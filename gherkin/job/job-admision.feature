# language: es

Característica: Relación entre Job de Admisión, Estados y Bandejas
  Como sistema AUNADOS
  Quiero que el Job de Admisión determine la clasificación de encuentros independientemente de sus estados
  Para mantener la correcta ubicación operativa de cada encuentro

  Antecedentes:
    Dado que el Job de Admisión está configurado y activo
    Y el sistema tiene encuentros en diferentes estados y bandejas

  # ========================================================================
  # CLASIFICACIÓN EXCLUSIVA DEL JOB
  # Cobertura: RN-LE-016
  # Sección 21 del documento 05-Lista-Encuentros.md
  # Sección 2.3 del documento 08-Estados.md
  # ========================================================================

  @autoP0 @prioridadExtrema @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: JOB-01 - Clasificación de encuentros es responsabilidad exclusiva del Job (RN-LE-016)
    Dado que existen encuentros pendientes de clasificación
    Y algunos encuentros tienen diferentes estados operativos
    Cuando el Job de Admisión ejecuta su proceso de evaluación
    Entonces el Job debe clasificar cada encuentro según sus reglas de negocio
    Y la clasificación NO debe depender del estado operativo del encuentro
    Y la clasificación debe ser responsabilidad exclusiva del Job de Admisión

  # ========================================================================
  # INDEPENDENCIA ENTRE ESTADO Y BANDEJA
  # Cobertura: RN-LE-017, RN-LE-018
  # Sección 21, 23 del documento 05-Lista-Encuentros.md
  # Sección 2.3, 15 del documento 07-Detalle-Encuentro.md
  # ========================================================================

  @autoP0 @prioridadExtrema @superusuarioAdmision @happyPath
  Escenario: JOB-02 - Cambio de estado NO determina la bandeja (RN-LE-017)
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y el encuentro "12345678" está en la bandeja "Lista de Encuentros"
    Y el encuentro tiene estado "Pendiente"
    Cuando cambio el estado del encuentro a "Tramitado"
    Y confirmo el cambio
    Entonces el estado debe actualizarse a "Tramitado"
    Y el encuentro debe permanecer en la bandeja "Lista de Encuentros"
    Y el cambio de estado NO debe determinar la bandeja
    Y solo el Job de Admisión puede determinar la bandeja

  @prioridadExtrema @ejecutivoAdmision @happyPath
  Escenario: JOB-03 - Estado operativo y bandeja son conceptos independientes (RN-LE-018)
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y el encuentro "12345678" está en la bandeja "Lista de Encuentros"
    Y el encuentro tiene estado "Derivado a Dirección Médica"
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el Job debe determinar la bandeja independientemente del estado "Derivado a Dirección Médica"
    Y el estado operativo NO debe influir en la clasificación de bandeja
    Y el estado operativo y la bandeja deben ser conceptos independientes

  @autoP0 @prioridadExtrema @superusuarioAdmision @happyPath
  Esquema del escenario: JOB-04 - Encuentros con diferentes estados permanecen en Admisión hasta nueva clasificación
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y el encuentro "12345678" está en la bandeja "Lista de Encuentros"
    Y el encuentro tiene estado "<estado>"
    Cuando el Job de Admisión NO clasifica el encuentro para otra bandeja
    Entonces el encuentro debe permanecer en la bandeja "Lista de Encuentros"
    Y el estado "<estado>" NO debe provocar cambio de bandeja automático

    Ejemplos:
      | estado                          |
      | Tramitado                       |
      | Derivado a Dirección Médica     |
      | Derivado a Supervisor           |
      | Error de Vinculación            |
      | Pendiente de Revisión           |
      | Terapia en Proceso              |
      | En Proceso                      |
      | Pago por Adelantado             |

  # ========================================================================
  # EVALUACIÓN PERIÓDICA DEL JOB
  # Cobertura: RN-LE-019
  # Sección 21 del documento 05-Lista-Encuentros.md
  # ========================================================================

  @autoP0 @prioridadExtrema @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: JOB-05 - Job evalúa periódicamente los encuentros (RN-LE-019)
    Dado que existen encuentros en la bandeja "Lista de Encuentros"
    Y los encuentros tienen diferentes estados operativos
    Cuando el Job de Admisión ejecuta su evaluación periódica
    Entonces el Job debe evaluar cada encuentro según sus reglas de negocio
    Y el Job debe determinar si cada encuentro corresponde a:
      | Bandeja      |
      | Admisión     |
      | Protocolo    |
      | Facturación  |
    Y la evaluación debe ser independiente del estado operativo

  @autoP0 @prioridadExtrema @superusuarioAdmision @happyPath
  Escenario: JOB-06 - Encuentro se mueve de Admisión a Protocolo según clasificación del Job
    Dado que el encuentro "12345678" está en la bandeja "Lista de Encuentros"
    Y el encuentro tiene estado "Tramitado"
    Y el encuentro cumple las condiciones para Protocolo
    Cuando el Job de Admisión ejecuta su evaluación
    Entonces el Job debe clasificar el encuentro para "Protocolo"
    Y el encuentro debe salir de la bandeja "Lista de Encuentros"
    Y el encuentro debe aparecer en la bandeja de Protocolo
    Y el estado "Tramitado" debe mantenerse

  @autoP0 @prioridadExtrema @superusuarioAdmision @happyPath
  Escenario: JOB-07 - Encuentro se mueve de Admisión a Facturación según clasificación del Job
    Dado que el encuentro "12345678" está en la bandeja "Lista de Encuentros"
    Y el encuentro tiene estado "En Proceso"
    Y el encuentro cumple las condiciones para Facturación
    Cuando el Job de Admisión ejecuta su evaluación
    Entonces el Job debe clasificar el encuentro para "Facturación"
    Y el encuentro debe salir de la bandeja "Lista de Encuentros"
    Y el encuentro debe aparecer en la bandeja de Facturación
    Y el estado "En Proceso" debe mantenerse

  # ========================================================================
  # RETORNO DE ENCUENTROS DESDE FACTURACIÓN
  # Cobertura: RN-LE-020
  # Sección 21 del documento 05-Lista-Encuentros.md
  # ========================================================================

  @autoP0 @prioridadExtrema @superusuarioAdmision @gestorTA @happyPath
  Escenario: JOB-08 - Encuentro retorna de Facturación a Admisión por exámenes sin resultado (RN-LE-020)
    Dado que el encuentro "12345678" está en la bandeja "Facturación"
    Y el encuentro tiene exámenes imputados sin resultado
    Cuando el Job de Admisión ejecuta su evaluación periódica
    Entonces el Job debe detectar que existen exámenes imputados sin resultado
    Y el Job debe reclasificar el encuentro para "Admisión"
    Y el encuentro debe aparecer en la bandeja "Lista de Encuentros"
    Y el encuentro debe salir de la bandeja de Facturación

  @autoP0 @prioridadExtrema @superusuarioAdmision @gestorTA @happyPath
  Escenario: JOB-09 - Encuentro retorna de Facturación a Admisión por exámenes no imputados (RN-LE-020)
    Dado que el encuentro "12345678" está en la bandeja "Facturación"
    Y el encuentro tiene exámenes con resultado no imputados
    Cuando el Job de Admisión ejecuta su evaluación periódica
    Entonces el Job debe detectar que existen exámenes con resultado no imputados
    Y el Job debe reclasificar el encuentro para "Admisión"
    Y el encuentro debe aparecer en la bandeja "Lista de Encuentros"
    Y el encuentro debe salir de la bandeja de Facturación

  @autoP0 @prioridadExtrema @superusuarioAdmision @gestorTA @happyPath
  Escenario: JOB-10 - Encuentro retorna de Facturación a Admisión por documentación pendiente (RN-LE-020)
    Dado que el encuentro "12345678" está en la bandeja "Facturación"
    Y el encuentro tiene documentación administrativa pendiente
    Y la documentación pendiente es:
      | Documento              |
      | Carta de Garantía      |
      | Hoja SITEDS            |
    Cuando el Job de Admisión ejecuta su evaluación periódica
    Entonces el Job debe detectar que existe documentación administrativa pendiente
    Y el Job debe reclasificar el encuentro para "Admisión"
    Y el encuentro debe aparecer en la bandeja "Lista de Encuentros"
    Y el encuentro debe mostrar los sustentos administrativos pendientes

  @autoP0 @prioridadExtrema @superusuarioAdmision @gestorTA @happyPath
  Esquema del escenario: JOB-11 - Encuentro puede retornar por diferentes condiciones (RN-LE-020)
    Dado que el encuentro "12345678" está en la bandeja "Facturación"
    Y el encuentro tiene la condición "<condicion_detectada>"
    Cuando el Job de Admisión ejecuta su evaluación periódica
    Entonces el Job debe detectar la condición "<condicion_detectada>"
    Y el Job debe reclasificar el encuentro para "Admisión"
    Y el encuentro debe retornar a la bandeja "Lista de Encuentros"

    Ejemplos:
      | condicion_detectada                        |
      | Exámenes imputados sin resultado           |
      | Exámenes con resultado no imputados        |
      | Documentación administrativa pendiente     |
      | Carta de Garantía pendiente                |
      | Autorización de seguro pendiente           |

  # ========================================================================
  # ENCUENTRO PUEDE IR Y VOLVER ENTRE BANDEJAS
  # Cobertura: RN-LE-020, Sección 21
  # ========================================================================

  @autoP0 @prioridadExtrema @superusuarioAdmision @happyPath
  Escenario: JOB-12 - Encuentro puede ir de Admisión a Facturación y volver múltiples veces
    Dado que el encuentro "12345678" está inicialmente en la bandeja "Lista de Encuentros"
    Y el encuentro cumple las condiciones para Facturación
    Cuando el Job de Admisión ejecuta su primera evaluación
    Entonces el encuentro debe moverse a la bandeja "Facturación"
    Cuando posteriormente se detectan exámenes sin resultado
    Y el Job de Admisión ejecuta su segunda evaluación
    Entonces el encuentro debe retornar a la bandeja "Lista de Encuentros"
    Cuando se subsanan los exámenes sin resultado
    Y el encuentro cumple nuevamente las condiciones para Facturación
    Y el Job de Admisión ejecuta su tercera evaluación
    Entonces el encuentro debe moverse nuevamente a la bandeja "Facturación"
    Y el encuentro puede moverse entre bandejas múltiples veces según las condiciones

  # ========================================================================
  # ESTADOS ESPECIALES QUE AFECTAN LA BANDEJA
  # Cobertura: RN-LE-013, RN-LE-014
  # Excepción a la regla de independencia
  # ========================================================================

  @autoP0 @prioridadExtrema @superusuarioAdmision @happyPath
  Escenario: JOB-13 - Estado "No Facturable" es la excepción: provoca salida inmediata (RN-LE-013)
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y el encuentro "12345678" está en la bandeja "Lista de Encuentros"
    Y el encuentro tiene estado "Pendiente"
    Cuando cambio el estado a "No Facturable"
    Y confirmo el cambio
    Entonces el encuentro debe salir inmediatamente de la bandeja "Lista de Encuentros"
    Y este es un comportamiento excepcional
    Y el estado "No Facturable" SÍ afecta directamente la bandeja
    Y el encuentro espera la próxima evaluación del Job

  @autoP0 @prioridadExtrema @superusuarioAdmision @happyPath
  Escenario: JOB-14 - Estado "Error de Facturación" es la excepción: provoca salida inmediata (RN-LE-013)
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y el encuentro "12345678" está en la bandeja "Lista de Encuentros"
    Y el encuentro tiene estado "Tramitado"
    Cuando cambio el estado a "Error de Facturación"
    Y confirmo el cambio
    Entonces el encuentro debe salir inmediatamente de la bandeja "Lista de Encuentros"
    Y este es un comportamiento excepcional
    Y el estado "Error de Facturación" SÍ afecta directamente la bandeja
    Y el encuentro espera la próxima evaluación del Job

  @autoP0 @prioridadExtrema @superusuarioAdmision @happyPath
  Escenario: JOB-15 - Llegada posterior a Facturación depende del Job (RN-LE-014, RN-LE-015)
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he cambiado el estado del encuentro "12345678" a "No Facturable"
    Y el encuentro ha salido de la bandeja "Lista de Encuentros"
    Cuando el Job de Admisión ejecuta su próxima evaluación
    Entonces el Job debe evaluar si el encuentro corresponde a Facturación
    Y el Responsable de Facturación visualizará el encuentro solo si el Job lo determina
    Y la llegada a Facturación NO es automática
    Y la llegada a Facturación depende exclusivamente de la ejecución del Job

  # ========================================================================
  # CASOS DE EJEMPLO COMPLEJOS
  # Cobertura: Sección 20, 21 del documento 08-Estados.md
  # ========================================================================

  @autoP0 @prioridadExtrema @superusuarioAdmision @happyPath
  Escenario: JOB-16 - Caso complejo: encuentro con múltiples estados permanece en Admisión
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y el encuentro "12345678" está en la bandeja "Lista de Encuentros"
    Y cambio el estado a "Tramitado" el día 1
    Y cambio el estado a "Derivado a Dirección Médica" el día 2
    Y cambio el estado a "En Proceso" el día 3
    Cuando el Job de Admisión evalúa el encuentro
    Y el encuentro NO cumple condiciones para Protocolo ni Facturación
    Entonces el encuentro debe permanecer en la bandeja "Lista de Encuentros"
    Y todos los cambios de estado deben quedar registrados en el historial
    Y los estados NO deben haber provocado cambio de bandeja

  @autoP0 @prioridadExtrema @superusuarioAdmision @happyPath
  Escenario: JOB-17 - Estado "Tramitado" no mueve a Facturación, solo el Job lo hace
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y el encuentro "12345678" está en la bandeja "Lista de Encuentros"
    Y el encuentro tiene estado "Pendiente"
    Cuando cambio el estado a "Tramitado"
    Entonces el encuentro debe permanecer en la bandeja "Lista de Encuentros"
    Y el estado "Tramitado" NO debe mover el encuentro a Facturación
    Y solo el Job de Admisión puede clasificar el encuentro para Facturación
    Cuando el Job evalúa el encuentro posteriormente
    Y el encuentro cumple las condiciones para Facturación
    Entonces el Job debe mover el encuentro a Facturación
    Y la clasificación es responsabilidad del Job, no del estado

  # ========================================================================
  # VALIDACIÓN DE FUENTE DE CLASIFICACIÓN
  # Cobertura: Sección 21 del documento 05-Lista-Encuentros.md
  # ========================================================================

  @autoP0 @prioridadExtrema @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: JOB-18 - Usuarios no pueden mover encuentros entre bandejas manualmente (RN-EST-03)
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y el encuentro "12345678" está en la bandeja "Lista de Encuentros"
    Cuando intento acceder a las opciones del encuentro
    Entonces NO debe existir ninguna opción para mover el encuentro a otra bandeja
    Y NO debo poder cambiar manualmente la bandeja del encuentro
    Y solo el Job de Admisión tiene autoridad para clasificar encuentros

  @autoP0 @prioridadExtrema @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: JOB-19 - Clasificación vigente determina visibilidad en bandeja
    Dado que el Job de Admisión ha clasificado el encuentro "12345678" para "Admisión"
    Y el encuentro tiene estado "Tramitado"
    Cuando visualizo la bandeja "Lista de Encuentros"
    Entonces el encuentro "12345678" debe ser visible
    Cuando el Job reclasifica el encuentro para "Facturación"
    Y visualizo nuevamente la bandeja "Lista de Encuentros"
    Entonces el encuentro "12345678" NO debe ser visible en Admisión
    Y debe ser visible únicamente en la bandeja de Facturación
    Y la clasificación vigente del Job determina la visibilidad

  # ========================================================================
  # ENCUENTROS EN DIFERENTES ESTADOS PERMANECEN EN ADMISIÓN
  # El estado NO determina la salida, solo el Job lo hace
  # ========================================================================

  @autoP0 @prioridadExtrema @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: JOB-20 - Encuentros en cualquier estado pueden permanecer en Admisión
    Dado que existen los siguientes encuentros en la bandeja "Lista de Encuentros":
      | Encuentro | Estado                          | Documentación | Laboratorios | Exámenes Imputados |
      | 12345678  | Pendiente                       | Incompleta    | Sin resultado| No                 |
      | 23456789  | Tramitado                       | Incompleta    | Sin resultado| No                 |
      | 34567890  | Derivado a Dirección Médica     | Incompleta    | Sin resultado| No                 |
      | 45678901  | En Proceso                      | Incompleta    | Sin resultado| No                 |
      | 56789012  | Pago por Adelantado             | Incompleta    | Sin resultado| No                 |
    Cuando el Job de Admisión ejecuta su evaluación
    Entonces todos los encuentros deben permanecer en la bandeja "Lista de Encuentros"
    Y el estado de cada encuentro NO debe afectar la permanencia en Admisión
    Y solo el Job determina cuándo un encuentro debe salir

  @autoP0 @prioridadExtrema @superusuarioAdmision @happyPath
  Esquema del escenario: JOB-21 - Encuentro permanece en Admisión independientemente del estado hasta completar requisitos
    Dado que el encuentro "12345678" está en la bandeja "Lista de Encuentros"
    Y el encuentro tiene estado "<estado>"
    Y el encuentro tiene documentación administrativa incompleta
    Cuando el Job de Admisión ejecuta su evaluación periódica
    Entonces el encuentro debe permanecer en la bandeja "Lista de Encuentros"
    Y el estado "<estado>" NO debe provocar la salida del encuentro
    Y el encuentro debe esperar hasta completar la documentación administrativa

    Ejemplos:
      | estado                          |
      | Pendiente                       |
      | Tramitado                       |
      | Derivado a Dirección Médica     |
      | Derivado a Supervisor           |
      | Error de Vinculación            |
      | Pendiente de Revisión           |
      | Terapia en Proceso              |
      | En Proceso                      |
      | Pago por Adelantado             |

  # ========================================================================
  # COMPLETAR DOCUMENTACIÓN Y LABORATORIOS - RECLASIFICACIÓN
  # Cobertura de flujo completo desde Admisión hasta Protocolo o Facturación
  # Basado en Tipo de Encuentro y Garante
  # ========================================================================

  @autoP0 @prioridadExtrema @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: JOB-22 - Consulta Externa NO Oncosalud < 7 días → Protocolo
    Dado que el encuentro "12345678" está en la bandeja "Lista de Encuentros"
    Y el encuentro es de tipo "Consulta Externa"
    Y el encuentro tiene garante "MAPFRE EPS"
    Y el encuentro tiene estado "Tramitado"
    Y el encuentro fue creado hace 3 días
    Y el encuentro tiene documentación administrativa pendiente:
      | Documento Pendiente   |
      | Carta de Garantía     |
      | Hoja SITEDS           |
    Y el encuentro tiene exámenes sin resultado:
      | Examen              |
      | Hemoglobina         |
      | Glucosa             |
    Y el encuentro tiene exámenes con resultado no imputados:
      | Examen              |
      | Creatinina          |
    Cuando el Ejecutivo de Admisión completa la documentación administrativa
    Y se cargan los resultados de laboratorio para "Hemoglobina" y "Glucosa"
    Y se imputan los exámenes médicos "Creatinina"
    Y el Job de Admisión ejecuta su evaluación periódica
    Entonces el Job debe detectar que la documentación está completa
    Y el Job debe detectar que todos los laboratorios tienen resultado
    Y el Job debe detectar que todos los exámenes están imputados
    Y el Job debe identificar que es tipo "Consulta Externa"
    Y el Job debe identificar que el garante NO es Oncosalud
    Y el Job debe evaluar que han pasado 3 días desde la creación (< 7 días)
    Y el Job debe reclasificar el encuentro para "Protocolo"
    Y el encuentro debe salir de la bandeja "Lista de Encuentros"
    Y el encuentro debe aparecer en la bandeja de Protocolo
    Y el estado "Tramitado" debe mantenerse

  @autoP0 @prioridadExtrema @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: JOB-23 - Consulta Externa NO Oncosalud ≥ 7 días → Facturación
    Dado que el encuentro "87654321" está en la bandeja "Lista de Encuentros"
    Y el encuentro es de tipo "Consulta Externa"
    Y el encuentro tiene garante "Pacífico EPS"
    Y el encuentro tiene estado "En Proceso"
    Y el encuentro fue creado hace 10 días
    Y el encuentro tiene documentación administrativa pendiente:
      | Documento Pendiente   |
      | Autorización Seguro   |
    Y el encuentro tiene exámenes sin resultado:
      | Examen              |
      | Radiografía Tórax   |
    Y el encuentro tiene exámenes con resultado no imputados:
      | Examen              |
      | Hemograma Completo  |
    Cuando el Ejecutivo de Admisión completa la documentación administrativa
    Y se cargan los resultados de laboratorio para "Radiografía Tórax"
    Y se imputan los exámenes médicos "Hemograma Completo"
    Y el Job de Admisión ejecuta su evaluación periódica
    Entonces el Job debe detectar que la documentación está completa
    Y el Job debe detectar que todos los laboratorios tienen resultado
    Y el Job debe detectar que todos los exámenes están imputados
    Y el Job debe identificar que es tipo "Consulta Externa"
    Y el Job debe identificar que el garante NO es Oncosalud
    Y el Job debe evaluar que han pasado 10 días desde la creación (≥ 7 días)
    Y el Job debe reclasificar el encuentro para "Facturación"
    Y el encuentro debe salir de la bandeja "Lista de Encuentros"
    Y el encuentro debe aparecer en la bandeja de Facturación
    Y el estado "En Proceso" debe mantenerse

  @autoP0 @prioridadExtrema @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: JOB-24 - Consulta Externa Oncosalud < 31 días → Protocolo
    Dado que el encuentro "11223344" está en la bandeja "Lista de Encuentros"
    Y el encuentro es de tipo "Consulta Externa"
    Y el encuentro tiene garante "Oncosalud"
    Y el encuentro tiene estado "Derivado a Dirección Médica"
    Y el encuentro fue creado hace 15 días
    Y el encuentro tiene documentación administrativa pendiente
    Y el encuentro tiene exámenes sin resultado
    Cuando el Ejecutivo de Admisión completa toda la documentación administrativa
    Y se cargan todos los resultados de laboratorio
    Y se imputan todos los exámenes médicos
    Y el Job de Admisión ejecuta su evaluación periódica
    Entonces el Job debe detectar que la documentación está completa
    Y el Job debe detectar que todos los laboratorios tienen resultado
    Y el Job debe detectar que todos los exámenes están imputados
    Y el Job debe identificar que es tipo "Consulta Externa"
    Y el Job debe identificar que el garante es Oncosalud
    Y el Job debe evaluar que han pasado 15 días desde la creación (< 31 días)
    Y el Job debe reclasificar el encuentro para "Protocolo"
    Y el encuentro debe salir de la bandeja "Lista de Encuentros"
    Y el encuentro debe aparecer en la bandeja de Protocolo

  @autoP0 @prioridadExtrema @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: JOB-25 - Consulta Externa Oncosalud ≥ 31 días → Facturación
    Dado que el encuentro "55667788" está en la bandeja "Lista de Encuentros"
    Y el encuentro es de tipo "Consulta Externa"
    Y el encuentro tiene garante "Oncosalud"
    Y el encuentro tiene estado "Pendiente de Revisión"
    Y el encuentro fue creado hace 45 días
    Y el encuentro tiene toda la documentación administrativa completa
    Y todos los exámenes tienen resultados cargados
    Y el encuentro tiene exámenes con resultado no imputados
    Cuando se imputan todos los exámenes médicos
    Y el Job de Admisión ejecuta su evaluación periódica
    Entonces el Job debe detectar que la documentación está completa
    Y el Job debe detectar que todos los laboratorios tienen resultado
    Y el Job debe detectar que todos los exámenes están imputados
    Y el Job debe identificar que es tipo "Consulta Externa"
    Y el Job debe identificar que el garante es Oncosalud
    Y el Job debe evaluar que han pasado 45 días desde la creación (≥ 31 días)
    Y el Job debe reclasificar el encuentro para "Facturación"
    Y el encuentro debe salir de la bandeja "Lista de Encuentros"
    Y el encuentro debe aparecer en la bandeja de Facturación

  @autoP0 @prioridadExtrema @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: JOB-26 - Emergencia < 2 días → Protocolo
    Dado que el encuentro "99887766" está en la bandeja "Lista de Encuentros"
    Y el encuentro es de tipo "Emergencia"
    Y el encuentro tiene garante "La Positiva"
    Y el encuentro tiene estado "Tramitado"
    Y el encuentro fue creado hace 1 día
    Y el encuentro tiene documentación administrativa pendiente
    Y el encuentro tiene exámenes sin resultado
    Cuando el Ejecutivo de Admisión completa toda la documentación administrativa
    Y se cargan todos los resultados de laboratorio
    Y se imputan todos los exámenes médicos
    Y el Job de Admisión ejecuta su evaluación periódica
    Entonces el Job debe detectar que la documentación está completa
    Y el Job debe detectar que todos los laboratorios tienen resultado
    Y el Job debe detectar que todos los exámenes están imputados
    Y el Job debe identificar que es tipo "Emergencia"
    Y el Job debe evaluar que han pasado 1 día desde la creación (< 2 días)
    Y el Job debe reclasificar el encuentro para "Protocolo"
    Y el encuentro debe salir de la bandeja "Lista de Encuentros"
    Y el encuentro debe aparecer en la bandeja de Protocolo

  @autoP0 @prioridadExtrema @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: JOB-27 - Emergencia ≥ 2 días → Facturación
    Dado que el encuentro "44556677" está en la bandeja "Lista de Encuentros"
    Y el encuentro es de tipo "Emergencia"
    Y el encuentro tiene garante "MAPFRE EPS"
    Y el encuentro tiene estado "En Proceso"
    Y el encuentro fue creado hace 5 días
    Y el encuentro tiene documentación administrativa pendiente
    Y el encuentro tiene exámenes sin resultado
    Cuando el Ejecutivo de Admisión completa toda la documentación administrativa
    Y se cargan todos los resultados de laboratorio
    Y se imputan todos los exámenes médicos
    Y el Job de Admisión ejecuta su evaluación periódica
    Entonces el Job debe detectar que la documentación está completa
    Y el Job debe detectar que todos los laboratorios tienen resultado
    Y el Job debe detectar que todos los exámenes están imputados
    Y el Job debe identificar que es tipo "Emergencia"
    Y el Job debe evaluar que han pasado 5 días desde la creación (≥ 2 días)
    Y el Job debe reclasificar el encuentro para "Facturación"
    Y el encuentro debe salir de la bandeja "Lista de Encuentros"
    Y el encuentro debe aparecer en la bandeja de Facturación

  # ========================================================================
  # COMPLETADO PARCIAL - PERMANECE EN ADMISIÓN
  # ========================================================================

  @autoP0 @prioridadExtrema @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: JOB-28 - Documentación completa pero laboratorios pendientes - permanece en Admisión
    Dado que el encuentro "66778899" está en la bandeja "Lista de Encuentros"
    Y el encuentro es de tipo "Consulta Externa"
    Y el encuentro tiene garante "MAPFRE EPS"
    Y el encuentro tiene estado "Derivado a Dirección Médica"
    Y el encuentro fue creado hace 5 días
    Y el encuentro tenía documentación administrativa pendiente
    Y el encuentro tiene exámenes sin resultado:
      | Examen              |
      | Biopsia             |
      | TAC Abdomen         |
    Cuando el Ejecutivo de Admisión completa toda la documentación administrativa
    Y el Job de Admisión ejecuta su evaluación periódica
    Entonces el Job debe detectar que la documentación está completa
    Y el Job debe detectar que existen exámenes sin resultado
    Y el Job debe mantener el encuentro en la bandeja "Lista de Encuentros"
    Y el encuentro NO debe salir de Admisión
    Y debe esperar a que se carguen los resultados pendientes

  @autoP0 @prioridadExtrema @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: JOB-29 - Laboratorios completos pero exámenes no imputados - permanece en Admisión
    Dado que el encuentro "77889900" está en la bandeja "Lista de Encuentros"
    Y el encuentro es de tipo "Consulta Externa"
    Y el encuentro tiene garante "Oncosalud"
    Y el encuentro tiene estado "Pendiente de Revisión"
    Y el encuentro fue creado hace 10 días
    Y el encuentro tiene toda la documentación administrativa completa
    Y todos los exámenes tienen resultados cargados
    Y el encuentro tiene exámenes con resultado no imputados:
      | Examen                |
      | Perfil Lipídico       |
      | Función Hepática      |
    Cuando el Job de Admisión ejecuta su evaluación periódica
    Entonces el Job debe detectar que la documentación está completa
    Y el Job debe detectar que todos los laboratorios tienen resultado
    Y el Job debe detectar que existen exámenes no imputados
    Y el Job debe mantener el encuentro en la bandeja "Lista de Encuentros"
    Y el encuentro NO debe salir de Admisión
    Y debe esperar a que se imputen los exámenes pendientes

  @autoP0 @prioridadExtrema @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: JOB-30 - Documentación incompleta - permanece en Admisión sin importar laboratorios
    Dado que el encuentro "88990011" está en la bandeja "Lista de Encuentros"
    Y el encuentro es de tipo "Emergencia"
    Y el encuentro tiene garante "La Positiva"
    Y el encuentro tiene estado "Tramitado"
    Y el encuentro fue creado hace 1 día
    Y el encuentro tiene documentación administrativa pendiente:
      | Documento Pendiente   |
      | SOAT Tarjeta Física   |
    Y todos los exámenes tienen resultados cargados
    Y todos los exámenes están imputados
    Cuando el Job de Admisión ejecuta su evaluación periódica
    Entonces el Job debe detectar que la documentación administrativa está incompleta
    Y el Job debe mantener el encuentro en la bandeja "Lista de Encuentros"
    Y el encuentro NO debe salir de Admisión
    Y debe esperar a que se complete la documentación administrativa
    Y aunque los laboratorios estén completos, el encuentro no puede avanzar

  # ========================================================================
  # MÚLTIPLES ENCUENTROS EN DIFERENTES ESTADOS - EVALUACIÓN DEL JOB
  # ========================================================================

  @autoP0 @prioridadExtrema @superusuarioAdmision @gestorTA @happyPath
  Escenario: JOB-31 - Job evalúa múltiples encuentros en diferentes estados y los clasifica según completitud
    Dado que existen los siguientes encuentros en la bandeja "Lista de Encuentros":
      | Encuentro | Estado                      | Tipo              | Garante    | Fecha Creación | Documentación | Laboratorios   | Imputación | Destino Esperado |
      | 10000001  | Pendiente                   | Emergencia        | MAPFRE EPS | hace 1 día     | Completa      | Con resultado  | Completa   | Protocolo        |
      | 10000002  | Tramitado                   | Consulta Externa  | Pacífico   | hace 10 días   | Completa      | Con resultado  | Completa   | Facturación      |
      | 10000003  | Derivado a Dirección Médica | Consulta Externa  | Oncosalud  | hace 5 días    | Incompleta    | Sin resultado  | Pendiente  | Admisión         |
      | 10000004  | En Proceso                  | Emergencia        | La Positiva| hace 1 día     | Completa      | Sin resultado  | Pendiente  | Admisión         |
      | 10000005  | Pago por Adelantado         | Consulta Externa  | MAPFRE EPS | hace 20 días   | Completa      | Con resultado  | Pendiente  | Admisión         |
    Cuando el Job de Admisión ejecuta su evaluación periódica
    Entonces el encuentro "10000001" debe ser reclasificado a "Protocolo" (Emergencia < 2 días)
    Y el encuentro "10000002" debe ser reclasificado a "Facturación" (Consulta Externa NO Oncosalud ≥ 7 días)
    Y el encuentro "10000003" debe permanecer en "Admisión"
    Y el encuentro "10000004" debe permanecer en "Admisión"
    Y el encuentro "10000005" debe permanecer en "Admisión"
    Y los estados operativos de todos los encuentros deben mantenerse sin cambios
    Y solo la clasificación de bandeja debe cambiar según los criterios del Job

  # ========================================================================
  # CRITERIOS DE CLASIFICACIÓN SEGÚN TIPO Y GARANTE
  # ========================================================================

  @autoP0 @prioridadExtrema @superusuarioAdmision @gestorTA @happyPath
  Esquema del escenario: JOB-32 - Consulta Externa NO Oncosalud: umbral de 7 días
    Dado que el encuentro "12345678" está en la bandeja "Lista de Encuentros"
    Y el encuentro es de tipo "Consulta Externa"
    Y el encuentro tiene garante "<garante>"
    Y el encuentro tiene estado "Tramitado"
    Y el encuentro fue creado hace <dias> días
    Y el encuentro tiene toda la documentación administrativa completa
    Y todos los exámenes tienen resultados cargados
    Y todos los exámenes están imputados
    Cuando el Job de Admisión ejecuta su evaluación periódica
    Entonces el Job debe identificar que es tipo "Consulta Externa"
    Y el Job debe identificar que el garante NO es Oncosalud
    Y el Job debe aplicar el umbral de 7 días
    Y el Job debe reclasificar el encuentro para "<destino>"
    Y el encuentro debe salir de la bandeja "Lista de Encuentros"

    Ejemplos:
      | garante     | dias | destino      |
      | MAPFRE EPS  | 1    | Protocolo    |
      | Pacífico    | 3    | Protocolo    |
      | La Positiva | 6    | Protocolo    |
      | MAPFRE EPS  | 7    | Facturación  |
      | Pacífico    | 10   | Facturación  |
      | La Positiva | 30   | Facturación  |

  @autoP0 @prioridadExtrema @superusuarioAdmision @gestorTA @happyPath
  Esquema del escenario: JOB-33 - Consulta Externa Oncosalud: umbral de 31 días
    Dado que el encuentro "23456789" está en la bandeja "Lista de Encuentros"
    Y el encuentro es de tipo "Consulta Externa"
    Y el encuentro tiene garante "Oncosalud"
    Y el encuentro tiene estado "Tramitado"
    Y el encuentro fue creado hace <dias> días
    Y el encuentro tiene toda la documentación administrativa completa
    Y todos los exámenes tienen resultados cargados
    Y todos los exámenes están imputados
    Cuando el Job de Admisión ejecuta su evaluación periódica
    Entonces el Job debe identificar que es tipo "Consulta Externa"
    Y el Job debe identificar que el garante es Oncosalud
    Y el Job debe aplicar el umbral de 31 días
    Y el Job debe reclasificar el encuentro para "<destino>"
    Y el encuentro debe salir de la bandeja "Lista de Encuentros"

    Ejemplos:
      | dias | destino      |
      | 1    | Protocolo    |
      | 10   | Protocolo    |
      | 30   | Protocolo    |
      | 31   | Facturación  |
      | 45   | Facturación  |
      | 60   | Facturación  |

  @autoP0 @prioridadExtrema @superusuarioAdmision @gestorTA @happyPath
  Esquema del escenario: JOB-34 - Emergencia: umbral de 2 días
    Dado que el encuentro "34567890" está en la bandeja "Lista de Encuentros"
    Y el encuentro es de tipo "Emergencia"
    Y el encuentro tiene garante "<garante>"
    Y el encuentro tiene estado "Tramitado"
    Y el encuentro fue creado hace <dias> días
    Y el encuentro tiene toda la documentación administrativa completa
    Y todos los exámenes tienen resultados cargados
    Y todos los exámenes están imputados
    Cuando el Job de Admisión ejecuta su evaluación periódica
    Entonces el Job debe identificar que es tipo "Emergencia"
    Y el Job debe aplicar el umbral de 2 días (independiente del garante)
    Y el Job debe reclasificar el encuentro para "<destino>"
    Y el encuentro debe salir de la bandeja "Lista de Encuentros"

    Ejemplos:
      | garante     | dias | destino      |
      | MAPFRE EPS  | 0    | Protocolo    |
      | Oncosalud   | 1    | Protocolo    |
      | Pacífico    | 2    | Facturación  |
      | La Positiva | 3    | Facturación  |
      | MAPFRE EPS  | 10   | Facturación  |

  # ========================================================================
  # FLUJO COMPLETO DE VIDA DE UN ENCUENTRO
  # ========================================================================

  @autoP0 @prioridadExtrema @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: JOB-35 - Flujo completo: Emergencia con múltiples estados hasta salida a Protocolo
    Dado que el encuentro "20240001" ingresa por primera vez a Admisión
    Y el encuentro es de tipo "Emergencia"
    Y el encuentro tiene garante "MAPFRE EPS"
    Y el encuentro tiene estado inicial "Pendiente"
    Y el encuentro fue creado hoy
    Y el encuentro tiene documentación administrativa pendiente
    Y el encuentro tiene exámenes sin resultado
    Cuando el Job de Admisión ejecuta su primera evaluación
    Entonces el encuentro debe permanecer en "Lista de Encuentros"
    Cuando el Ejecutivo de Admisión cambia el estado a "En Proceso" al día 1
    Y el Job ejecuta evaluación
    Entonces el encuentro debe permanecer en "Lista de Encuentros"
    Cuando el Ejecutivo de Admisión cambia el estado a "Derivado a Dirección Médica" al día 1
    Y el Job ejecuta evaluación
    Entonces el encuentro debe permanecer en "Lista de Encuentros"
    Cuando se completa parcialmente la documentación administrativa al día 1
    Y el Job ejecuta evaluación
    Entonces el encuentro debe permanecer en "Lista de Encuentros"
    Cuando el Ejecutivo de Admisión cambia el estado a "Tramitado" al día 1
    Y el Job ejecuta evaluación
    Entonces el encuentro debe permanecer en "Lista de Encuentros"
    Cuando se completa toda la documentación administrativa al día 1
    Y se cargan todos los resultados de laboratorio al día 1
    Y se imputan todos los exámenes médicos al día 1
    Y el Job ejecuta evaluación al día 1
    Entonces el Job debe detectar que todos los requisitos están completos
    Y el Job debe identificar que es tipo "Emergencia"
    Y el Job debe evaluar que el encuentro tiene 1 día desde la creación (< 2 días)
    Y el Job debe reclasificar el encuentro para "Protocolo"
    Y el encuentro debe salir de "Lista de Encuentros"
    Y el encuentro debe aparecer en la bandeja de Protocolo
    Y el estado final debe ser "Tramitado"
    Y el encuentro tuvo 4 cambios de estado pero solo el Job determinó su salida

  @autoP0 @prioridadExtrema @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: JOB-36 - Flujo completo: Consulta Externa NO Oncosalud con múltiples estados hasta salida a Facturación
    Dado que el encuentro "20230001" ingresó a Admisión hace 15 días
    Y el encuentro es de tipo "Consulta Externa"
    Y el encuentro tiene garante "Pacífico EPS"
    Y el encuentro tiene estado inicial "Pendiente"
    Y el encuentro fue creado hace 15 días
    Y el encuentro tiene documentación administrativa pendiente
    Y el encuentro tiene exámenes sin resultado
    Cuando el Ejecutivo de Admisión cambia el estado a "Derivado a Supervisor" hace 13 días
    Y el Job ejecuta evaluación
    Entonces el encuentro debe permanecer en "Lista de Encuentros"
    Cuando el Ejecutivo de Admisión cambia el estado a "Pendiente de Revisión" hace 10 días
    Y el Job ejecuta evaluación
    Entonces el encuentro debe permanecer en "Lista de Encuentros"
    Cuando el Ejecutivo de Admisión cambia el estado a "Terapia en Proceso" hace 8 días
    Y el Job ejecuta evaluación
    Entonces el encuentro debe permanecer en "Lista de Encuentros"
    Cuando se completa toda la documentación administrativa hoy
    Y se cargan todos los resultados de laboratorio hoy
    Y se imputan todos los exámenes médicos hoy
    Y el Job ejecuta evaluación hoy
    Entonces el Job debe detectar que todos los requisitos están completos
    Y el Job debe identificar que es tipo "Consulta Externa"
    Y el Job debe identificar que el garante NO es Oncosalud
    Y el Job debe evaluar que el encuentro tiene 15 días desde la creación (≥ 7 días)
    Y el Job debe reclasificar el encuentro para "Facturación"
    Y el encuentro debe salir de "Lista de Encuentros"
    Y el encuentro debe aparecer en la bandeja de Facturación
    Y el estado final debe ser "Terapia en Proceso"
    Y el encuentro tuvo múltiples cambios de estado pero solo el Job determinó su salida

  # ========================================================================
  # ENCUENTROS DEVUELTOS REEVALUADOS POR EL JOB
  # El Job evalúa encuentros devueltos cuando XHIS resuelve la condición bloqueante
  # ========================================================================

  @autoP0 @prioridadExtrema @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: JOB-37 - Encuentro devuelto por laboratorios pendientes es enviado a Facturación por el Job al completarse los exámenes vía XHIS
    Dado que el encuentro "12345678" fue enviado previamente a Facturación por el Job
    Y Facturación devolvió el encuentro con el motivo "Carta de Garantía por Laboratorio"
    Y el encuentro se encuentra en la bandeja "Encuentros Devueltos" de Admisión
    Y el encuentro es de tipo "Consulta Externa"
    Y el encuentro tiene garante "MAPFRE EPS"
    Y el encuentro fue creado hace 10 días
    Y el encuentro tiene toda la documentación administrativa completa
    Y los exámenes de laboratorio tenían resultado pendiente al momento de la devolución:
      | Examen        |
      | Hemoglobina   |
      | Glucosa       |
    Y XHIS cargó los resultados de laboratorio para "Hemoglobina" y "Glucosa"
    Y todos los exámenes están imputados
    Cuando el Job de Admisión ejecuta su evaluación periódica
    Entonces el Job debe detectar que los laboratorios ahora tienen resultado completo vía XHIS
    Y el Job debe detectar que todos los exámenes están imputados
    Y el Job debe detectar que la documentación está completa
    Y el Job debe identificar que es tipo "Consulta Externa"
    Y el Job debe identificar que el garante NO es Oncosalud
    Y el Job debe evaluar que han pasado 10 días desde la creación (≥ 7 días)
    Y el Job debe reclasificar el encuentro para "Facturación"
    Y el encuentro debe salir de la bandeja "Encuentros Devueltos"
    Y el encuentro debe aparecer en la bandeja de Facturación
