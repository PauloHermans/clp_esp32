# CLP Didático Open-Source Baseado em ESP32

## Descrição

Este projeto implementa um Controlador Lógico Programável (CLP) didático utilizando o microcontrolador ESP32 e o framework ESP-IDF.

O objetivo é reproduzir a arquitetura clássica de um CLP industrial, separando claramente as funções de aquisição de entradas, execução da lógica de controle, atualização de saídas e comunicação externa.

A lógica de controle é desenvolvida utilizando o software LDmicro, permitindo a programação em linguagem Ladder Diagram (LD) e a geração automática de código C compatível com o projeto.

Além da execução da lógica Ladder, o sistema disponibiliza comunicação Modbus TCP para integração com sistemas supervisórios SCADA, IHMs e softwares de monitoramento industrial.

---

## Características

* Arquitetura baseada em ciclo de scan determinístico.
* Execução da lógica Ladder gerada pelo LDmicro.
* Comunicação Modbus TCP Slave.
* Entradas e saídas digitais.
* Entradas e saídas analógicas.
* Separação entre núcleo de controle e núcleo de comunicação.
* Compatível com ESP-IDF 5.x.
* Estrutura modular voltada para fins didáticos e acadêmicos.

---

## Arquitetura Geral

O sistema é dividido em dois domínios principais:

### Núcleo de Controle (Core 1)

Responsável por:

* Leitura das entradas.
* Execução da lógica Ladder.
* Atualização das saídas.
* Medição dos tempos de scan.

O Core 1 possui prioridade máxima dentro da aplicação para minimizar jitter e aumentar o determinismo.

### Núcleo de Comunicação (Core 0)

Responsável por:

* Pilha Wi-Fi.
* Modbus TCP.
* Comunicação com sistemas externos.

Esta separação evita que tarefas de rede interfiram na execução do ciclo de controle.

---

## Estrutura dos Arquivos

### main.c

Ponto de entrada da aplicação.

Responsável pela inicialização dos módulos do sistema:

* Hardware de IO.
* Comunicação.
* Temporização.
* Execução do ciclo de scan.

---

### io_map.c / io_map.h

Camada de abstração de hardware.

Responsável por:

* Configuração dos GPIOs.
* Leitura de entradas digitais.
* Escrita de saídas digitais.
* Leitura de entradas analógicas.
* Controle de saídas analógicas.
* Mapeamento físico dos canais de IO.

Toda a lógica de controle acessa os sinais através desta camada, sem dependência direta dos GPIOs do ESP32.

---

### ladder.c / ladder.h

Arquivos gerados automaticamente pelo LDmicro.

Contêm:

* Variáveis internas do programa Ladder.
* Temporizadores.
* Contadores.
* Bobinas.
* Contatos.
* Implementação da lógica gerada.

Estes arquivos normalmente não devem ser editados manualmente.

---

### ld_program.c / ld_program.h

Camada de integração entre o LDmicro e o restante do sistema.

Responsável por:

* Inicialização do programa Ladder.
* Execução de um ciclo da lógica Ladder.
* Encapsulamento das chamadas geradas pelo LDmicro.

Permite substituir ou atualizar programas Ladder sem alterar o restante da arquitetura.

---

### plc_scan.c / plc_scan.h

Implementação do ciclo principal de scan do CLP.

Executa continuamente:

1. Atualização das entradas.
2. Execução da lógica Ladder.
3. Atualização das saídas.
4. Atualização dos dados disponibilizados para comunicação.

Este módulo representa o núcleo operacional do controlador.

---

### plc_time.c / plc_time.h

Módulo de temporização e diagnóstico.

Responsável por:

* Medição do tempo de scan.
* Detecção de overruns.
* Estatísticas de execução.
* Instrumentação para análise de desempenho.

Permite avaliar o comportamento temporal do controlador.

---

### plc_coms.c / plc_coms.h

Módulo de comunicação industrial.

Responsável por:

* Inicialização da rede Wi-Fi.
* Configuração do Modbus TCP Slave.
* Disponibilização das variáveis de processo para sistemas externos.

As áreas Modbus são alimentadas a partir de snapshots produzidos pelo núcleo de controle.

---

### idf_component.yml

Arquivo de gerenciamento de dependências do ESP-IDF.

Define componentes externos utilizados pelo projeto, incluindo bibliotecas fornecidas pela Espressif.

---

## Arquivo Ladder de Exemplo

### example_program.ld

Programa Ladder de exemplo desenvolvido para o LDmicro.

Este arquivo deve ser aberto diretamente no software LDmicro.

O fluxo típico de desenvolvimento é:

1. Abrir o arquivo `.ld` no LDmicro.
2. Editar a lógica Ladder.
3. Gerar os arquivos C correspondentes.
4. Substituir os arquivos gerados no projeto.
5. Compilar utilizando o ESP-IDF.

Este procedimento permite desenvolver aplicações de automação industrial utilizando uma interface gráfica Ladder tradicional.

---

## Ciclo de Scan

O controlador executa continuamente o seguinte fluxo:

```text
Leitura das Entradas
          ↓
Execução da Lógica Ladder
          ↓
Atualização das Saídas
          ↓
Atualização dos Dados de Comunicação
          ↓
Início do Próximo Scan
```

Este modelo segue a arquitetura clássica utilizada em CLPs industriais comerciais.

---

## Comunicação Modbus

O sistema implementa Modbus TCP Slave.

Mapeamento padrão:

| Área Modbus       | Conteúdo            |
| ----------------- | ------------------- |
| Discrete Inputs   | Entradas digitais   |
| Coils             | Saídas digitais     |
| Input Registers   | Entradas analógicas |
| Holding Registers | Saídas analógicas   |

A comunicação pode ser utilizada por:

* ScadaBR
* OpenSCADA
* Ignition
* Elipse E3
* Factory I/O
* Softwares de supervisão compatíveis com Modbus TCP

---

## Ferramentas Utilizadas

* ESP32
* ESP-IDF 5.x
* FreeRTOS
* ESP-MODBUS
* LDmicro
* Modbus TCP
* Wi-Fi IEEE 802.11

---

## Objetivo Acadêmico

Este projeto foi desenvolvido como plataforma de estudos para:

* Sistemas embarcados.
* Sistemas de tempo real.
* Automação industrial.
* Linguagem Ladder.
* Arquitetura de CLPs.
* Comunicação industrial.
* Desenvolvimento com ESP32.

A arquitetura foi projetada para ser facilmente compreendida, modificada e expandida por estudantes e pesquisadores.
