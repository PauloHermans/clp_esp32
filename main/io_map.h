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

/* Quantidade de entradas e saídas digitais */
#define NUM_DI 6
#define NUM_DO 6

/* Inicialização do hardware de IO */
void io_init(void);

/* Leitura de entrada digital */
bool di_read(uint8_t channel);

/* Escrita no buffer de saída digital */
void do_write(uint8_t channel, bool value);

/* Escrita em massa no buffer de saídas */
void do_write_all(uint32_t mask);

/* Aplica o buffer físico nas saídas */
void do_apply_outputs(void);

void di_update(void);

bool di_get(uint8_t channel);

bool do_get(uint8_t channel);

#endif /* IO_MAP_H */