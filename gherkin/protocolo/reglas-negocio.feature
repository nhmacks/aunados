# language: es

Característica: Reglas de Negocio de Encuentros en Protocolo
  Como sistema AUNADOS
  Quiero aplicar las reglas de negocio correctamente
  Para clasificar encuentros en protocolo según criterios establecidos

  Antecedentes:
    Dado que el Job de Admisión está ejecutándose
    Y el Job obtiene información desde los sistemas origen

  # ========================================================================
  # TÉCNICA: CONDICIONES PARA ESTAR EN PROTOCOLO
  # ========================================================================

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-01 - Encuentro cumple todas las condiciones para estar en Protocolo
    Dado que existe un encuentro "12345678"
    Y la documentación administrativa está completa
    Y todos los exámenes de laboratorio cuentan con resultado
    Y todos los exámenes de laboratorio están finalizados
    Y todos los exámenes de laboratorio están imputados
    Y el encuentro cumple las reglas de permanencia para Protocolo
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe clasificarse en la bandeja "Protocolo"
    Y el encuentro debe mostrarse en la pantalla "Encuentros en Protocolo"

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-02 - Encuentro con documentación administrativa incompleta NO está en Protocolo
    Dado que existe un encuentro "12345678"
    Y la documentación administrativa está INCOMPLETA
    Y todos los exámenes de laboratorio están completos, finalizados e imputados
    Y el encuentro cumple las reglas de permanencia
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro NO debe clasificarse en "Protocolo"
    Y el encuentro debe permanecer en la bandeja correspondiente de Admisión
    Y el encuentro NO debe mostrarse en la pantalla "Encuentros en Protocolo"

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-03 - Encuentro con laboratorios sin resultado NO está en Protocolo
    Dado que existe un encuentro "12345678"
    Y la documentación administrativa está completa
    Y al menos un examen de laboratorio NO cuenta con resultado
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro NO debe clasificarse en "Protocolo"
    Y el encuentro debe permanecer en Admisión
    Y el encuentro NO debe mostrarse en la pantalla "Encuentros en Protocolo"

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-04 - Encuentro con laboratorios no finalizados NO está en Protocolo
    Dado que existe un encuentro "12345678"
    Y la documentación administrativa está completa
    Y todos los exámenes cuentan con resultado
    Y al menos un examen de laboratorio NO está finalizado
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro NO debe clasificarse en "Protocolo"
    Y el encuentro debe permanecer en Admisión
    Y el encuentro NO debe mostrarse en la pantalla "Encuentros en Protocolo"

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-05 - Encuentro con laboratorios no imputados NO está en Protocolo
    Dado que existe un encuentro "12345678"
    Y la documentación administrativa está completa
    Y todos los exámenes cuentan con resultado y están finalizados
    Y al menos un examen de laboratorio NO está imputado
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro NO debe clasificarse en "Protocolo"
    Y el encuentro debe permanecer en Admisión
    Y el encuentro NO debe mostrarse en la pantalla "Encuentros en Protocolo"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ESTADO IMPUTADO VS CITADO
  # ========================================================================

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-05A - Encuentro con laboratorios citados NO está en Protocolo
    Dado que existe un encuentro "12345678"
    Y la documentación administrativa está completa
    Y todos los exámenes de laboratorio cuentan con resultado y están finalizados
    Y al menos un examen de laboratorio está en estado "Citado"
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro NO debe clasificarse en "Protocolo"
    Y el encuentro debe permanecer en Admisión
    Y el examen citado debe ser imputado antes de poder pasar a Protocolo

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-05B - Encuentro con todos los laboratorios imputados SÍ puede estar en Protocolo
    Dado que existe un encuentro "12345678"
    Y la documentación administrativa está completa
    Y todos los exámenes de laboratorio cuentan con resultado y están finalizados
    Y todos los exámenes de laboratorio están en estado "Imputado"
    Y NO hay exámenes en estado "Citado"
    Y el encuentro cumple la regla de antigüedad
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe clasificarse en "Protocolo"

  @prioridadExtrema @jobAdmision @unhappyPath
  Esquema del escenario: RN-05C - Validar estado de exámenes de laboratorio
    Dado que existe un encuentro con todas las demás condiciones cumplidas
    Y el encuentro tiene "<total>" exámenes de laboratorio
    Y "<imputados>" exámenes están en estado "Imputado"
    Y "<citados>" exámenes están en estado "Citado"
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe clasificarse en "<bandeja_destino>"

    Ejemplos:
      | total | imputados | citados | bandeja_destino |
      | 5     | 5         | 0       | Protocolo       |
      | 5     | 4         | 1       | Admisión        |
      | 5     | 3         | 2       | Admisión        |
      | 5     | 0         | 5       | Admisión        |
      | 1     | 1         | 0       | Protocolo       |
      | 1     | 0         | 1       | Admisión        |

  # ========================================================================
  # TÉCNICA: TABLA DE DECISIÓN - COMBINACIONES DE CONDICIONES
  # ========================================================================

  @prioridadExtrema @jobAdmision @unhappyPath
  Esquema del escenario: RN-06 - Evaluación de condiciones para clasificar en Protocolo
    Dado que existe un encuentro con las siguientes características:
      | Condición                        | Estado                        |
      | Documentación administrativa     | <doc_admin>                   |
      | Laboratorios con resultado       | <lab_resultado>               |
      | Laboratorios finalizados         | <lab_finalizado>              |
      | Laboratorios imputados           | <lab_imputado>                |
      | Cumple reglas de permanencia     | <permanencia>                 |
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe clasificarse en "<bandeja_destino>"
    Y debe mostrarse en la pantalla "<pantalla_visible>"

    Ejemplos:
      | doc_admin | lab_resultado | lab_finalizado | lab_imputado | permanencia | bandeja_destino | pantalla_visible              |
      | Completa  | Sí            | Sí             | Sí           | Sí          | Protocolo       | Encuentros en Protocolo       |
      | Incompleta| Sí            | Sí             | Sí           | Sí          | Admisión        | Lista de Encuentros (Admisión)|
      | Completa  | No            | Sí             | Sí           | Sí          | Admisión        | Lista de Encuentros (Admisión)|
      | Completa  | Sí            | No             | Sí           | Sí          | Admisión        | Lista de Encuentros (Admisión)|
      | Completa  | Sí            | Sí             | No           | Sí          | Admisión        | Lista de Encuentros (Admisión)|
      | Completa  | Sí            | Sí             | Sí           | No          | Admisión        | Lista de Encuentros (Admisión)|

  # ========================================================================
  # TÉCNICA: REGLAS DE RECLASIFICACIÓN - PASO A FACTURACIÓN
  # ========================================================================

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-07 - Encuentro en Protocolo pasa a Facturación al superar período máximo
    Dado que un encuentro está clasificado en "Protocolo"
    Y mantiene documentación administrativa completa
    Y mantiene laboratorios completos
    Y mantiene laboratorios finalizados
    Y mantiene laboratorios imputados
    Y supera el período máximo permitido para permanecer en Protocolo
    Cuando el Job de Admisión evalúa nuevamente el encuentro
    Entonces el encuentro debe abandonar la bandeja "Protocolo"
    Y el encuentro debe pasar a la bandeja "Facturación"
    Y el encuentro debe desaparecer de la pantalla "Encuentros en Protocolo"

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-08 - Encuentro permanece en Protocolo si no supera el período
    Dado que un encuentro está en "Protocolo"
    Y mantiene todas las condiciones requeridas
    Y NO ha superado el período máximo de permanencia
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe permanecer en "Protocolo"
    Y el encuentro debe seguir visible en la pantalla "Encuentros en Protocolo"

  # ========================================================================
  # TÉCNICA: REGLAS DE RETORNO - REGRESO A ADMISIÓN
  # ========================================================================

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-09 - Encuentro regresa a Admisión por documentación administrativa pendiente
    Dado que un encuentro está clasificado en "Protocolo"
    Y durante una nueva evaluación la documentación administrativa queda INCOMPLETA
    Cuando el Job de Admisión detecta el cambio
    Entonces el encuentro debe abandonar "Protocolo"
    Y el encuentro debe regresar a la bandeja de "Admisión"
    Y el encuentro debe desaparecer de la pantalla "Encuentros en Protocolo"

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-10 - Encuentro regresa a Admisión por laboratorios pendientes
    Dado que un encuentro está en "Protocolo"
    Y durante una nueva evaluación un laboratorio queda sin resultado
    Cuando el Job de Admisión detecta el cambio
    Entonces el encuentro debe abandonar "Protocolo"
    Y el encuentro debe regresar a "Admisión"
    Y el encuentro debe desaparecer de la pantalla "Encuentros en Protocolo"

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-11 - Encuentro regresa a Admisión por laboratorios no imputados
    Dado que un encuentro está en "Protocolo"
    Y durante una nueva evaluación un laboratorio queda NO imputado
    Cuando el Job de Admisión detecta el cambio
    Entonces el encuentro debe abandonar "Protocolo"
    Y el encuentro debe regresar a "Admisión"
    Y el encuentro debe desaparecer de la pantalla "Encuentros en Protocolo"

  @prioridadExtrema @jobAdmision @unhappyPath
  Esquema del escenario: RN-12 - Evaluación continua de encuentros en Protocolo
    Dado que un encuentro está en "Protocolo"
    Y durante una nueva evaluación se detecta que "<condicion_faltante>" deja de cumplirse
    Cuando el Job de Admisión reevalúa el encuentro
    Entonces el encuentro debe regresar a "Admisión"
    Y debe desaparecer de "Encuentros en Protocolo"

    Ejemplos:
      | condicion_faltante                   |
      | Documentación administrativa completa|
      | Laboratorios con resultado           |
      | Laboratorios finalizados             |
      | Laboratorios imputados               |

  # ========================================================================
  # TÉCNICA: RESPONSABILIDAD DEL JOB DE ADMISIÓN
  # ========================================================================

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-13 - La clasificación es responsabilidad exclusiva del Job de Admisión
    Dado que existe un encuentro en el sistema
    Cuando se determina la bandeja correspondiente
    Entonces la clasificación debe ser realizada únicamente por el Job de Admisión
    Y la pantalla "Encuentros en Protocolo" NO debe realizar clasificaciones
    Y el usuario NO debe poder modificar manualmente la clasificación

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-14 - El Job obtiene información desde sistemas origen
    Dado que el Job de Admisión necesita clasificar un encuentro
    Cuando el Job evalúa las condiciones
    Entonces la información debe obtenerse desde los sistemas origen (XHIS, etc.)
    Y NO debe depender de información ingresada manualmente en AUNADOS
    Y la fuente de verdad es el sistema origen

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-15 - El Job evalúa continuamente los encuentros
    Dado que existen encuentros en diferentes bandejas
    Cuando el Job de Admisión se ejecuta periódicamente
    Entonces debe reevaluar todos los encuentros
    Y debe reclasificar aquellos que cambien de estado
    Y debe mantener actualizadas todas las bandejas

  # ========================================================================
  # TÉCNICA: FUENTE DE VERDAD
  # ========================================================================

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-16 - La clasificación NO depende de acciones del usuario
    Dado que un Gestor TA visualiza la pantalla "Encuentros en Protocolo"
    Y el usuario aplica filtros o búsquedas
    Cuando el usuario interactúa con la pantalla
    Entonces la clasificación de los encuentros NO debe modificarse
    Y la ubicación de los encuentros en bandejas NO debe cambiar
    Y solo el Job de Admisión tiene autoridad para reclasificar

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-17 - La pantalla refleja la clasificación del Job, no la determina
    Dado que el Job de Admisión ha clasificado encuentros en "Protocolo"
    Cuando un Gestor TA accede a la pantalla "Encuentros en Protocolo"
    Entonces la pantalla debe mostrar únicamente los encuentros clasificados por el Job
    Y la pantalla NO debe realizar ninguna evaluación adicional
    Y la pantalla es únicamente una vista de los resultados del Job

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE REGLAS DE PERMANENCIA
  # ========================================================================

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-18 - Validar que las reglas de permanencia están correctamente configuradas
    Dado que existen reglas de permanencia definidas para Protocolo
    Cuando el Job de Admisión evalúa un encuentro
    Entonces debe aplicar las reglas de permanencia vigentes
    Y debe calcular correctamente el tiempo de permanencia
    Y debe determinar si el encuentro aún puede permanecer en Protocolo

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-19 - Encuentro cumple todas las condiciones pero no las reglas de permanencia
    Dado que un encuentro tiene:
      - Documentación administrativa completa
      - Laboratorios completos, finalizados e imputados
    Y NO cumple las reglas de permanencia para Protocolo
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro NO debe clasificarse en "Protocolo"
    Y debe clasificarse en la bandeja que corresponda según su estado

  # ========================================================================
  # TÉCNICA: CONSISTENCIA DE DATOS
  # ========================================================================

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-20 - Validar consistencia entre sistemas origen y AUNADOS
    Dado que el Job de Admisión obtiene datos de sistemas origen
    Cuando se detecta una inconsistencia entre sistema origen y AUNADOS
    Entonces el Job debe priorizar la información del sistema origen
    Y debe actualizar AUNADOS con la información correcta
    Y debe reclasificar el encuentro si es necesario

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-21 - Actualización en tiempo real desde sistemas origen
    Dado que un laboratorio cambia de estado en el sistema origen
    Y el cambio afecta la clasificación de un encuentro en "Protocolo"
    Cuando el Job de Admisión ejecuta su siguiente ciclo
    Entonces debe detectar el cambio
    Y debe reclasificar el encuentro inmediatamente
    Y el encuentro debe desaparecer de "Protocolo" si ya no cumple las condiciones

  # ========================================================================
  # TÉCNICA: REGLAS DE ANTIGÜEDAD POR TIPO DE ENCUENTRO
  # ========================================================================

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-22 - Consulta Externa No Oncosalud con menos de 7 días ingresa a Protocolo
    Dado que existe un encuentro tipo "Consulta Externa No Oncosalud"
    Y la documentación administrativa está completa
    Y los laboratorios están completos, finalizados e imputados
    Y el encuentro tiene 3 días desde su creación
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe clasificarse en "Protocolo"
    Y debe permanecer en "Protocolo" hasta superar los 7 días

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-23 - Consulta Externa No Oncosalud con más de 7 días pasa a Facturación
    Dado que existe un encuentro tipo "Consulta Externa No Oncosalud"
    Y la documentación administrativa está completa
    Y los laboratorios están completos, finalizados e imputados
    Y el encuentro tiene 9 días desde su creación
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro NO debe clasificarse en "Protocolo"
    Y el encuentro debe clasificarse en "Facturación"

  @prioridadExtrema @jobAdmision @unhappyPath
  Esquema del escenario: RN-24 - Valores límite de antigüedad para Consulta Externa No Oncosalud
    Dado que existe un encuentro tipo "Consulta Externa No Oncosalud"
    Y cumple todas las condiciones de documentación y laboratorios
    Y el encuentro tiene "<dias>" días desde su creación
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe clasificarse en "<bandeja_destino>"

    Ejemplos:
      | dias | bandeja_destino |
      | 1    | Protocolo       |
      | 3    | Protocolo       |
      | 6    | Protocolo       |
      | 7    | Protocolo       |
      | 8    | Facturación     |
      | 10   | Facturación     |

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-25 - Consulta Externa Oncosalud con 31 días o menos ingresa a Protocolo
    Dado que existe un encuentro tipo "Consulta Externa Oncosalud"
    Y la documentación administrativa está completa
    Y los laboratorios están completos, finalizados e imputados
    Y el encuentro tiene 20 días desde su creación
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe clasificarse en "Protocolo"
    Y debe permanecer en "Protocolo" hasta superar los 31 días

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-26 - Consulta Externa Oncosalud con más de 31 días pasa a Facturación
    Dado que existe un encuentro tipo "Consulta Externa Oncosalud"
    Y la documentación administrativa está completa
    Y los laboratorios están completos, finalizados e imputados
    Y el encuentro tiene 35 días desde su creación
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro NO debe clasificarse en "Protocolo"
    Y el encuentro debe clasificarse en "Facturación"

  @prioridadExtrema @jobAdmision @unhappyPath
  Esquema del escenario: RN-27 - Valores límite de antigüedad para Consulta Externa Oncosalud
    Dado que existe un encuentro tipo "Consulta Externa Oncosalud"
    Y cumple todas las condiciones de documentación y laboratorios
    Y el encuentro tiene "<dias>" días desde su creación
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe clasificarse en "<bandeja_destino>"

    Ejemplos:
      | dias | bandeja_destino |
      | 1    | Protocolo       |
      | 15   | Protocolo       |
      | 30   | Protocolo       |
      | 31   | Protocolo       |
      | 32   | Facturación     |
      | 45   | Facturación     |

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-28 - Emergencia con 2 días o menos ingresa a Protocolo
    Dado que existe un encuentro tipo "Emergencia"
    Y la documentación administrativa está completa
    Y los laboratorios están completos, finalizados e imputados
    Y el encuentro tiene 1 día desde su creación
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe clasificarse en "Protocolo"
    Y debe permanecer en "Protocolo" hasta superar los 2 días

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-29 - Emergencia con más de 2 días pasa a Facturación
    Dado que existe un encuentro tipo "Emergencia"
    Y la documentación administrativa está completa
    Y los laboratorios están completos, finalizados e imputados
    Y el encuentro tiene 4 días desde su creación
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro NO debe clasificarse en "Protocolo"
    Y el encuentro debe clasificarse en "Facturación"

  @prioridadExtrema @jobAdmision @unhappyPath
  Esquema del escenario: RN-30 - Valores límite de antigüedad para Emergencia
    Dado que existe un encuentro tipo "Emergencia"
    Y cumple todas las condiciones de documentación y laboratorios
    Y el encuentro tiene "<dias>" días desde su creación
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe clasificarse en "<bandeja_destino>"

    Ejemplos:
      | dias | bandeja_destino |
      | 1    | Protocolo       |
      | 2    | Protocolo       |
      | 3    | Facturación     |
      | 5    | Facturación     |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE SUSTENTOS ADMINISTRATIVOS
  # ========================================================================

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-31 - Encuentro con sustentos administrativos pendientes NO ingresa a Protocolo
    Dado que existe un encuentro "12345678"
    Y la documentación administrativa está incompleta
    Y existen sustentos administrativos pendientes
    Y los laboratorios están completos, finalizados e imputados
    Y el encuentro cumple la regla de antigüedad
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro NO debe clasificarse en "Protocolo"
    Y el encuentro debe permanecer en "Admisión"

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-32 - Encuentro con sustentos médicos pendientes NO ingresa a Protocolo
    Dado que existe un encuentro "12345678"
    Y la documentación administrativa está completa
    Y existen sustentos médicos pendientes
    Y los laboratorios están completos, finalizados e imputados
    Y el encuentro cumple la regla de antigüedad
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro NO debe clasificarse en "Protocolo"
    Y el encuentro debe permanecer en "Admisión"

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-33 - Encuentro sin laboratorios pendientes cumple requisito de sustentos médicos
    Dado que existe un encuentro "12345678"
    Y la documentación administrativa está completa
    Y NO existen laboratorios pendientes
    Y todos los laboratorios están finalizados e imputados
    Y el encuentro cumple la regla de antigüedad
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe cumplir el requisito de sustentos médicos
    Y debe clasificarse en "Protocolo"

  # ========================================================================
  # TÉCNICA: PRINCIPIOS FUNCIONALES
  # ========================================================================

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-34 - PF-PRO-01 - Protocolo NO corrige documentación administrativa
    Dado que un encuentro está clasificado en "Protocolo"
    Y durante la reevaluación se detecta que falta documentación administrativa
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe regresar a "Admisión"
    Y Protocolo NO debe intentar corregir la documentación administrativa
    Y la corrección debe realizarse en Admisión

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-35 - PF-PRO-02 - Protocolo NO corrige sustentos médicos
    Dado que un encuentro está clasificado en "Protocolo"
    Y durante la reevaluación se detecta que faltan sustentos médicos
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe regresar a "Admisión"
    Y Protocolo NO debe intentar corregir los sustentos médicos
    Y la corrección debe realizarse en Admisión

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-36 - PF-PRO-03 - Protocolo NO corrige laboratorios no imputados
    Dado que un encuentro está clasificado en "Protocolo"
    Y durante la reevaluación se detecta que hay laboratorios citados (no imputados)
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe regresar a "Admisión"
    Y Protocolo NO debe intentar imputar los laboratorios
    Y los laboratorios citados deben ser imputados en Admisión

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-37 - PF-PRO-04 - Todo encuentro en Protocolo superó validaciones de Admisión
    Dado que un encuentro está clasificado en "Protocolo"
    Cuando se valida el historial del encuentro
    Entonces el encuentro debe haber superado todas las validaciones de Admisión
    Y debe tener documentación administrativa completa
    Y debe tener sustentos médicos completos
    Y debe tener todos los laboratorios imputados
    Y NO debe haber ingresado a Protocolo sin cumplir estas condiciones

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-38 - PF-PRO-05 - Permanencia en Protocolo depende exclusivamente de antigüedad
    Dado que un encuentro está clasificado en "Protocolo"
    Y mantiene todas las condiciones requeridas (documentación, laboratorios, exámenes imputados)
    Cuando el Job de Admisión evalúa el encuentro
    Entonces la permanencia o salida de Protocolo debe depender únicamente de la antigüedad
    Y NO debe depender de estados operativos
    Y NO debe depender de acciones manuales del usuario

  # ========================================================================
  # TÉCNICA: INDEPENDENCIA ENTRE ESTADOS Y CLASIFICACIÓN
  # ========================================================================

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-39 - Encuentro en Protocolo con estado "Tramitado" permanece hasta cumplir antigüedad
    Dado que un encuentro está clasificado en "Protocolo"
    Y el encuentro tiene estado operativo "Tramitado"
    Y el encuentro aún NO ha superado el período de antigüedad
    Y mantiene todas las condiciones requeridas
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe permanecer en "Protocolo"
    Y el estado "Tramitado" NO debe afectar la clasificación de bandeja
    Y la salida de Protocolo debe determinarse únicamente por antigüedad

  @prioridadExtrema @jobAdmision @happyPath
  Esquema del escenario: RN-40 - Estados operativos son independientes de la clasificación
    Dado que un encuentro está clasificado en "Protocolo"
    Y el encuentro tiene estado operativo "<estado_operativo>"
    Y el encuentro cumple las condiciones de antigüedad para permanecer en Protocolo
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe permanecer en "Protocolo"
    Y el estado operativo NO debe modificar la clasificación de bandeja

    Ejemplos:
      | estado_operativo     |
      | Tramitado            |
      | En revisión          |
      | Pendiente            |
      | Observado            |

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-41 - Cambio de estado operativo NO provoca salida de Protocolo
    Dado que un encuentro está clasificado en "Protocolo"
    Y el encuentro tiene estado operativo "Tramitado"
    Cuando el estado operativo cambia a "En revisión"
    Y el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe permanecer en "Protocolo"
    Y el cambio de estado NO debe provocar reclasificación
    Y únicamente la antigüedad debe determinar la salida de Protocolo

  # ========================================================================
  # TÉCNICA: ESCENARIOS CONCRETOS DE EJEMPLO
  # ========================================================================

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-42 - Ejemplo Concreto: Consulta Externa No Oncosalud - 3 días
    Dado que existe un encuentro tipo "Consulta Externa No Oncosalud"
    Y el encuentro tiene 3 días de antigüedad
    Y la documentación administrativa está completa
    Y los laboratorios están completos
    Y todos los exámenes de laboratorio están imputados
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe clasificarse en "Protocolo"

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-43 - Ejemplo Concreto: Consulta Externa No Oncosalud - 9 días
    Dado que existe un encuentro tipo "Consulta Externa No Oncosalud"
    Y el encuentro tiene 9 días de antigüedad
    Y la documentación administrativa está completa
    Y los laboratorios están completos
    Y todos los exámenes de laboratorio están imputados
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe clasificarse en "Facturación"
    Y NO debe clasificarse en "Protocolo"

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-44 - Ejemplo Concreto: Emergencia - 1 día
    Dado que existe un encuentro tipo "Emergencia"
    Y el encuentro tiene 1 día de antigüedad
    Y la documentación administrativa está completa
    Y los laboratorios están completos
    Y todos los exámenes de laboratorio están imputados
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe clasificarse en "Protocolo"

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-45 - Ejemplo Concreto: Emergencia - 4 días
    Dado que existe un encuentro tipo "Emergencia"
    Y el encuentro tiene 4 días de antigüedad
    Y la documentación administrativa está completa
    Y los laboratorios están completos
    Y todos los exámenes de laboratorio están imputados
    Cuando el Job de Admisión evalúa el encuentro
    Entonces el encuentro debe clasificarse en "Facturación"
    Y NO debe clasificarse en "Protocolo"

  @prioridadExtrema @jobAdmision @happyPath
  Escenario: RN-46 - Validar que Protocolo NO es aprobación manual
    Dado que un encuentro está clasificado en "Protocolo"
    Cuando se valida el proceso de clasificación
    Entonces la clasificación NO debe ser resultado de aprobación manual
    Y la clasificación debe ser determinada automáticamente por el Job de Admisión
    Y el encuentro debe haber cumplido todas las validaciones requeridas
    Y el encuentro debe estar esperando alcanzar la antigüedad necesaria para Facturación

  @prioridadExtrema @jobAdmision @unhappyPath
  Escenario: RN-47 - Ningún usuario puede mover manualmente encuentros hacia Protocolo
    Dado que existe un encuentro en "Admisión"
    Y el encuentro cumple todas las condiciones para Protocolo
    Cuando un usuario intenta mover manualmente el encuentro a "Protocolo"
    Entonces la acción debe ser bloqueada
    Y debe mostrarse un mensaje "La clasificación a Protocolo es responsabilidad del Job de Admisión"
    Y únicamente el Job de Admisión debe poder clasificar encuentros en Protocolo
