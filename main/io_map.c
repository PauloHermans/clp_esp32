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
#include "esp_log.h"

/* Tag para logs */
static const char *TAG = "io_map";

/* ============================================================
 * DOUBLE BUFFER - ENTRADAS
 * ============================================================ */

/* Buffer usado exclusivamente pelo PLC (core 1) */
static bool di_buffer_plc[NUM_DI] = {0};

/* Snapshot usado pela comunicação (core 0) */
static bool di_buffer_com[NUM_DI] = {0};

/* ============================================================
 * DOUBLE BUFFER - SAÍDAS
 * ============================================================ */

/* Escrito pelo PLC */
static bool do_buffer_plc[NUM_DO] = {0};

/* Visível para comunicação e hardware */
static bool do_buffer_com[NUM_DO] = {0};

/* ============================================================
 * ABSTRAÇÃO DE HARDWARE
 * ============================================================ */

/* Tipos de interface possíveis */
typedef enum {
    IO_TYPE_GPIO,
    IO_TYPE_I2C,
    IO_TYPE_SHIFTREG
} io_type_t;

/* Estrutura genérica de mapeamento */
typedef struct {
    io_type_t type;

    union {
        gpio_num_t gpio;

        struct {
            uint8_t device;
            uint8_t pin;
        } i2c;

        struct {
            uint8_t bit;
        } shift;

    } hw;

} io_map_entry_t;

/* ============================================================
 * MAPEAMENTO DOS CANAIS (FACILMENTE EXPANSÍVEL)
 * ============================================================ */

/* Entradas digitais */
static const io_map_entry_t di_map[NUM_DI] = {
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_16 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_17 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_18 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_19 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_21 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_22 }
};

/* Saídas digitais */
static const io_map_entry_t do_map[NUM_DO] = {
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_23 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_25 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_26 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_27 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_32 },
    { .type = IO_TYPE_GPIO, .hw.gpio = GPIO_NUM_33 }
};

/* ============================================================
 * LEITURA FÍSICA (GENÉRICA)
 * ============================================================ */

static bool read_physical_input(uint8_t ch)
{
    const io_map_entry_t *e = &di_map[ch];

    switch (e->type) {

        case IO_TYPE_GPIO:
            /* Entrada ativa em nível alto */
            return gpio_get_level(e->hw.gpio);

        case IO_TYPE_I2C:
            /* FUTURO: implementar driver */
            // return i2c_expander_read(e->hw.i2c.device, e->hw.i2c.pin);
            return false;

        case IO_TYPE_SHIFTREG:
            /* FUTURO: implementar driver */
            // return shiftreg_read(e->hw.shift.bit);
            return false;

        default:
            return false;
    }
}

/* ============================================================
 * ESCRITA FÍSICA (GENÉRICA)
 * ============================================================ */

static void write_physical_output(uint8_t ch, bool value)
{
    const io_map_entry_t *e = &do_map[ch];

    switch (e->type) {

        case IO_TYPE_GPIO:
            gpio_set_level(e->hw.gpio, value ? 1 : 0);
            break;

        case IO_TYPE_I2C:
            /* FUTURO */
            // i2c_expander_write(...);
            break;

        case IO_TYPE_SHIFTREG:
            /* FUTURO */
            // shiftreg_write(...);
            break;

        default:
            break;
    }
}

/* ============================================================
 * INICIALIZAÇÃO DO HARDWARE
 * ============================================================ */

void io_init(void)
{
    gpio_config_t io_conf = {0};

    /* ================================
     * CONFIGURAÇÃO DAS ENTRADAS
     * ================================ */
    io_conf.mode = GPIO_MODE_INPUT;
    io_conf.pull_up_en = GPIO_PULLUP_DISABLE;
    io_conf.pull_down_en = GPIO_PULLDOWN_ENABLE;  // evita flutuação
    io_conf.intr_type = GPIO_INTR_DISABLE;

    for (uint8_t i = 0; i < NUM_DI; i++) {
        if (di_map[i].type == IO_TYPE_GPIO) {
            io_conf.pin_bit_mask = 1ULL << di_map[i].hw.gpio;
            gpio_config(&io_conf);
        }
    }

    /* ================================
     * CONFIGURAÇÃO DAS SAÍDAS
     * ================================ */
    io_conf.mode = GPIO_MODE_OUTPUT;
    io_conf.pull_up_en = GPIO_PULLUP_DISABLE;

    for (uint8_t i = 0; i < NUM_DO; i++) {
        if (do_map[i].type == IO_TYPE_GPIO) {
            io_conf.pin_bit_mask = 1ULL << do_map[i].hw.gpio;
            gpio_config(&io_conf);
            gpio_set_level(do_map[i].hw.gpio, 0);
        }
    }

    ESP_LOGI(TAG, "IO inicializado com sucesso");
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

/* */