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

/* ================================
 * DOUBLE BUFFER - ENTRADAS
 * ================================ */

/* Usado pelo PLC (core 1) */
static bool di_buffer_plc[NUM_DI] = {0};

/* Usado pela comunicação (core 0) */
static bool di_buffer_com[NUM_DI] = {0};

/* ================================
 * DOUBLE BUFFER - SAÍDAS
 * ================================ */

/* Escrito pelo PLC */
static bool do_buffer_plc[NUM_DO] = {0};

/* Visível para comunicação + hardware */
static bool do_buffer_com[NUM_DO] = {0};

/* ================================
 * MAPEAMENTO FÍSICO DOS PINOS
 * ================================ */

/* Entradas digitais (ativo ALTO agora) */
static const gpio_num_t di_pins[NUM_DI] = {
    GPIO_NUM_16,
    GPIO_NUM_17,
    GPIO_NUM_18,
    GPIO_NUM_19,
    GPIO_NUM_21,
    GPIO_NUM_22
};

/* Saídas digitais */
static const gpio_num_t do_pins[NUM_DO] = {
    GPIO_NUM_23,
    GPIO_NUM_25,
    GPIO_NUM_26,
    GPIO_NUM_27,
    GPIO_NUM_32,
    GPIO_NUM_33
};

void io_init(void)
{
    gpio_config_t io_conf = {0};

    /* ================================
     * ENTRADAS - PULLDOWN (IMPORTANTE)
     * ================================ */
    io_conf.mode = GPIO_MODE_INPUT;
    io_conf.pull_up_en = GPIO_PULLUP_DISABLE;
    io_conf.pull_down_en = GPIO_PULLDOWN_ENABLE;
    io_conf.intr_type = GPIO_INTR_DISABLE;

    for (int i = 0; i < NUM_DI; i++) {
        io_conf.pin_bit_mask = 1ULL << di_pins[i];
        gpio_config(&io_conf);
    }

    /* ================================
     * SAÍDAS
     * ================================ */
    io_conf.mode = GPIO_MODE_OUTPUT;
    io_conf.pull_up_en = GPIO_PULLUP_DISABLE;

    for (int i = 0; i < NUM_DO; i++) {
        io_conf.pin_bit_mask = 1ULL << do_pins[i];
        gpio_config(&io_conf);
        gpio_set_level(do_pins[i], 0);
    }

    ESP_LOGI(TAG, "IO inicializado com sucesso");
}

/* ================================
 * ATUALIZAÇÃO DE ENTRADAS (SCAN)
 * ================================ */
void di_update(void)
{
    for (uint8_t i = 0; i < NUM_DI; i++) {

        /* Leitura física (ativo alto) */
        bool value = gpio_get_level(di_pins[i]) == 1;

        /* PLC usa isso */
        di_buffer_plc[i] = value;

        /* Comunicação usa snapshot */
        di_buffer_com[i] = value;
    }
}

/* ================================
 * LEITURA PELO PLC
 * ================================ */
bool di_read(uint8_t channel)
{
    if (channel >= NUM_DI) {
        return false;
    }

    return di_buffer_plc[channel];
}

/* ================================
 * ESCRITA PELO PLC
 * ================================ */
void do_write(uint8_t channel, bool value)
{
    if (channel < NUM_DO) {
        do_buffer_plc[channel] = value;
    }
}

void do_write_all(uint32_t mask)
{
    for (uint8_t i = 0; i < NUM_DO; i++) {
        bool value = (mask >> i) & 0x01;
        do_buffer_plc[i] = value;
    }
}

/* ================================
 * APLICAÇÃO DAS SAÍDAS (SCAN)
 * ================================ */
void do_apply_outputs(void)
{
    /* PLC → comunicação */
    for (uint8_t i = 0; i < NUM_DO; i++) {
        do_buffer_com[i] = do_buffer_plc[i];
    }

    /* Comunicação → hardware */
    for (uint8_t i = 0; i < NUM_DO; i++) {
        gpio_set_level(do_pins[i], do_buffer_com[i] ? 1 : 0);
    }
}

/* ================================
 * LEITURA PARA COMUNICAÇÃO (CORE 0)
 * ================================ */
bool di_get(uint8_t channel)
{
    if (channel >= NUM_DI) {
        return false;
    }
    return di_buffer_com[channel];
}

bool do_get(uint8_t channel)
{
    if (channel >= NUM_DO) {
        return false;
    }
    return do_buffer_com[channel];
}

/* */