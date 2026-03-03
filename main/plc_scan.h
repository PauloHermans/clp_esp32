/*
 * Arquivo: plc_scan.h
 * Projeto: CLP Didático e Modular baseado em ESP32
 * Autor: Paulo Martino Hermans
 *
 * Descrição:
 * Interface pública do motor de scan do CLP.
 *
 * Este módulo encapsula a execução periódica da lógica
 * de controle, seguindo o modelo clássico de CLP:
 *
 *   1) Execução do programa do usuário
 *   2) Atualização das saídas físicas
 *   3) Sincronização temporal determinística (1 ms)
 *
 * A implementação é baseada em uma task dedicada do FreeRTOS,
 * permitindo controle explícito de:
 *   - Prioridade
 *   - Período
 *   - Afinidade de core
 *
 * O objetivo é garantir previsibilidade temporal e
 * separação entre controle e demais serviços do sistema.
 */

#ifndef PLC_SCAN_H
#define PLC_SCAN_H

/* Inicializa e cria a task responsável pelo ciclo de scan */
void plc_scan_start(void);

#endif /* PLC_SCAN_H */