PROGRAM main
VAR
	DI1 : bool AT %IX0.0;
	DI2 : bool AT %IX0.1;
	DI3 : bool AT %IX0.2;
	DI4 : bool AT %IX0.3;
	DI5 : bool AT %IX0.4;
	DI6 : bool AT %IX0.5;
	DO1 : bool AT %QX0.0;
	DO2 : bool AT %QX0.1;
	DO3 : bool AT %QX0.2;
	DO4 : bool AT %QX0.3;
	DO5 : bool AT %QX0.4;
	DO6 : bool AT %QX0.5;
	AI1 : uint AT %IW0;
	AI2 : uint AT %IW1;
	AO1 : uint AT %QW0;
	AO2 : uint AT %QW1;
	M1 : bool;
	M2 : bool;
	M3 : bool;
	TON1 : TON;
	TON2 : TON;
	TON3 : TON;
END_VAR

{
  "name": "main",
  "rungs": [
    {
      "id": "rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        323,
        120
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "type": "powerRail",
          "position": {
            "x": 0,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 3,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "left-rail",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 20,
                "right": -3
              }
            },
            "numericId": "8307685",
            "variant": "left",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "CONTACT_0da9bd3e-db57-4ab0-8df7-72b11f2f9091",
          "type": "contact",
          "position": {
            "x": 68,
            "y": 38
          },
          "height": 24,
          "width": 24,
          "measured": {
            "width": 24,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 92,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "negated",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 92,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 68,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 92,
                "y": 50
              },
              "relPosition": {
                "x": 24,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "6593047",
            "variable": {
              "name": "M1",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "COIL_d8f3a7d5-42f1-4d15-9680-1f19229c4271",
          "type": "coil",
          "position": {
            "x": 182,
            "y": 38
          },
          "height": 24,
          "width": 28,
          "measured": {
            "width": 28,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 182,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 210,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "default",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 182,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 210,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 182,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 210,
                "y": 50
              },
              "relPosition": {
                "x": 28,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "5862642",
            "variable": {
              "name": "DO1",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "%QX0.0",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "right-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "type": "powerRail",
          "position": {
            "x": 320,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                },
                "x": 320
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                }
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 297,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "right-rail",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 20,
                "left": -3
              }
            },
            "numericId": "10364353",
            "variant": "right",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        }
      ],
      "edges": [
        {
          "id": "e_left-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40_CONTACT_0da9bd3e-db57-4ab0-8df7-72b11f2f9091__left-rail_input",
          "source": "left-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "sourceHandle": "left-rail",
          "target": "CONTACT_0da9bd3e-db57-4ab0-8df7-72b11f2f9091",
          "targetHandle": "input"
        },
        {
          "id": "e_CONTACT_0da9bd3e-db57-4ab0-8df7-72b11f2f9091_COIL_d8f3a7d5-42f1-4d15-9680-1f19229c4271__output_input",
          "source": "CONTACT_0da9bd3e-db57-4ab0-8df7-72b11f2f9091",
          "sourceHandle": "output",
          "target": "COIL_d8f3a7d5-42f1-4d15-9680-1f19229c4271",
          "targetHandle": "input"
        },
        {
          "id": "e_COIL_d8f3a7d5-42f1-4d15-9680-1f19229c4271_right-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40__output_right-rail",
          "source": "COIL_d8f3a7d5-42f1-4d15-9680-1f19229c4271",
          "sourceHandle": "output",
          "target": "right-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "targetHandle": "right-rail"
        }
      ]
    },
    {
      "id": "rung_main_70c231d9-97d3-4805-83fb-c0fcd73fca10",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        629,
        134
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "type": "powerRail",
          "position": {
            "x": 0,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 3,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "left-rail",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 20,
                "right": -3
              }
            },
            "numericId": "1498683",
            "variant": "left",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "CONTACT_bec6f8e2-faa4-4d08-9d55-4cf85bd6e001",
          "type": "contact",
          "position": {
            "x": 68,
            "y": 38
          },
          "height": 24,
          "width": 24,
          "measured": {
            "width": 24,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 92,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "negated",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 92,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 68,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 92,
                "y": 50
              },
              "relPosition": {
                "x": 24,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "4070486",
            "variable": {
              "name": "M3",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "BLOCK_01dfc183-5830-48d0-91fd-fdfc7729c677",
          "type": "block",
          "position": {
            "x": 257,
            "y": 14
          },
          "height": 100,
          "width": 66,
          "measured": {
            "width": 66,
            "height": 100
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 257,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "IN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 257,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "PT",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 323,
                  "y": 50
                },
                "relPosition": {
                  "x": 66,
                  "y": 36
                },
                "id": "Q",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 323,
                  "y": 90
                },
                "relPosition": {
                  "x": 66,
                  "y": 76
                },
                "id": "ET",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 257,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "IN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 257,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "PT",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 323,
                  "y": 50
                },
                "relPosition": {
                  "x": 66,
                  "y": 36
                },
                "id": "Q",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 323,
                  "y": 90
                },
                "relPosition": {
                  "x": 66,
                  "y": 76
                },
                "id": "ET",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 257,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 36
              },
              "id": "IN",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 36,
                "left": 0
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 323,
                "y": 50
              },
              "relPosition": {
                "x": 66,
                "y": 36
              },
              "id": "Q",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 36,
                "right": 0
              }
            },
            "numericId": "7534713",
            "variant": {
              "name": "TON",
              "type": "function-block",
              "language": "st",
              "variables": [
                {
                  "name": "IN",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "documentation": "first input parameter"
                },
                {
                  "name": "PT",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  },
                  "documentation": "second input parameter"
                },
                {
                  "name": "Q",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "initialValue": {
                    "value": "FALSE"
                  },
                  "documentation": "first output parameter"
                },
                {
                  "name": "ET",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  },
                  "initialValue": {
                    "value": "T#0s"
                  },
                  "documentation": "second output parameter"
                },
                {
                  "name": "STATE",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "SINT"
                  },
                  "initialValue": {
                    "value": "0"
                  },
                  "documentation": "internal state: 0-reset, 1-counting, 2-set"
                },
                {
                  "name": "PREV_IN",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "initialValue": {
                    "value": "FALSE"
                  }
                },
                {
                  "name": "CURRENT_TIME",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  }
                },
                {
                  "name": "START_TIME",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  }
                }
              ],
              "body": "{__SET_VAR(data__->,CURRENT_TIME,,__CURRENT_TIME)}\n\n      IF ((STATE = 0) AND NOT(PREV_IN) AND IN)   (* found rising edge on IN *)\n      THEN\n        (* start timer... *)\n        STATE := 1;\n        Q := TRUE;\n        START_TIME := CURRENT_TIME;\n\n      ELSE\n        (* STATE is 1 or 2 !! *)\n        IF (NOT(IN))\n        THEN\n          ET := T#0s;\n          Q := FALSE;\n          STATE := 0;\n\n        ELSIF (STATE = 1)\n        THEN\n          IF ((START_TIME + PT) <= CURRENT_TIME)\n          THEN\n            STATE := 2;\n            Q := TRUE;\n            ET := PT;\n          ELSE\n            ET := CURRENT_TIME - START_TIME;\n          END_IF;\n        END_IF;\n\n      END_IF;\n\n      PREV_IN := IN;",
              "documentation": "The on-delay timer can be used to delay setting an output true, for fixed period after an input becomes true."
            },
            "variable": {
              "name": "TON1",
              "type": {
                "definition": "derived",
                "value": "TON"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": false,
            "lockExecutionControl": false,
            "connectedVariables": [
              {
                "handleId": "PT",
                "type": "input",
                "variable": {
                  "name": "T#5s"
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "COIL_81d284bc-a0e7-4f0b-94fd-6d8c3ec37d51",
          "type": "coil",
          "position": {
            "x": 488,
            "y": 38
          },
          "height": 24,
          "width": 28,
          "measured": {
            "width": 28,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 488,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 516,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "default",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 488,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 516,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 488,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 516,
                "y": 50
              },
              "relPosition": {
                "x": 28,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "6345387",
            "variable": {
              "name": "M1",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "right-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "type": "powerRail",
          "position": {
            "x": 626,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                },
                "x": 626
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                }
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 297,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "right-rail",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 20,
                "left": -3
              }
            },
            "numericId": "4941441",
            "variant": "right",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "VARIABLE_4608b2a4-7c63-42c1-8242-90b60ce9a435",
          "type": "variable",
          "position": {
            "x": 147,
            "y": 74
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 307,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 307,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 307,
                "y": 90
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "6153010",
            "variable": {
              "name": "T#5s"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_01dfc183-5830-48d0-91fd-fdfc7729c677",
              "handleId": "PT",
              "variableType": {
                "name": "PT",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "TIME"
                },
                "documentation": "second input parameter"
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_155e8723-6b38-48fc-885d-56916737c2c5",
          "type": "variable",
          "position": {
            "x": 353,
            "y": 74
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 353,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 353,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 353,
                "y": 90
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "4829986",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_01dfc183-5830-48d0-91fd-fdfc7729c677",
              "handleId": "ET",
              "variableType": {
                "name": "ET",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "TIME"
                },
                "initialValue": {
                  "value": "T#0s"
                },
                "documentation": "second output parameter"
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        }
      ],
      "edges": [
        {
          "id": "e_left-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40_CONTACT_bec6f8e2-faa4-4d08-9d55-4cf85bd6e001__left-rail_input",
          "source": "left-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "sourceHandle": "left-rail",
          "target": "CONTACT_bec6f8e2-faa4-4d08-9d55-4cf85bd6e001",
          "targetHandle": "input"
        },
        {
          "id": "e_COIL_81d284bc-a0e7-4f0b-94fd-6d8c3ec37d51_right-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40__output_right-rail",
          "source": "COIL_81d284bc-a0e7-4f0b-94fd-6d8c3ec37d51",
          "sourceHandle": "output",
          "target": "right-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_CONTACT_bec6f8e2-faa4-4d08-9d55-4cf85bd6e001_BLOCK_01dfc183-5830-48d0-91fd-fdfc7729c677__output_IN",
          "source": "CONTACT_bec6f8e2-faa4-4d08-9d55-4cf85bd6e001",
          "sourceHandle": "output",
          "target": "BLOCK_01dfc183-5830-48d0-91fd-fdfc7729c677",
          "targetHandle": "IN"
        },
        {
          "id": "e_BLOCK_01dfc183-5830-48d0-91fd-fdfc7729c677_COIL_81d284bc-a0e7-4f0b-94fd-6d8c3ec37d51__Q_input",
          "source": "BLOCK_01dfc183-5830-48d0-91fd-fdfc7729c677",
          "sourceHandle": "Q",
          "target": "COIL_81d284bc-a0e7-4f0b-94fd-6d8c3ec37d51",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_4608b2a4-7c63-42c1-8242-90b60ce9a435_BLOCK_01dfc183-5830-48d0-91fd-fdfc7729c677__output_PT",
          "source": "VARIABLE_4608b2a4-7c63-42c1-8242-90b60ce9a435",
          "sourceHandle": "output",
          "target": "BLOCK_01dfc183-5830-48d0-91fd-fdfc7729c677",
          "targetHandle": "PT"
        },
        {
          "id": "e_BLOCK_01dfc183-5830-48d0-91fd-fdfc7729c677_VARIABLE_155e8723-6b38-48fc-885d-56916737c2c5__ET_input",
          "source": "BLOCK_01dfc183-5830-48d0-91fd-fdfc7729c677",
          "sourceHandle": "ET",
          "target": "VARIABLE_155e8723-6b38-48fc-885d-56916737c2c5",
          "targetHandle": "input"
        }
      ]
    },
    {
      "id": "rung_main_660762f0-1abb-4782-93fe-876f8f601987",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        437,
        120
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "type": "powerRail",
          "position": {
            "x": 0,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 3,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "left-rail",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 20,
                "right": -3
              }
            },
            "numericId": "866497",
            "variant": "left",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "CONTACT_30c503a4-10c4-426a-baba-4cbc8b271cde",
          "type": "contact",
          "position": {
            "x": 68,
            "y": 38
          },
          "height": 24,
          "width": 24,
          "measured": {
            "width": 24,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 92,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "default",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 92,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 68,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 92,
                "y": 50
              },
              "relPosition": {
                "x": 24,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "2511079",
            "variable": {
              "name": "M1",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "CONTACT_68d1877a-fab9-4d59-8335-c5d6b37557e9",
          "type": "contact",
          "position": {
            "x": 182,
            "y": 38
          },
          "height": 24,
          "width": 24,
          "measured": {
            "width": 24,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 182,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 206,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "negated",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 182,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 206,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 182,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 206,
                "y": 50
              },
              "relPosition": {
                "x": 24,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "344459",
            "variable": {
              "name": "M2",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "COIL_a2958589-e499-4a8a-a5ad-32f5acf8ffd6",
          "type": "coil",
          "position": {
            "x": 296,
            "y": 38
          },
          "height": 24,
          "width": 28,
          "measured": {
            "width": 28,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 296,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 324,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "default",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 296,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 324,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 296,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 324,
                "y": 50
              },
              "relPosition": {
                "x": 28,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "4640691",
            "variable": {
              "name": "DO2",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "%QX0.1",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "right-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "type": "powerRail",
          "position": {
            "x": 434,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                },
                "x": 434
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                }
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 297,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "right-rail",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 20,
                "left": -3
              }
            },
            "numericId": "3861282",
            "variant": "right",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        }
      ],
      "edges": [
        {
          "id": "e_left-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40_CONTACT_30c503a4-10c4-426a-baba-4cbc8b271cde__left-rail_input",
          "source": "left-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "sourceHandle": "left-rail",
          "target": "CONTACT_30c503a4-10c4-426a-baba-4cbc8b271cde",
          "targetHandle": "input"
        },
        {
          "id": "e_COIL_a2958589-e499-4a8a-a5ad-32f5acf8ffd6_right-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40__output_right-rail",
          "source": "COIL_a2958589-e499-4a8a-a5ad-32f5acf8ffd6",
          "sourceHandle": "output",
          "target": "right-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_CONTACT_30c503a4-10c4-426a-baba-4cbc8b271cde_CONTACT_68d1877a-fab9-4d59-8335-c5d6b37557e9__output_input",
          "source": "CONTACT_30c503a4-10c4-426a-baba-4cbc8b271cde",
          "sourceHandle": "output",
          "target": "CONTACT_68d1877a-fab9-4d59-8335-c5d6b37557e9",
          "targetHandle": "input"
        },
        {
          "id": "e_CONTACT_68d1877a-fab9-4d59-8335-c5d6b37557e9_COIL_a2958589-e499-4a8a-a5ad-32f5acf8ffd6__output_input",
          "source": "CONTACT_68d1877a-fab9-4d59-8335-c5d6b37557e9",
          "sourceHandle": "output",
          "target": "COIL_a2958589-e499-4a8a-a5ad-32f5acf8ffd6",
          "targetHandle": "input"
        }
      ]
    },
    {
      "id": "rung_main_aa44559f-5889-449c-b782-602885f5712e",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        629,
        134
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "type": "powerRail",
          "position": {
            "x": 0,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 3,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "left-rail",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 20,
                "right": -3
              }
            },
            "numericId": "1626649",
            "variant": "left",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "CONTACT_50d91144-eff2-468f-ac86-3f1d21f56c56",
          "type": "contact",
          "position": {
            "x": 68,
            "y": 38
          },
          "height": 24,
          "width": 24,
          "measured": {
            "width": 24,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 92,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "default",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 92,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 68,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 92,
                "y": 50
              },
              "relPosition": {
                "x": 24,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "8738993",
            "variable": {
              "name": "M1",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "BLOCK_891c28d4-5eff-419b-9d2b-e09dcfbae2ab",
          "type": "block",
          "position": {
            "x": 257,
            "y": 14
          },
          "height": 100,
          "width": 66,
          "measured": {
            "width": 66,
            "height": 100
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 257,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "IN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 257,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "PT",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 323,
                  "y": 50
                },
                "relPosition": {
                  "x": 66,
                  "y": 36
                },
                "id": "Q",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 323,
                  "y": 90
                },
                "relPosition": {
                  "x": 66,
                  "y": 76
                },
                "id": "ET",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 257,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "IN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 257,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "PT",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 323,
                  "y": 50
                },
                "relPosition": {
                  "x": 66,
                  "y": 36
                },
                "id": "Q",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 323,
                  "y": 90
                },
                "relPosition": {
                  "x": 66,
                  "y": 76
                },
                "id": "ET",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 257,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 36
              },
              "id": "IN",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 36,
                "left": 0
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 323,
                "y": 50
              },
              "relPosition": {
                "x": 66,
                "y": 36
              },
              "id": "Q",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 36,
                "right": 0
              }
            },
            "numericId": "8073846",
            "variant": {
              "name": "TON",
              "type": "function-block",
              "language": "st",
              "variables": [
                {
                  "name": "IN",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "documentation": "first input parameter"
                },
                {
                  "name": "PT",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  },
                  "documentation": "second input parameter"
                },
                {
                  "name": "Q",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "initialValue": {
                    "value": "FALSE"
                  },
                  "documentation": "first output parameter"
                },
                {
                  "name": "ET",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  },
                  "initialValue": {
                    "value": "T#0s"
                  },
                  "documentation": "second output parameter"
                },
                {
                  "name": "STATE",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "SINT"
                  },
                  "initialValue": {
                    "value": "0"
                  },
                  "documentation": "internal state: 0-reset, 1-counting, 2-set"
                },
                {
                  "name": "PREV_IN",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "initialValue": {
                    "value": "FALSE"
                  }
                },
                {
                  "name": "CURRENT_TIME",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  }
                },
                {
                  "name": "START_TIME",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  }
                }
              ],
              "body": "{__SET_VAR(data__->,CURRENT_TIME,,__CURRENT_TIME)}\n\n      IF ((STATE = 0) AND NOT(PREV_IN) AND IN)   (* found rising edge on IN *)\n      THEN\n        (* start timer... *)\n        STATE := 1;\n        Q := TRUE;\n        START_TIME := CURRENT_TIME;\n\n      ELSE\n        (* STATE is 1 or 2 !! *)\n        IF (NOT(IN))\n        THEN\n          ET := T#0s;\n          Q := FALSE;\n          STATE := 0;\n\n        ELSIF (STATE = 1)\n        THEN\n          IF ((START_TIME + PT) <= CURRENT_TIME)\n          THEN\n            STATE := 2;\n            Q := TRUE;\n            ET := PT;\n          ELSE\n            ET := CURRENT_TIME - START_TIME;\n          END_IF;\n        END_IF;\n\n      END_IF;\n\n      PREV_IN := IN;",
              "documentation": "The on-delay timer can be used to delay setting an output true, for fixed period after an input becomes true."
            },
            "variable": {
              "name": "TON2",
              "type": {
                "definition": "derived",
                "value": "TON"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": false,
            "lockExecutionControl": false,
            "connectedVariables": [
              {
                "handleId": "PT",
                "type": "input",
                "variable": {
                  "name": "T#2s"
                }
              },
              {
                "handleId": "ET",
                "type": "output",
                "variable": {
                  "name": ""
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "COIL_a176159e-46ff-4be6-ba92-f9aed56716a7",
          "type": "coil",
          "position": {
            "x": 488,
            "y": 38
          },
          "height": 24,
          "width": 28,
          "measured": {
            "width": 28,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 488,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 516,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "default",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 488,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 516,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 488,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 516,
                "y": 50
              },
              "relPosition": {
                "x": 28,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "5103035",
            "variable": {
              "name": "M2",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "right-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "type": "powerRail",
          "position": {
            "x": 626,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                },
                "x": 626
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                }
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 297,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "right-rail",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 20,
                "left": -3
              }
            },
            "numericId": "5573104",
            "variant": "right",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "VARIABLE_c40fe59b-3ba2-4489-970b-68327dba0c0a",
          "type": "variable",
          "position": {
            "x": 147,
            "y": 74
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 307,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 307,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 307,
                "y": 90
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "8697241",
            "variable": {
              "name": "T#2s"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_891c28d4-5eff-419b-9d2b-e09dcfbae2ab",
              "handleId": "PT",
              "variableType": {
                "name": "PT",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "TIME"
                },
                "documentation": "second input parameter"
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_f2f0ddea-6325-4b1e-b4b7-1c7d3c03f8b5",
          "type": "variable",
          "position": {
            "x": 353,
            "y": 74
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 353,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 353,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 353,
                "y": 90
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "5980074",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_891c28d4-5eff-419b-9d2b-e09dcfbae2ab",
              "handleId": "ET",
              "variableType": {
                "name": "ET",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "TIME"
                },
                "initialValue": {
                  "value": "T#0s"
                },
                "documentation": "second output parameter"
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        }
      ],
      "edges": [
        {
          "id": "e_left-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40_CONTACT_50d91144-eff2-468f-ac86-3f1d21f56c56__left-rail_input",
          "source": "left-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "sourceHandle": "left-rail",
          "target": "CONTACT_50d91144-eff2-468f-ac86-3f1d21f56c56",
          "targetHandle": "input"
        },
        {
          "id": "e_COIL_a176159e-46ff-4be6-ba92-f9aed56716a7_right-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40__output_right-rail",
          "source": "COIL_a176159e-46ff-4be6-ba92-f9aed56716a7",
          "sourceHandle": "output",
          "target": "right-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_CONTACT_50d91144-eff2-468f-ac86-3f1d21f56c56_BLOCK_891c28d4-5eff-419b-9d2b-e09dcfbae2ab__output_IN",
          "source": "CONTACT_50d91144-eff2-468f-ac86-3f1d21f56c56",
          "sourceHandle": "output",
          "target": "BLOCK_891c28d4-5eff-419b-9d2b-e09dcfbae2ab",
          "targetHandle": "IN"
        },
        {
          "id": "e_BLOCK_891c28d4-5eff-419b-9d2b-e09dcfbae2ab_COIL_a176159e-46ff-4be6-ba92-f9aed56716a7__Q_input",
          "source": "BLOCK_891c28d4-5eff-419b-9d2b-e09dcfbae2ab",
          "sourceHandle": "Q",
          "target": "COIL_a176159e-46ff-4be6-ba92-f9aed56716a7",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_c40fe59b-3ba2-4489-970b-68327dba0c0a_BLOCK_891c28d4-5eff-419b-9d2b-e09dcfbae2ab__output_PT",
          "source": "VARIABLE_c40fe59b-3ba2-4489-970b-68327dba0c0a",
          "sourceHandle": "output",
          "target": "BLOCK_891c28d4-5eff-419b-9d2b-e09dcfbae2ab",
          "targetHandle": "PT"
        },
        {
          "id": "e_BLOCK_891c28d4-5eff-419b-9d2b-e09dcfbae2ab_VARIABLE_f2f0ddea-6325-4b1e-b4b7-1c7d3c03f8b5__ET_input",
          "source": "BLOCK_891c28d4-5eff-419b-9d2b-e09dcfbae2ab",
          "sourceHandle": "ET",
          "target": "VARIABLE_f2f0ddea-6325-4b1e-b4b7-1c7d3c03f8b5",
          "targetHandle": "input"
        }
      ]
    },
    {
      "id": "rung_main_dcbdb20f-d92a-4c16-8d5d-c3e2fa3ba24b",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        323,
        120
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "type": "powerRail",
          "position": {
            "x": 0,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 3,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "left-rail",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 20,
                "right": -3
              }
            },
            "numericId": "6768515",
            "variant": "left",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "CONTACT_2615788a-1298-4c2d-a1cf-75cd26e439e6",
          "type": "contact",
          "position": {
            "x": 68,
            "y": 38
          },
          "height": 24,
          "width": 24,
          "measured": {
            "width": 24,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 92,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "default",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 92,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 68,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 92,
                "y": 50
              },
              "relPosition": {
                "x": 24,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "4320581",
            "variable": {
              "name": "M2",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "COIL_33822c1c-ea05-4e49-86f1-723f7bddb874",
          "type": "coil",
          "position": {
            "x": 182,
            "y": 38
          },
          "height": 24,
          "width": 28,
          "measured": {
            "width": 28,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 182,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 210,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "default",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 182,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 210,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 182,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 210,
                "y": 50
              },
              "relPosition": {
                "x": 28,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "9847859",
            "variable": {
              "name": "DO3",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "%QX0.2",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "right-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "type": "powerRail",
          "position": {
            "x": 320,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                },
                "x": 320
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                }
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 297,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "right-rail",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 20,
                "left": -3
              }
            },
            "numericId": "7505410",
            "variant": "right",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        }
      ],
      "edges": [
        {
          "id": "e_left-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40_CONTACT_2615788a-1298-4c2d-a1cf-75cd26e439e6__left-rail_input",
          "source": "left-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "sourceHandle": "left-rail",
          "target": "CONTACT_2615788a-1298-4c2d-a1cf-75cd26e439e6",
          "targetHandle": "input"
        },
        {
          "id": "e_CONTACT_2615788a-1298-4c2d-a1cf-75cd26e439e6_COIL_33822c1c-ea05-4e49-86f1-723f7bddb874__output_input",
          "source": "CONTACT_2615788a-1298-4c2d-a1cf-75cd26e439e6",
          "sourceHandle": "output",
          "target": "COIL_33822c1c-ea05-4e49-86f1-723f7bddb874",
          "targetHandle": "input"
        },
        {
          "id": "e_COIL_33822c1c-ea05-4e49-86f1-723f7bddb874_right-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40__output_right-rail",
          "source": "COIL_33822c1c-ea05-4e49-86f1-723f7bddb874",
          "sourceHandle": "output",
          "target": "right-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "targetHandle": "right-rail"
        }
      ]
    },
    {
      "id": "rung_main_6904e7fb-ecf4-4ad0-8094-dd171591da7f",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        629,
        134
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "type": "powerRail",
          "position": {
            "x": 0,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 3,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "left-rail",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 20,
                "right": -3
              }
            },
            "numericId": "6790308",
            "variant": "left",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "CONTACT_3178e84a-c5f2-452b-8614-2aded20fad5a",
          "type": "contact",
          "position": {
            "x": 68,
            "y": 38
          },
          "height": 24,
          "width": 24,
          "measured": {
            "width": 24,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 92,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "default",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 92,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 68,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 92,
                "y": 50
              },
              "relPosition": {
                "x": 24,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "3979145",
            "variable": {
              "name": "M2",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "BLOCK_ef54cdf6-ce2c-48a6-8f16-654a8b97012c",
          "type": "block",
          "position": {
            "x": 257,
            "y": 14
          },
          "height": 100,
          "width": 66,
          "measured": {
            "width": 66,
            "height": 100
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 257,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "IN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 257,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "PT",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 323,
                  "y": 50
                },
                "relPosition": {
                  "x": 66,
                  "y": 36
                },
                "id": "Q",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 323,
                  "y": 90
                },
                "relPosition": {
                  "x": 66,
                  "y": 76
                },
                "id": "ET",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 257,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "IN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 257,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "PT",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 323,
                  "y": 50
                },
                "relPosition": {
                  "x": 66,
                  "y": 36
                },
                "id": "Q",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 323,
                  "y": 90
                },
                "relPosition": {
                  "x": 66,
                  "y": 76
                },
                "id": "ET",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 257,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 36
              },
              "id": "IN",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 36,
                "left": 0
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 323,
                "y": 50
              },
              "relPosition": {
                "x": 66,
                "y": 36
              },
              "id": "Q",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 36,
                "right": 0
              }
            },
            "numericId": "5858283",
            "variant": {
              "name": "TON",
              "type": "function-block",
              "language": "st",
              "variables": [
                {
                  "name": "IN",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "documentation": "first input parameter"
                },
                {
                  "name": "PT",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  },
                  "documentation": "second input parameter"
                },
                {
                  "name": "Q",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "initialValue": {
                    "value": "FALSE"
                  },
                  "documentation": "first output parameter"
                },
                {
                  "name": "ET",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  },
                  "initialValue": {
                    "value": "T#0s"
                  },
                  "documentation": "second output parameter"
                },
                {
                  "name": "STATE",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "SINT"
                  },
                  "initialValue": {
                    "value": "0"
                  },
                  "documentation": "internal state: 0-reset, 1-counting, 2-set"
                },
                {
                  "name": "PREV_IN",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "initialValue": {
                    "value": "FALSE"
                  }
                },
                {
                  "name": "CURRENT_TIME",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  }
                },
                {
                  "name": "START_TIME",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  }
                }
              ],
              "body": "{__SET_VAR(data__->,CURRENT_TIME,,__CURRENT_TIME)}\n\n      IF ((STATE = 0) AND NOT(PREV_IN) AND IN)   (* found rising edge on IN *)\n      THEN\n        (* start timer... *)\n        STATE := 1;\n        Q := TRUE;\n        START_TIME := CURRENT_TIME;\n\n      ELSE\n        (* STATE is 1 or 2 !! *)\n        IF (NOT(IN))\n        THEN\n          ET := T#0s;\n          Q := FALSE;\n          STATE := 0;\n\n        ELSIF (STATE = 1)\n        THEN\n          IF ((START_TIME + PT) <= CURRENT_TIME)\n          THEN\n            STATE := 2;\n            Q := TRUE;\n            ET := PT;\n          ELSE\n            ET := CURRENT_TIME - START_TIME;\n          END_IF;\n        END_IF;\n\n      END_IF;\n\n      PREV_IN := IN;",
              "documentation": "The on-delay timer can be used to delay setting an output true, for fixed period after an input becomes true."
            },
            "variable": {
              "name": "TON3",
              "type": {
                "definition": "derived",
                "value": "TON"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": false,
            "lockExecutionControl": false,
            "connectedVariables": [
              {
                "handleId": "PT",
                "type": "input",
                "variable": {
                  "name": "T#5s"
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "COIL_6e075adc-1438-4e8a-89e7-e63b3f463e8b",
          "type": "coil",
          "position": {
            "x": 488,
            "y": 38
          },
          "height": 24,
          "width": 28,
          "measured": {
            "width": 28,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 488,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 516,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "default",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 488,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 516,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 488,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 516,
                "y": 50
              },
              "relPosition": {
                "x": 28,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "2741341",
            "variable": {
              "name": "M3",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "right-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "type": "powerRail",
          "position": {
            "x": 626,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                },
                "x": 626
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                }
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 297,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "right-rail",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 20,
                "left": -3
              }
            },
            "numericId": "9312417",
            "variant": "right",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "VARIABLE_c3f46e2b-e80a-4d2a-b9b1-9e483f05ac9e",
          "type": "variable",
          "position": {
            "x": 147,
            "y": 74
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 307,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 307,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 307,
                "y": 90
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "4458403",
            "variable": {
              "name": "T#5s"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_ef54cdf6-ce2c-48a6-8f16-654a8b97012c",
              "handleId": "PT",
              "variableType": {
                "name": "PT",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "TIME"
                },
                "documentation": "second input parameter"
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_392f537c-33cd-4ecb-93ee-82878c33f7ce",
          "type": "variable",
          "position": {
            "x": 353,
            "y": 74
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 353,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 353,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 353,
                "y": 90
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "5528441",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_ef54cdf6-ce2c-48a6-8f16-654a8b97012c",
              "handleId": "ET",
              "variableType": {
                "name": "ET",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "TIME"
                },
                "initialValue": {
                  "value": "T#0s"
                },
                "documentation": "second output parameter"
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        }
      ],
      "edges": [
        {
          "id": "e_left-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40_CONTACT_3178e84a-c5f2-452b-8614-2aded20fad5a__left-rail_input",
          "source": "left-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "sourceHandle": "left-rail",
          "target": "CONTACT_3178e84a-c5f2-452b-8614-2aded20fad5a",
          "targetHandle": "input"
        },
        {
          "id": "e_COIL_6e075adc-1438-4e8a-89e7-e63b3f463e8b_right-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40__output_right-rail",
          "source": "COIL_6e075adc-1438-4e8a-89e7-e63b3f463e8b",
          "sourceHandle": "output",
          "target": "right-rail-rung_main_5e36ee0d-d39a-4d5c-8d16-b6bee8039c40",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_CONTACT_3178e84a-c5f2-452b-8614-2aded20fad5a_BLOCK_ef54cdf6-ce2c-48a6-8f16-654a8b97012c__output_IN",
          "source": "CONTACT_3178e84a-c5f2-452b-8614-2aded20fad5a",
          "sourceHandle": "output",
          "target": "BLOCK_ef54cdf6-ce2c-48a6-8f16-654a8b97012c",
          "targetHandle": "IN"
        },
        {
          "id": "e_BLOCK_ef54cdf6-ce2c-48a6-8f16-654a8b97012c_COIL_6e075adc-1438-4e8a-89e7-e63b3f463e8b__Q_input",
          "source": "BLOCK_ef54cdf6-ce2c-48a6-8f16-654a8b97012c",
          "sourceHandle": "Q",
          "target": "COIL_6e075adc-1438-4e8a-89e7-e63b3f463e8b",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_c3f46e2b-e80a-4d2a-b9b1-9e483f05ac9e_BLOCK_ef54cdf6-ce2c-48a6-8f16-654a8b97012c__output_PT",
          "source": "VARIABLE_c3f46e2b-e80a-4d2a-b9b1-9e483f05ac9e",
          "sourceHandle": "output",
          "target": "BLOCK_ef54cdf6-ce2c-48a6-8f16-654a8b97012c",
          "targetHandle": "PT"
        },
        {
          "id": "e_BLOCK_ef54cdf6-ce2c-48a6-8f16-654a8b97012c_VARIABLE_392f537c-33cd-4ecb-93ee-82878c33f7ce__ET_input",
          "source": "BLOCK_ef54cdf6-ce2c-48a6-8f16-654a8b97012c",
          "sourceHandle": "ET",
          "target": "VARIABLE_392f537c-33cd-4ecb-93ee-82878c33f7ce",
          "targetHandle": "input"
        }
      ]
    }
  ]
}
END_PROGRAM