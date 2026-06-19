# language: es

Característica: Búsqueda y Filtros en Pendientes por Facturar
  Como Ejecutivo de Facturación
  Quiero buscar y filtrar mis encuentros asignados
  Para encontrar rápidamente los encuentros que necesito procesar

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Facturación"
    Y he accedido a "Pendientes por Facturar"

  # ========================================================================
  # TÉCNICA: BÚSQUEDA POR DIFERENTES CRITERIOS
  # Cobertura: Sección 7.1 del documento 21-Pendientes-Facturar.md
  # ========================================================================

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: BUS-01 - Buscar encuentro por nombre del paciente
    Dado que tengo encuentros asignados
    Y existe un encuentro del paciente "Juan Carlos García"
    Cuando ingreso "Juan Carlos" en la caja de búsqueda
    Entonces debe mostrarse únicamente los encuentros del paciente "Juan Carlos García"
    Y el contador debe actualizarse con la cantidad de resultados

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: BUS-02 - Buscar encuentro por apellido del paciente
    Dado que tengo encuentros asignados
    Y existe un encuentro del paciente con apellido "García Pérez"
    Cuando ingreso "García" en la caja de búsqueda
    Entonces debe mostrarse únicamente los encuentros que coincidan con "García" en apellidos
    Y el contador debe actualizarse con la cantidad de resultados

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: BUS-03 - Buscar encuentro por número de encuentro
    Dado que tengo el encuentro "12345678" asignado
    Cuando ingreso "12345678" en la caja de búsqueda
    Entonces debe mostrarse únicamente el encuentro "12345678"
    Y el contador debe mostrar "1 encuentro encontrado"

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: BUS-04 - Buscar encuentro por NHC
    Dado que tengo encuentros asignados
    Y existe un encuentro del paciente con NHC "987654"
    Cuando ingreso "987654" en la caja de búsqueda
    Entonces debe mostrarse únicamente encuentros del paciente con NHC "987654"

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: BUS-05 - Limpiar búsqueda con botón Restablecer vista
    Dado que he realizado una búsqueda por "García"
    Y el sistema muestra resultados filtrados
    Cuando selecciono el botón "Restablecer vista"
    Entonces la caja de búsqueda debe limpiarse
    Y debe mostrarse todos mis encuentros asignados
    Y el contador debe mostrar la cantidad total de mis encuentros

  # ========================================================================
  # TÉCNICA: FILTROS DISPONIBLES
  # Cobertura: Sección 7.2 del documento 21-Pendientes-Facturar.md
  # ========================================================================

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Esquema del escenario: FIL-01 - Filtrar encuentros por estado de facturación
    Dado que tengo encuentros asignados en diferentes estados
    Cuando aplico el filtro "Estado" con valor "<estado>"
    Entonces debe mostrarse únicamente encuentros en estado "<estado>"
    Y el contador debe actualizarse

    Ejemplos:
      | estado                  |
      | Asignado                |
      | En Proceso              |
      | Pendiente de Validación |
      | Observado               |

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: FIL-02 - Filtrar encuentros por fecha de apertura
    Dado que tengo encuentros asignados
    Cuando aplico el filtro "Fecha de apertura" desde "01/01/2024" hasta "31/01/2024"
    Entonces debe mostrarse únicamente encuentros abiertos en ese rango de fechas
    Y el contador debe actualizarse

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: FIL-03 - Filtrar encuentros por fecha de asignación
    Dado que tengo encuentros asignados en diferentes fechas
    Cuando aplico el filtro "Fecha de asignación" desde "01/06/2024" hasta "30/06/2024"
    Entonces debe mostrarse únicamente encuentros asignados en ese rango
    Y el contador debe actualizarse

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Esquema del escenario: FIL-04 - Filtrar encuentros por prioridad
    Dado que tengo encuentros asignados con diferentes prioridades
    Cuando aplico el filtro "Prioridad" con valor "<prioridad>"
    Entonces debe mostrarse únicamente encuentros con prioridad "<prioridad>"

    Ejemplos:
      | prioridad |
      | Alta      |
      | Media     |
      | Baja      |

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: FIL-05 - Filtrar encuentros por garante
    Dado que tengo encuentros asignados de diferentes garantes
    Cuando aplico el filtro "Garante" con valor "Pacífico Seguros"
    Entonces debe mostrarse únicamente encuentros del garante "Pacífico Seguros"

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: FIL-06 - Filtrar encuentros por tipo de encuentro
    Dado que tengo encuentros asignados de diferentes tipos
    Cuando aplico el filtro "Tipo de encuentro" con valor "Consulta Externa"
    Entonces debe mostrarse únicamente encuentros tipo "Consulta Externa"

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: FIL-07 - Filtrar encuentros por sede
    Dado que tengo encuentros asignados de diferentes sedes
    Cuando aplico el filtro "Sede" con valor "Auna Guardia Civil"
    Entonces debe mostrarse únicamente encuentros de la sede "Auna Guardia Civil"

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: FIL-08 - Filtrar encuentros por rango de monto
    Dado que tengo encuentros asignados con diferentes montos
    Cuando aplico el filtro "Monto" desde "1000" hasta "5000"
    Entonces debe mostrarse únicamente encuentros con monto entre S/ 1,000 y S/ 5,000

  # ========================================================================
  # TÉCNICA: COMBINACIÓN DE FILTROS
  # ========================================================================

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: FIL-09 - Aplicar múltiples filtros simultáneamente
    Dado que tengo encuentros asignados
    Cuando aplico el filtro "Estado" con valor "En Proceso"
    Y aplico el filtro "Prioridad" con valor "Alta"
    Y aplico el filtro "Garante" con valor "Pacífico Seguros"
    Entonces debe mostrarse únicamente encuentros que cumplan TODOS los filtros
    Y el contador debe mostrar la cantidad correcta

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: FIL-10 - Limpiar todos los filtros con Restablecer vista
    Dado que he aplicado múltiples filtros
    Y el sistema muestra 15 encuentros filtrados
    Cuando selecciono "Restablecer vista"
    Entonces todos los filtros deben limpiarse
    Y debe mostrarse todos mis encuentros asignados
    Y el contador debe mostrar el total sin filtros

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO
  # Cobertura: Sección 7.3 del documento 21-Pendientes-Facturar.md
  # ========================================================================

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Esquema del escenario: ORD-01 - Ordenar encuentros por diferentes criterios
    Dado que tengo encuentros asignados
    Cuando selecciono ordenar por "<criterio>" en forma "<direccion>"
    Entonces los encuentros deben ordenarse por "<criterio>" en forma "<direccion>"

    Ejemplos:
      | criterio             | direccion   |
      | Fecha de asignación  | Ascendente  |
      | Fecha de asignación  | Descendente |
      | Fecha de apertura    | Ascendente  |
      | Fecha de apertura    | Descendente |
      | Número de encuentro  | Ascendente  |
      | Número de encuentro  | Descendente |
      | Prioridad            | Ascendente  |
      | Prioridad            | Descendente |
      | Monto                | Ascendente  |
      | Monto                | Descendente |

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: ORD-02 - Ordenar encuentros alfabéticamente por paciente
    Dado que tengo encuentros asignados de diferentes pacientes
    Cuando selecciono ordenar por "Paciente" en forma "Ascendente"
    Entonces los encuentros deben ordenarse alfabéticamente por apellido del paciente

  @prioridadMedia @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: ORD-03 - Mantener ordenamiento después de aplicar filtros
    Dado que he ordenado los encuentros por "Fecha de asignación" descendente
    Cuando aplico un filtro de "Prioridad" = "Alta"
    Entonces los encuentros filtrados deben mantener el ordenamiento por "Fecha de asignación" descendente
