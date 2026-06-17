# language: es

Característica: Filtros en Cuadro de Control Admisión
  Como Superusuario de Admisión o Gestor TA
  Quiero filtrar los datos del cuadro de control
  Para analizar métricas específicas por sede, prioridad, tipo de atención, ejecutivo y garante

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y he accedido a "Cuadro de control Admisión"

  # ========================================================================
  # TÉCNICA: ESTADO INICIAL DE FILTROS
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-01 - Visualizar estado inicial de filtros
    Dado que soy un usuario con rol "<rol>"
    Cuando accedo a "Cuadro de control Admisión"
    Entonces el filtro "Sede" debe mostrar "Todos"
    Y el filtro "Prioridad" debe mostrar "Todos"
    Y el filtro "Tipo de atención" debe mostrar "Todos"
    Y el filtro "Ejecutivo" debe mostrar "Todos"
    Y el filtro "Garante" debe mostrar "Todos"
    Y el botón "Filtrar" debe estar habilitado
    Y el botón "Limpiar" debe estar habilitado
    Y el toggle "Solo positivos" debe estar desactivado
    Y deben mostrarse todos los datos sin filtrar

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: FILTRO POR SEDE
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-02 - Filtrar por sede específica
    Dado que soy un usuario con rol "<rol>"
    Y existen datos de múltiples sedes
    Cuando selecciono "<sede>" en el filtro "Sede"
    Y presiono el botón "Filtrar"
    Entonces las tarjetas de métricas deben actualizarse con datos de "<sede>"
    Y la tabla "Total por ejecutivo" debe mostrar solo ejecutivos de "<sede>"
    Y las demás tablas deben mostrar solo datos de encuentros de "<sede>"

    Ejemplos:
      | rol                        | sede                |
      | Superusuario de Admisión   | Auna Guardia Civil  |
      | Gestor TA                  | Las Flores          |
      | Superusuario de Admisión   | Bellavista          |
      | Gestor TA                  | Delgado             |

  # ========================================================================
  # TÉCNICA: FILTRO POR PRIORIDAD
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-03 - Filtrar por prioridad específica
    Dado que soy un usuario con rol "<rol>"
    Y existen encuentros con diferentes prioridades
    Cuando selecciono "<prioridad>" en el filtro "Prioridad"
    Y presiono el botón "Filtrar"
    Entonces las métricas deben mostrar solo datos de encuentros con prioridad "<prioridad>"
    Y todas las tablas deben reflejar el filtro de prioridad

    Ejemplos:
      | rol                        | prioridad |
      | Superusuario de Admisión   | Alta      |
      | Gestor TA                  | Media     |
      | Superusuario de Admisión   | Baja      |

  # ========================================================================
  # TÉCNICA: FILTRO POR TIPO DE ATENCIÓN
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-04 - Filtrar por tipo de atención
    Dado que soy un usuario con rol "<rol>"
    Y existen encuentros de múltiples tipos de atención
    Cuando selecciono "<tipo_atencion>" en el filtro "Tipo de atención"
    Y presiono el botón "Filtrar"
    Entonces las tarjetas deben mostrar solo datos de tipo "<tipo_atencion>"
    Y las tablas deben mostrar solo encuentros tipo "<tipo_atencion>"

    Ejemplos:
      | rol                        | tipo_atencion     |
      | Superusuario de Admisión   | Consulta Externa  |
      | Gestor TA                  | Emergencia        |
      | Superusuario de Admisión   | Procedimiento     |

  # ========================================================================
  # TÉCNICA: FILTRO POR EJECUTIVO
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-05 - Filtrar por ejecutivo de admisión
    Dado que soy un usuario con rol "<rol>"
    Y existen múltiples ejecutivos de admisión
    Cuando selecciono "<ejecutivo>" en el filtro "Ejecutivo"
    Y presiono el botón "Filtrar"
    Entonces la tabla "Total por ejecutivo" debe mostrar solo la fila de "<ejecutivo>"
    Y las tarjetas deben mostrar datos solo de "<ejecutivo>"
    Y las demás tablas deben mostrar solo encuentros asignados a "<ejecutivo>"

    Ejemplos:
      | rol                        | ejecutivo                |
      | Superusuario de Admisión   | Abigail Bisquert Luz I   |
      | Gestor TA                  | Abigail Yoselyn Si...    |
      | Superusuario de Admisión   | Adriana Castellar...     |

  # ========================================================================
  # TÉCNICA: FILTRO POR GARANTE
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-06 - Filtrar por garante específico
    Dado que soy un usuario con rol "<rol>"
    Y existen encuentros de múltiples garantes
    Cuando selecciono "<garante>" en el filtro "Garante"
    Y presiono el botón "Filtrar"
    Entonces las métricas deben mostrar solo datos del garante "<garante>"
    Y las tablas deben mostrar solo encuentros del garante "<garante>"

    Ejemplos:
      | rol                        | garante              |
      | Superusuario de Admisión   | IAFAS PÚBLICAS       |
      | Gestor TA                  | PACIFICO SEGUROS     |
      | Superusuario de Admisión   | MAPFRE SEGUROS       |

  # ========================================================================
  # TÉCNICA: COMBINACIÓN DE FILTROS
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-07 - Aplicar filtros combinados
    Dado que soy un usuario con rol "<rol>"
    Y existen datos con diferentes combinaciones
    Cuando selecciono "Auna Guardia Civil" en el filtro "Sede"
    Y selecciono "Alta" en el filtro "Prioridad"
    Y selecciono "PACIFICO SEGUROS" en el filtro "Garante"
    Y presiono el botón "Filtrar"
    Entonces las métricas deben mostrar solo datos que cumplan los 3 filtros:
      - Sede: "Auna Guardia Civil"
      - Prioridad: "Alta"
      - Garante: "PACIFICO SEGUROS"
    Y todas las tablas deben reflejar la combinación de filtros

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-08 - Aplicar los cinco filtros simultáneamente
    Dado que soy un usuario con rol "<rol>"
    Cuando selecciono valores específicos en los 5 filtros
    Y presiono el botón "Filtrar"
    Entonces las métricas deben mostrar solo datos que cumplan TODOS los filtros
    Y todas las tablas deben reflejar la combinación completa

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: BOTÓN LIMPIAR
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-09 - Limpiar filtros aplicados
    Dado que soy un usuario con rol "<rol>"
    Y he aplicado filtros en "Sede", "Prioridad" y "Garante"
    Y he presionado el botón "Filtrar"
    Y las métricas muestran datos filtrados
    Cuando presiono el botón "Limpiar"
    Entonces todos los filtros deben volver a "Todos"
    Y las tarjetas de métricas deben mostrar todos los datos sin filtrar
    Y las tablas deben mostrar todos los datos sin filtrar
    Y el toggle "Solo positivos" debe permanecer en su estado actual

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: TOGGLE "SOLO POSITIVOS"
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-10 - Activar toggle Solo positivos
    Dado que soy un usuario con rol "<rol>"
    Y NO he aplicado ningún filtro
    Cuando activo el toggle "Solo positivos"
    Y presiono el botón "Filtrar"
    Entonces las tablas deben mostrar únicamente filas con valores mayores a 0
    Y NO deben mostrarse filas con cantidades = 0
    Y NO deben mostrarse filas con montos = S/ 0.00
    Y las filas "Totales" siempre deben mostrarse

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-11 - Desactivar toggle Solo positivos
    Dado que soy un usuario con rol "<rol>"
    Y he activado el toggle "Solo positivos"
    Y las tablas muestran solo valores positivos
    Cuando desactivo el toggle "Solo positivos"
    Y presiono el botón "Filtrar"
    Entonces las tablas deben mostrar todas las filas
    Y deben incluirse filas con cantidades = 0
    Y deben incluirse filas con montos = S/ 0.00

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-12 - Combinar toggle Solo positivos con filtros
    Dado que soy un usuario con rol "<rol>"
    Y he seleccionado "Bellavista" en el filtro "Sede"
    Y he activado el toggle "Solo positivos"
    Cuando presiono el botón "Filtrar"
    Entonces las tablas deben mostrar:
      - Solo datos de la sede "Bellavista"
      - Solo filas con valores mayores a 0
    Y NO deben mostrarse filas vacías

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: ACTUALIZACIÓN DE TARJETAS AL FILTRAR
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-13 - Las tarjetas se actualizan al aplicar filtros
    Dado que soy un usuario con rol "<rol>"
    Y las tarjetas muestran valores iniciales sin filtrar
    Cuando aplico un filtro por "Sede" = "Delgado"
    Y presiono el botón "Filtrar"
    Entonces las tarjetas deben mostrar montos y cantidades recalculados
    Y los nuevos valores deben ser menores o iguales a los valores iniciales
    Y la suma de las tarjetas debe coincidir con los totales de las tablas filtradas

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-14 - Tarjetas vuelven a valores originales al limpiar
    Dado que soy un usuario con rol "<rol>"
    Y he aplicado filtros
    Y las tarjetas muestran valores filtrados
    Cuando presiono el botón "Limpiar"
    Entonces las tarjetas deben volver a mostrar los valores completos sin filtrar

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE BOTÓN FILTRAR
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-15 - Botón Filtrar aplica cambios solo al ser presionado
    Dado que soy un usuario con rol "<rol>"
    Y he seleccionado "Camino Real" en el filtro "Sede"
    Y NO he presionado el botón "Filtrar"
    Cuando visualizo las métricas y tablas
    Entonces deben mostrarse todos los datos sin filtrar
    Y las métricas NO deben reflejar el filtro de Sede aún
    Cuando presiono el botón "Filtrar"
    Entonces las métricas y tablas deben actualizarse con datos de "Camino Real"

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: FILTROS SIN RESULTADOS
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @unhappyPath
  Esquema del escenario: FIL-16 - Aplicar filtros que no retornan resultados
    Dado que soy un usuario con rol "<rol>"
    Y selecciono una combinación de filtros sin datos
    Cuando presiono el botón "Filtrar"
    Entonces las tarjetas de métricas deben mostrar valores en 0
    Y las tablas deben mostrar solo las filas "Totales" con valores en 0
    Y debe mostrarse un mensaje "No se encontraron resultados para los filtros aplicados"

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  # ========================================================================
  # TÉCNICA: PERSISTENCIA DE FILTROS
  # ========================================================================

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-17 - Los filtros se mantienen al hacer scroll
    Dado que soy un usuario con rol "<rol>"
    Y he aplicado filtros por "Sede" y "Garante"
    Y he presionado "Filtrar"
    Cuando hago scroll hacia abajo en la página
    Entonces los filtros deben permanecer visibles y activos
    Y las métricas deben seguir mostrando datos filtrados

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |

  @superusuarioAdmision @gestorTA @cuadroControlAdmision @unhappyPath
  Esquema del escenario: FIL-18 - Los filtros NO persisten al recargar la página
    Dado que soy un usuario con rol "<rol>"
    Y he aplicado filtros múltiples
    Y he presionado "Filtrar"
    Cuando refresco la página del navegador
    Entonces todos los filtros deben volver a "Todos"
    Y el toggle "Solo positivos" debe estar desactivado
    Y deben mostrarse todos los datos sin filtrar

    Ejemplos:
      | rol                        |
      | Superusuario de Admisión   |
      | Gestor TA                  |
