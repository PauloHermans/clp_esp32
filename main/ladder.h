/*
 * Arquivo: ladder.h
 * Projeto: CLP Didático e Modular baseado em ESP32
 * Autor: Paulo Martino Hermans
 *
 * Descrição:
 * Interface de integração entre o código gerado pelo LDmicro
 * e o mapeamento interno de IO do CLP.
 *
 * Este arquivo fornece as funções exigidas pelo LDmicro para:
 *   - Leitura de entradas digitais
 *   - Escrita de saídas digitais
 *
 * As funções aqui definidas fazem apenas a ponte entre
 * o programa IEC e o módulo io_map.
 *
 * Importante:
 *  - Não há lógica de controle neste arquivo
 *  - Não há acesso direto a hardware
 *  - Atua apenas como camada de adaptação
 */

#ifndef LADDER_H
#define LADDER_H

#include <stdint.h>
#include <stdbool.h>
#include "io_map.h"

/* ============================================================
 * Tipos exigidos pelo LDmicro
 * ============================================================ */

typedef int16_t SWORD;
typedef uint8_t BOOL;

/* ============================================================
 * ENTRADAS DIGITAIS
 * ============================================================ */

static inline BOOL Read_U_b_XDI1(void) { return di_read(0); }
static inline BOOL Read_U_b_XDI2(void) { return di_read(1); }
static inline BOOL Read_U_b_XDI3(void) { return di_read(2); }
static inline BOOL Read_U_b_XDI4(void) { return di_read(3); }
static inline BOOL Read_U_b_XDI5(void) { return di_read(4); }
static inline BOOL Read_U_b_XDI6(void) { return di_read(5); }

/* ============================================================
 * SAÍDAS DIGITAIS
 * ============================================================ */

static inline void Write_U_b_YDO1(BOOL v) { do_write(0, v); }
static inline void Write_U_b_YDO2(BOOL v) { do_write(1, v); }
static inline void Write_U_b_YDO3(BOOL v) { do_write(2, v); }
static inline void Write_U_b_YDO4(BOOL v) { do_write(3, v); }
static inline void Write_U_b_YDO5(BOOL v) { do_write(4, v); }
static inline void Write_U_b_YDO6(BOOL v) { do_write(5, v); }

/* ============================================================
 * ENTRADAS ANALÓGICAS
 * ============================================================ */

static inline BOOL Read_U_b_XAI1(void) { return analog_read(0); }
static inline BOOL Read_U_b_XAI2(void) { return analog_read(1); }

/* ============================================================
 * SAÍDAS ANALÓGICAS
 * ============================================================ */

static inline void Write_U_b_YAO1(BOOL v) { analog_write(0, v); }
static inline void Write_U_b_YAO2(BOOL v) { analog_write(1, v); }

/* ============================================================
 * ENTRADAS DIGITAIS - MCP23017
 * ============================================================ */

static inline BOOL Read_U_b_XEDI1(void) { return i2c_di_read(0); }
static inline BOOL Read_U_b_XEDI2(void) { return i2c_di_read(1); }
static inline BOOL Read_U_b_XEDI3(void) { return i2c_di_read(2); }
static inline BOOL Read_U_b_XEDI4(void) { return i2c_di_read(3); }
static inline BOOL Read_U_b_XEDI5(void) { return i2c_di_read(4); }
static inline BOOL Read_U_b_XEDI6(void) { return i2c_di_read(5); }
static inline BOOL Read_U_b_XEDI7(void) { return i2c_di_read(6); }
static inline BOOL Read_U_b_XEDI8(void) { return i2c_di_read(7); }

/* ============================================================
 * SAÍDAS DIGITAIS - MCP23017
 * ============================================================ */

static inline void Write_U_b_YEDO1(BOOL v) { i2c_do_write(0, v); }
static inline void Write_U_b_YEDO2(BOOL v) { i2c_do_write(1, v); }
static inline void Write_U_b_YEDO3(BOOL v) { i2c_do_write(2, v); }
static inline void Write_U_b_YEDO4(BOOL v) { i2c_do_write(3, v); }
static inline void Write_U_b_YEDO5(BOOL v) { i2c_do_write(4, v); }
static inline void Write_U_b_YEDO6(BOOL v) { i2c_do_write(5, v); }
static inline void Write_U_b_YEDO7(BOOL v) { i2c_do_write(6, v); }
static inline void Write_U_b_YEDO8(BOOL v) { i2c_do_write(7, v); }

#endif /* LADDER_H */