/*
 * Arquivo: ld_program.h
 * Projeto: CLP Didático e Modular baseado em ESP32
 * Autor: Paulo Martino Hermans
 *
 * Descrição:
 * Interface do programa de controle do usuário.
 *
 * Este módulo representa a lógica IEC executada pelo CLP
 * (Ladder, FBD, ST ou código gerado automaticamente).
 *
 * O motor de scan depende apenas desta interface pública,
 * permanecendo totalmente desacoplado da implementação
 * interna do programa.
 *
 * Responsabilidades:
 *  - Inicialização do programa
 *  - Execução de um ciclo lógico completo
 */

#ifndef LD_PROGRAM_H
#define LD_PROGRAM_H

/* Inicializa o programa de controle */
void ld_program_init(void);

/* Executa um ciclo completo da lógica de controle */
void ld_program_cycle(void);

#endif /* LD_PROGRAM_H */