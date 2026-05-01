/*
 * Arquivo: main.c
 * Projeto: CLP Didático e Modular baseado em ESP32
 * Autor: Paulo Martino Hermans
 *
 * Descrição:
 * Ponto de entrada da aplicação embarcada.
 *
 * Este arquivo é responsável exclusivamente pela
 * inicialização estruturada dos módulos do sistema e
 * pela ativação do ciclo determinístico do CLP.
 *
 * A lógica de controle (ciclo de scan) NÃO é implementada
 * neste arquivo. Ela é executada por uma task dedicada
 * (plc_scan), com período fixo de 1 ms, garantindo:
 *
 *  - Separação clara de responsabilidades
 *  - Melhor organização arquitetural
 *  - Determinismo temporal
 *  - Estrutura alinhada a CLPs industriais
 *
 * Após a inicialização dos módulos, o controle da aplicação
 * é totalmente delegado ao escalonador do FreeRTOS.
 */

#include "io_map.h"
#include "plc_scan.h"
#include "plc_time.h"
#include "plc_coms.h"

#include "esp_log.h"

//#include "freertos/FreeRTOS.h"
//#include "freertos/task.h"
#include "driver/gpio.h"

/* Tag para logs do módulo principal */
static const char *TAG = "main";

void app_main(void)
{
    ESP_LOGI(TAG, "Inicializando sistema CLP baseado em ESP32 (scan = 1 ms)");

    /* ============================================================
     * Inicialização do hardware de entradas e saídas.
     *
     * Deve ocorrer antes da ativação do ciclo de scan,
     * garantindo que todos os GPIOs estejam configurados
     * corretamente antes da primeira execução da lógica.
     * ============================================================ */
    io_init();

    /* ============================================================
     * Inicialização do módulo de medição temporal.
     *
     * Responsável por:
     *  - Medir o tempo real de execução do scan
     *  - Detectar overruns
     *  - Manter estatísticas de tempo máximo e último ciclo
     *
     * Fundamental para validação de determinismo.
     * ============================================================ */
    plc_time_init();

    /* ============================================================
     * Inicialização do ciclo determinístico do CLP.
     *
     * A partir deste ponto:
     *  - A task plc_scan é criada
     *  - O ciclo é executado a cada 1 ms
     *  - PlcCycle() passa a ser chamado periodicamente
     *
     * O controle lógico do sistema é então delegado
     * completamente ao escalonador do FreeRTOS.
     * ============================================================ */
    plc_scan_start();

    /*
    */
    plc_coms_init();

    ESP_LOGI(TAG, "Sistema inicializado. Controle entregue ao ciclo de scan.");
}