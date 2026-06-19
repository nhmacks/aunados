# language: es

Característica: Filtros en PxF Ambulatorio
  Como Gestor TA
  Quiero filtrar los datos de PxF Ambulatorio
  Para analizar métricas específicas por sede, tipo de atención y garante

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Gestor TA"
    Y he accedido a "PxF Ambulatorio"

  # ========================================================================
  # TÉCNICA: ESTADO INICIAL DE FILTROS
  # ========================================================================

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Escenario: FIL-01 - Visualizar estado inicial de filtros
    Cuando accedo a "PxF Ambulatorio"
    Entonces el filtro "Sede" debe mostrar "Todos"
    Y el filtro "Tipo de atención" debe mostrar "Todos"
    Y el filtro "Garante" debe mostrar "Todos"
    Y el botón "Filtrar" debe estar habilitado
    Y el botón "Limpiar" debe estar habilitado
    Y el toggle "Solo positivos" debe estar desactivado
    Y deben mostrarse todos los datos sin filtrar

  # ========================================================================
  # TÉCNICA: FILTRO POR SEDE
  # ========================================================================

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Escenario: FIL-02 - Abrir dropdown de filtro Sede
    Cuando hago clic en el filtro "Sede"
    Entonces debe desplegarse una lista de sedes
    Y debe mostrarse la opción "Todos" seleccionada por defecto
    Y deben mostrarse todas las sedes disponibles en el sistema

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Esquema del escenario: FIL-03 - Filtrar por sede específica
    Dado que existen datos de múltiples sedes
    Cuando selecciono "<sede>" en el filtro "Sede"
    Y presiono el botón "Filtrar"
    Entonces las tarjetas de métricas deben actualizarse con datos de "<sede>"
    Y la tabla "Protocolo" debe mostrar solo datos de "<sede>"
    Y la tabla "Admisión" debe mostrar solo datos de "<sede>"
    Y la tabla "Facturación" debe mostrar solo datos de "<sede>"

    Ejemplos:
      | sede                |
      | Auna Guardia Civil  |
      | Las Flores          |
      | Bellavista          |
      | Camino Real         |
      | Delgado             |
      | Auna Cañete         |

  # ========================================================================
  # TÉCNICA: FILTRO POR TIPO DE ATENCIÓN
  # ========================================================================

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Escenario: FIL-04 - Abrir dropdown de filtro Tipo de atención
    Cuando hago clic en el filtro "Tipo de atención"
    Entonces debe desplegarse una lista de tipos de atención
    Y debe mostrarse la opción "Todos" seleccionada por defecto
    Y deben mostrarse todos los tipos de atención disponibles

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Esquema del escenario: FIL-05 - Filtrar por tipo de atención específico
    Dado que existen datos de múltiples tipos de atención
    Cuando selecciono "<tipo_atencion>" en el filtro "Tipo de atención"
    Y presiono el botón "Filtrar"
    Entonces las tarjetas de métricas deben actualizarse con datos de "<tipo_atencion>"
    Y las tres tablas deben mostrar solo datos de encuentros tipo "<tipo_atencion>"

    Ejemplos:
      | tipo_atencion     |
      | Consulta Externa  |
      | Emergencia        |
      | Procedimiento     |

  # ========================================================================
  # TÉCNICA: FILTRO POR GARANTE
  # ========================================================================

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Escenario: FIL-06 - Abrir dropdown de filtro Garante
    Cuando hago clic en el filtro "Garante"
    Entonces debe desplegarse una lista de garantes
    Y debe mostrarse la opción "Todos" seleccionada por defecto
    Y deben mostrarse todos los garantes con encuentros ambulatorios

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Esquema del escenario: FIL-07 - Filtrar por garante específico
    Dado que existen datos de múltiples garantes
    Cuando selecciono "<garante>" en el filtro "Garante"
    Y presiono el botón "Filtrar"
    Entonces las tarjetas de métricas deben actualizarse con datos de "<garante>"
    Y las tres tablas deben mostrar solo datos de encuentros del garante "<garante>"

    Ejemplos:
      | garante              |
      | IAFAS PÚBLICAS       |
      | INTERNACIONAL        |
      | LA POSITIVA          |
      | LA PROTECTORA        |
      | MAPFRE SEGUROS       |
      | PACIFICO SEGUROS     |

  # ========================================================================
  # TÉCNICA: COMBINACIÓN DE FILTROS
  # ========================================================================

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Escenario: FIL-08 - Aplicar filtros combinados de Sede y Garante
    Dado que existen datos de múltiples sedes y garantes
    Cuando selecciono "Auna Guardia Civil" en el filtro "Sede"
    Y selecciono "PACIFICO SEGUROS" en el filtro "Garante"
    Y presiono el botón "Filtrar"
    Entonces las métricas deben mostrar solo datos de:
      - Sede: "Auna Guardia Civil"
      - Garante: "PACIFICO SEGUROS"
    Y las tablas deben mostrar solo encuentros que cumplan AMBOS filtros

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Escenario: FIL-09 - Aplicar los tres filtros simultáneamente
    Dado que existen datos con diferentes combinaciones
    Cuando selecciono "Las Flores" en el filtro "Sede"
    Y selecciono "Consulta Externa" en el filtro "Tipo de atención"
    Y selecciono "MAPFRE SEGUROS" en el filtro "Garante"
    Y presiono el botón "Filtrar"
    Entonces las métricas deben mostrar solo datos que cumplan los 3 filtros:
      - Sede: "Las Flores"
      - Tipo de atención: "Consulta Externa"
      - Garante: "MAPFRE SEGUROS"
    Y todas las tablas deben reflejar la combinación de filtros

  # ========================================================================
  # TÉCNICA: BOTÓN LIMPIAR
  # ========================================================================

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Escenario: FIL-10 - Limpiar filtros aplicados
    Dado que he aplicado filtros en "Sede", "Tipo de atención" y "Garante"
    Y he presionado el botón "Filtrar"
    Y las métricas muestran datos filtrados
    Cuando presiono el botón "Limpiar"
    Entonces el filtro "Sede" debe volver a "Todos"
    Y el filtro "Tipo de atención" debe volver a "Todos"
    Y el filtro "Garante" debe volver a "Todos"
    Y las tarjetas de métricas deben mostrar todos los datos sin filtrar
    Y las tablas deben mostrar todos los datos sin filtrar
    Y el toggle "Solo positivos" debe permanecer en su estado actual

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Escenario: FIL-11 - Botón Limpiar restablece estado inicial completo
    Dado que he aplicado múltiples filtros
    Y he activado el toggle "Solo positivos"
    Cuando presiono el botón "Limpiar"
    Entonces todos los filtros deben volver a "Todos"
    Y el toggle "Solo positivos" debe desactivarse
    Y las métricas deben mostrar todos los datos

  # ========================================================================
  # TÉCNICA: TOGGLE "SOLO POSITIVOS"
  # ========================================================================

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Escenario: FIL-12 - Activar toggle "Solo positivos" sin filtros previos
    Dado que NO he aplicado ningún filtro
    Y visualizo todos los datos
    Cuando activo el toggle "Solo positivos"
    Y presiono el botón "Filtrar"
    Entonces las tablas deben mostrar únicamente filas con valores mayores a 0
    Y NO deben mostrarse filas con cantidades = 0
    Y NO deben mostrarse filas con montos = S/ 0.00

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Escenario: FIL-13 - Desactivar toggle "Solo positivos" vuelve a mostrar todos los datos
    Dado que he activado el toggle "Solo positivos"
    Y las tablas muestran solo valores positivos
    Cuando desactivo el toggle "Solo positivos"
    Y presiono el botón "Filtrar"
    Entonces las tablas deben mostrar todas las filas
    Y deben incluirse filas con cantidades = 0
    Y deben incluirse filas con montos = S/ 0.00

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Escenario: FIL-14 - Combinar toggle "Solo positivos" con filtros de Sede
    Dado que he seleccionado "Delgado" en el filtro "Sede"
    Y he activado el toggle "Solo positivos"
    Cuando presiono el botón "Filtrar"
    Entonces las tablas deben mostrar:
      - Solo datos de la sede "Delgado"
      - Solo filas con valores mayores a 0
    Y NO deben mostrarse filas vacías

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Escenario: FIL-15 - Toggle "Solo positivos" afecta todas las tablas
    Dado que he activado el toggle "Solo positivos"
    Cuando presiono el botón "Filtrar"
    Entonces la tabla "Protocolo" debe mostrar solo filas con valores > 0
    Y la tabla "Admisión" debe mostrar solo filas con valores > 0
    Y la tabla "Facturación" debe mostrar solo filas con valores > 0
    Y las filas "Totales" siempre deben mostrarse

  # ========================================================================
  # TÉCNICA: ACTUALIZACIÓN DE TARJETAS AL FILTRAR
  # ========================================================================

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Escenario: FIL-16 - Las tarjetas de métricas se actualizan al aplicar filtros
    Dado que las tarjetas muestran los siguientes valores iniciales:
      | Tarjeta       | Monto             | Cantidad |
      | Total PxS     | S/ 32,624,330.16  | 196355   |
      | Total Cápita  | S/ 1,854,007.83   | 2559     |
      | Total CPM     | S/ 889,289.63     | 2651     |
    Cuando aplico un filtro por "Sede" = "Auna Guardia Civil"
    Y presiono el botón "Filtrar"
    Entonces las tarjetas deben mostrar montos y cantidades recalculados
    Y los nuevos valores deben ser menores o iguales a los valores iniciales
    Y la suma de las tres tarjetas debe coincidir con los totales de las tablas filtradas

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Escenario: FIL-17 - Tarjetas vuelven a valores originales al limpiar filtros
    Dado que he aplicado filtros
    Y las tarjetas muestran valores filtrados
    Cuando presiono el botón "Limpiar"
    Entonces las tarjetas deben volver a mostrar:
      | Tarjeta       | Monto             | Cantidad |
      | Total PxS     | S/ 32,624,330.16  | 196355   |
      | Total Cápita  | S/ 1,854,007.83   | 2559     |
      | Total CPM     | S/ 889,289.63     | 2651     |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE BOTÓN FILTRAR
  # ========================================================================

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Escenario: FIL-18 - Botón Filtrar aplica cambios solo al ser presionado
    Dado que he seleccionado "Bellavista" en el filtro "Sede"
    Y NO he presionado el botón "Filtrar"
    Cuando visualizo las métricas y tablas
    Entonces deben mostrarse todos los datos sin filtrar
    Y las métricas NO deben reflejar el filtro de Sede aún
    Cuando presiono el botón "Filtrar"
    Entonces las métricas y tablas deben actualizarse con datos de "Bellavista"

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Escenario: FIL-19 - Modificar filtros después de aplicar filtro previo
    Dado que he filtrado por "Sede" = "Camino Real"
    Y he presionado "Filtrar"
    Y las métricas muestran datos de "Camino Real"
    Cuando cambio el filtro "Sede" a "Delgado"
    Y presiono nuevamente "Filtrar"
    Entonces las métricas deben actualizarse con datos de "Delgado"
    Y NO deben mostrarse datos de "Camino Real"

  # ========================================================================
  # TÉCNICA: FILTROS SIN RESULTADOS
  # ========================================================================

  @prioridadAlta @gestorTA @pxfAmbulatorio @unhappyPath
  Escenario: FIL-20 - Aplicar filtros que no retornan resultados
    Dado que selecciono una combinación de filtros sin datos
    Cuando presiono el botón "Filtrar"
    Entonces las tarjetas de métricas deben mostrar:
      | Tarjeta       | Monto    | Cantidad |
      | Total PxS     | S/ 0.00  | 0        |
      | Total Cápita  | S/ 0.00  | 0        |
      | Total CPM     | S/ 0.00  | 0        |
    Y las tablas deben mostrar solo las filas "Totales" con valores en 0
    Y debe mostrarse un mensaje "No se encontraron resultados para los filtros aplicados"

  # ========================================================================
  # TÉCNICA: PERSISTENCIA DE FILTROS
  # ========================================================================

  @prioridadAlta @gestorTA @pxfAmbulatorio @happyPath
  Escenario: FIL-21 - Los filtros se mantienen al hacer scroll
    Dado que he aplicado filtros por "Sede" y "Garante"
    Y he presionado "Filtrar"
    Cuando hago scroll hacia abajo en la página
    Entonces los filtros deben permanecer visibles y activos
    Y las métricas deben seguir mostrando datos filtrados

  @prioridadAlta @gestorTA @pxfAmbulatorio @unhappyPath
  Escenario: FIL-22 - Los filtros NO persisten al recargar la página
    Dado que he aplicado filtros múltiples
    Y he presionado "Filtrar"
    Cuando refresco la página del navegador
    Entonces todos los filtros deben volver a "Todos"
    Y el toggle "Solo positivos" debe estar desactivado
    Y deben mostrarse todos los datos sin filtrar
