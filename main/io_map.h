/*
 * Arquivo: io_map.h
 * Projeto: CLP Didático e Modular baseado em ESP32
 * Autor: Paulo Martino Hermans
 *
 * Descrição:
 * Interface pública do módulo de mapeamento de IO do CLP.
 *
 * Este módulo abstrai completamente o acesso direto aos GPIOs,
 * permitindo que a lógica de controle opere sem dependência
 * do hardware físico.
 *
 * Modelo adotado:
 *   - Entradas são lidas diretamente do hardware
 *   - Saídas são escritas em um buffer interno
 *   - O buffer é aplicado fisicamente ao final do scan
 *
 * Essa abordagem reflete o comportamento clássico de CLPs
 * industriais, garantindo consistência temporal.
 */

#ifndef IO_MAP_H
#define IO_MAP_H

#include <stdbool.h>
#include <stdint.h>

/* Quantidade de entradas digitais (I1...I6) */
#define NUM_DI 6

/* Quantidade de saídas digitais (O1...O6) */
#define NUM_DO 6

/* Entradas analógicas (AI1, AI2) */
#define NUM_AI 2

/* Saídas analógicas (AO1, AO2) */
#define NUM_AO 2

/* Inicialização do hardware de IO */
void io_init(void);

/* Leitura de entrada digital */
bool di_read(uint8_t channel);

/* Escrita no buffer de saída digital */
void do_write(uint8_t channel, bool value);

/* Escrita em massa no buffer de saídas digitais
 * Cada bit do mask corresponde a uma saída (bit 0 → DO0) */
void do_write_all(uint32_t mask);

/* Aplica o buffer de saídas ao hardware físico.
 * Deve ser chamado ao final de cada ciclo de scan do PLC. */
void do_apply_outputs(void);

/* Atualiza o buffer de entradas a partir do hardware.
 * Deve ser chamado no início de cada ciclo de scan. */
void di_update(void);

/* Leitura de entrada digital (snapshot para comunicação) */
bool di_get(uint8_t channel);

/* Leitura de saída digital (snapshot para comunicação) */
bool do_get(uint8_t channel);

/* Leitura de entrada analógica (valor bruto do ADC)
 * Range típico: 0–4095 (12 bits) */
uint16_t ai_get_raw(uint8_t ch);

/* Leitura do valor aplicado na saída analógica (duty PWM)
 * Range típico: 0–1023 (dependente da resolução configurada)
 */
uint16_t ao_get_raw(uint8_t ch);

#endif /* IO_MAP_H */