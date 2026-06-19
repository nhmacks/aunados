# language: es

Característica: Job de Laboratorio - Devolución de Encuentros a Admisión
  Como sistema AUNADOS
  Quiero que el Job de Laboratorio evalúe periódicamente los encuentros en Facturación
  Para devolver a Admisión aquellos que ya no tienen exámenes de laboratorio pendientes

  Antecedentes:
    Dado que el Job de Laboratorio está configurado y activo
    Y el sistema tiene encuentros en la bandeja de Facturación

  # ========================================================================
  # LÓGICA DE EVALUACIÓN DEL JOB DE LABORATORIO
  # ========================================================================

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Escenario: JOBL-01 - Job evalúa si encuentro tiene exámenes imputados pendientes de resultado
    Dado que el encuentro "12345678" está en la bandeja "Facturación"
    Y el encuentro tiene estado de clasificación "Por asignar"
    Y estando en Facturación, se le imputan 3 exámenes de laboratorio al encuentro
    Y los 3 exámenes quedan pendientes de resultado
    Cuando el Job de Laboratorio ejecuta su evaluación periódica
    Entonces el Job debe detectar que existen exámenes imputados pendientes de resultado
    Y el encuentro debe permanecer en la bandeja "Facturación"
    Y el encuentro NO debe devolverse a Admisión

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Escenario: JOBL-02 - Job evalúa si encuentro tiene exámenes con resultado no imputados
    Dado que el encuentro "87654321" está en la bandeja "Facturación"
    Y el encuentro tiene estado de clasificación "Asignado"
    Y estando en Facturación, se solicitaron 2 exámenes de laboratorio para el encuentro
    Y los 2 exámenes ya tienen resultado del laboratorio
    Y los resultados aún NO han sido imputados al encuentro
    Cuando el Job de Laboratorio ejecuta su evaluación periódica
    Entonces el Job debe detectar que existen exámenes con resultado no imputados
    Y el encuentro debe permanecer en la bandeja "Facturación"
    Y el encuentro NO debe devolverse a Admisión

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Escenario: JOBL-03 - Job devuelve encuentro a Admisión cuando NO hay pendientes de laboratorio
    Dado que el encuentro "11223344" está en la bandeja "Facturación"
    Y el encuentro tiene estado de clasificación "Por facturar"
    Y el encuentro NO tiene exámenes imputados pendientes de resultado
    Y el encuentro NO tiene exámenes con resultado no imputados
    Cuando el Job de Laboratorio ejecuta su evaluación periódica
    Entonces el Job debe detectar que NO hay exámenes de laboratorio pendientes
    Y el Job debe reclasificar el encuentro para "Admisión"
    Y el encuentro debe aparecer en la bandeja "Lista de Encuentros"
    Y el encuentro debe salir de la bandeja "Facturación"

  # ========================================================================
  # JOB FUNCIONA INDEPENDIENTEMENTE DEL ESTADO DE CLASIFICACIÓN
  # ========================================================================

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: JOBL-04 - Job devuelve encuentro sin importar su estado de clasificación
    Dado que el encuentro "12345678" está en la bandeja "Facturación"
    Y el encuentro tiene estado de clasificación "<estado_clasificacion>"
    Y el encuentro NO tiene exámenes imputados pendientes de resultado
    Y el encuentro NO tiene exámenes con resultado no imputados
    Cuando el Job de Laboratorio ejecuta su evaluación periódica
    Entonces el Job debe reclasificar el encuentro para "Admisión"
    Y el encuentro debe aparecer en la bandeja "Lista de Encuentros"
    Y el estado de clasificación "<estado_clasificacion>" debe mantenerse

    Ejemplos:
      | estado_clasificacion |
      | Por asignar          |
      | Asignado             |
      | Facturado hoy        |
      | Por facturar         |
      | En revisión          |
      | Regularizado         |
      | No facturable        |
      | Error de facturación |

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: JOBL-05 - Job retiene encuentro en Facturación si tiene pendientes de laboratorio
    Dado que el encuentro "12345678" está en la bandeja "Facturación"
    Y el encuentro tiene estado de clasificación "<estado_clasificacion>"
    Y estando en Facturación, se le solicitaron exámenes de laboratorio que están pendientes
    Cuando el Job de Laboratorio ejecuta su evaluación periódica
    Entonces el encuentro debe permanecer en la bandeja "Facturación"
    Y el encuentro NO debe devolverse a Admisión
    Y el estado de clasificación "<estado_clasificacion>" debe mantenerse

    Ejemplos:
      | estado_clasificacion |
      | Por asignar          |
      | Asignado             |
      | Facturado hoy        |
      | Por facturar         |
      | En revisión          |
      | Regularizado         |
      | No facturable        |
      | Error de facturación |

  # ========================================================================
  # CASOS COMBINADOS DE EXÁMENES DE LABORATORIO
  # ========================================================================

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Escenario: JOBL-06 - Encuentro con ambos tipos de pendientes permanece en Facturación
    Dado que el encuentro "12345678" está en la bandeja "Facturación"
    Y estando en Facturación, se le imputan 2 exámenes de laboratorio que quedan pendientes de resultado
    Y además se solicitaron 3 exámenes adicionales que ya tienen resultado pero NO han sido imputados
    Cuando el Job de Laboratorio ejecuta su evaluación periódica
    Entonces el Job debe detectar que existen pendientes de laboratorio
    Y el encuentro debe permanecer en la bandeja "Facturación"
    Y el encuentro NO debe devolverse a Admisión

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Escenario: JOBL-07 - Encuentro con solo un tipo de pendiente permanece en Facturación
    Dado que el encuentro "87654321" está en la bandeja "Facturación"
    Y estando en Facturación, se le imputa 1 examen de laboratorio que queda pendiente de resultado
    Y el encuentro NO tiene otros exámenes con resultado no imputados
    Cuando el Job de Laboratorio ejecuta su evaluación periódica
    Entonces el Job debe detectar que existe al menos un pendiente de laboratorio
    Y el encuentro debe permanecer en la bandeja "Facturación"

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Escenario: JOBL-08 - Encuentro con solo el otro tipo de pendiente permanece en Facturación
    Dado que el encuentro "11223344" está en la bandeja "Facturación"
    Y estando en Facturación, se solicitaron 2 exámenes de laboratorio
    Y los 2 exámenes ya tienen resultado pero NO han sido imputados al encuentro
    Y el encuentro NO tiene otros exámenes pendientes de resultado
    Cuando el Job de Laboratorio ejecuta su evaluación periódica
    Entonces el Job debe detectar que existe al menos un pendiente de laboratorio
    Y el encuentro debe permanecer en la bandeja "Facturación"

  # ========================================================================
  # ENCUENTROS SIN EXÁMENES DE LABORATORIO
  # ========================================================================

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Escenario: JOBL-09 - Encuentro sin exámenes de laboratorio asociados vuelve a Admisión
    Dado que el encuentro "99887766" está en la bandeja "Facturación"
    Y el encuentro NO tiene exámenes de laboratorio asociados desde el inicio
    Y el encuentro NO tiene exámenes imputados pendientes de resultado
    Y el encuentro NO tiene exámenes con resultado no imputados
    Cuando el Job de Laboratorio ejecuta su evaluación periódica
    Entonces el Job debe detectar que NO hay exámenes de laboratorio pendientes
    Y el Job debe reclasificar el encuentro para "Admisión"
    Y el encuentro debe aparecer en la bandeja "Lista de Encuentros"

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Escenario: JOBL-10 - Encuentro con laboratorios completados vuelve a Admisión
    Dado que el encuentro "55443322" está en la bandeja "Facturación"
    Y estando en Facturación, se le solicitaron 5 exámenes de laboratorio
    Y con el tiempo, todos los exámenes recibieron resultado del laboratorio
    Y todos los resultados fueron imputados al encuentro
    Cuando el Job de Laboratorio ejecuta su evaluación periódica
    Entonces el Job debe detectar que todos los laboratorios están completados
    Y el Job debe reclasificar el encuentro para "Admisión"
    Y el encuentro debe aparecer en la bandeja "Lista de Encuentros"

  # ========================================================================
  # FLUJO IDA Y VUELTA ENTRE FACTURACIÓN Y ADMISIÓN
  # ========================================================================

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Escenario: JOBL-11 - Encuentro puede ir y volver entre Facturación y Admisión múltiples veces
    Dado que el encuentro "12345678" está inicialmente en la bandeja "Facturación"
    Y estando en Facturación, se le solicitaron 2 exámenes de laboratorio pendientes de resultado
    Cuando el Job de Laboratorio ejecuta su primera evaluación
    Entonces el encuentro debe permanecer en la bandeja "Facturación"
    Cuando con el tiempo, se completan los 2 exámenes (resultado e imputación)
    Y el Job de Laboratorio ejecuta su segunda evaluación
    Entonces el encuentro debe retornar a la bandeja "Lista de Encuentros"
    Cuando el Job de Admisión detecta que el encuentro debe volver a Facturación
    Y el encuentro regresa a la bandeja "Facturación"
    Y estando nuevamente en Facturación, se solicitan 3 nuevos exámenes de laboratorio
    Y los 3 exámenes quedan pendientes de resultado
    Y el Job de Laboratorio ejecuta su tercera evaluación
    Entonces el encuentro debe permanecer en la bandeja "Facturación"
    Y el encuentro puede moverse entre bandejas múltiples veces según las condiciones

  # ========================================================================
  # CLASIFICACIÓN REALIZADA POR RESPONSABLE DE FACTURACIÓN
  # ========================================================================

  @autoP0 @prioridadExtrema @responsableFacturacion @happyPath
  Escenario: JOBL-12 - Responsable clasifica encuentro y Job evalúa independientemente
    Dado que soy un usuario con rol "Responsable de Facturación"
    Y el encuentro "12345678" está en estado "Por asignar"
    Y el encuentro está en la bandeja "Facturación"
    Cuando clasifico el encuentro a estado "Por facturar"
    Y el encuentro NO tiene exámenes de laboratorio pendientes
    Y el Job de Laboratorio ejecuta su evaluación periódica
    Entonces el Job debe devolver el encuentro a Admisión
    Y el estado "Por facturar" debe mantenerse
    Y la clasificación del Responsable NO impide la devolución por el Job

  @autoP0 @prioridadExtrema @responsableFacturacion @happyPath
  Escenario: JOBL-13 - Responsable clasifica a múltiples estados pero Job evalúa igual
    Dado que soy un usuario con rol "Responsable de Facturación"
    Y el encuentro "12345678" está en la bandeja "Facturación"
    Y clasifico el encuentro a estado "Asignado" el día 1
    Y clasifico el encuentro a estado "En revisión" el día 2
    Y clasifico el encuentro a estado "Regularizado" el día 3
    Y el encuentro NO tiene exámenes de laboratorio pendientes
    Cuando el Job de Laboratorio ejecuta su evaluación periódica
    Entonces el Job debe devolver el encuentro a Admisión
    Y el estado "Regularizado" debe mantenerse
    Y el historial de cambios de estado debe conservarse

  # ========================================================================
  # ESTADOS ESPECIALES DE FACTURACIÓN
  # ========================================================================

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Escenario: JOBL-14 - Encuentro en estado No Facturable también puede devolverse
    Dado que el encuentro "12345678" está en la bandeja "Facturación"
    Y el encuentro tiene estado de clasificación "No facturable"
    Y el encuentro NO tiene exámenes de laboratorio pendientes
    Cuando el Job de Laboratorio ejecuta su evaluación periódica
    Entonces el Job debe reclasificar el encuentro para "Admisión"
    Y el encuentro debe aparecer en la bandeja "Lista de Encuentros"
    Y el estado "No facturable" debe mantenerse

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Escenario: JOBL-15 - Encuentro en estado Error de Facturación también puede devolverse
    Dado que el encuentro "87654321" está en la bandeja "Facturación"
    Y el encuentro tiene estado de clasificación "Error de facturación"
    Y el encuentro NO tiene exámenes de laboratorio pendientes
    Cuando el Job de Laboratorio ejecuta su evaluación periódica
    Entonces el Job debe reclasificar el encuentro para "Admisión"
    Y el encuentro debe aparecer en la bandeja "Lista de Encuentros"
    Y el estado "Error de facturación" debe mantenerse

  # ========================================================================
  # TRAZABILIDAD Y VISIBILIDAD
  # ========================================================================

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Escenario: JOBL-16 - Usuarios pueden identificar encuentros con laboratorios pendientes
    Dado que soy un usuario con rol "Responsable de Facturación"
    Y el encuentro "12345678" está en la bandeja "Facturación"
    Y estando en Facturación, se le solicitaron 3 exámenes de laboratorio
    Y los 3 exámenes quedan pendientes de resultado
    Cuando visualizo los detalles del encuentro
    Entonces debo poder ver que el encuentro tiene laboratorios pendientes
    Y debe mostrarse la cantidad de exámenes pendientes
    Y debe mostrarse el tipo de pendiente:
      | Tipo de Pendiente                         |
      | Exámenes imputados sin resultado          |
      | Exámenes con resultado no imputados       |

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Escenario: JOBL-17 - Sistema registra devoluciones realizadas por Job de Laboratorio
    Dado que el encuentro "12345678" está en la bandeja "Facturación"
    Y el encuentro NO tiene exámenes de laboratorio pendientes
    Cuando el Job de Laboratorio ejecuta su evaluación y devuelve el encuentro
    Y accedo al historial del encuentro
    Entonces debe existir un registro de la devolución
    Y el registro debe indicar "Devuelto a Admisión por Job de Laboratorio"
    Y debe mostrarse la fecha y hora de la devolución
    Y debe indicarse el motivo "Sin exámenes de laboratorio pendientes"

  @autoP0 @prioridadExtrema @superusuarioAdmision @gestorTA @happyPath
  Escenario: JOBL-18 - Usuarios de Admisión visualizan encuentros devueltos por Job de Laboratorio
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y el encuentro "12345678" fue devuelto de Facturación a Admisión por el Job de Laboratorio
    Cuando accedo a la pantalla "Lista de Encuentros"
    Entonces debo visualizar el encuentro "12345678"
    Y el encuentro debe mostrar un indicador de que fue devuelto desde Facturación
    Y puedo acceder al detalle para ver el motivo de la devolución

  # ========================================================================
  # EVALUACIÓN PERIÓDICA Y FRECUENCIA
  # ========================================================================

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Escenario: JOBL-19 - Job de Laboratorio evalúa periódicamente todos los encuentros
    Dado que existen 1000 encuentros en la bandeja "Facturación"
    Y a 300 de esos encuentros se les solicitaron exámenes de laboratorio que están pendientes
    Y 700 encuentros NO tienen exámenes de laboratorio pendientes
    Cuando el Job de Laboratorio ejecuta su evaluación periódica
    Entonces el Job debe evaluar los 1000 encuentros
    Y los 300 encuentros con laboratorios pendientes deben permanecer en Facturación
    Y los 700 encuentros sin laboratorios pendientes deben devolverse a Admisión
    Y la evaluación debe completarse exitosamente

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Escenario: JOBL-20 - Job no devuelve encuentros recién clasificados inmediatamente
    Dado que el encuentro "12345678" acaba de ser clasificado para Facturación
    Y el encuentro ingresó a "Lista de encuentros para asignar" hace 5 minutos
    Y el encuentro NO tiene exámenes de laboratorio pendientes
    Cuando el Job de Laboratorio ejecuta su evaluación
    Entonces el Job debe aplicar las mismas reglas de evaluación
    Y si no tiene laboratorios pendientes, debe devolverse a Admisión
    Y NO debe haber tiempo mínimo de permanencia en Facturación

  # ========================================================================
  # CASOS EDGE Y VALIDACIONES
  # ========================================================================

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Escenario: JOBL-21 - Job maneja correctamente encuentros con laboratorios cancelados
    Dado que el encuentro "12345678" está en la bandeja "Facturación"
    Y estando en Facturación, se le solicitaron 5 exámenes de laboratorio
    Y posteriormente 3 de esos exámenes fueron cancelados
    Y los 2 exámenes restantes están pendientes de resultado
    Cuando el Job de Laboratorio ejecuta su evaluación periódica
    Entonces el Job debe detectar que existen 2 exámenes pendientes
    Y el encuentro debe permanecer en la bandeja "Facturación"
    Y los exámenes cancelados NO deben considerarse como pendientes

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Escenario: JOBL-22 - Job diferencia entre exámenes de laboratorio y otros tipos de exámenes
    Dado que el encuentro "12345678" está en la bandeja "Facturación"
    Y estando en Facturación, se le solicitaron 2 exámenes de laboratorio que ya fueron completados
    Y además se le solicitaron 3 exámenes de imágenes que están pendientes
    Y el encuentro NO tiene exámenes de laboratorio pendientes
    Cuando el Job de Laboratorio ejecuta su evaluación periódica
    Entonces el Job debe evaluar únicamente exámenes de laboratorio
    Y el Job debe ignorar los exámenes de imágenes
    Y el Job debe devolver el encuentro a Admisión
    Y los exámenes de imágenes NO deben impedir la devolución

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Escenario: JOBL-23 - Encuentro con laboratorios externos también se evalúa
    Dado que el encuentro "12345678" está en la bandeja "Facturación"
    Y estando en Facturación, se le solicitaron 2 exámenes a un laboratorio externo
    Y los 2 exámenes externos están pendientes de resultado
    Cuando el Job de Laboratorio ejecuta su evaluación periódica
    Entonces el Job debe detectar que existen exámenes pendientes
    Y el encuentro debe permanecer en la bandeja "Facturación"
    Y los exámenes de laboratorio externo deben evaluarse igual que los internos

  # ========================================================================
  # PERFORMANCE Y ESCALABILIDAD
  # ========================================================================

  @autoP0 @prioridadExtrema @responsableFacturacion @gestorTA @happyPath
  Escenario: JOBL-24 - Job procesa grandes volúmenes de encuentros eficientemente
    Dado que existen 10000 encuentros en la bandeja "Facturación"
    Cuando el Job de Laboratorio ejecuta su evaluación periódica
    Entonces el Job debe completar la evaluación en un tiempo razonable
    Y el Job debe procesar todos los encuentros sin errores
    Y el sistema debe mantener su rendimiento durante la ejecución del Job
    Y los usuarios deben poder seguir trabajando mientras el Job se ejecuta
