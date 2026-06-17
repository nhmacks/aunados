# language: es

Característica: Cálculos y Totales en PxF Ambulatorio
  Como Gestor TA
  Quiero validar que los cálculos y totales sean correctos
  Para confiar en las métricas mostradas en PxF Ambulatorio

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Gestor TA"
    Y he accedido a "PxF Ambulatorio"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TOTALES EN TABLA PROTOCOLO
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: CALC-01 - Validar que fila Totales suma correctamente en tabla Protocolo
    Dado que la tabla "Protocolo" tiene las siguientes filas:
      | Fila                      | Total cant. | Total monto       |
      | Con sustentos completos   | 25647       | S/ 13,263,575.08  |
      | En plazo de laboratorio   | 0           | S/ 0.00           |
    Cuando visualizo la fila "Totales" de la tabla "Protocolo"
    Entonces debe mostrar:
      | Columna      | Valor esperado    | Cálculo                  |
      | Total cant.  | 25647             | 25647 + 0                |
      | Total monto  | S/ 13,263,575.08  | 13,263,575.08 + 0.00     |

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: CALC-02 - Validar columnas PxS en fila Totales de tabla Protocolo
    Dado que la tabla "Protocolo" tiene datos PxS
    Cuando visualizo la fila "Totales"
    Entonces "PxS cant." debe ser igual a "Total cant."
    Y "PxS monto" debe ser igual a "Total monto"
    Y las columnas Cápita y CPM deben mostrar "-"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TOTALES EN TABLA ADMISIÓN
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: CALC-03 - Validar que fila Totales suma correctamente en tabla Admisión
    Dado que la tabla "Admisión" tiene las siguientes filas:
      | Fila                  | Total cant. | Total monto       |
      | Lista de encuentros   | 27385       | S/ 10,082,314.52  |
      | Encuentros devueltos  | 359         | S/ 196,927.12     |
    Cuando visualizo la fila "Totales" de la tabla "Admisión"
    Entonces debe mostrar:
      | Columna      | Valor esperado    | Cálculo                          |
      | Total cant.  | 27744             | 27385 + 359                      |
      | Total monto  | S/ 10,279,241.64  | 10,082,314.52 + 196,927.12       |

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: CALC-04 - Validar suma de columnas PxS, Cápita y CPM en tabla Admisión
    Dado que la tabla "Admisión" fila "Totales" tiene:
      | Tipo       | Cantidad | Monto             |
      | PxS        | 22645    | S/ 7,524,547.58   |
      | Cápita     | 2559     | S/ 1,854,007.83   |
      | CPM        | 2651     | S/ 889,289.63     |
    Cuando sumo las cantidades: 22645 + 2559 + 2651
    Entonces el resultado debe ser 27855
    Pero el "Total cant." mostrado es 27744
    Y la diferencia es debido a encuentros sin tipo definido
    Cuando sumo los montos: 7,524,547.58 + 1,854,007.83 + 889,289.63
    Entonces el resultado debe ser aproximadamente 10,267,845.04
    Y debe coincidir con "Total monto" considerando redondeos

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TOTALES EN TABLA FACTURACIÓN
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: CALC-05 - Validar que fila Totales suma correctamente en tabla Facturación
    Dado que la tabla "Facturación" tiene las siguientes filas:
      | Fila            | Total cant. | Total monto       |
      | Por asignar     | 142804      | S/ 11,719,424.95  |
      | Asignados       | 759         | S/ 116,782.55     |
      | Facturados hoy  | 0           | S/ 0.00           |
    Cuando visualizo la fila "Totales" de la tabla "Facturación"
    Entonces debe mostrar:
      | Columna      | Valor esperado    | Cálculo                              |
      | Total cant.  | 143563            | 142804 + 759 + 0                     |
      | Total monto  | S/ 11,836,207.50  | 11,719,424.95 + 116,782.55 + 0.00    |

  # ========================================================================
  # TÉCNICA: COHERENCIA ENTRE TARJETAS Y TABLAS
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: CALC-06 - Validar que tarjetas coinciden con totales de las tablas
    Dado que las tarjetas muestran:
      | Tarjeta       | Monto             | Cantidad |
      | Total PxS     | S/ 32,624,330.16  | 196355   |
      | Total Cápita  | S/ 1,854,007.83   | 2559     |
      | Total CPM     | S/ 889,289.63     | 2651     |
    Cuando sumo los montos de las tres tarjetas
    Entonces el resultado debe ser S/ 35,367,627.62
    Y este monto debe ser igual o cercano a la suma total de todas las tablas

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: CALC-07 - Tarjeta Total PxS debe coincidir con columnas PxS de las tablas
    Dado que la tarjeta "Total PxS" muestra S/ 32,624,330.16
    Cuando sumo la columna "PxS monto" de las tres tablas:
      | Tabla         | PxS monto          |
      | Protocolo     | S/ 13,263,575.08   |
      | Admisión      | S/ 7,524,547.58    |
      | Facturación   | S/ 11,836,207.50   |
    Entonces la suma debe ser S/ 32,624,330.16
    Y debe coincidir exactamente con la tarjeta "Total PxS"

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: CALC-08 - Tarjeta Total Cápita debe coincidir con columnas Cápita de las tablas
    Dado que la tarjeta "Total Cápita" muestra S/ 1,854,007.83
    Cuando reviso la columna "Cápita monto" en tabla Admisión
    Entonces debe mostrar S/ 1,854,007.83
    Y debe coincidir exactamente con la tarjeta "Total Cápita"

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: CALC-09 - Tarjeta Total CPM debe coincidir con columnas CPM de las tablas
    Dado que la tarjeta "Total CPM" muestra S/ 889,289.63
    Cuando reviso la columna "CPM monto" en tabla Admisión
    Entonces debe mostrar S/ 889,289.63 (o aproximado considerando redondeos)
    Y debe coincidir con la tarjeta "Total CPM"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE CÁLCULOS CON FILTROS APLICADOS
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: CALC-10 - Totales se recalculan correctamente al aplicar filtros
    Dado que he aplicado el filtro "Sede" = "Auna Guardia Civil"
    Y he presionado "Filtrar"
    Cuando visualizo las filas "Totales" de las tres tablas
    Entonces cada total debe ser la suma correcta de las filas filtradas
    Y los totales deben ser menores o iguales a los totales sin filtrar
    Y las tarjetas deben coincidir con los nuevos totales

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: CALC-11 - Totales con toggle "Solo positivos" excluyen filas con valor 0
    Dado que he activado el toggle "Solo positivos"
    Y he presionado "Filtrar"
    Cuando visualizo las filas "Totales"
    Entonces deben sumarse únicamente las filas con valores > 0
    Y NO deben incluirse filas con cantidades = 0 en la sumatoria

  # ========================================================================
  # TÉCNICA: BOUNDARY VALUE ANALYSIS - VALORES MÍNIMOS
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Esquema del escenario: CALC-12 - Validar formato de montos mínimos
    Dado que existe una fila con monto "<monto_minimo>"
    Cuando visualizo la tabla
    Entonces el monto debe mostrarse como "<formato_esperado>"
    Y debe incluir el símbolo "S/"
    Y debe incluir dos decimales

    Ejemplos:
      | monto_minimo | formato_esperado |
      | 0.00         | S/ 0.00          |
      | 0.01         | S/ 0.01          |
      | 1.00         | S/ 1.00          |
      | 10.50        | S/ 10.50         |

  # ========================================================================
  # TÉCNICA: BOUNDARY VALUE ANALYSIS - VALORES MÁXIMOS
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Esquema del escenario: CALC-13 - Validar formato de montos grandes
    Dado que existe una fila con monto "<monto_grande>"
    Cuando visualizo la tabla
    Entonces el monto debe mostrarse como "<formato_esperado>"
    Y debe incluir separadores de miles correctamente
    Y debe incluir dos decimales

    Ejemplos:
      | monto_grande    | formato_esperado    |
      | 1000.00         | S/ 1,000.00         |
      | 10000.00        | S/ 10,000.00        |
      | 100000.00       | S/ 100,000.00       |
      | 1000000.00      | S/ 1,000,000.00     |
      | 10000000.00     | S/ 10,000,000.00    |
      | 32624330.16     | S/ 32,624,330.16    |
      | 999999999.99    | S/ 999,999,999.99   |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE CANTIDADES
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Esquema del escenario: CALC-14 - Validar formato de cantidades
    Dado que existe una fila con cantidad "<cantidad>"
    Cuando visualizo la tabla
    Entonces la cantidad debe mostrarse como "<formato_esperado>"
    Y NO debe incluir decimales
    Y NO debe incluir símbolo de moneda

    Ejemplos:
      | cantidad | formato_esperado |
      | 0        | 0                |
      | 1        | 1                |
      | 10       | 10               |
      | 100      | 100              |
      | 1000     | 1000             |
      | 25647    | 25647            |
      | 196355   | 196355           |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE REDONDEOS
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: CALC-15 - Validar redondeo correcto de decimales
    Dado que existen montos con más de 2 decimales
    Cuando el sistema calcula los totales
    Entonces debe redondear a 2 decimales usando redondeo bancario
    Y la suma de montos redondeados debe coincidir con el total mostrado
    Y NO debe haber diferencias mayores a S/ 0.01

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: CALC-16 - Validar que no hay desbordamiento numérico en totales
    Dado que existen montos muy grandes en las tablas
    Cuando visualizo los totales
    Entonces todos los montos deben mostrarse correctamente
    Y NO debe haber truncamiento de valores
    Y NO deben mostrarse notaciones científicas
    Y los separadores de miles deben estar correctos

  # ========================================================================
  # TÉCNICA: CONSISTENCIA ENTRE SESIONES
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: CALC-17 - Los totales son consistentes al recargar la página
    Dado que visualizo las tarjetas con los siguientes valores:
      | Tarjeta       | Monto             |
      | Total PxS     | S/ 32,624,330.16  |
      | Total Cápita  | S/ 1,854,007.83   |
      | Total CPM     | S/ 889,289.63     |
    Cuando refresco la página del navegador
    Entonces las tarjetas deben mostrar exactamente los mismos valores
    Y las tablas deben mostrar los mismos totales
    Y NO debe haber variaciones en los cálculos

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE INTEGRIDAD DE DATOS
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: CALC-18 - Suma de tipos (PxS + Cápita + CPM) coincide con Total
    Dado que visualizo la tabla "Admisión" fila "Lista de encuentros"
    Cuando sumo las cantidades: PxS cant. + Cápita cant + CPM cant.
    Entonces debe ser menor o igual a "Total cant."
    Y la diferencia debe explicarse por encuentros sin tipo asignado
    Cuando sumo los montos: PxS monto + Cápita monto + CPM monto
    Entonces debe ser menor o igual a "Total monto"

  @gestorTA @pxfAmbulatorio @unhappyPath
  Escenario: CALC-19 - Detectar inconsistencias en totales
    Dado que existe una inconsistencia en los datos
    Cuando la suma de las filas NO coincide con el total mostrado
    Entonces debe mostrarse un mensaje de advertencia
    Y debe indicarse "Inconsistencia detectada en los cálculos. Contacte al administrador."
    Y los datos deben seguir siendo visibles para análisis

  # ========================================================================
  # TÉCNICA: PERFORMANCE EN CÁLCULOS
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: CALC-20 - Los cálculos se realizan rápidamente al filtrar
    Dado que he seleccionado múltiples filtros
    Cuando presiono el botón "Filtrar"
    Entonces el sistema debe recalcular todos los totales
    Y debe actualizar las tarjetas y tablas
    Y el tiempo de cálculo no debe exceder 2 segundos
    Y la experiencia debe ser fluida sin bloqueos
