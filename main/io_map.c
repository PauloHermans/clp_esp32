/*
 * Arquivo: io_map.c
 * Projeto: CLP Didático e Modular baseado em ESP32
 * Autor: Paulo Martino Hermans
 *
 * Descrição:
 * Implementação do módulo de mapeamento físico de IO.
 *
 * Este módulo centraliza:
 *   - Configuração dos GPIOs
 *   - Leitura das entradas digitais
 *   - Bufferização das saídas digitais
 *   - Aplicação física das saídas
 *
 * A lógica IEC escreve apenas no buffer de saídas.
 * A atualização física ocorre no final do ciclo de scan.
 */

#include "io_map.h"
#include "driver/gpio.h"
#include "esp_adc/adc_oneshot.h"
#include "hal/adc_types.h"
#include "driver/ledc.h"
#include "esp_log.h"
#include "driver/i2c_master.h"

/* Tag para logs */
static const char *TAG = "io_map";

static adc_oneshot_unit_handle_t adc_handle;

static i2c_master_bus_handle_t i2c_bus_handle;

static i2c_master_dev_handle_t mcp23017_handle;

/* ============================================================
 * CONFIGURAÇÃO ANALÓGICA
 * ============================================================ */

/* -------- ENTRADAS ANALÓGICAS (ADC1) -------- */
#define AI1_CHANNEL ADC_CHANNEL_6   // GPIO34
#define AI2_CHANNEL ADC_CHANNEL_7   // GPIO35

#define AI_ATTEN     ADC_ATTEN_DB_12   // 0–3.3V
#define AI_WIDTH     ADC_WIDTH_BIT_12  // 0–4095

#define AI1_THRESHOLD 2000
#define AI2_THRESHOLD 2000

/* -------- SAÍDAS ANALÓGICAS (PWM) -------- */
#define AO1_GPIO    25
#define AO2_GPIO    26

#define AO1_CHANNEL LEDC_CHANNEL_0
#define AO2_CHANNEL LEDC_CHANNEL_1

#define AO_TIMER    LEDC_TIMER_0
#define AO_MODE     LEDC_HIGH_SPEED_MODE

#define AO_FREQ     5000
#define AO_RES      LEDC_TIMER_10_BIT  // 0–1023

#define AO1_DUTY_ON 512
#define AO2_DUTY_ON 256

#define AO_DUTY_OFF 0

/* ============================================================ */
/* CONFIGURAÇÃO MCP23017                                        */
/* ============================================================ */

#define MCP23017_ADDR      0x20

#define MCP23017_SDA_GPIO  GPIO_NUM_21
#define MCP23017_SCL_GPIO  GPIO_NUM_22

#define MCP23017_FREQ_HZ   100000

/* Registradores MCP23017 */
#define MCP23017_IODIRA    0x00
#define MCP23017_IODIRB    0x01

#define MCP23017_GPPUA     0x0C
#define MCP23017_GPPUB     0x0D

#define MCP23017_GPIOA     0x12
#define MCP23017_GPIOB     0x13

#define MCP23017_OLATA     0x14
#define MCP23017_OLATB     0x15

/* ============================================================
 * DOUBLE BUFFER - ENTRADAS
 * ============================================================ */

static bool di_buffer_plc[NUM_DI] = {0};
static bool di_buffer_com[NUM_DI] = {0};

/* ============================================================
 * DOUBLE BUFFER - SAÍDAS
 * ============================================================ */

static bool do_buffer_plc[NUM_DO] = {0};
static bool do_buffer_com[NUM_DO] = {0};

/* ============================================================
 * ANALÓGICO - BUFFERS INTERNOS
 * ============================================================ */

static uint16_t ai_raw[NUM_AI] = {0};
static uint16_t ao_raw[NUM_AO] = {0};  // guardar duty atual

/* ============================================================
 * SNAPSHOTS - MCP23017
 * ============================================================ */

/*
 * GPA:
 *   Core 0 escreve
 *   Core 1 lê
 */
static volatile uint8_t mcp_input_snapshot = 0x00;

/*
 * GPB:
 *   Core 1 escreve
 *   Core 0 lê
 */
static volatile uint8_t mcp_output_snapshot = 0x00;

/* ============================================================
 * ABSTRAÇÃO DE HARDWARE
 * ============================================================ */

typedef enum {
    IO_TYPE_GPIO,
    IO_TYPE_I2C,
} io_type_t;

typedef struct {
    io_type_t type;

    union {
        gpio_num_t gpio;

        struct {
            uint8_t device;
            uint8_t pin_adress;
        } i2c;

    } hw;

} io_map_entry_t;

/* ============================================================
 * MAPEAMENTO
 * ============================================================ */

static const io_map_entry_t di_map[NUM_DI] = {
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_16 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_17 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_18 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_19 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_36 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_39 }
};

static const io_map_entry_t do_map[NUM_DO] = {
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_13 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_14 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_23 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_27 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_32 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_33 }
};

static const io_map_entry_t edi_map[NUM_EDI] = {
    { .type = IO_TYPE_I2C, .hw.i2c.pin_adress = 1, .hw.i2c.device = 1 },
    { .type = IO_TYPE_I2C, .hw.i2c.pin_adress = 2, .hw.i2c.device = 1 },
    { .type = IO_TYPE_I2C, .hw.i2c.pin_adress = 3, .hw.i2c.device = 1 },
    { .type = IO_TYPE_I2C, .hw.i2c.pin_adress = 4, .hw.i2c.device = 1 },
    { .type = IO_TYPE_I2C, .hw.i2c.pin_adress = 5, .hw.i2c.device = 1 },
    { .type = IO_TYPE_I2C, .hw.i2c.pin_adress = 6, .hw.i2c.device = 1 },
    { .type = IO_TYPE_I2C, .hw.i2c.pin_adress = 7, .hw.i2c.device = 1 },
    { .type = IO_TYPE_I2C, .hw.i2c.pin_adress = 8, .hw.i2c.device = 1 }
};

static const io_map_entry_t edo_map[NUM_EDO] = {
    { .type = IO_TYPE_I2C, .hw.i2c.pin_adress = 1, .hw.i2c.device = 1 },
    { .type = IO_TYPE_I2C, .hw.i2c.pin_adress = 2, .hw.i2c.device = 1 },
    { .type = IO_TYPE_I2C, .hw.i2c.pin_adress = 3, .hw.i2c.device = 1 },
    { .type = IO_TYPE_I2C, .hw.i2c.pin_adress = 4, .hw.i2c.device = 1 },
    { .type = IO_TYPE_I2C, .hw.i2c.pin_adress = 5, .hw.i2c.device = 1 },
    { .type = IO_TYPE_I2C, .hw.i2c.pin_adress = 6, .hw.i2c.device = 1 },
    { .type = IO_TYPE_I2C, .hw.i2c.pin_adress = 7, .hw.i2c.device = 1 },
    { .type = IO_TYPE_I2C, .hw.i2c.pin_adress = 8, .hw.i2c.device = 1 }
};

/* ============================================================
 * ANALOG READ
 * ============================================================ */

bool analog_read(uint8_t ch)
{
    if (ch == 0) {
        return (ai_raw[0] < AI1_THRESHOLD);
    }

    if (ch == 1) {
        return (ai_raw[1] < AI2_THRESHOLD);
    }

    return false;
}

/* ============================================================
 * ANALOG WRITE (PWM)
 * ============================================================ */

void analog_write(uint8_t ch, bool v)
{
    uint32_t duty = AO_DUTY_OFF;

    if (ch == 0) {
        duty = v ? AO1_DUTY_ON : AO_DUTY_OFF;
        ledc_set_duty(AO_MODE, AO1_CHANNEL, duty);
        ledc_update_duty(AO_MODE, AO1_CHANNEL);
        ao_raw[0] = duty;
    }

    else if (ch == 1) {
        duty = v ? AO2_DUTY_ON : AO_DUTY_OFF;
        ledc_set_duty(AO_MODE, AO2_CHANNEL, duty);
        ledc_update_duty(AO_MODE, AO2_CHANNEL);
        ao_raw[1] = duty;
    }
}

/* ============================================================
 * LEITURA FÍSICA DIGITAL
 * ============================================================ */

static bool read_physical_input(uint8_t ch)
{
    const io_map_entry_t *e = &di_map[ch];

    switch (e->type) {
        case IO_TYPE_GPIO:
            return gpio_get_level(e->hw.gpio);
        default:
            return false;
    }
}

/* ============================================================
 * ESCRITA FÍSICA DIGITAL
 * ============================================================ */

static void write_physical_output(uint8_t ch, bool value)
{
    const io_map_entry_t *e = &do_map[ch];

    switch (e->type) {
        case IO_TYPE_GPIO:
            gpio_set_level(e->hw.gpio, value ? 1 : 0);
            break;
        default:
            break;
    }
}

bool i2c_di_read(uint8_t channel)
{
    if (channel >= NUM_EDI) {
        return false;
    }

    return (mcp_input_snapshot >> channel) & 0x01;
}

void i2c_do_write(uint8_t channel, bool value)
{
    if (channel >= NUM_EDO) {
        return;
    }

    if (value) {
        mcp_output_snapshot |= (1U << channel);
    } else {
        mcp_output_snapshot &= ~(1U << channel);
    }
}

/* ============================================================
 * INIT
 * ============================================================ */

void io_init(void)
{
    gpio_config_t io_conf = {0};

    /* INPUTS */
    io_conf.mode = GPIO_MODE_INPUT;
    io_conf.pull_down_en = GPIO_PULLDOWN_ENABLE;

    for (uint8_t i = 0; i < NUM_DI; i++) {
        if (di_map[i].type == IO_TYPE_GPIO) {
            io_conf.pin_bit_mask = 1ULL << di_map[i].hw.gpio;
            gpio_config(&io_conf);
        }
    }

    /* OUTPUTS */
    io_conf.mode = GPIO_MODE_OUTPUT;

    for (uint8_t i = 0; i < NUM_DO; i++) {
        if (do_map[i].type == IO_TYPE_GPIO) {
            io_conf.pin_bit_mask = 1ULL << do_map[i].hw.gpio;
            gpio_config(&io_conf);
            gpio_set_level(do_map[i].hw.gpio, 0);
        }
    }

    /* ADC INIT (ONESHOT) */
    adc_oneshot_unit_init_cfg_t init_config = {
        .unit_id = ADC_UNIT_1,
    };
    adc_oneshot_new_unit(&init_config, &adc_handle);

    /* Configuração do canal AI1 */
    adc_oneshot_chan_cfg_t config = {
        .bitwidth = ADC_BITWIDTH_12,
        .atten = AI_ATTEN
    };
    adc_oneshot_config_channel(adc_handle, ADC_CHANNEL_6, &config);

    /* Configuração do canal AI2 */
    adc_oneshot_config_channel(adc_handle, ADC_CHANNEL_7, &config);

    /* PWM TIMER */
    ledc_timer_config_t timer = {
        .speed_mode = AO_MODE,
        .timer_num = AO_TIMER,
        .duty_resolution = AO_RES,
        .freq_hz = AO_FREQ,
        .clk_cfg = LEDC_AUTO_CLK
    };
    ledc_timer_config(&timer);

    /* PWM CHANNELS */
    ledc_channel_config_t ch0 = {
        .gpio_num = AO1_GPIO,
        .speed_mode = AO_MODE,
        .channel = AO1_CHANNEL,
        .timer_sel = AO_TIMER,
        .duty = 0
    };

    ledc_channel_config_t ch1 = {
        .gpio_num = AO2_GPIO,
        .speed_mode = AO_MODE,
        .channel = AO2_CHANNEL,
        .timer_sel = AO_TIMER,
        .duty = 0
    };

    ledc_channel_config(&ch0);
    ledc_channel_config(&ch1);

    ESP_LOGI(TAG, "IO inicializado (digital + analogico)");

    /* Inicia I2C*/

    esp_err_t ret;

    /* -------------------------------------------------------- */
    /* Configuração do barramento I2C                           */
    /* -------------------------------------------------------- */

    i2c_master_bus_config_t bus_config = {
        .i2c_port = I2C_NUM_0,
        .sda_io_num = MCP23017_SDA_GPIO,
        .scl_io_num = MCP23017_SCL_GPIO,
        .clk_source = I2C_CLK_SRC_DEFAULT,
        .glitch_ignore_cnt = 7,
        .flags.enable_internal_pullup = true
    };

    ret = i2c_new_master_bus(&bus_config, &i2c_bus_handle);

    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "Falha ao inicializar barramento I2C: %s",
                 esp_err_to_name(ret));
        return;
    }

    /* -------------------------------------------------------- */
    /* Adiciona o MCP23017 ao barramento                        */
    /* -------------------------------------------------------- */

    i2c_device_config_t dev_config = {
        .dev_addr_length = I2C_ADDR_BIT_LEN_7,
        .device_address = MCP23017_ADDR,
        .scl_speed_hz = MCP23017_FREQ_HZ
    };

    ret = i2c_master_bus_add_device(
        i2c_bus_handle,
        &dev_config,
        &mcp23017_handle
    );

    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "Falha ao adicionar MCP23017: %s",
                 esp_err_to_name(ret));
        return;
    }

    /* -------------------------------------------------------- */
    /* Configura GPA como entrada                               */
    /* Configura GPB como saída                                 */
    /* -------------------------------------------------------- */

    uint8_t iodira = 0xFF;   // GPA: 11111111 = entradas
    uint8_t iodirb = 0x00;   // GPB: 00000000 = saídas

    ret = i2c_master_transmit(
        mcp23017_handle,
        (uint8_t[]){MCP23017_IODIRA, iodira},
        2,
        -1
    );

    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "Falha ao configurar IODIRA: %s",
                 esp_err_to_name(ret));
        return;
    }

    ret = i2c_master_transmit(
        mcp23017_handle,
        (uint8_t[]){MCP23017_IODIRB, iodirb},
        2,
        -1
    );

    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "Falha ao configurar IODIRB: %s",
                 esp_err_to_name(ret));
        return;
    }

    /* -------------------------------------------------------- */
    /* Pull-ups internos de GPA                                 */
    /* -------------------------------------------------------- */

    uint8_t gppua = 0xFF;    // habilita pull-up em GPA
    uint8_t gppub = 0x00;    // GPB não precisa de pull-up

    ret = i2c_master_transmit(
        mcp23017_handle,
        (uint8_t[]){MCP23017_GPPUA, gppua},
        2,
        -1
    );

    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "Falha ao configurar GPPUA: %s",
                 esp_err_to_name(ret));
        return;
    }

    ret = i2c_master_transmit(
        mcp23017_handle,
        (uint8_t[]){MCP23017_GPPUB, gppub},
        2,
        -1
    );

    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "Falha ao configurar GPPUB: %s",
                 esp_err_to_name(ret));
        return;
    }

    /* -------------------------------------------------------- */
    /* Garante que todas as saídas começam desligadas           */
    /* -------------------------------------------------------- */

    uint8_t output_b = 0x00;

    ret = i2c_master_transmit(
        mcp23017_handle,
        (uint8_t[]){MCP23017_OLATB, output_b},
        2,
        -1
    );

    if (ret != ESP_OK) {
        ESP_LOGE(TAG, "Falha ao inicializar saídas GPB: %s",
                 esp_err_to_name(ret));
        return;
    }

    ESP_LOGI(TAG, "MCP23017 inicializado: GPA=INPUT, GPB=OUTPUT");
}

/* ============================================================
 * ATUALIZAÇÃO DAS ENTRADAS (SCAN)
 * ============================================================ */

void di_update(void)
{
    for (uint8_t i = 0; i < NUM_DI; i++) {

        bool value = read_physical_input(i);

        /* Atualiza buffer do PLC */
        di_buffer_plc[i] = value;

        /* Atualiza snapshot para comunicação */
        di_buffer_com[i] = value;
    }
    /* === ANALÓGICO === */
    int raw = 0;
    adc_oneshot_read(adc_handle, ADC_CHANNEL_6, &raw);
    ai_raw[0] = raw;

    adc_oneshot_read(adc_handle, ADC_CHANNEL_7, &raw);
    ai_raw[1] = raw;
}

/* ============================================================
 * ATUALIZAÇÃO DO MCP23017
 *
 * Executada pelo Core 0.
 *
 * GPA -> mcp_input_snapshot
 * mcp_output_snapshot -> GPB
 * ============================================================ */

void mcp23017_update(void)
{
    uint8_t reg;
    uint8_t input_value;
    uint8_t output_value;

    /* --------------------------------------------------------
     * 1. Lê GPA
     * -------------------------------------------------------- */

    reg = MCP23017_GPIOA;

    esp_err_t ret = i2c_master_transmit_receive(
        mcp23017_handle,
        &reg,
        1,
        &input_value,
        1,
        -1
    );

    if (ret == ESP_OK) {

        /*
         * Atualiza o snapshot das entradas.
         *
         * Core 0 escreve
         * Core 1 lê
         */
        mcp_input_snapshot = input_value;
    }

    /* --------------------------------------------------------
     * 2. Obtém snapshot das saídas
     * -------------------------------------------------------- */

    /*
     * Copiamos para uma variável local antes da transmissão.
     *
     * Assim, mesmo que o Core 1 altere o snapshot durante
     * a operação I2C, esta transação permanece consistente.
     */
    output_value = mcp_output_snapshot;

    /* --------------------------------------------------------
     * 3. Escreve GPB
     * -------------------------------------------------------- */

    uint8_t output_data[2] = {
        MCP23017_GPIOB,
        output_value
    };

    ret = i2c_master_transmit(
        mcp23017_handle,
        output_data,
        2,
        -1
    );

    if (ret != ESP_OK) {
        ESP_LOGW(
            TAG,
            "Falha na atualização do MCP23017: %s",
            esp_err_to_name(ret)
        );
    }
}

/* ============================================================
 * INTERFACE DO PLC
 * ============================================================ */

bool di_read(uint8_t channel)
{
    if (channel >= NUM_DI) return false;
    return di_buffer_plc[channel];
}

void do_write(uint8_t channel, bool value)
{
    if (channel < NUM_DO) {
        do_buffer_plc[channel] = value;
    }
}

void do_write_all(uint32_t mask)
{
    for (uint8_t i = 0; i < NUM_DO; i++) {
        do_buffer_plc[i] = (mask >> i) & 0x01;
    }
}

/* ============================================================
 * APLICAÇÃO DAS SAÍDAS (SCAN)
 * ============================================================ */

void do_apply_outputs(void)
{
    /* Copia PLC → comunicação */
    for (uint8_t i = 0; i < NUM_DO; i++) {
        do_buffer_com[i] = do_buffer_plc[i];
    }

    /* Aplica no hardware */
    for (uint8_t i = 0; i < NUM_DO; i++) {
        write_physical_output(i, do_buffer_com[i]);
    }
}

/* ============================================================
 * INTERFACE PARA COMUNICAÇÃO (CORE 0)
 * ============================================================ */

bool di_get(uint8_t channel)
{
    if (channel >= NUM_DI) return false;
    return di_buffer_com[channel];
}

bool do_get(uint8_t channel)
{
    if (channel >= NUM_DO) return false;
    return do_buffer_com[channel];
}

uint16_t ai_get_raw(uint8_t ch)
{
    if (ch >= 2) return 0;
    return ai_raw[ch];
}

uint16_t ao_get_raw(uint8_t ch)
{
    if (ch >= 2) return 0;
    return ao_raw[ch];
}