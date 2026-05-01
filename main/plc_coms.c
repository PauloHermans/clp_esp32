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

#define WIFI_SSID      "Wifi Paulo"
#define WIFI_PASSWORD  "timmermans"

static const char *TAG = "plc_coms";

/* ============================================================ */
/* BUFFERS MODBUS */
/* ============================================================ */

static uint8_t mb_di[NUM_DI];
static uint8_t mb_do[NUM_DO];

/* ============================================================ */
/* CONTROLE DE CONEXÃO WIFI */
/* ============================================================ */

static bool wifi_connected = false;

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
        wifi_connected = true;
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
}

/* ============================================================ */
/* MODBUS TCP (COMPATÍVEL IDF 5.x + esp-modbus atual) */
/* ============================================================ */

static void modbus_init(void)
{
    void *ctx = NULL;

    ESP_LOGI(TAG, "Inicializando Modbus...");

    /* Inicializa controller (transporte definido via menuconfig) */
    ESP_ERROR_CHECK(mbc_slave_init_iface(&ctx));

    if (ctx == NULL) {
        ESP_LOGE(TAG, "Erro: contexto Modbus NULL");
        return;
    }

    /* ================================
     * DISCRETE INPUTS
     * ================================ */
    mb_register_area_descriptor_t reg_di = {
        .type = MB_PARAM_DISCRETE,
        .start_offset = 0,
        .address = (void *)mb_di,
        .size = sizeof(mb_di)
    };

    ESP_ERROR_CHECK(mbc_slave_set_descriptor(ctx, reg_di));

    /* ================================
     * COILS
     * ================================ */
    mb_register_area_descriptor_t reg_coils = {
        .type = MB_PARAM_COIL,
        .start_offset = 0,
        .address = (void *)mb_do,
        .size = sizeof(mb_do)
    };

    ESP_ERROR_CHECK(mbc_slave_set_descriptor(ctx, reg_coils));

    /* Inicia stack */
    ESP_ERROR_CHECK(mbc_slave_start(ctx));

    ESP_LOGI(TAG, "Modbus iniciado (TCP via menuconfig)");
}

/* ============================================================ */
/* TASK */
/* ============================================================ */

static void modbus_update_task(void *arg)
{
    while (1) {
        update_modbus_buffers();
        vTaskDelay(pdMS_TO_TICKS(10));
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

    /* Espera conexão real com WiFi (IP obtido) */
    while (!wifi_connected) {
        vTaskDelay(pdMS_TO_TICKS(100));
    }

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