/*
 * Arquivo: plc_time.c
 * Projeto: CLP Didático e Modular baseado em ESP32
 * Autor: Paulo Martino Hermans
 *
 * Descrição:
 * Módulo responsável pela medição do tempo de execução
 * do ciclo de scan do CLP.
 *
 * Utiliza o esp_timer (resolução de 1 µs) para medir com
 * precisão o tempo real de execução da lógica de controle.
 *
 * Responsabilidades:
 *  - Medir duração do último scan
 *  - Registrar o pior caso já observado (max scan time)
 *  - Detectar violação do tempo máximo permitido (overrun)
 *
 * Este módulo é independente do FreeRTOS e não interfere
 * na temporização do ciclo — ele apenas realiza medição.
 */

#include "plc_time.h"
#include "esp_timer.h"

/* Instante de início do scan (µs desde boot) */
static int64_t scan_start_time = 0;

/* Duração do último scan (µs) */
static uint32_t last_scan_us = 0;

/* Maior duração de scan já registrada (µs) */
static uint32_t max_scan_us = 0;

/* Indica se houve violação do tempo no último ciclo */
static bool scan_overrun = false;

/* Deadline do ciclo de scan: 1 ms = 1000 µs */
#define PLC_SCAN_DEADLINE_US 1000

void plc_time_init(void)
{
    scan_start_time = 0;
    last_scan_us = 0;
    max_scan_us = 0;
    scan_overrun = false;
}

void plc_time_scan_start(void)
{
    /* Captura o instante exato de início do ciclo */
    scan_start_time = esp_timer_get_time();
}

void plc_time_scan_end(void)
{
    /* Captura o instante atual */
    int64_t now = esp_timer_get_time();

    /* Calcula a duração do ciclo atual */
    last_scan_us = (uint32_t)(now - scan_start_time);

    /* Atualiza estatística de pior caso */
    if (last_scan_us > max_scan_us) {
        max_scan_us = last_scan_us;
    }

    /* Verifica violação do deadline */
    scan_overrun = (last_scan_us > PLC_SCAN_DEADLINE_US);
}

uint32_t plc_time_get_last_scan_us(void)
{
    return last_scan_us;
}

uint32_t plc_time_get_max_scan_us(void)
{
    return max_scan_us;
}

bool plc_time_had_overrun(void)
{
    return scan_overrun;
}