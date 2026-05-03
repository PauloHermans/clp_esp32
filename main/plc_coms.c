/* 
* Arquivo: plc_coms.c 
* Projeto: CLP Didático e Modular baseado em ESP32 
* Autor: Paulo Martino Hermans 
* 
* Descrição: 
* 
*/

#include "plc_coms.h"
#include "io_map.h"

#include "esp_log.h"
#include "nvs_flash.h"

#include "esp_wifi.h"
#include "esp_event.h"
#include "esp_netif.h"

#include "esp_modbus_slave.h"

/* ============================================================ */

#define WIFI_SSID      "YOURSSID"
#define WIFI_PASSWORD  "YOURPASSWORD"

static const char *TAG = "plc_coms";

/* ============================================================ */
/* BUFFERS MODBUS */
/* ============================================================ */

static uint8_t mb_di[NUM_DI];
static uint8_t mb_do[NUM_DO];

static uint16_t mb_ai[NUM_AI];
static uint16_t mb_ao[NUM_AO];

/* ============================================================ */
/* WIFI EVENT HANDLER (PEGA IP) */
/* ============================================================ */

static void wifi_event_handler(void *arg,
                               esp_event_base_t event_base,
                               int32_t event_id,
                               void *event_data)
{
    if (event_base == IP_EVENT && event_id == IP_EVENT_STA_GOT_IP) {
        ip_event_got_ip_t *event = (ip_event_got_ip_t *)event_data;
        ESP_LOGI(TAG, "IP obtido: " IPSTR, IP2STR(&event->ip_info.ip));
    }
}

/* ============================================================ */
/* WIFI */
/* ============================================================ */

static void wifi_init_sta(void)
{
    esp_netif_init();
    esp_event_loop_create_default();
    esp_netif_create_default_wifi_sta();

    esp_event_handler_register(IP_EVENT, IP_EVENT_STA_GOT_IP,
                               &wifi_event_handler, NULL);

    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    esp_wifi_init(&cfg);

    wifi_config_t wifi_config = {
        .sta = {
            .ssid = WIFI_SSID,
            .password = WIFI_PASSWORD,
        },
    };

    esp_wifi_set_mode(WIFI_MODE_STA);
    esp_wifi_set_config(WIFI_IF_STA, &wifi_config);
    esp_wifi_start();
    esp_wifi_connect();

    ESP_LOGI(TAG, "WiFi iniciado, conectando...");
}

/* ============================================================ */
/* ATUALIZA BUFFERS */
/* ============================================================ */

static void update_modbus_buffers(void)
{
    for (uint8_t i = 0; i < NUM_DI; i++) {
        mb_di[i] = di_get(i);
    }

    for (uint8_t i = 0; i < NUM_DO; i++) {
        mb_do[i] = do_get(i);
    }
    for (uint8_t i = 0; i < NUM_AI; i++) {
        mb_ai[i] = ai_get_raw(i);   // novo getter
    }

    for (uint8_t i = 0; i < NUM_AO; i++) {
        mb_ao[i] = ao_get_raw(i);   // novo getter
    }
}

/* ====================== Variáveis estáticas ====================== */

static void *mb_slave_handle = NULL;

/* ============================================================ */
/* MODBUS TCP SLAVE - ESP-MODBUS (IDF 5.5)                     */
/* ============================================================ */

static void modbus_init(void)
{
    ESP_LOGI(TAG, "Inicializando Modbus TCP Slave...");

    mb_communication_info_t comm_info = {
        .tcp_opts = {
            .port      = 502,                    // Porta fixa (recomendado)
            .uid       = 1,                      // Unit ID / Slave Address
            .mode      = MB_TCP,
            .addr_type = MB_IPV4,
        }
    };

    // Criar o controller Modbus TCP Slave
    esp_err_t err = mbc_slave_create_tcp(&comm_info, &mb_slave_handle);
    if (err != ESP_OK || mb_slave_handle == NULL) {
        ESP_LOGE(TAG, "Falha ao criar Modbus TCP slave: %s (0x%x)", esp_err_to_name(err), err);
        return;
    }

    ESP_LOGI(TAG, "Modbus TCP controller criado com sucesso");

    // Discrete Inputs
    mb_register_area_descriptor_t reg_di = {
        .type         = MB_PARAM_DISCRETE,
        .start_offset = 0,
        .address      = (void *)mb_di,
        .size         = sizeof(mb_di)
    };
    ESP_ERROR_CHECK(mbc_slave_set_descriptor(mb_slave_handle, reg_di));

    // Coils (Digital Outputs)
    mb_register_area_descriptor_t reg_coils = {
        .type         = MB_PARAM_COIL,
        .start_offset = 0,
        .address      = (void *)mb_do,
        .size         = sizeof(mb_do)
    };
    ESP_ERROR_CHECK(mbc_slave_set_descriptor(mb_slave_handle, reg_coils));

    mb_register_area_descriptor_t reg_input = {
        .type = MB_PARAM_INPUT,
        .start_offset = 0,
        .address = (void *)mb_ai,
        .size = sizeof(mb_ai)
    };
    ESP_ERROR_CHECK(mbc_slave_set_descriptor(mb_slave_handle, reg_input));
    
    mb_register_area_descriptor_t reg_holding = {
        .type = MB_PARAM_HOLDING,
        .start_offset = 0,
        .address = (void *)mb_ao,
        .size = sizeof(mb_ao)
    };
    ESP_ERROR_CHECK(mbc_slave_set_descriptor(mb_slave_handle, reg_holding));    

    // Iniciar a stack
    ESP_ERROR_CHECK(mbc_slave_start(mb_slave_handle));

    ESP_LOGI(TAG, "Modbus TCP Slave iniciado com sucesso!");
    ESP_LOGI(TAG, "Porta: 502 | Unit ID: 1");
}

/* ============================================================ */
/* TASK */
/* ============================================================ */

static void modbus_update_task(void *arg)
{
    while (1) {
        update_modbus_buffers();
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}

/* ============================================================ */
/* INIT */
/* ============================================================ */

void plc_coms_init(void)
{
    ESP_LOGI(TAG, "Inicializando comunicação...");

    ESP_ERROR_CHECK(nvs_flash_init());

    wifi_init_sta();

    /* espera WiFi subir */
    vTaskDelay(pdMS_TO_TICKS(3000));

    /* IMPORTANTE: só inicia depois do WiFi */
    modbus_init();

    xTaskCreatePinnedToCore(
        modbus_update_task,
        "modbus_update",
        4096,
        NULL,
        5,
        NULL,
        0
    );
}