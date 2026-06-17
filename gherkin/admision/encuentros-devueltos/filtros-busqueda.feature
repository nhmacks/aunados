# language: es

Característica: Búsqueda y Filtros en Encuentros Devueltos
  Como Ejecutivo de Admisión
  Quiero buscar y filtrar encuentros devueltos
  Para encontrar rápidamente los encuentros que necesito subsanar

  # ========================================================================
  # TÉCNICA: BÚSQUEDA POR DIFERENTES CRITERIOS
  # Cobertura: Sección 6.1 del documento 18-Encuentros-Devueltos.md
  # ========================================================================

  @ejecutivoAdmision @gestorTA @superusuarioAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: BUS-00 - Validar placeholder de caja de búsqueda
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Cuando accedo a la bandeja "Encuentros Devueltos"
    Entonces la caja de búsqueda debe mostrar el placeholder "Buscar por nombre, apellido o nro de encuentro"

    Ejemplos:
      | rol                      |
      | Ejecutivo de Admisión    |
      | Gestor TA                |
      | Superusuario de Admisión |

  @ejecutivoAdmision @gestorTA @superusuarioAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: BUS-01 - Buscar encuentro devuelto por nombre del paciente
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Y tengo encuentros devueltos
    Y existe un encuentro del paciente "Juan Carlos García"
    Cuando ingreso "Juan Carlos" en la caja de búsqueda
    Entonces debe mostrarse únicamente los encuentros del paciente "Juan Carlos García"
    Y el contador debe actualizarse con la cantidad de resultados

    Ejemplos:
      | rol                      |
      | Ejecutivo de Admisión    |
      | Gestor TA                |
      | Superusuario de Admisión |

  @ejecutivoAdmision @gestorTA @superusuarioAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: BUS-02 - Buscar encuentro devuelto por apellido del paciente
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Y tengo encuentros devueltos
    Y existe un encuentro del paciente con apellido "García Pérez"
    Cuando ingreso "García" en la caja de búsqueda
    Entonces debe mostrarse únicamente los encuentros que coincidan con "García" en apellidos

    Ejemplos:
      | rol                      |
      | Ejecutivo de Admisión    |
      | Gestor TA                |
      | Superusuario de Admisión |

  @ejecutivoAdmision @gestorTA @superusuarioAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: BUS-03 - Buscar encuentro devuelto por número de encuentro
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Y tengo el encuentro devuelto "12345678"
    Cuando ingreso "12345678" en la caja de búsqueda
    Entonces debe mostrarse únicamente el encuentro "12345678"

    Ejemplos:
      | rol                      |
      | Ejecutivo de Admisión    |
      | Gestor TA                |
      | Superusuario de Admisión |

  # ========================================================================
  # TÉCNICA: FILTROS DISPONIBLES
  # Cobertura: Sección 6.2 del documento 18-Encuentros-Devueltos.md
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-01 - Filtrar encuentros por fecha de devolución
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y tengo encuentros devueltos en diferentes fechas
    Cuando aplico el filtro "Fecha de Devolución" desde "01/06/2024" hasta "30/06/2024"
    Entonces debe mostrarse únicamente encuentros devueltos en ese rango de fechas
    Y el contador debe actualizarse

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: FIL-02 - Filtrar encuentros por motivo de devolución
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y tengo encuentros devueltos por diferentes motivos
    Cuando aplico el filtro "Motivo de Devolución" con valor "<motivo>"
    Entonces debe mostrarse únicamente encuentros con motivo "<motivo>"

    Ejemplos:
      | motivo                              |
      | Falta documentación administrativa  |
      | Error en datos del seguro           |
      | Cobertura insuficiente              |
      | Falta autorización de garante       |
      | Información de paciente incompleta  |

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: FIL-03 - Filtrar encuentros por estado
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y tengo encuentros devueltos en diferentes estados
    Cuando aplico el filtro "Estado" con valor "<estado>"
    Entonces debe mostrarse únicamente encuentros en estado "<estado>"

    Ejemplos:
      | estado                         |
      | Devuelto                       |
      | No facturable                  |
      | Error de facturación           |
      | Regularizado                   |
      | Derivado a Supervisor          |
      | Derivado a Dirección Médica    |

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: FIL-04 - Filtrar encuentros por prioridad
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y tengo encuentros devueltos con diferentes prioridades
    Cuando aplico el filtro "Prioridad" con valor "<prioridad>"
    Entonces debe mostrarse únicamente encuentros con prioridad "<prioridad>"

    Ejemplos:
      | prioridad |
      | Alta      |
      | Media     |
      | Baja      |

  # ========================================================================
  # TÉCNICA: FILTROS EXCLUSIVOS PARA SUPERUSUARIO Y GESTOR
  # Cobertura: Sección 6.2 del documento 18-Encuentros-Devueltos.md
  # ========================================================================

  @superusuarioAdmision @gestorTA @encuentrosDevueltos @happyPath
  Escenario: FIL-05 - Superusuario y Gestor pueden filtrar por sede
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he iniciado sesión en el sistema
    Y existen encuentros devueltos de diferentes sedes
    Cuando aplico el filtro "Sede" con valor "Auna Guardia Civil"
    Entonces debe mostrarse únicamente encuentros de la sede "Auna Guardia Civil"

  @superusuarioAdmision @gestorTA @encuentrosDevueltos @happyPath
  Escenario: FIL-06 - Superusuario y Gestor pueden filtrar por usuario responsable
    Dado que soy un usuario con rol "Gestor TA"
    Y he iniciado sesión en el sistema
    Y existen encuentros devueltos de diferentes usuarios
    Cuando aplico el filtro "Usuario Responsable" con valor "ejecutivo01"
    Entonces debe mostrarse únicamente encuentros del usuario "ejecutivo01"

  @superusuarioAdmision @gestorTA @encuentrosDevueltos @happyPath
  Esquema del escenario: FIL-06B - Gestor TA y Superusuario pueden filtrar por múltiples columnas
    Dado que soy un usuario con rol "Gestor TA"
    Y he iniciado sesión en el sistema
    Y existen encuentros devueltos con diferentes valores de "<filtro>"
    Cuando aplico el filtro "<filtro>" con valor "<valor>"
    Entonces debe mostrarse únicamente encuentros que coincidan con "<filtro>" = "<valor>"

    Ejemplos:
      | filtro                        | valor                             |
      | Estado                        | Devuelto                          |
      | Estado                        | Regularizado                      |
      | Garante                       | AUNA NO ONCOLOGICO                |
      | Tipo de encuentro             | CEX                               |
      | Tipo de encuentro             | Hospitalización                   |
      | Fecha apert.                  | 01/06/2026 - 30/06/2026           |
      | Prioridad                     | Alta                              |
      | Prioridad                     | Media                             |
      | Devoluciones administrativas  | Acta Conformidad                  |
      | Devoluciones médicas          | Carta de Garantía por Laboratorio |
      | Devoluciones de proceso       | Duplicidad de Gastos              |

  @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Escenario: FIL-07 - Ejecutivo NO tiene acceso a filtros de Sede y Usuario
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Cuando visualizo los filtros disponibles
    Entonces NO debo visualizar el filtro "Sede"
    Y NO debo visualizar el filtro "Usuario Responsable"

  # ========================================================================
  # TÉCNICA: COMBINACIÓN DE FILTROS
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-08 - Aplicar múltiples filtros simultáneamente
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y tengo encuentros devueltos
    Cuando aplico el filtro "Estado" con valor "Devuelto"
    Y aplico el filtro "Prioridad" con valor "Alta"
    Y aplico el filtro "Motivo de Devolución" con valor "Falta documentación administrativa"
    Entonces debe mostrarse únicamente encuentros que cumplan TODOS los filtros

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: FIL-09 - Limpiar todos los filtros con Restablecer vista
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y he aplicado múltiples filtros
    Y el sistema muestra 10 encuentros filtrados
    Cuando selecciono "Restablecer vista"
    Entonces todos los filtros deben limpiarse
    Y debe mostrarse todos mis encuentros devueltos
