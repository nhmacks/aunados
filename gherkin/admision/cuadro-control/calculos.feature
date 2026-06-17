# language: es

Característica: Cálculos y Totales en Cuadro de Control Admisión
  Como Superusuario de Admisión o Gestor TA
  Quiero validar que los cálculos y totales sean correctos
  Para confiar en las métricas mostradas

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y he accedido a "Cuadro de control Admisión"

  # ========================================================================
  # TÉCNICA: COHERENCIA ENTRE TARJETAS Y TABLAS
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: CALC-01 - Tarjetas coinciden con totales de tabla Total por ejecutivo
    Dado que soy un usuario con rol "<rol>"
    Y las tarjetas muestran:
      | Tarjeta                           | Monto            | Cantidad |
      | Total de encuentros perdientes    | S/ 8,874,299.92  | 23805    |
      | Lista de encuentros               | S/ 8,691,265.17  | -        |
      | Encuentros devueltos              | S/ 183,034.75    | 384      |
    Cuando visualizo la fila "Totales" de la tabla "Total por ejecutivo"
    Entonces debe coincidir exactamente:
      | Campo tarjeta                  | Campo tabla          | Valor esperado   |
      | Total de encuentros (cantidad) | Total cant.          | 23805            |
      | Total de encuentros (monto)    | Total monto          | S/ 8,874,299.92  |
      | Lista de encuentros (monto)    | Lista de enc. monto  | S/ 8,691,265.17  |
      | Encuentros devueltos (cantidad)| Enc. devueltos cant. | 384              |
      | Encuentros devueltos (monto)   | Enc. devueltos monto | S/ 183,034.75    |

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE SUMA EN TABLA TOTAL POR EJECUTIVO
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: CALC-02 - Fila Totales suma correctamente los ejecutivos
    Dado que soy un usuario con rol "<rol>"
    Y la tabla "Total por ejecutivo" tiene múltiples filas de ejecutivos
    Cuando sumo manualmente todas las cantidades de la columna "Total cant."
    Entonces el resultado debe ser 23805
    Y debe coincidir con la fila "Totales"
    Cuando sumo manualmente todos los montos de la columna "Total monto"
    Entonces el resultado debe ser S/ 8,874,299.92
    Y debe coincidir con la fila "Totales"

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: CALC-03 - Total es la suma de Lista de encuentros + Encuentros devueltos
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la fila "Totales" de la tabla "Total por ejecutivo"
    Y sumo "Lista de enc. cant." + "Enc. devueltos cant."
    Entonces el resultado debe ser igual o cercano a "Total cant."
    Cuando sumo "Lista de enc. monto" + "Enc. devueltos monto"
    Entonces el resultado debe ser igual a "Total monto"

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TABLA SUSTENTOS PENDIENTES
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: CALC-04 - Totales de Sustentos pendientes suma correctamente
    Dado que soy un usuario con rol "<rol>"
    Y la tabla "Sustentos pendientes" tiene las siguientes filas administrativas:
      | Sustento                | Total cant. |
      | Formato SCTR            | 437         |
      | SOAT Tarjeta Física     | 405         |
      | Autorización por Co...  | 9           |
    Cuando sumo todas las cantidades de administrativos
    Entonces el resultado debe incluirse en el total de 30121

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TABLA DEVOLUCIONES
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: CALC-05 - Totales de Devoluciones suma correctamente por categoría
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la fila "Totales" de la tabla "Devoluciones"
    Entonces debe mostrar:
      | Categoría       | Total cant. | Cálculo                          |
      | Administrativos | 251         | Suma de todas las filas admin    |
      | Médicos         | 103         | Suma de todas las filas médicas  |
      | De proceso      | 52          | Suma de todas las filas proceso  |

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: CALC-06 - Suma de categorías coincide con Encuentros devueltos
    Dado que soy un usuario con rol "<rol>"
    Cuando sumo los totales de las 3 categorías de devoluciones: 251 + 103 + 52
    Entonces el resultado debe ser 406
    Y este valor debe ser mayor o igual a la cantidad de Encuentros devueltos (384)
    Y la diferencia se explica por clasificaciones múltiples o estados

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TABLA TOTAL DE ENCUENTROS POR ESTADO
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: CALC-07 - Fila Totales suma correctamente todos los estados
    Dado que soy un usuario con rol "<rol>"
    Y la tabla "Total de encuentros por estado" tiene múltiples filas de estados
    Cuando sumo todas las cantidades de "Total cant."
    Entonces el resultado debe ser 23813
    Y debe coincidir con la fila "Totales"
    Cuando sumo todos los montos de "Total monto"
    Entonces el resultado debe ser S/ 8,877,507.38
    Y debe coincidir con la fila "Totales"

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: CALC-08 - Lista enc + Enc dev coincide con Total en tabla por estado
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la fila "Totales" de la tabla "Total de encuentros por estado"
    Y sumo "Lista enc. cant." (23429) + "Enc. dev. cant." (384)
    Entonces el resultado debe ser 23813
    Y debe coincidir con "Total cant."
    Cuando sumo "Lista enc. monto" + "Enc. dev. monto"
    Entonces el resultado debe coincidir con "Total monto"

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: COHERENCIA ENTRE TABLAS
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: CALC-09 - Totales de tabla Total por ejecutivo coinciden con tabla por estado
    Dado que soy un usuario con rol "<rol>"
    Cuando comparo las filas "Totales" de ambas tablas
    Entonces los siguientes valores deben coincidir o ser cercanos:
      | Campo tabla ejecutivo    | Campo tabla estado   | Valor esperado   |
      | Lista de enc. cant.      | Lista enc. cant.     | ~23421 vs 23429  |
      | Lista de enc. monto      | Lista enc. monto     | ~S/ 8,691,265.17 |
      | Enc. devueltos cant.     | Enc. dev. cant.      | 384              |
      | Enc. devueltos monto     | Enc. dev. monto      | S/ 183,034.75    |

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE MONTOS NEGATIVOS
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: CALC-10 - Montos negativos se restan correctamente en totales
    Dado que soy un usuario con rol "<rol>"
    Y existe un encuentro con monto "-S/ 2.69"
    Cuando el sistema calcula los totales
    Entonces el monto negativo debe restarse del total
    Y el total debe reflejar la operación aritmética correcta
    Y NO debe ignorarse el signo negativo

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN CON FILTROS APLICADOS
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: CALC-11 - Totales se recalculan correctamente al aplicar filtros
    Dado que soy un usuario con rol "<rol>"
    Y he aplicado el filtro "Sede" = "Auna Guardia Civil"
    Y he presionado "Filtrar"
    Cuando visualizo las filas "Totales" de todas las tablas
    Entonces cada total debe ser la suma correcta de las filas filtradas
    Y los totales deben ser menores o iguales a los totales sin filtrar
    Y las tarjetas deben coincidir con los nuevos totales

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: CALC-12 - Totales con toggle Solo positivos excluyen valores cero
    Dado que soy un usuario con rol "<rol>"
    Y he activado el toggle "Solo positivos"
    Y he presionado "Filtrar"
    Cuando visualizo las filas "Totales"
    Entonces deben sumarse únicamente las filas con valores > 0
    Y NO deben incluirse filas con cantidades = 0
    Y NO deben incluirse filas con montos = S/ 0.00

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: BOUNDARY VALUE ANALYSIS - FORMATOS
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: CALC-13 - Validar formato de montos grandes
    Dado que soy un usuario con rol "<rol>"
    Y existen montos grandes en las tablas
    Cuando visualizo los montos
    Entonces deben mostrarse con formato "S/ #,###,###.##"
    Y debe incluir separadores de miles correctamente
    Y debe incluir dos decimales
    Y NO deben mostrarse notaciones científicas

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: CALC-14 - Validar formato de cantidades
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo las columnas de cantidades
    Entonces deben mostrarse como números enteros
    Y NO deben incluir decimales
    Y NO deben incluir símbolo de moneda

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE REDONDEOS
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: CALC-15 - Validar redondeo correcto de decimales
    Dado que soy un usuario con rol "<rol>"
    Y existen montos con más de 2 decimales
    Cuando el sistema calcula los totales
    Entonces debe redondear a 2 decimales usando redondeo bancario
    Y la suma de montos redondeados debe coincidir con el total mostrado
    Y NO debe haber diferencias mayores a S/ 0.01

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: CONSISTENCIA ENTRE SESIONES
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: CALC-16 - Los totales son consistentes al recargar la página
    Dado que soy un usuario con rol "<rol>"
    Y visualizo las tarjetas con valores específicos
    Cuando refresco la página del navegador
    Entonces las tarjetas deben mostrar exactamente los mismos valores
    Y las tablas deben mostrar los mismos totales
    Y NO debe haber variaciones en los cálculos

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE INTEGRIDAD
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @unhappyPath
  Esquema del escenario: CALC-17 - Detectar inconsistencias en totales
    Dado que soy un usuario con rol "<rol>"
    Y existe una inconsistencia en los datos
    Cuando la suma de las filas NO coincide con el total mostrado
    Entonces debe mostrarse un mensaje de advertencia
    Y debe indicarse "Inconsistencia detectada en los cálculos. Contacte al administrador."
    Y los datos deben seguir siendo visibles para análisis

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: PERFORMANCE EN CÁLCULOS
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: CALC-18 - Los cálculos se realizan rápidamente al filtrar
    Dado que soy un usuario con rol "<rol>"
    Y he seleccionado múltiples filtros
    Cuando presiono el botón "Filtrar"
    Entonces el sistema debe recalcular todos los totales
    Y debe actualizar las tarjetas y tablas
    Y el tiempo de cálculo no debe exceder 2 segundos
    Y la experiencia debe ser fluida sin bloqueos

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |
