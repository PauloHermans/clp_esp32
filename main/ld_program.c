/*
 * Arquivo: ld_program.c
 * Projeto: CLP Didático e Modular baseado em ESP32
 * Autor: Paulo Martino Hermans
 *
 * Descrição:
 * Adaptador (wrapper) para o código gerado pelo LDmicro.
 *
 * Este módulo encapsula a chamada da função PlcCycle(),
 * mantendo o motor de scan desacoplado da implementação
 * específica do programa do usuário.
 *
 * Responsabilidades:
 *  - Inicialização do programa (quando aplicável)
 *  - Execução de um ciclo lógico completo
 *
 * Importante:
 *  - Este módulo NÃO conhece hardware
 *  - Não realiza leitura ou escrita física de IO
 *  - Atua apenas como interface para o código IEC gerado
 */

#include "ld_program.h"

/* Função principal gerada automaticamente pelo LDmicro */
extern void PlcCycle(void);

void ld_program_init(void)
{
    /* Caso o código IEC gere inicializações futuras,
       elas poderão ser chamadas aqui. */
}

void ld_program_cycle(void)
{
    /* Executa um ciclo lógico completo do programa IEC */
    PlcCycle();
}