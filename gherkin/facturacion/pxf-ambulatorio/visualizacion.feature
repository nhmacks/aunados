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

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-01 - Visualizar elementos principales de PxF Ambulatorio
    Cuando accedo a la pantalla "PxF Ambulatorio"
    Entonces debe mostrarse el título "PxF Ambulatorio"
    Y deben mostrarse 3 filtros: Sede, Tipo de atención, Garante
    Y deben mostrarse los botones "Filtrar" y "Limpiar"
    Y debe mostrarse el toggle "Solo positivos"
    Y deben mostrarse 3 tarjetas de métricas
    Y deben mostrarse 3 tablas: Protocolo, Admisión, Facturación

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TARJETAS DE MÉTRICAS
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-02 - Visualizar las 3 tarjetas de métricas
    Cuando visualizo las tarjetas de métricas
    Entonces debe mostrarse la tarjeta "Total PxS"
    Y debe mostrarse la tarjeta "Total Cápita"
    Y debe mostrarse la tarjeta "Total CPM"
    Y cada tarjeta debe mostrar un monto
    Y cada tarjeta debe mostrar una cantidad

  @gestorTA @pxfAmbulatorio @happyPath
  Esquema del escenario: VIS-03 - Validar formato de montos en tarjetas de métricas
    Dado que existen datos de facturación ambulatoria
    Cuando visualizo la tarjeta "<tarjeta>"
    Entonces el monto debe mostrarse con formato "S/ #,###,###.##"
    Y debe incluir el símbolo "S/" al inicio
    Y debe incluir separador de miles
    Y debe incluir dos decimales
    Y debe mostrarse la cantidad con formato "Cant. ######"

    Ejemplos:
      | tarjeta       |
      | Total PxS     |
      | Total Cápita  |
      | Total CPM     |

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-04 - Tarjeta Total PxS muestra monto y cantidad correctos
    Dado que existen 196355 encuentros PxS ambulatorios
    Y el monto total PxS es S/ 32,624,330.16
    Cuando visualizo la tarjeta "Total PxS"
    Entonces debe mostrarse "S/ 32,624,330.16"
    Y debe mostrarse "Cant. 196355"

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-05 - Tarjeta Total Cápita muestra monto y cantidad correctos
    Dado que existen 2559 encuentros Cápita ambulatorios
    Y el monto total Cápita es S/ 1,854,007.83
    Cuando visualizo la tarjeta "Total Cápita"
    Entonces debe mostrarse "S/ 1,854,007.83"
    Y debe mostrarse "Cant. 2559"

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-06 - Tarjeta Total CPM muestra monto y cantidad correctos
    Dado que existen 2651 encuentros CPM ambulatorios
    Y el monto total CPM es S/ 889,289.63
    Cuando visualizo la tarjeta "Total CPM"
    Entonces debe mostrarse "S/ 889,289.63"
    Y debe mostrarse "Cant. 2651"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TABLA PROTOCOLO
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-07 - Visualizar estructura de tabla Protocolo
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

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-08 - Validar datos de fila "Con sustentos completos"
    Dado que existen 25647 encuentros con sustentos completos
    Y el monto total es S/ 13,263,575.08
    Cuando visualizo la tabla "Protocolo"
    Entonces la fila "Con sustentos completos" debe mostrar:
      | Columna      | Valor             |
      | Total cant.  | 25647             |
      | Total monto  | S/ 13,263,575.08  |
      | PxS cant.    | 25647             |
      | PxS monto    | S/ 13,263,575.08  |

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-09 - Validar datos de fila "En plazo de laboratorio"
    Dado que existen 0 encuentros en plazo de laboratorio
    Cuando visualizo la tabla "Protocolo"
    Entonces la fila "En plazo de laboratorio" debe mostrar:
      | Columna      | Valor    |
      | Total cant.  | 0        |
      | Total monto  | S/ 0.00  |
      | PxS cant.    | 0        |
      | PxS monto    | S/ 0.00  |

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-10 - Validar fila de Totales en tabla Protocolo
    Dado que la suma de "Con sustentos completos" y "En plazo de laboratorio" es 25647
    Cuando visualizo la tabla "Protocolo"
    Entonces la fila "Totales" debe mostrar:
      | Columna      | Valor             |
      | Total cant.  | 25647             |
      | Total monto  | S/ 13,263,575.08  |
      | PxS cant.    | 25647             |
      | PxS monto    | S/ 13,263,575.08  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TABLA ADMISIÓN
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-11 - Visualizar estructura de tabla Admisión
    Cuando visualizo la tabla "Admisión"
    Entonces debe mostrarse el encabezado "Admisión"
    Y debe mostrarse la tabla con las siguientes columnas:
      | Columna        |
      | Tipo           |
      | Total cant.    |
      | Total monto    |
      | PxS cant.      |
      | PxS monto      |
      | Cápita cant    |
      | Cápita monto   |
      | CPM cant.      |
      | CPM monto      |
    Y deben mostrarse las siguientes filas:
      | Fila                  |
      | Lista de encuentros   |
      | Encuentros devueltos  |
      | Totales               |

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-12 - Validar datos de fila "Lista de encuentros"
    Dado que existen 27385 encuentros en lista de encuentros
    Y el monto total es S/ 10,082,314.52
    Y 22286 son PxS con monto S/ 7,327,620.46
    Y 2559 son Cápita con monto S/ 1,854,007.83
    Y 2651 son CPM con monto S/ 889,289.63
    Cuando visualizo la tabla "Admisión"
    Entonces la fila "Lista de encuentros" debe mostrar:
      | Columna        | Valor             |
      | Total cant.    | 27385             |
      | Total monto    | S/ 10,082,314.52  |
      | PxS cant.      | 22286             |
      | PxS monto      | S/ 7,327,620.46   |
      | Cápita cant    | 2559              |
      | Cápita monto   | S/ 1,854,007.83   |
      | CPM cant.      | 2651              |
      | CPM monto      | S/ 889,289.63     |

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-13 - Validar datos de fila "Encuentros devueltos"
    Dado que existen 359 encuentros devueltos
    Y el monto total es S/ 196,927.12
    Cuando visualizo la tabla "Admisión"
    Entonces la fila "Encuentros devueltos" debe mostrar:
      | Columna        | Valor          |
      | Total cant.    | 359            |
      | Total monto    | S/ 196,927.12  |
      | PxS cant.      | 359            |
      | PxS monto      | S/ 196,927.12  |
      | Cápita cant    | 0              |
      | Cápita monto   | S/ 0.00        |

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-14 - Validar fila de Totales en tabla Admisión
    Cuando visualizo la tabla "Admisión"
    Entonces la fila "Totales" debe mostrar:
      | Columna        | Valor             |
      | Total cant.    | 27744             |
      | Total monto    | S/ 10,279,241.64  |
      | PxS cant.      | 22645             |
      | PxS monto      | S/ 7,524,547.58   |
      | Cápita cant    | 2559              |
      | Cápita monto   | S/ 1,854,007.83   |
      | CPM cant.      | 2651              |
      | CPM monto      | S/ 889,289.63     |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TABLA FACTURACIÓN
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-15 - Visualizar estructura de tabla Facturación
    Cuando visualizo la tabla "Facturación"
    Entonces debe mostrarse el encabezado "Facturación"
    Y debe mostrarse la tabla con las siguientes columnas:
      | Columna        |
      | Tipo           |
      | Total cant.    |
      | Total monto    |
      | PxS cant.      |
      | PxS monto      |
      | Cápita cant    |
      | Cápita monto   |
      | CPM cant.      |
      | CPM monto      |
    Y deben mostrarse las siguientes filas:
      | Fila            |
      | Por asignar     |
      | Asignados       |
      | Facturados hoy  |
      | Totales         |

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-16 - Validar datos de fila "Por asignar"
    Dado que existen 142804 encuentros por asignar
    Y el monto total es S/ 11,719,424.95
    Cuando visualizo la tabla "Facturación"
    Entonces la fila "Por asignar" debe mostrar:
      | Columna      | Valor              |
      | Total cant.  | 142804             |
      | Total monto  | S/ 11,719,424.95   |
      | PxS cant.    | 142804             |
      | PxS monto    | S/ 11,719,424.95   |

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-17 - Validar datos de fila "Asignados"
    Dado que existen 759 encuentros asignados
    Y el monto total es S/ 116,782.55
    Cuando visualizo la tabla "Facturación"
    Entonces la fila "Asignados" debe mostrar:
      | Columna      | Valor          |
      | Total cant.  | 759            |
      | Total monto  | S/ 116,782.55  |
      | PxS cant.    | 759            |
      | PxS monto    | S/ 116,782.55  |

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-18 - Validar datos de fila "Facturados hoy"
    Dado que existen 0 encuentros facturados hoy
    Cuando visualizo la tabla "Facturación"
    Entonces la fila "Facturados hoy" debe mostrar:
      | Columna      | Valor    |
      | Total cant.  | 0        |
      | Total monto  | S/ 0.00  |
      | PxS cant.    | 0        |
      | PxS monto    | S/ 0.00  |

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-19 - Validar fila de Totales en tabla Facturación
    Cuando visualizo la tabla "Facturación"
    Entonces la fila "Totales" debe mostrar:
      | Columna      | Valor              |
      | Total cant.  | 143563             |
      | Total monto  | S/ 11,836,207.50   |
      | PxS cant.    | 143563             |
      | PxS monto    | S/ 11,836,207.50   |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE GUIONES PARA VALORES VACÍOS
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-20 - Validar que columnas vacías muestran guión "-"
    Cuando visualizo las tablas de Protocolo, Admisión y Facturación
    Entonces las columnas sin datos deben mostrar "-"
    Y NO deben mostrarse valores "0" o "S/ 0.00" cuando corresponde guión
    Y el guión debe estar centrado en la celda

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-21 - Columnas Cápita y CPM muestran guión en tabla Protocolo
    Cuando visualizo la tabla "Protocolo"
    Entonces las columnas "Cápita cant", "Cápita monto", "CPM cant.", "CPM monto" deben mostrar "-"
    Y NO deben mostrar valores numéricos

  # ========================================================================
  # TÉCNICA: ALINEACIÓN DE DATOS EN TABLAS
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-22 - Validar alineación de columnas en tablas
    Cuando visualizo las tres tablas
    Entonces las columnas de tipo texto deben estar alineadas a la izquierda
    Y las columnas de cantidades deben estar alineadas a la derecha
    Y las columnas de montos deben estar alineadas a la derecha
    Y los guiones "-" deben estar centrados

  # ========================================================================
  # TÉCNICA: FORMATO DE MONTOS EN TABLAS
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Esquema del escenario: VIS-23 - Validar formato de montos en todas las columnas de monto
    Dado que visualizo las tablas de métricas
    Cuando observo la columna "<columna_monto>"
    Entonces todos los montos deben tener formato "S/ #,###,###.##"
    Y debe incluir el símbolo "S/" al inicio
    Y debe incluir separador de miles
    Y debe incluir dos decimales obligatorios

    Ejemplos:
      | columna_monto  |
      | Total monto    |
      | PxS monto      |
      | Cápita monto   |
      | CPM monto      |

  # ========================================================================
  # TÉCNICA: SCROLL Y RESPONSIVIDAD
  # ========================================================================

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-24 - Validar scroll vertical en la página
    Dado que la página contiene múltiples secciones
    Cuando hago scroll hacia abajo
    Entonces debo poder visualizar las 3 tablas completas
    Y las tarjetas de métricas deben permanecer visibles o desplazarse según el diseño
    Y el scroll debe ser fluido

  @gestorTA @pxfAmbulatorio @happyPath
  Escenario: VIS-25 - Validar que todas las columnas son visibles sin scroll horizontal
    Cuando visualizo las tablas en una pantalla estándar
    Entonces todas las 9 columnas deben ser visibles sin necesidad de scroll horizontal
    Y las columnas deben ajustarse al ancho disponible
    Y los datos deben ser legibles
