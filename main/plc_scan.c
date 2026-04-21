/*
 * Arquivo: plc_scan.c
 * Projeto: CLP Didático e Modular baseado em ESP32
 * Autor: Paulo Martino Hermans
 *
 * Descrição:
 * Implementação do ciclo de scan determinístico do CLP.
 *
 * Este módulo é responsável exclusivamente por:
 *  - Garantir a execução periódica do ciclo de scan (1 ms)
 *  - Medir o tempo de execução da lógica de controle
 *  - Detectar violações temporais (overrun)
 *  - Orquestrar a chamada da lógica do usuário
 *
 * Importante:
 *  - Nenhuma lógica de controle (ladder, ST, etc.) é implementada aqui
 *  - O scan não conhece entradas, saídas ou regras de controle
 *
 * Este modelo reflete fielmente a arquitetura de CLPs industriais,
 * onde o ciclo de scan é desacoplado do programa do usuário.
 */

#include "io_map.h"
#include "plc_scan.h"
#include "plc_time.h"
#include "ld_program.h"

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_log.h"

#define PLC_SCAN_PERIOD_US 1000

/* ============================================================
 * Configuração do período de scan
 *
 * O ciclo lógico do CLP é configurado para 1 ms.
 * A temporização do FreeRTOS é utilizada apenas para
 * sincronização periódica.
 *
 * A medição precisa do tempo de execução é realizada
 * exclusivamente pelo módulo plc_time.
 * ============================================================ */
#define PLC_SCAN_PERIOD_TICKS pdMS_TO_TICKS(1)

/* Tag para logs */
static const char *TAG = "plc_scan";

/* ============================================================
 * Task responsável pelo ciclo de scan do CLP.
 *
 * Características:
 *  - Executa ciclo determinístico de 1 ms
 *  - Fixada em core dedicado
 *  - Alta prioridade
 *  - Monitoramento de overrun
 *
 * Estrutura clássica de CLP:
 *   1. Marca início do ciclo
 *   2. Executa lógica ladder
 *   3. Atualiza saídas físicas
 *   4. Mede tempo do ciclo
 *   5. Aguarda próximo período
 * ============================================================ */
static void plc_scan_task(void *arg)
{
    /* Referência usada por vTaskDelayUntil.
     * Garante periodicidade fixa, independente
     * do tempo de execução do ciclo.
     */
    TickType_t last_wake_time = xTaskGetTickCount();

    ESP_LOGI(TAG,
             "Task de scan iniciada no core %d | Periodo: %d us",
             xPortGetCoreID(),
             PLC_SCAN_PERIOD_US);

    /* ========================================================
     * Inicialização da lógica do usuário
     *
     * Pode incluir:
     *  - Reset de variáveis IEC
     *  - Reset de temporizadores (TON/TOF)
     *  - Estados iniciais de bobinas
     * ======================================================== */
    ld_program_init();

    while (1) {

        /* ================================
         * INÍCIO DO CICLO DE SCAN
         * ================================ */
        plc_time_scan_start();

        /* 1) Atualiza entradas */
        di_update();

        /* 2) Executa lógica */
        ld_program_cycle();

        /* 3) Atualiza saídas */
        do_apply_outputs();

        /* ================================
         * FIM DO CICLO DE SCAN
         * ================================ */
        plc_time_scan_end();

        /* ====================================================
         * Monitoramento de violação temporal (Overrun)
         *
         * Overrun ocorre quando:
         * tempo_execucao > periodo_configurado
         *
         * Em ambiente industrial isso é crítico.
         * ==================================================== */
        if (plc_time_had_overrun()) {
            ESP_LOGW(TAG,
                     "OVERRUN detectado! Scan=%lu us | Max=%lu us",
                     plc_time_get_last_scan_us(),
                     plc_time_get_max_scan_us());
        }

        /* ====================================================
         * Sincronização temporal determinística
         *
         * vTaskDelayUntil:
         *  - Mantém período fixo
         *  - Compensa variações de execução
         *  - Evita drift acumulativo
         *
         * Diferente de vTaskDelay(), aqui o período é
         * absolutamente estável.
         * ==================================================== */
        vTaskDelayUntil(&last_wake_time, PLC_SCAN_PERIOD_TICKS);
    }
}

/* ============================================================
 * Inicialização pública do módulo de scan
 *
 * Deve ser chamada uma única vez em app_main().
 *
 * Core 1 foi escolhido para:
 *  - Isolar do WiFi (normalmente core 0)
 *  - Reduzir jitter
 * ============================================================ */
void plc_scan_start(void)
{
    BaseType_t result = xTaskCreatePinnedToCore(
        plc_scan_task,   /* Função da task */
        "plc_scan",      /* Nome */
        4096,            /* Stack */
        NULL,            /* Parâmetros */
        10,              /* Prioridade alta */
        NULL,            /* Handle */
        1                /* Core dedicado */
    );

    if (result != pdPASS) {
        ESP_LOGE(TAG, "Falha ao criar task de scan!");
    }
}