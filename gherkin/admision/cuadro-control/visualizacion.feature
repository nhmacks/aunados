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

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
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
  # TÉCNICA: VALIDACIÓN DE TARJETAS DE MÉTRICAS
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-02 - Visualizar las 3 tarjetas de métricas
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo las tarjetas de métricas
    Entonces debe mostrarse la tarjeta "Total de encuentros perdientes"
    Y debe mostrarse la tarjeta "Lista de encuentros"
    Y debe mostrarse la tarjeta "Encuentros devueltos"
    Y cada tarjeta debe mostrar un monto con formato "S/ #,###,###.##"
    Y las tarjetas que corresponda deben mostrar una cantidad con formato "Cant. #####"

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-03 - Tarjeta Total de encuentros perdientes muestra datos correctos
    Dado que soy un usuario con rol "<rol>"
    Y existen 23805 encuentros pendientes en admisión
    Y el monto total pendiente es S/ 8,874,299.92
    Cuando visualizo la tarjeta "Total de encuentros perdientes"
    Entonces debe mostrarse "S/ 8,874,299.92"
    Y debe mostrarse "Cant. 23805"

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-04 - Tarjeta Lista de encuentros muestra datos correctos
    Dado que soy un usuario con rol "<rol>"
    Y existen encuentros en la bandeja "Lista de encuentros"
    Y el monto total es S/ 8,691,265.17
    Cuando visualizo la tarjeta "Lista de encuentros"
    Entonces debe mostrarse "S/ 8,691,265.17"

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-05 - Tarjeta Encuentros devueltos muestra datos correctos
    Dado que soy un usuario con rol "<rol>"
    Y existen 384 encuentros devueltos
    Y el monto total devuelto es S/ 183,034.75
    Cuando visualizo la tarjeta "Encuentros devueltos"
    Entonces debe mostrarse "S/ 183,034.75"
    Y debe mostrarse "Cant. 384"

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TABLA "TOTAL POR EJECUTIVO"
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-06 - Visualizar estructura de tabla Total por ejecutivo
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la tabla "Total por ejecutivo"
    Entonces debe mostrarse el encabezado "Total por ejecutivo"
    Y debe mostrarse la tabla con las siguientes columnas:
      | Columna              |
      | Ejecutivo            |
      | Total cant.          |
      | Total monto          |
      | Lista de enc. cant.  |
      | Lista de enc. monto  |
      | Enc. devueltos cant. |
      | Enc. devueltos monto |
    Y debe mostrarse una fila "Totales" al final

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-07 - Validar datos de ejecutivos individuales
    Dado que soy un usuario con rol "<rol>"
    Y existe el ejecutivo "<ejecutivo>" con datos específicos
    Cuando visualizo la tabla "Total por ejecutivo"
    Entonces la fila del ejecutivo "<ejecutivo>" debe mostrar:
      - Total cant.: número entero
      - Total monto: formato "S/ #,###.##"
      - Lista de enc. cant.: número entero
      - Lista de enc. monto: formato "S/ #,###.##"
      - Enc. devueltos cant.: número entero >= 0
      - Enc. devueltos monto: formato "S/ #,###.##" o "S/ 0.00"

    Ejemplos:
      | rol                        | ejecutivo                |
      | Superusuario de Admisión   | Abigail Bisquert Luz I   |
      | Gestor TA                  | Abigail Yoselyn Si...    |
      | Superusuario de Admisión   | Adriana Castellar...     |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-08 - Validar fila de Totales en tabla Total por ejecutivo
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la fila "Totales" de la tabla "Total por ejecutivo"
    Entonces debe mostrar:
      | Columna              | Valor esperado    |
      | Total cant.          | 23805             |
      | Total monto          | S/ 8,874,299.92   |
      | Lista de enc. cant.  | 23421             |
      | Lista de enc. monto  | S/ 8,691,265.17   |
      | Enc. devueltos cant. | 384               |
      | Enc. devueltos monto | S/ 183,034.75     |

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TABLA "SUSTENTOS PENDIENTES"
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-09 - Visualizar estructura de tabla Sustentos pendientes
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la tabla "Sustentos pendientes - Bandeja 'Lista de encuentros'"
    Entonces debe mostrarse el encabezado "Sustentos pendientes - Bandeja 'Lista de encuentros'"
    Y debe mostrarse la tabla con las siguientes columnas:
      | Columna          |
      | Administrativos  |
      | Total cant.      |
      | Médicos          |
      | Total cant.      |
    Y debe mostrarse una fila "Totales"

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-10 - Validar datos de sustentos administrativos
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la tabla "Sustentos pendientes"
    Entonces la columna "Administrativos" debe mostrar:
      | Sustento                  | Total cant. |
      | Formato SCTR              | 437         |
      | Orden de Compra           | -           |
      | SOAT Tarjeta Física       | 405         |
      | Autorización por Co...    | 9           |
    Y los guiones "-" deben mostrarse cuando no hay datos

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-11 - Validar datos de sustentos médicos
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la tabla "Sustentos pendientes"
    Entonces la columna "Médicos" debe mostrar:
      | Sustento       | Total cant. |
      | -              | 14548       |
      | Laboratorios   | 9371        |
      | Totales        | 23449       |

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-12 - Validar fila Totales en tabla Sustentos pendientes
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la fila "Totales" de la tabla "Sustentos pendientes"
    Entonces debe mostrar "30121" en la columna de Administrativos
    Y debe mostrar "23449" en la columna de Médicos (si aplica según lógica)

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TABLA "DEVOLUCIONES"
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-13 - Visualizar estructura de tabla Devoluciones
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la tabla "Devoluciones - Bandeja 'Encuentros devueltos'"
    Entonces debe mostrarse el encabezado "Devoluciones - Bandeja 'Encuentros devueltos'"
    Y debe mostrarse la tabla con las siguientes columnas:
      | Columna          |
      | Administrativos  |
      | Total cant.      |
      | Médicos          |
      | Total cant.      |
      | De proceso       |
      | Total cant.      |
    Y debe mostrarse una fila "Totales"

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-14 - Validar motivos de devolución administrativos
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la columna "Administrativos" de la tabla "Devoluciones"
    Entonces debe mostrarse los siguientes motivos con sus cantidades:
      | Motivo                    | Total cant. |
      | AMPLIACIÓN DE CAR...      | 15          |
      | AREA DEVOLUCIONES         | 2           |
      | AUTORIZACIÓN NO V...      | 38          |
      | CARTA DE GARANTÍA...      | 3           |
      | CARTA DE GARANTÍA...      | 17          |

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-15 - Validar motivos de devolución médicos
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la columna "Médicos" de la tabla "Devoluciones"
    Entonces debe mostrarse los siguientes motivos:
      | Motivo            | Total cant. |
      | HC                | 46          |
      | INF APA           | 5           |
      | INF IMAGEN        | 22          |
      | INF LAB           | 5           |
      | INF PROCEDIMIENTO | 43          |

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-16 - Validar motivos de devolución de proceso
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la columna "De proceso" de la tabla "Devoluciones"
    Entonces debe mostrarse los siguientes motivos:
      | Motivo                | Total cant. |
      | COD AUTORIZACIÓN...   | 1           |
      | ERROR BENEFICIO       | 5           |
      | ERROR COASEG          | 4           |
      | ERROR DEDUCIBLE       | 1           |
      | ERROR EN COD AUTO...  | 1           |

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-17 - Validar fila Totales en tabla Devoluciones
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la fila "Totales" de la tabla "Devoluciones"
    Entonces debe mostrar "251" para Administrativos
    Y debe mostrar "103" para Médicos
    Y debe mostrar "52" para De proceso

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TABLA "TOTAL DE ENCUENTROS POR ESTADO"
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-18 - Visualizar estructura de tabla Total de encuentros por estado
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la tabla "Total de encuentros por estado"
    Entonces debe mostrarse el encabezado "Total de encuentros por estado"
    Y debe mostrarse la tabla con las siguientes columnas:
      | Columna           |
      | Tipo de estado    |
      | Estado            |
      | Total cant.       |
      | Total monto       |
      | Lista enc. cant.  |
      | Lista enc. monto  |
      | Enc. dev. cant.   |
      | Enc. dev. monto   |
    Y debe mostrarse un ícono de filtro junto a "Tipo de estado"
    Y debe mostrarse una fila "Totales"

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-19 - Validar diferentes tipos y estados de encuentros
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la tabla "Total de encuentros por estado"
    Entonces debe mostrarse las siguientes filas con sus datos:
      | Tipo de estado  | Estado               | Total cant. | Total monto       |
      | Devueltos       | Devuelto o D.M       | 1           | -S/ 2.69          |
      | Administrativo  | Devuelto o Eje...    | 88          | S/ 9,076.62       |
      | Administrativo  | Devuelto             | 381         | S/ 180,754.20     |
      | Administrativo  | Error de circula...  | 63          | S/ 32,373.19      |
      | Seguimiento     | Pago por adela...    | 180         | S/ 52,527.60      |
      | Administrativo  | Pendiente            | 22753       | S/ 8,391,780.96   |
      | Seguimiento     | Pendiente de re...   | 16          | S/ 4,378.04       |
      | Seguimiento     | Tiempo en proc...    | 312         | S/ 212,680.35     |

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-20 - Validar fila Totales en tabla Total de encuentros por estado
    Dado que soy un usuario con rol "<rol>"
    Cuando visualizo la fila "Totales" de la tabla "Total de encuentros por estado"
    Entonces debe mostrar:
      | Columna           | Valor             |
      | Total cant.       | 23813             |
      | Total monto       | S/ 8,877,507.38   |
      | Lista enc. cant.  | 23429             |
      | Lista enc. monto  | S/ 8,694,572.63   |
      | Enc. dev. cant.   | 384               |
      | Enc. dev. monto   | S/ 183,034.75     |

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE MONTOS NEGATIVOS
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-21 - Validar formato de montos negativos
    Dado que soy un usuario con rol "<rol>"
    Y existe un encuentro con monto negativo "-S/ 2.69"
    Cuando visualizo la tabla "Total de encuentros por estado"
    Entonces el monto debe mostrarse como "-S/ 2.69"
    Y el símbolo "-" debe preceder al símbolo "S/"
    Y el formato debe incluir dos decimales

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: SCROLL Y VISUALIZACIÓN
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: VIS-22 - Validar scroll vertical en la página
    Dado que soy un usuario con rol "<rol>"
    Y la página contiene múltiples secciones
    Cuando hago scroll hacia abajo
    Entonces debo poder visualizar las 4 tablas completas
    Y las tarjetas de métricas deben permanecer visibles o desplazarse según el diseño
    Y el scroll debe ser fluido

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |
