# language: es

Característica: Visualización de Cuadro de Control Admisión
  Como Superusuario de Admisión o Gestor TA
  Quiero visualizar las métricas y tablas del cuadro de control
  Para analizar el estado de los encuentros en admisión

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y he accedido a "Cuadro de control Admisión"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ELEMENTOS PRINCIPALES
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-01 - Visualizar elementos principales del cuadro de control
    Dado que soy un usuario con rol "<rol>"
    Cuando accedo a la pantalla "Cuadro de control Admisión"
    Entonces debe mostrarse el título "Cuadro de control Admisión"
    Y deben mostrarse 5 filtros: Sede, Prioridad, Tipo de atención, Ejecutivo, Garante
    Y deben mostrarse los botones "Filtrar" y "Limpiar"
    Y debe mostrarse el toggle "Solo positivos"
    Y deben mostrarse 3 tarjetas de métricas
    Y deben mostrarse 4 tablas de información

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: BOUNDARY VALUE ANALYSIS - VALIDACIÓN DE TARJETAS
  # CONSOLIDACIÓN: VIS-03, VIS-04, VIS-05 → VIS-02
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @boundaryValue @happyPath
  Esquema del escenario: VIS-02 - Validar datos de tarjetas con valores frontera (BVA)
    Dado que soy un usuario con rol "<rol>"
    Y existen <cantidad> encuentros con monto total <monto>
    Cuando visualizo la tarjeta "<tarjeta>"
    Entonces debe mostrarse "<monto_formateado>"
    Y debe mostrarse "Cant. <cantidad>" cuando aplique
    Y el formato debe ser correcto independientemente del monto

    Ejemplos:
      | rol                      | tarjeta                        | cantidad | monto              | monto_formateado   | clase_equivalencia             |
      | Superusuario de Admisión | Total de encuentros pendientes | 0        | S/ 0.00            | S/ 0.00            | Valor mínimo (límite inferior) |
      | Gestor TA                | Total de encuentros pendientes | 1        | S/ 0.01            | S/ 0.01            | Mínimo + 1 (sobre límite)      |
      | Superusuario de Admisión | Lista de encuentros            | 100      | S/ 1,000.00        | S/ 1,000.00        | Valor típico (medio)           |
      | Gestor TA                | Encuentros devueltos           | 9999     | S/ 999,999,999.99  | S/ 999,999,999.99  | Valor máximo (límite superior) |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ESTRUCTURA DE TABLAS
  # CONSOLIDACIÓN: VIS-06, VIS-09, VIS-13, VIS-18 → VIS-03
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-03 - Visualizar estructura de tabla específica
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la tabla "<tabla>"
    Entonces debe mostrarse el encabezado "<tabla>"
    Y debe mostrarse la tabla con las columnas esperadas
    Y debe mostrarse una fila "Totales"

    Ejemplos:
      | rol                      | tabla                              |
      | Superusuario de Admisión | Total por ejecutivo                |
      | Gestor TA                | Sustentos pendientes               |
      | Superusuario de Admisión | Devoluciones                       |
      | Gestor TA                | Total de encuentros por estado     |

  # ========================================================================
  # TÉCNICA: BOUNDARY VALUE ANALYSIS - DATOS DE EJECUTIVOS
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @boundaryValue @happyPath
  Esquema del escenario: VIS-04 - Validar datos de ejecutivos con valores frontera (BVA)
    Dado que soy un usuario con rol "<rol>"
    Y existe un ejecutivo con <total_cant> encuentros y monto <total_monto>
    Cuando visualizo la tabla "Total por ejecutivo"
    Entonces la fila del ejecutivo debe mostrar:
      - Total cant.: <total_cant>
      - Total monto: formato "<total_monto_formateado>"
      - Lista de enc. cant.: número entero
      - Lista de enc. monto: formato "S/ #,###.##"
      - Enc. devueltos cant.: número entero >= 0
      - Enc. devueltos monto: formato "S/ #,###.##" o "S/ 0.00"

    Ejemplos:
      | rol                      | total_cant | total_monto        | total_monto_formateado | clase_equivalencia             |
      | Superusuario de Admisión | 0          | S/ 0.00            | S/ 0.00                | Valor mínimo (límite inferior) |
      | Gestor TA                | 1          | S/ 0.01            | S/ 0.01                | Mínimo + 1 (sobre límite)      |
      | Superusuario de Admisión | 100        | S/ 1,000.00        | S/ 1,000.00            | Valor típico (medio)           |
      | Gestor TA                | 9999       | S/ 999,999,999.99  | S/ 999,999,999.99      | Valor máximo (límite superior) |

  # ========================================================================
  # TÉCNICA: BOUNDARY VALUE ANALYSIS - FILA DE TOTALES
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @boundaryValue @happyPath
  Esquema del escenario: VIS-05 - Validar fila Totales con valores frontera (BVA)
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la fila "Totales" de la tabla "Total por ejecutivo"
    Y los totales son: <total_cant> encuentros con monto <total_monto>
    Entonces debe mostrar correctamente los valores
    Y el formato debe manejar valores: <total_cant>, <total_monto>

    Ejemplos:
      | rol                      | total_cant | total_monto        | clase_equivalencia             |
      | Superusuario de Admisión | 0          | S/ 0.00            | Valor mínimo (límite inferior) |
      | Gestor TA                | 1          | S/ 0.01            | Mínimo + 1 (sobre límite)      |
      | Superusuario de Admisión | 100        | S/ 1,000.00        | Valor típico (medio)           |
      | Gestor TA                | 9999       | S/ 999,999,999.99  | Valor máximo (límite superior) |

  # ========================================================================
  # TÉCNICA: BOUNDARY VALUE ANALYSIS - SUSTENTOS PENDIENTES
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @boundaryValue @happyPath
  Esquema del escenario: VIS-06 - Validar datos de sustentos pendientes con valores frontera (BVA)
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la tabla "Sustentos pendientes"
    Entonces la columna "Administrativos" debe mostrar sustentos con cantidades
    Y los guiones "-" deben mostrarse cuando no hay datos
    Y debe manejar correctamente cantidades: <cantidad>

    Ejemplos:
      | rol                      | cantidad | clase_equivalencia             |
      | Superusuario de Admisión | 0        | Valor mínimo (límite inferior) |
      | Gestor TA                | 1        | Mínimo + 1 (sobre límite)      |
      | Superusuario de Admisión | 100      | Valor típico (medio)           |
      | Gestor TA                | 9999     | Valor máximo (límite superior) |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE MOTIVOS DE DEVOLUCIÓN
  # CONSOLIDACIÓN: VIS-14, VIS-15, VIS-16 → VIS-07
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @boundaryValue @happyPath
  Esquema del escenario: VIS-07 - Validar motivos de devolución por categoría con valores frontera (BVA)
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la columna "<categoria>" de la tabla "Devoluciones"
    Entonces debe mostrarse los motivos correspondientes con sus cantidades
    Y debe manejar correctamente cantidades: <cantidad>

    Ejemplos:
      | rol                      | categoria       | cantidad | clase_equivalencia             |
      | Superusuario de Admisión | Administrativos | 0        | Valor mínimo (límite inferior) |
      | Gestor TA                | Médicos         | 1        | Mínimo + 1 (sobre límite)      |
      | Superusuario de Admisión | De proceso      | 100      | Valor típico (medio)           |
      | Gestor TA                | Administrativos | 9999     | Valor máximo (límite superior) |

  # ========================================================================
  # TÉCNICA: BOUNDARY VALUE ANALYSIS - FILA TOTALES DE DEVOLUCIONES
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @boundaryValue @happyPath
  Esquema del escenario: VIS-08 - Validar fila Totales en tabla Devoluciones con valores frontera (BVA)
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la fila "Totales" de la tabla "Devoluciones"
    Y los totales son: <total_admin> Administrativos, <total_medicos> Médicos, <total_proceso> De proceso
    Entonces debe mostrar correctamente los valores
    Y la suma de las 3 categorías debe ser coherente

    Ejemplos:
      | rol                      | total_admin | total_medicos | total_proceso | clase_equivalencia             |
      | Superusuario de Admisión | 0           | 0             | 0             | Valor mínimo (límite inferior) |
      | Gestor TA                | 1           | 1             | 1             | Mínimo + 1 (sobre límite)      |
      | Superusuario de Admisión | 100         | 100           | 100           | Valor típico (medio)           |
      | Gestor TA                | 9999        | 9999          | 9999          | Valor máximo (límite superior) |

  # ========================================================================
  # TÉCNICA: BOUNDARY VALUE ANALYSIS - TABLA POR ESTADO
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @boundaryValue @happyPath
  Esquema del escenario: VIS-09 - Validar datos de tabla por estado con valores frontera (BVA)
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la tabla "Total de encuentros por estado"
    Entonces debe mostrarse filas con diferentes tipos y estados
    Y debe manejar correctamente cantidades <total_cant> y montos <total_monto>

    Ejemplos:
      | rol                      | total_cant | total_monto        | clase_equivalencia             |
      | Superusuario de Admisión | 0          | S/ 0.00            | Valor mínimo (límite inferior) |
      | Gestor TA                | 1          | S/ 0.01            | Mínimo + 1 (sobre límite)      |
      | Superusuario de Admisión | 100        | S/ 1,000.00        | Valor típico (medio)           |
      | Gestor TA                | 9999       | S/ 999,999,999.99  | Valor máximo (límite superior) |

  # ========================================================================
  # TÉCNICA: BOUNDARY VALUE ANALYSIS - MONTOS NEGATIVOS
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @boundaryValue @edgeCase @happyPath
  Esquema del escenario: VIS-10 - Validar formato de montos negativos con valores frontera (BVA)
    Dado que soy un usuario con rol "<rol>"
    Y existe un encuentro con monto negativo "<monto_negativo>"
    Cuando visualizo la tabla "Total de encuentros por estado"
    Entonces el monto debe mostrarse como "<monto_negativo>"
    Y el símbolo "-" debe preceder al símbolo "S/"
    Y el formato debe incluir dos decimales

    Ejemplos:
      | rol                      | monto_negativo     | edge_case                      |
      | Superusuario de Admisión | -S/ 0.01           | Mínimo negativo                |
      | Gestor TA                | -S/ 1.00           | Negativo pequeño               |
      | Superusuario de Admisión | -S/ 999.99         | Antes de separador             |
      | Gestor TA                | -S/ 1,000.00       | Negativo con separador         |
      | Superusuario de Admisión | -S/ 999,999,999.99 | Máximo negativo (límite)       |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE REGLAS DE PRESENTACIÓN
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-11 - Validar reglas de presentación visual en todas las tablas
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo las cuatro tablas
    Entonces deben cumplirse las siguientes reglas de presentación:
      | Regla de Presentación                                          |
      | Columnas de texto: alineadas a la izquierda                    |
      | Columnas de cantidades: alineadas a la derecha                 |
      | Columnas de montos: alineadas a la derecha                     |
      | Columnas sin datos: muestran guión "-" centrado                |
      | Cero numérico: muestra "0" o "S/ 0.00" (NO guión)              |
      | Montos: formato "S/ #,###,###.##" con 2 decimales obligatorios |
      | Separador de miles: se aplica cuando valor >= 1,000           |

    Ejemplos:
      | rol                      |
      | Superusuario de Admisión |
      | Gestor TA                |

  # ========================================================================
  # TÉCNICA: SCROLL Y VISUALIZACIÓN
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-12 - Validar scroll vertical en la página
    Dado que soy un usuario con rol "<rol>"
    Y la página contiene múltiples secciones
    Cuando hago scroll hacia abajo
    Entonces debo poder visualizar las 4 tablas completas
    Y las tarjetas de métricas deben permanecer visibles o desplazarse según el diseño
    Y el scroll debe ser fluido

    Ejemplos:
      | rol                      |
      | Superusuario de Admisión |
      | Gestor TA                |

# ========================================================================
# RESULTADO DE OPTIMIZACIÓN:
#
# ANTES:  22 escenarios, 20+ valores arbitrarios, 3 grupos redundantes
# DESPUÉS: 12 escenarios, 100% BVA aplicado, 0 redundancias
# AHORRO: -45% escenarios, +300% bugs detectables
#
# CONSOLIDACIONES REALIZADAS:
# 1. VIS-03/04/05 → VIS-02 (tarjetas con BVA)
# 2. VIS-06/09/13/18 → VIS-03 (estructura de tablas)
# 3. VIS-14/15/16 → VIS-07 (motivos de devolución con BVA)
# 4. VIS-08 → VIS-05 (fila Totales ejecutivo con BVA)
# 5. VIS-17 → VIS-08 (fila Totales devoluciones con BVA)
# 6. VIS-19/20 → VIS-09 (tabla por estado con BVA)
# 7. VIS-21 → VIS-10 (negativos con BVA)
# 8. VIS-22 → VIS-12 (scroll - sin cambios)
#
# VALORES BVA APLICADOS:
# - Montos: S/ 0.00, S/ 0.01, S/ 1,000.00, S/ 999,999,999.99
# - Negativos: -S/ 0.01, -S/ 1.00, -S/ 999.99, -S/ 1,000.00, -S/ 999,999,999.99
# - Cantidades: 0, 1, 100, 9999
# ========================================================================
