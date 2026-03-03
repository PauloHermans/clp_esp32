/*
 * Arquivo: plc_time.h
 * Projeto: CLP Didático e Modular baseado em ESP32
 * Autor: Paulo Martino Hermans
 *
 * Descrição:
 * Interface pública do módulo de medição de tempo do ciclo de scan.
 *
 * Este módulo mede o tempo real de execução de cada ciclo
 * do CLP, permitindo:
 *   - Verificação de determinismo temporal
 *   - Detecção de violação de deadline (overrun)
 *   - Coleta de métricas para análise e validação acadêmica
 *
 * A medição é realizada em microssegundos utilizando
 * o temporizador de alta resolução (esp_timer),
 * sem interferir no escalonamento do FreeRTOS.
 */

#ifndef PLC_TIME_H
#define PLC_TIME_H

#include <stdint.h>
#include <stdbool.h>

/* Inicializa o módulo de medição de tempo */
void plc_time_init(void);

/* Marca o início de um ciclo de scan */
void plc_time_scan_start(void);

/* Marca o fim do ciclo e calcula sua duração */
void plc_time_scan_end(void);

/* Retorna o tempo do último scan (µs) */
uint32_t plc_time_get_last_scan_us(void);

/* Retorna o maior tempo de scan já registrado (µs) */
uint32_t plc_time_get_max_scan_us(void);

/* Indica se o último scan ultrapassou o deadline */
bool plc_time_had_overrun(void);

#endif /* PLC_TIME_H */