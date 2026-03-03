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

/* Buffer interno de saídas digitais */
static volatile bool do_buffer[NUM_DO] = {0};

/* ================================
 * MAPEAMENTO FÍSICO DOS PINOS
 * ================================ */

/* Entradas digitais (ativas em nível baixo) */
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

    /* Configuração das entradas */
    io_conf.mode = GPIO_MODE_INPUT;
    io_conf.pull_up_en = GPIO_PULLUP_ENABLE;
    io_conf.pull_down_en = GPIO_PULLDOWN_DISABLE;
    io_conf.intr_type = GPIO_INTR_DISABLE;

    for (int i = 0; i < NUM_DI; i++) {
        io_conf.pin_bit_mask = 1ULL << di_pins[i];
        gpio_config(&io_conf);
    }

    /* Configuração das saídas */
    io_conf.mode = GPIO_MODE_OUTPUT;
    io_conf.pull_up_en = GPIO_PULLUP_DISABLE;

    for (int i = 0; i < NUM_DO; i++) {
        io_conf.pin_bit_mask = 1ULL << do_pins[i];
        gpio_config(&io_conf);
        gpio_set_level(do_pins[i], 0);
    }

    ESP_LOGI(TAG, "IO inicializado com sucesso");
}

bool di_read(uint8_t channel)
{
    if (channel >= NUM_DI) {
        return false;
    }

    /* Entrada ativa em nível baixo */
    return gpio_get_level(di_pins[channel]) == 0;
}

void do_write(uint8_t channel, bool value)
{
    if (channel < NUM_DO) {
        do_buffer[channel] = value;
    }
}

void do_write_all(uint32_t mask)
{
    for (uint8_t i = 0; i < NUM_DO; i++) {
        bool value = (mask >> i) & 0x01;
        do_buffer[i] = value;
    }
}

void do_apply_outputs(void)
{
    for (uint8_t i = 0; i < NUM_DO; i++) {
        gpio_set_level(do_pins[i], do_buffer[i] ? 1 : 0);
    }
}