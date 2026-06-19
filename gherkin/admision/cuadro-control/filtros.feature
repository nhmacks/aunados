# language: es

Característica: Filtros en Cuadro de Control Admisión
  Como Superusuario de Admisión o Gestor TA
  Quiero filtrar los datos del Cuadro de Control
  Para analizar métricas específicas por sede, prioridad, tipo de atención, ejecutivo y garante

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y he accedido a "Cuadro de control Admisión"

  # ========================================================================
  # TÉCNICA: ESTADO INICIAL DE FILTROS
  # ========================================================================

  @prioridadAlta @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-01 - Visualizar estado inicial de filtros
    Dado que soy un usuario con rol "<rol>"
    Cuando accedo a "Cuadro de control Admisión"
    Entonces todos los filtros deben mostrar "Todos" por defecto
    Y el botón "Filtrar" debe estar habilitado
    Y el botón "Limpiar" debe estar habilitado
    Y el toggle "Solo positivos" debe estar desactivado
    Y deben mostrarse todos los datos sin filtrar

    Ejemplos:
      | rol                      |
      | Superusuario de Admisión |
      | Gestor TA                |

  # ========================================================================
  # TÉCNICA: FILTRADO POR CAMPO ESPECÍFICO
  # CONSOLIDACIÓN: FIL-02, FIL-03, FIL-04, FIL-05, FIL-06 → FIL-02
  # ========================================================================

  @prioridadAlta @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-02 - Filtrar por campo específico
    Dado que soy un usuario con rol "<rol>"
    Y existen datos de múltiples <tipo_dato>
    Cuando selecciono "<valor>" en el filtro "<filtro>"
    Y presiono el botón "Filtrar"
    Entonces las tarjetas de métricas deben actualizarse con datos filtrados por "<valor>"
    Y la tabla "Total por ejecutivo" debe mostrar solo datos de "<valor>"
    Y las tres tablas restantes deben mostrar solo datos de "<valor>"

    Ejemplos:
      | rol                      | filtro           | tipo_dato        | valor                     |
      | Superusuario de Admisión | Sede             | sedes            | Auna Guardia Civil        |
      | Gestor TA                | Sede             | sedes            | Las Flores                |
      | Superusuario de Admisión | Prioridad        | prioridades      | Alta                      |
      | Gestor TA                | Prioridad        | prioridades      | Baja                      |
      | Superusuario de Admisión | Tipo de atención | tipos atención   | Consulta Externa          |
      | Gestor TA                | Tipo de atención | tipos atención   | Emergencia                |
      | Superusuario de Admisión | Ejecutivo        | ejecutivos       | Abigail Bisquert Luz I    |
      | Gestor TA                | Ejecutivo        | ejecutivos       | Adriana Castellar...      |
      | Superusuario de Admisión | Garante          | garantes         | PACIFICO SEGUROS          |
      | Gestor TA                | Garante          | garantes         | MAPFRE SEGUROS            |

  # ========================================================================
  # TÉCNICA: COMBINACIÓN DE FILTROS
  # ========================================================================

  @prioridadAlta @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-03 - Aplicar filtros combinados
    Dado que soy un usuario con rol "<rol>"
    Y existen datos con diferentes combinaciones
    Cuando selecciono "<valor1>" en el filtro "<filtro1>"
    Y selecciono "<valor2>" en el filtro "<filtro2>"
    Y presiono el botón "Filtrar"
    Entonces las métricas deben mostrar solo datos que cumplan AMBOS filtros
    Y todas las tablas deben reflejar la combinación de filtros

    Ejemplos:
      | rol                      | filtro1    | valor1             | filtro2 | valor2          |
      | Superusuario de Admisión | Sede       | Auna Guardia Civil | Garante | PACIFICO SEGUROS|
      | Gestor TA                | Prioridad  | Alta               | Sede    | Las Flores      |

  # ========================================================================
  # TÉCNICA: BOTÓN LIMPIAR
  # ========================================================================

  @prioridadAlta @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-04 - Limpiar filtros aplicados
    Dado que soy un usuario con rol "<rol>"
    Y he aplicado filtros múltiples
    Y he presionado el botón "Filtrar"
    Y las métricas muestran datos filtrados
    Cuando presiono el botón "Limpiar"
    Entonces todos los filtros deben volver a "Todos"
    Y el toggle "Solo positivos" debe desactivarse
    Y las tarjetas de métricas deben mostrar todos los datos sin filtrar
    Y las tablas deben mostrar todos los datos sin filtrar

    Ejemplos:
      | rol                      |
      | Superusuario de Admisión |
      | Gestor TA                |

  # ========================================================================
  # TÉCNICA: TOGGLE "SOLO POSITIVOS"
  # CONSOLIDACIÓN: FIL-10, FIL-11 → FIL-05
  # ========================================================================

  @prioridadAlta @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-05 - Toggle Solo positivos filtra valores mayores a cero
    Dado que soy un usuario con rol "<rol>"
    Y visualizo todos los datos
    Cuando <accion> el toggle "Solo positivos"
    Y presiono el botón "Filtrar"
    Entonces las tablas deben mostrar <resultado_esperado>

    Ejemplos:
      | rol                      | accion     | resultado_esperado                              |
      | Superusuario de Admisión | activo     | únicamente filas con valores mayores a 0        |
      | Gestor TA                | activo     | únicamente filas con valores mayores a 0        |
      | Superusuario de Admisión | desactivo  | todas las filas (incluyendo valores = 0)        |
      | Gestor TA                | desactivo  | todas las filas (incluyendo valores = 0)        |

  @prioridadAlta @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-06 - Combinar toggle Solo positivos con filtros
    Dado que soy un usuario con rol "<rol>"
    Y he seleccionado "<filtro>" en el filtro "<campo>"
    Y he activado el toggle "Solo positivos"
    Cuando presiono el botón "Filtrar"
    Entonces las tablas deben mostrar:
      - Solo datos del filtro "<filtro>"
      - Solo filas con valores mayores a 0
    Y NO deben mostrarse filas vacías

    Ejemplos:
      | rol                      | campo | filtro             |
      | Superusuario de Admisión | Sede  | Auna Guardia Civil |
      | Gestor TA                | Sede  | Las Flores         |

  # ========================================================================
  # TÉCNICA: ACTUALIZACIÓN DE TARJETAS AL FILTRAR
  # CONSOLIDACIÓN: FIL-13, FIL-14 → FIL-07
  # ========================================================================

  @prioridadAlta @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-07 - Tarjetas se actualizan según acción
    Dado que soy un usuario con rol "<rol>"
    Y las tarjetas muestran valores iniciales
    Cuando <accion_filtro>
    Entonces las tarjetas deben <comportamiento_esperado>
    Y la suma de las tarjetas debe coincidir con los totales de las tablas

    Ejemplos:
      | rol                      | accion_filtro                                    | comportamiento_esperado           |
      | Superusuario de Admisión | aplico filtro "Sede" = "Auna Guardia Civil"     | mostrar valores recalculados      |
      | Gestor TA                | aplico filtro "Sede" = "Las Flores"             | mostrar valores recalculados      |
      | Superusuario de Admisión | presiono el botón "Limpiar"                      | volver a valores originales       |
      | Gestor TA                | presiono el botón "Limpiar"                      | volver a valores originales       |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE BOTÓN FILTRAR
  # ========================================================================

  @prioridadAlta @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-08 - Botón Filtrar aplica cambios solo al ser presionado
    Dado que soy un usuario con rol "<rol>"
    Y he seleccionado "Bellavista" en el filtro "Sede"
    Y NO he presionado el botón "Filtrar"
    Cuando visualizo las métricas y tablas
    Entonces deben mostrarse todos los datos sin filtrar
    Y las métricas NO deben reflejar el filtro de Sede aún
    Cuando presiono el botón "Filtrar"
    Entonces las métricas y tablas deben actualizarse con datos de "Bellavista"

    Ejemplos:
      | rol                      |
      | Superusuario de Admisión |
      | Gestor TA                |

  # ========================================================================
  # TÉCNICA: FILTROS SIN RESULTADOS
  # ========================================================================

  @prioridadAlta @superusuarioAdmision @gestorTA @cuadroControlAdmision @unhappyPath
  Esquema del escenario: FIL-09 - Aplicar filtros que no retornan resultados
    Dado que soy un usuario con rol "<rol>"
    Y selecciono una combinación de filtros sin datos
    Cuando presiono el botón "Filtrar"
    Entonces las tarjetas de métricas deben mostrar valores en cero
    Y las tablas deben mostrar solo las filas "Totales" con valores en 0
    Y debe mostrarse un mensaje "No se encontraron resultados para los filtros aplicados"

    Ejemplos:
      | rol                      |
      | Superusuario de Admisión |
      | Gestor TA                |

  # ========================================================================
  # TÉCNICA: PERSISTENCIA DE FILTROS
  # CONSOLIDACIÓN: FIL-17, FIL-18 → FIL-10
  # ========================================================================

  @prioridadAlta @superusuarioAdmision @gestorTA @cuadroControlAdmision @happyPath
  Esquema del escenario: FIL-10 - Validar persistencia de filtros según acción
    Dado que soy un usuario con rol "<rol>"
    Y he aplicado filtros múltiples
    Y he presionado "Filtrar"
    Cuando <accion>
    Entonces los filtros <comportamiento_persistencia>

    Ejemplos:
      | rol                      | accion                        | comportamiento_persistencia                     |
      | Superusuario de Admisión | hago scroll hacia abajo       | deben permanecer visibles y activos             |
      | Gestor TA                | hago scroll hacia abajo       | deben permanecer visibles y activos             |
      | Superusuario de Admisión | refresco la página            | deben volver a "Todos" (NO persisten)           |
      | Gestor TA                | refresco la página            | deben volver a "Todos" (NO persisten)           |

# ========================================================================
# RESULTADO DE OPTIMIZACIÓN:
#
# ANTES:  18 escenarios, 0 BVA (filtros textuales), 4 grupos redundantes
# DESPUÉS: 10 escenarios, 0 redundancias
# AHORRO: -44% escenarios (misma cobertura)
#
# CONSOLIDACIONES REALIZADAS:
# 1. FIL-02/03/04/05/06 → FIL-02 (filtrar por campo con múltiples ejemplos)
# 2. FIL-10/11 → FIL-05 (toggle con parámetro acción)
# 3. FIL-13/14 → FIL-07 (actualización de tarjetas)
# 4. FIL-17/18 → FIL-10 (persistencia con parámetro acción)
# 5. FIL-08 → FIL-03 (combinación de filtros)
# 6. FIL-14 → FIL-06 (toggle + filtros)
# 7. FIL-15 → FIL-05 (toggle afecta todas las tablas)
# 8. FIL-16 → FIL-07 (tarjetas se actualizan)
# ========================================================================
