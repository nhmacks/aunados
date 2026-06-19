# language: es

Característica: Visualización de Cuadro de Control - Encuentros Asignados
  Como Responsable de Facturación o Gestor TA
  Quiero visualizar el cuadro de control de encuentros asignados
  Para monitorear el desempeño de los ejecutivos de facturación

  Antecedentes:
    Dado que he iniciado sesión en el sistema

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ELEMENTOS DE UI PRINCIPALES
  # ========================================================================

  @prioridadMedia @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: VIS-01 - Visualizar elementos principales de la pantalla Cuadro de Control
    Dado que soy un usuario con rol "<rol>"
    Cuando accedo a la pantalla "Cuadro de control - Enc. asignados"
    Entonces debe mostrarse el título "Cuadro de control - Enc. asignados"
    Y debe mostrarse la fecha actual "Hoy, DD de MMMM de AAAA"
    Y debe mostrarse el dropdown "Garante" con valor por defecto "Todos"
    Y debe mostrarse el dropdown "Sede" con valor por defecto "Todos"
    Y debe mostrarse el dropdown "Ejecutivo" con valor por defecto "Todos"
    Y debe mostrarse el botón "Filtrar" habilitado
    Y debe mostrarse el botón "Limpiar" habilitado
    Y debe mostrarse el gráfico circular "Total de encuentros pendientes"
    Y debe mostrarse 7 tarjetas de métricas
    Y debe mostrarse la sección "Encuentros asignados"
    Y debe mostrarse el contador de registros
    Y debe mostrarse el botón "Descargar" habilitado
    Y debe mostrarse el botón "Restablecer vista" habilitado

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TARJETAS DE MÉTRICAS
  # ========================================================================

  @prioridadMedia @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: VIS-02 - Visualizar las 7 tarjetas de métricas con datos correctos
    Dado que soy un usuario con rol "<rol>"
    Y he accedido a la pantalla "Cuadro de control - Enc. asignados"
    Y existen encuentros asignados con diferentes estados
    Cuando visualizo las tarjetas de métricas
    Entonces debe mostrarse la tarjeta "Facturado hoy" con monto y cantidad
    Y debe mostrarse la tarjeta "Por facturar" con monto y cantidad
    Y debe mostrarse la tarjeta "En revisión" con monto y cantidad
    Y debe mostrarse la tarjeta "Regul. adm." con monto y cantidad
    Y debe mostrarse la tarjeta "No facturable" con monto y cantidad
    Y debe mostrarse la tarjeta "Error facturación" con monto y cantidad
    Y debe mostrarse la tarjeta "Devueltos" con monto y cantidad
    Y todas las tarjetas deben mostrar formato de moneda "S/ #,###.##"
    Y todas las tarjetas deben mostrar el formato "Cant. ###"

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  @prioridadMedia @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: VIS-03 - Validar cálculos de métricas en tarjetas
    Dado que soy un usuario con rol "<rol>"
    Y he accedido a la pantalla "Cuadro de control - Enc. asignados"
    Y existen <facturado_hoy> encuentros facturados hoy con monto total <monto_fac>
    Y existen <por_facturar> encuentros por facturar con monto total <monto_por_fac>
    Y existen <en_revision> encuentros en revisión con monto total <monto_rev>
    Cuando visualizo las tarjetas de métricas
    Entonces la tarjeta "Facturado hoy" debe mostrar "S/ <monto_fac>" y "Cant. <facturado_hoy>"
    Y la tarjeta "Por facturar" debe mostrar "S/ <monto_por_fac>" y "Cant. <por_facturar>"
    Y la tarjeta "En revisión" debe mostrar "S/ <monto_rev>" y "Cant. <en_revision>"

    Ejemplos:
      | rol                        | facturado_hoy | monto_fac | por_facturar | monto_por_fac | en_revision | monto_rev |
      | Responsable de Facturación | 20            | 7,933.70  | 223          | 40,059.53     | 63          | 25,583.46 |
      | Gestor TA                  | 20            | 7,933.70  | 223          | 40,059.53     | 63          | 25,583.46 |
      | Responsable de Facturación | 0             | 0.00      | 150          | 25,000.00     | 10          | 5,000.00  |
      | Gestor TA                  | 0             | 0.00      | 150          | 25,000.00     | 10          | 5,000.00  |
      | Responsable de Facturación | 50            | 15,000.00 | 0            | 0.00          | 100         | 30,000.00 |
      | Gestor TA                  | 50            | 15,000.00 | 0            | 0.00          | 100         | 30,000.00 |

  # ========================================================================
  # TÉCNICA: VALORES DE FRONTERA - MONTOS MÍNIMOS, PROMEDIO Y MÁXIMOS
  # ========================================================================

  @prioridadMedia @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: VIS-03B - Validar manejo de montos mínimos, promedio y máximos
    Dado que soy un usuario con rol "<rol>"
    Y he accedido a la pantalla "Cuadro de control - Enc. asignados"
    Y existe un ejecutivo con encuentros que suman un monto total de "<monto>"
    Cuando visualizo la grilla y las tarjetas de métricas
    Entonces el monto debe mostrarse correctamente como "S/ <monto_formateado>"
    Y el formato debe ser legible y correcto
    Y NO debe haber errores de desbordamiento ni truncamiento

    Ejemplos:
      | rol                        | monto        | monto_formateado | tipo_valor    |
      | Responsable de Facturación | 0.00         | 0.00             | Mínimo        |
      | Gestor TA                  | 0.00         | 0.00             | Mínimo        |
      | Responsable de Facturación | 0.01         | 0.01             | Mínimo límite |
      | Gestor TA                  | 0.01         | 0.01             | Mínimo límite |
      | Responsable de Facturación | 100.50       | 100.50           | Bajo          |
      | Gestor TA                  | 100.50       | 100.50           | Bajo          |
      | Responsable de Facturación | 5000.00      | 5,000.00         | Promedio bajo |
      | Gestor TA                  | 5000.00      | 5,000.00         | Promedio bajo |
      | Responsable de Facturación | 25000.00     | 25,000.00        | Promedio      |
      | Gestor TA                  | 25000.00     | 25,000.00        | Promedio      |
      | Responsable de Facturación | 50000.00     | 50,000.00        | Promedio alto |
      | Gestor TA                  | 50000.00     | 50,000.00        | Promedio alto |
      | Responsable de Facturación | 100000.00    | 100,000.00       | Alto          |
      | Gestor TA                  | 100000.00    | 100,000.00       | Alto          |
      | Responsable de Facturación | 500000.00    | 500,000.00       | Muy alto      |
      | Gestor TA                  | 500000.00    | 500,000.00       | Muy alto      |
      | Responsable de Facturación | 1000000.00   | 1,000,000.00     | Máximo        |
      | Gestor TA                  | 1000000.00   | 1,000,000.00     | Máximo        |
      | Responsable de Facturación | 9999999.99   | 9,999,999.99     | Máximo límite |
      | Gestor TA                  | 9999999.99   | 9,999,999.99     | Máximo límite |

  @prioridadMedia @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: VIS-03C - Validar cantidades mínimas, promedio y máximas
    Dado que soy un usuario con rol "<rol>"
    Y he accedido a la pantalla "Cuadro de control - Enc. asignados"
    Y existe un ejecutivo con "<cantidad>" encuentros asignados
    Cuando visualizo la grilla
    Entonces la cantidad debe mostrarse correctamente como "<cantidad>"
    Y el formato debe ser numérico entero
    Y NO debe haber errores de visualización

    Ejemplos:
      | rol                        | cantidad | tipo_valor    |
      | Responsable de Facturación | 0        | Mínimo        |
      | Gestor TA                  | 0        | Mínimo        |
      | Responsable de Facturación | 1        | Mínimo límite |
      | Gestor TA                  | 1        | Mínimo límite |
      | Responsable de Facturación | 10       | Bajo          |
      | Gestor TA                  | 10       | Bajo          |
      | Responsable de Facturación | 50       | Promedio bajo |
      | Gestor TA                  | 50       | Promedio bajo |
      | Responsable de Facturación | 100      | Promedio      |
      | Gestor TA                  | 100      | Promedio      |
      | Responsable de Facturación | 250      | Promedio alto |
      | Gestor TA                  | 250      | Promedio alto |
      | Responsable de Facturación | 500      | Alto          |
      | Gestor TA                  | 500      | Alto          |
      | Responsable de Facturación | 1000     | Muy alto      |
      | Gestor TA                  | 1000     | Muy alto      |
      | Responsable de Facturación | 5000     | Máximo        |
      | Gestor TA                  | 5000     | Máximo        |
      | Responsable de Facturación | 9999     | Máximo límite |
      | Gestor TA                  | 9999     | Máximo límite |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE GRÁFICO CIRCULAR
  # ========================================================================

  @prioridadMedia @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: VIS-04 - Visualizar gráfico circular "Total de encuentros pendientes"
    Dado que soy un usuario con rol "<rol>"
    Y he accedido a la pantalla "Cuadro de control - Enc. asignados"
    Y existen 555 encuentros pendientes con monto total S/ 121,829.42
    Cuando visualizo el gráfico circular
    Entonces debe mostrarse el título "Total de encuentros pendientes"
    Y debe mostrarse el monto total "S/ 121,829.42"
    Y debe mostrarse la cantidad total "Cant. 555"
    Y el gráfico debe mostrar 5 segmentos con colores diferentes
    Y debe mostrarse la leyenda con las categorías:
      | Categoría         | Color |
      | Por facturar      | Azul  |
      | En revisión       | Cyan  |
      | Regularizado      | Verde |
      | No facturable     | Rosa  |
      | Error facturación | Rojo  |

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  @prioridadMedia @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: VIS-05 - Validar distribución porcentual en gráfico circular
    Dado que soy un usuario con rol "<rol>"
    Y he accedido a la pantalla "Cuadro de control - Enc. asignados"
    Y existen <por_facturar> encuentros por facturar
    Y existen <en_revision> encuentros en revisión
    Y existen <regularizado> encuentros regularizados
    Y existen <no_facturable> encuentros no facturables
    Y existen <error_fact> encuentros con error de facturación
    Cuando visualizo el gráfico circular
    Entonces el segmento "Por facturar" debe representar aproximadamente <porc_fac>%
    Y el segmento "En revisión" debe representar aproximadamente <porc_rev>%
    Y el segmento "Regularizado" debe representar aproximadamente <porc_reg>%

    Ejemplos:
      | rol                        | por_facturar | en_revision | regularizado | no_facturable | error_fact | porc_fac | porc_rev | porc_reg |
      | Responsable de Facturación | 223          | 63          | 238          | 0             | 31         | 40       | 11       | 43       |
      | Gestor TA                  | 223          | 63          | 238          | 0             | 31         | 40       | 11       | 43       |
      | Responsable de Facturación | 100          | 100         | 100          | 50            | 50         | 25       | 25       | 25       |
      | Gestor TA                  | 100          | 100         | 100          | 50            | 50         | 25       | 25       | 25       |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE GRILLA DE EJECUTIVOS
  # ========================================================================

  @prioridadMedia @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: VIS-06 - Visualizar grilla "Encuentros asignados" con todas las columnas
    Dado que soy un usuario con rol "<rol>"
    Y he accedido a la pantalla "Cuadro de control - Enc. asignados"
    Cuando visualizo la grilla "Encuentros asignados"
    Entonces debe mostrarse la grilla con las siguientes columnas en orden:
      | Columna                  |
      | Ejecutivo                |
      | Facturado hoy            |
      | Monto fact.              |
      | Por facturar             |
      | Monto por fact.          |
      | En revisión              |
      | Monto en revisión        |
      | Regularizado             |
      | Monto regul.             |
      | No facturable            |
      | Monto NF                 |
      | Error de fact.           |
      | Monto error de f.        |
      | Total pendientes         |
      | Monto total pendientes   |
      | % Total pendiente        |
      | Devuelto a adm.          |
      | Monto devuelto           |

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  @prioridadMedia @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: VIS-07 - Validar datos de un ejecutivo en la grilla
    Dado que soy un usuario con rol "<rol>"
    Y he accedido a la pantalla "Cuadro de control - Enc. asignados"
    Y existe el ejecutivo "Jenny Xamara Ponce Ega" con los siguientes datos:
      | Campo                  | Valor        |
      | Facturado hoy          | 0            |
      | Monto fact.            | S/ 0.00      |
      | Por facturar           | 183          |
      | Monto por fact.        | S/ 25,301.89 |
      | En revisión            | 0            |
      | Monto en revisión      | S/ 0.00      |
      | Regularizado           | 46           |
    Cuando visualizo la grilla
    Entonces el ejecutivo "Jenny Xamara Ponce Ega" debe mostrar todos los datos correctamente
    Y todos los montos deben tener formato "S/ #,###.##"
    Y todas las cantidades deben ser números enteros

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  @prioridadMedia @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: VIS-08 - Validar contador de registros en la grilla
    Dado que soy un usuario con rol "<rol>"
    Y he accedido a la pantalla "Cuadro de control - Enc. asignados"
    Y existen 135 ejecutivos de facturación con encuentros asignados
    Cuando visualizo la grilla
    Entonces debe mostrarse "135 registros encontrados"
    Y el contador debe ubicarse encima de la grilla

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  @prioridadMedia @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: VIS-09 - Validar cálculo del porcentaje de pendientes por ejecutivo
    Dado que soy un usuario con rol "<rol>"
    Y he accedido a la pantalla "Cuadro de control - Enc. asignados"
    Y existe un ejecutivo con <total_pendientes> encuentros pendientes
    Y el total de encuentros asignados a ese ejecutivo es <total_asignados>
    Cuando visualizo la grilla
    Entonces la columna "% Total pendiente" debe mostrar "<porcentaje>%"
    Y el porcentaje debe calcularse como (total_pendientes / total_asignados) * 100

    Ejemplos:
      | rol                        | total_pendientes | total_asignados | porcentaje |
      | Responsable de Facturación | 258              | 903             | 28.58      |
      | Gestor TA                  | 258              | 903             | 28.58      |
      | Responsable de Facturación | 154              | 683             | 22.5       |
      | Gestor TA                  | 154              | 683             | 22.5       |
      | Responsable de Facturación | 31               | 273             | 11.34      |
      | Gestor TA                  | 31               | 273             | 11.34      |
      | Responsable de Facturación | 0                | 100             | 0.00       |
      | Gestor TA                  | 0                | 100             | 0.00       |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE FORMATO DE MONTOS
  # ========================================================================

  @prioridadMedia @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: VIS-10 - Validar formato de montos en soles
    Dado que soy un usuario con rol "<rol>"
    Y he accedido a la pantalla "Cuadro de control - Enc. asignados"
    Y existe un monto de "<monto_valor>"
    Cuando visualizo el monto en "<ubicacion>"
    Entonces debe mostrarse con formato "S/ <monto_formateado>"
    Y debe incluir separador de miles con coma
    Y debe incluir dos decimales

    Ejemplos:
      | rol                        | monto_valor | monto_formateado | ubicacion                    |
      | Responsable de Facturación | 121829.42   | 121,829.42       | Gráfico circular             |
      | Gestor TA                  | 121829.42   | 121,829.42       | Gráfico circular             |
      | Responsable de Facturación | 7933.70     | 7,933.70         | Tarjeta Facturado hoy        |
      | Gestor TA                  | 7933.70     | 7,933.70         | Tarjeta Facturado hoy        |
      | Responsable de Facturación | 40059.53    | 40,059.53        | Tarjeta Por facturar         |
      | Gestor TA                  | 40059.53    | 40,059.53        | Tarjeta Por facturar         |
      | Responsable de Facturación | 0.00        | 0.00             | Tarjeta No facturable        |
      | Gestor TA                  | 0.00        | 0.00             | Tarjeta No facturable        |
      | Responsable de Facturación | 25301.89    | 25,301.89        | Grilla - Monto por fact.     |
      | Gestor TA                  | 25301.89    | 25,301.89        | Grilla - Monto por fact.     |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE SCROLL HORIZONTAL EN GRILLA
  # ========================================================================

  @prioridadMedia @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: VIS-11 - Validar scroll horizontal para visualizar todas las columnas
    Dado que soy un usuario con rol "<rol>"
    Y he accedido a la pantalla "Cuadro de control - Enc. asignados"
    Y la grilla tiene 18 columnas
    Cuando visualizo la grilla
    Entonces las primeras columnas visibles deben ser "Ejecutivo", "Facturado hoy", "Monto fact."
    Y debo poder hacer scroll horizontal hacia la derecha
    Y al hacer scroll debo poder visualizar las columnas finales "Devuelto a adm.", "Monto devuelto"
    Y todas las 18 columnas deben ser accesibles mediante scroll

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ESTADO INICIAL
  # ========================================================================

  @prioridadMedia @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: VIS-12 - Validar estado inicial de la pantalla al cargar
    Dado que soy un usuario con rol "<rol>"
    Cuando accedo por primera vez a la pantalla "Cuadro de control - Enc. asignados"
    Entonces los filtros deben mostrar "Todos" por defecto
    Y NO deben haber filtros aplicados
    Y las tarjetas deben mostrar datos de todos los ejecutivos
    Y el gráfico debe mostrar datos de todos los ejecutivos
    Y la grilla debe mostrar todos los ejecutivos de facturación
    Y el contador debe mostrar el total de ejecutivos

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  @prioridadMedia @responsableFacturacion @gestorTA @unhappyPath
  Esquema del escenario: VIS-13 - Visualizar pantalla sin ejecutivos asignados
    Dado que soy un usuario con rol "<rol>"
    Y NO existen ejecutivos de facturación con encuentros asignados
    Cuando accedo a la pantalla "Cuadro de control - Enc. asignados"
    Entonces las tarjetas deben mostrar "S/ 0.00" y "Cant. 0"
    Y el gráfico debe mostrar "S/ 0.00" y "Cant. 0"
    Y la grilla debe estar vacía
    Y debe mostrarse "0 registros encontrados"
    Y debe mostrarse un mensaje "No hay encuentros asignados para mostrar"

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ACTUALIZACIÓN DE DATOS
  # ========================================================================

  @prioridadMedia @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: VIS-14 - Validar que los datos se actualizan al refrescar la pantalla
    Dado que soy un usuario con rol "<rol>"
    Y he accedido a la pantalla "Cuadro de control - Enc. asignados"
    Y visualizo 555 encuentros pendientes
    Cuando refresco la pantalla
    Y en el sistema ahora existen 600 encuentros pendientes
    Entonces el gráfico debe actualizarse y mostrar "Cant. 600"
    Y las tarjetas deben actualizarse con los nuevos valores
    Y la grilla debe actualizarse con los nuevos datos de ejecutivos

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |

  @prioridadMedia @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: VIS-15 - Validar formato de fecha actual
    Dado que soy un usuario con rol "<rol>"
    Cuando accedo a la pantalla "Cuadro de control - Enc. asignados"
    Y hoy es 16 de junio de 2026
    Entonces debe mostrarse "Hoy, 16 de junio de 2026"
    Y el formato debe ser "Hoy, DD de MMMM de AAAA"
    Y el mes debe mostrarse en español

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |
