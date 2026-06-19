# language: es

Característica: Visualización de PxF Ambulatorio
  Como Gestor TA
  Quiero visualizar las métricas y tablas de pendientes por facturar ambulatorio
  Para analizar el estado de la facturación ambulatoria

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Gestor TA"
    Y he accedido a "PxF Ambulatorio"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ELEMENTOS PRINCIPALES
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-01 - Visualizar elementos principales de PxF Ambulatorio
    Cuando accedo a la pantalla "PxF Ambulatorio"
    Entonces debe mostrarse el título "PxF Ambulatorio"
    Y deben mostrarse 3 filtros: Sede, Tipo de atención, Garante
    Y deben mostrarse los botones "Filtrar" y "Limpiar"
    Y debe mostrarse el toggle "Solo positivos"
    Y deben mostrarse 3 tarjetas de métricas
    Y deben mostrarse 3 tablas: Protocolo, Admisión, Facturación

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-02 - Visualizar las 3 tarjetas de métricas
    Cuando visualizo las tarjetas de métricas
    Entonces debe mostrarse la tarjeta "Total PxS"
    Y debe mostrarse la tarjeta "Total Cápita"
    Y debe mostrarse la tarjeta "Total CPM"
    Y cada tarjeta debe mostrar un monto
    Y cada tarjeta debe mostrar una cantidad

  # ========================================================================
  # TÉCNICA DE TESTING: BOUNDARY VALUE ANALYSIS (BVA)
  # Probamos valores frontera para validar manejo correcto del sistema
  # NOTA: Este Esquema TAMBIÉN valida formato de montos (S/ #,###,###.##)
  #       Por lo tanto NO necesitamos un escenario separado solo para formato
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @boundaryValue @happyPath
  Esquema del escenario: VIS-03 - Tarjetas muestran correctamente valores frontera (BVA) y formato
    Dado que existen <cantidad> encuentros <tipo> ambulatorios
    Y el monto total <tipo> es <monto>
    Cuando visualizo la tarjeta "Total <tipo>"
    Entonces debe mostrarse "<monto_formateado>"
    Y debe mostrarse "Cant. <cantidad>"
    Y el formato debe incluir símbolo "S/" al inicio
    Y el formato debe incluir separador de miles cuando corresponda
    Y el formato debe incluir dos decimales obligatorios

    # Casos de Equivalence Partitioning + Boundary Value Analysis
    Ejemplos:
      | tipo   | cantidad | monto              | monto_formateado        | clase_equivalencia                |
      | PxS    | 0        | S/ 0.00            | S/ 0.00                 | Valor mínimo (límite inferior)    |
      | PxS    | 1        | S/ 0.01            | S/ 0.01                 | Mínimo + 1 (sobre límite)         |
      | PxS    | 100      | S/ 1,000.00        | S/ 1,000.00             | Valor típico (medio)              |
      | PxS    | 500000   | S/ 50,500,250.50   | S/ 50,500,250.50        | Valor grande (con separadores)    |
      | PxS    | 999999   | S/ 999,999,999.99  | S/ 999,999,999.99       | Valor máximo (límite superior)    |
      | Cápita | 0        | S/ 0.00            | S/ 0.00                 | Valor mínimo (límite inferior)    |
      | Cápita | 1        | S/ 0.01            | S/ 0.01                 | Mínimo + 1 (sobre límite)         |
      | Cápita | 2500     | S/ 1,850,000.00    | S/ 1,850,000.00         | Valor típico (medio)              |
      | CPM    | 0        | S/ 0.00            | S/ 0.00                 | Valor mínimo (límite inferior)    |
      | CPM    | 1        | S/ 0.01            | S/ 0.01                 | Mínimo + 1 (sobre límite)         |
      | CPM    | 2500     | S/ 890,000.00      | S/ 890,000.00           | Valor típico (medio)              |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TABLA PROTOCOLO
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-04 - Visualizar estructura de tabla Protocolo
    Cuando visualizo la tabla "Protocolo"
    Entonces debe mostrarse el encabezado "Protocolo"
    Y debe mostrarse la tabla con las siguientes columnas:
      | Columna        |
      | Protocolo      |
      | Total cant.    |
      | Total monto    |
      | PxS cant.      |
      | PxS monto      |
      | Cápita cant    |
      | Cápita monto   |
      | CPM cant.      |
      | CPM monto      |
    Y deben mostrarse las siguientes filas:
      | Fila                      |
      | Con sustentos completos   |
      | En plazo de laboratorio   |
      | Totales                   |

  # ========================================================================
  # TÉCNICA DE TESTING: BOUNDARY VALUE ANALYSIS (BVA) APLICADO A TABLAS
  # NOTA: Este Esquema TAMBIÉN valida formato de montos en tablas
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @boundaryValue @happyPath
  Esquema del escenario: VIS-05 - Tabla Protocolo maneja correctamente valores frontera (BVA) y formato
    Dado que existen <cantidad> encuentros con sustentos completos
    Y el monto total es <monto>
    Cuando visualizo la tabla "Protocolo"
    Entonces la fila "Con sustentos completos" debe mostrar:
      | Columna      | Valor                     |
      | Total cant.  | <cantidad>                |
      | Total monto  | <monto_formateado>        |
      | PxS cant.    | <cantidad>                |
      | PxS monto    | <monto_formateado>        |
    Y el formato debe incluir símbolo "S/" y dos decimales
    Y no debe haber overflow visual

    # Aplicando BVA: mínimo, mínimo+1, típico, máximo
    Ejemplos:
      | cantidad | monto              | monto_formateado        | caso_prueba                        |
      | 0        | S/ 0.00            | S/ 0.00                 | Valor mínimo - sin encuentros      |
      | 1        | S/ 0.01            | S/ 0.01                 | Mínimo + 1 - un encuentro mínimo   |
      | 100      | S/ 5,000.00        | S/ 5,000.00             | Valor típico bajo                  |
      | 25000    | S/ 13,000,000.00   | S/ 13,000,000.00        | Valor típico medio                 |
      | 999999   | S/ 999,999,999.99  | S/ 999,999,999.99       | Valor máximo - límite superior     |

  @prioridadMedia @gestorTA @pxfAmbulatorio @boundaryValue @happyPath
  Escenario: VIS-06 - Diferenciar cero numérico vs valor vacío (REGLA CRÍTICA)
    Dado que existen 0 encuentros en plazo de laboratorio
    Cuando visualizo la tabla "Protocolo"
    Entonces la fila "En plazo de laboratorio" debe mostrar:
      | Columna      | Valor    |
      | Total cant.  | 0        |
      | Total monto  | S/ 0.00  |
    Y debe validarse que cero se muestra como "0" y "S/ 0.00"
    Y NO debe mostrarse guión "-" cuando el valor es cero numérico

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-07 - Validar coherencia de totales en tabla Protocolo
    Dado que la fila "Con sustentos completos" tiene cantidad 25000
    Y la fila "En plazo de laboratorio" tiene cantidad 500
    Cuando visualizo la tabla "Protocolo"
    Entonces la fila "Totales" debe mostrar cantidad 25500
    Y el total de montos debe ser la suma de las dos filas anteriores
    Y debe aplicarse el principio de coherencia contable

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TABLA ADMISIÓN
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-08 - Visualizar estructura de tabla Admisión
    Cuando visualizo la tabla "Admisión"
    Entonces debe mostrarse el encabezado "Admisión"
    Y debe mostrarse la tabla con las mismas 9 columnas que tabla Protocolo
    Y deben mostrarse las siguientes filas:
      | Fila                  |
      | Lista de encuentros   |
      | Encuentros devueltos  |
      | Totales               |

  @prioridadMedia @gestorTA @pxfAmbulatorio @boundaryValue @happyPath
  Esquema del escenario: VIS-09 - Tabla Admisión maneja múltiples tipos con valores frontera (BVA)
    Dado que existen <total_cantidad> encuentros en lista de encuentros
    Y el monto total es <total_monto>
    Y <pxs_cantidad> son PxS con monto <pxs_monto>
    Y <capita_cantidad> son Cápita con monto <capita_monto>
    Y <cpm_cantidad> son CPM con monto <cpm_monto>
    Cuando visualizo la tabla "Admisión"
    Entonces la fila "Lista de encuentros" debe mostrar:
      | Columna        | Valor            |
      | Total cant.    | <total_cantidad> |
      | Total monto    | <total_monto>    |
      | PxS cant.      | <pxs_cantidad>   |
      | PxS monto      | <pxs_monto>      |
      | Cápita cant    | <capita_cantidad>|
      | Cápita monto   | <capita_monto>   |
      | CPM cant.      | <cpm_cantidad>   |
      | CPM monto      | <cpm_monto>      |
    Y todos los montos deben tener formato correcto
    Y la suma de PxS + Cápita + CPM debe igual total

    # Aplicando Equivalence Partitioning con diferentes distribuciones
    Ejemplos:
      | total_cantidad | total_monto        | pxs_cantidad | pxs_monto         | capita_cantidad | capita_monto     | cpm_cantidad | cpm_monto        | caso_particion                           |
      | 0              | S/ 0.00            | 0            | S/ 0.00           | 0               | S/ 0.00          | 0            | S/ 0.00          | Clase: Todos cero (límite inferior)      |
      | 1              | S/ 0.01            | 1            | S/ 0.01           | 0               | S/ 0.00          | 0            | S/ 0.00          | Clase: Solo PxS mínimo                   |
      | 3              | S/ 3.00            | 1            | S/ 1.00           | 1               | S/ 1.00          | 1            | S/ 1.00          | Clase: Distribución uniforme mínima      |
      | 30000          | S/ 10,000,000.00   | 20000        | S/ 7,000,000.00   | 5000            | S/ 2,000,000.00  | 5000         | S/ 1,000,000.00  | Clase: Distribución típica media         |
      | 999999         | S/ 999,999,999.99  | 500000       | S/ 500,000,000.00 | 250000          | S/ 250,000,000.00| 249999       | S/ 249,999,999.99| Clase: Valores máximos (límite superior) |

  @prioridadMedia @gestorTA @pxfAmbulatorio @boundaryValue @happyPath
  Esquema del escenario: VIS-10 - Tabla Admisión valida encuentros devueltos con valores frontera
    Dado que existen <cantidad> encuentros devueltos
    Y el monto total es <monto>
    Cuando visualizo la tabla "Admisión"
    Entonces la fila "Encuentros devueltos" debe mostrar correctamente cantidad y monto
    Y las columnas vacías deben mostrar "-" según regla de negocio

    # BVA para encuentros devueltos
    Ejemplos:
      | cantidad | monto              | caso_bva                              |
      | 0        | S/ 0.00            | Valor mínimo - sin devoluciones       |
      | 1        | S/ 0.01            | Mínimo + 1 - una devolución mínima    |
      | 500      | S/ 200,000.00      | Valor típico medio                    |
      | 99999    | S/ 50,000,000.00   | Valor grande                          |

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-11 - Validar coherencia de totales en tabla Admisión
    Cuando visualizo la tabla "Admisión"
    Entonces la fila "Totales" debe ser la suma exacta de:
      | Fila componente       |
      | Lista de encuentros   |
      | Encuentros devueltos  |
    Y cada columna de total debe sumar correctamente
    Y no debe haber errores de redondeo

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TABLA FACTURACIÓN
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-12 - Visualizar estructura de tabla Facturación
    Cuando visualizo la tabla "Facturación"
    Entonces debe mostrarse el encabezado "Facturación"
    Y debe mostrarse la tabla con las mismas 9 columnas que otras tablas
    Y deben mostrarse las siguientes filas:
      | Fila            |
      | Por asignar     |
      | Asignados       |
      | Facturados hoy  |
      | Totales         |

  @prioridadMedia @gestorTA @pxfAmbulatorio @boundaryValue @happyPath
  Esquema del escenario: VIS-13 - Tabla Facturación valida estados con valores frontera (BVA)
    Dado que existen <por_asignar_cant> encuentros por asignar con monto <por_asignar_monto>
    Y existen <asignados_cant> encuentros asignados con monto <asignados_monto>
    Y existen <facturados_cant> encuentros facturados hoy con monto <facturados_monto>
    Cuando visualizo la tabla "Facturación"
    Entonces todas las filas deben mostrar cantidades y montos correctos
    Y el total debe ser la suma de las tres filas
    Y todos los formatos deben ser consistentes

    # Aplicando EP con diferentes distribuciones de estados
    Ejemplos:
      | por_asignar_cant | por_asignar_monto  | asignados_cant | asignados_monto  | facturados_cant | facturados_monto | caso_particion                           |
      | 0                | S/ 0.00            | 0              | S/ 0.00          | 0               | S/ 0.00          | Clase: Todos vacíos (límite inferior)    |
      | 1                | S/ 0.01            | 0              | S/ 0.00          | 0               | S/ 0.00          | Clase: Solo por asignar mínimo           |
      | 100000           | S/ 10,000,000.00   | 1000           | S/ 150,000.00    | 0               | S/ 0.00          | Clase: Distribución típica               |
      | 500000           | S/ 500,000,000.00  | 100000         | S/ 100,000,000.00| 50000           | S/ 50,000,000.00 | Clase: Volumen alto                      |
      | 1                | S/ 0.01            | 1              | S/ 0.01          | 1               | S/ 0.01          | Clase: Distribución uniforme mínima      |

  # ========================================================================
  # TÉCNICA: VALIDACIONES DE PRESENTACIÓN VISUAL
  # CONSOLIDADO: Alineación, guiones, y formato en UN SOLO escenario
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-14 - Validar reglas de presentación visual en todas las tablas
    Cuando visualizo las tres tablas (Protocolo, Admisión, Facturación)
    Entonces deben cumplirse las siguientes reglas de presentación:
      | Regla de Presentación                                          |
      | Columnas de texto: alineadas a la izquierda                    |
      | Columnas de cantidades: alineadas a la derecha                 |
      | Columnas de montos: alineadas a la derecha                     |
      | Columnas sin datos: muestran guión "-" centrado                |
      | Cero numérico: muestra "0" o "S/ 0.00" (NO guión)              |
      | Montos: formato "S/ #,###,###.##" con 2 decimales obligatorios |
      | Separador de miles: se aplica cuando valor >= 1,000           |

  # ========================================================================
  # TÉCNICA DE TESTING: VALORES ESPECIALES Y EDGE CASES
  # Validamos transiciones de formato (separadores de miles)
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @edgeCase @happyPath
  Esquema del escenario: VIS-15 - Sistema maneja correctamente transiciones de formato (Edge Cases)
    Dado que existen <cantidad> encuentros con monto <monto>
    Cuando visualizo las tarjetas y tablas
    Entonces el sistema debe mostrar <monto_formateado> sin errores
    Y no debe haber overflow visual
    Y no debe haber truncamiento de dígitos
    Y el separador de miles debe aplicarse correctamente

    # Edge cases: transiciones críticas de formato
    Ejemplos:
      | cantidad | monto              | monto_formateado        | edge_case                                    |
      | 1        | S/ 0.01            | S/ 0.01                 | Un centavo (mínimo monetario)                |
      | 1        | S/ 0.99            | S/ 0.99                 | Centavos sin unidades                        |
      | 1        | S/ 1.00            | S/ 1.00                 | Exactamente una unidad                       |
      | 1000     | S/ 999.99          | S/ 999.99               | Justo antes de primer separador de miles     |
      | 1001     | S/ 1,000.00        | S/ 1,000.00             | Primer separador de miles (transición)       |
      | 10000    | S/ 999,999.99      | S/ 999,999.99           | Justo antes de segundo separador             |
      | 10001    | S/ 1,000,000.00    | S/ 1,000,000.00         | Un millón exacto (segunda transición)        |
      | 100000   | S/ 99,999,999.99   | S/ 99,999,999.99        | Máximo de 8 dígitos antes del punto          |
      | 500000   | S/ 500,000,000.50  | S/ 500,000,000.50       | Valor grande con centavos                    |
      | 999999   | S/ 999,999,999.99  | S/ 999,999,999.99       | Valor máximo absoluto del sistema            |

  # ========================================================================
  # TÉCNICA: SCROLL Y RESPONSIVIDAD
  # ========================================================================

  @prioridadMedia @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-16 - Validar scroll y visualización completa
    Dado que la página contiene múltiples secciones
    Cuando hago scroll vertical
    Entonces debo poder visualizar las 3 tablas completas
    Y el scroll debe ser fluido
    Y todas las 9 columnas deben ser visibles sin scroll horizontal
    Y los datos deben ser legibles

  # ========================================================================
  # RESUMEN DE OPTIMIZACIÓN DE REDUNDANCIAS
  # ========================================================================
  #
  # CAMBIOS REALIZADOS:
  #
  # ✅ ELIMINADO VIS-03 (formato genérico de tarjetas):
  #    - REDUNDANTE con VIS-03 que ya valida formato con valores BVA
  #
  # ✅ ELIMINADO VIS-16 (guiones en Protocolo específicamente):
  #    - REDUNDANTE con VIS-14 consolidado que cubre TODAS las tablas
  #
  # ✅ ELIMINADO VIS-18 (formato de montos en columnas genérico):
  #    - REDUNDANTE: VIS-05, VIS-09, VIS-13 ya validan formato con BVA
  #    - CONSOLIDADO en VIS-14 como regla de presentación
  #
  # ✅ CONSOLIDADO VIS-15, VIS-16, VIS-17, VIS-18 en VIS-14:
  #    - UN SOLO escenario para TODAS las reglas de presentación visual
  #    - Más eficiente y más fácil de mantener
  #
  # ✅ RENUMERADO escenarios del VIS-01 al VIS-16 (antes VIS-01 al VIS-21)
  #
  # RESULTADO:
  # - De 21 escenarios → 16 escenarios (-24% reducción)
  # - Misma cobertura, menos redundancia
  # - Mejor mantenibilidad
  # - Validaciones consolidadas en escenarios lógicos
  #
  # ========================================================================
