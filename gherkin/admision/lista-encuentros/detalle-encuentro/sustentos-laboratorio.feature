# language: es

Característica: Sustentos de Laboratorio en Detalle del Encuentro
  Como usuario del sistema AUNADOS
  Quiero visualizar el estado detallado de los exámenes de laboratorio
  Para tener visibilidad completa de los sustentos médicos y de proceso pendientes

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y estoy en la pantalla "Lista de Encuentros"

  # ========================================================================
  # TÉCNICA: TABLA DE DECISIÓN - COMBINACIONES DE ESTADOS DE LABORATORIO
  # Cobertura: Estados combinados Imputado/No Imputado + Finalizado/Pendiente
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Esquema del escenario: SL-01 - Visualizar encuentro con exámenes de laboratorio en diferentes estados
    Dado que soy un usuario con rol "<rol>"
    Y he accedido al detalle de un encuentro
    Y el encuentro tiene exámenes de laboratorio "<estado_imputacion>" y "<estado_finalizacion>"
    Cuando visualizo la cabecera y los agrupadores de sustentos
    Entonces debo visualizar "<grupo_sustentos_medicos>" el grupo "Sustentos médicos"
    Y debo visualizar "<grupo_sustentos_proceso>" el grupo "Sustentos de proceso"
    Y en "Sustentos médicos" - subgrupo "Laboratorio" debo ver "<examenes_medicos>"
    Y en "Sustentos de proceso" debo ver "<examenes_proceso>"

    Ejemplos:
      | rol                      | estado_imputacion | estado_finalizacion | grupo_sustentos_medicos | grupo_sustentos_proceso | examenes_medicos        | examenes_proceso               |
      | Superusuario de Admisión | Imputados         | Finalizados         | NO                      | NO                      | ningún examen           | ningún examen                  |
      | Gestor de A              | Imputados         | Finalizados         | NO                      | NO                      | ningún examen           | ningún examen                  |
      | Ejecutivo de Admisión    | Imputados         | Finalizados         | NO                      | NO                      | ningún examen           | ningún examen                  |
      | Superusuario de Admisión | Pendientes        | No Imputados        | SÍ                      | NO                      | exámenes con Pendiente  | ningún examen                  |
      | Gestor de A              | Pendientes        | No Imputados        | SÍ                      | NO                      | exámenes con Pendiente  | ningún examen                  |
      | Ejecutivo de Admisión    | Pendientes        | No Imputados        | SÍ                      | NO                      | exámenes con Pendiente  | ningún examen                  |
      | Superusuario de Admisión | Imputados         | No Finalizados      | SÍ                      | SÍ                      | ningún examen           | exámenes No imputado y Sin resultado |
      | Gestor de A              | Imputados         | No Finalizados      | SÍ                      | SÍ                      | ningún examen           | exámenes No imputado y Sin resultado |
      | Ejecutivo de Admisión    | Imputados         | No Finalizados      | SÍ                      | SÍ                      | ningún examen           | exámenes No imputado y Sin resultado |
      | Superusuario de Admisión | No Imputados      | Finalizados         | SÍ                      | SÍ                      | ningún examen           | exámenes con No imputado       |
      | Gestor de A              | No Imputados      | Finalizados         | SÍ                      | SÍ                      | ningún examen           | exámenes con No imputado       |
      | Ejecutivo de Admisión    | No Imputados      | Finalizados         | SÍ                      | SÍ                      | ningún examen           | exámenes con No imputado       |

  # ========================================================================
  # TÉCNICA: VALORES LÍMITE - MÚLTIPLES EXÁMENES EN DIFERENTES ESTADOS
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Esquema del escenario: SL-02 - Visualizar encuentro con múltiples exámenes de laboratorio
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle de un encuentro
    Y el encuentro tiene "<cantidad_examenes>" exámenes de laboratorio pendientes y no imputados
    Cuando visualizo el subgrupo "Laboratorio" en "Sustentos médicos"
    Entonces el subgrupo "Laboratorio" debe listar exactamente "<cantidad_examenes>" exámenes
    Y cada examen debe mostrar el label "Pendiente"
    Y debe mostrarse la sección "Sustentos Médicos Pendientes" en la cabecera

    Ejemplos:
      | cantidad_examenes |
      | 1                 |
      | 5                 |
      | 10                |

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: SL-03 - Visualizar encuentro con combinación de exámenes en múltiples estados
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle de un encuentro
    Y el encuentro tiene los siguientes exámenes de laboratorio:
      | Examen          | Estado Imputación | Estado Finalización |
      | Hemograma       | No Imputado       | Finalizado          |
      | Glucosa         | Imputado          | Finalizado          |
      | Creatinina      | Imputado          | No Finalizado       |
      | Urea            | No Imputado       | No Finalizado          |
    Cuando visualizo los agrupadores de sustentos
    Entonces en "Sustentos médicos" debo ver 1 examen: "Hemograma" con label "Pendiente"
    Y en "Sustentos de proceso" debo ver 2 exámenes: "Creatinina" y "Urea"
    Y "Creatinina" debe mostrar labels "No imputado" y "Sin resultado"
    Y "Urea" debe mostrar label "No imputado"
    Y NO debo ver "Glucosa" en ningún grupo

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE LABELS - ETIQUETAS ESPECÍFICAS POR ESTADO
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: SL-04 - Validar labels en exámenes Pendientes y No Imputados
    Dado que soy un usuario con rol "Gestor de A"
    Y he accedido al detalle de un encuentro
    Y el encuentro tiene exámenes de laboratorio pendientes y no imputados
    Cuando visualizo el subgrupo "Laboratorio" en "Sustentos médicos"
    Entonces cada examen debe mostrar claramente el label "Pendiente"
    Y el label debe ser visible y destacado
    Y NO debe mostrar "Sin resultado" ni "No imputado" en este subgrupo

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: SL-05 - Validar labels en exámenes No Imputados con resultado
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle de un encuentro
    Y el encuentro tiene exámenes de laboratorio no imputados y finalizados
    Cuando visualizo el subgrupo "Sustentos de proceso"
    Entonces cada examen debe mostrar el label "No imputado"
    Y NO debe mostrar "Pendiente"
    Y NO debe mostrar "Sin resultado" (porque tiene resultado finalizado)

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: SL-06 - Validar labels en exámenes Imputados sin resultado
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle de un encuentro
    Y el encuentro tiene exámenes de laboratorio imputados y no finalizados
    Cuando visualizo el subgrupo "Sustentos de proceso"
    Entonces cada examen debe mostrar dos labels:
      | Label          |
      | No imputado    |
      | Sin resultado  |
    Y ambos labels deben ser claramente visibles

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE CONSISTENCIA - LISTA VS DETALLE
  # ========================================================================

  @superusuarioAdmision @gestorTA
  Escenario: SL-07 - Validar consistencia entre columna Sustentos Médicos en lista y detalle
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y estoy en la Lista de Encuentros
    Y un encuentro muestra "Laboratorio" en la columna "Sustentos Médicos"
    Cuando accedo al detalle de ese encuentro
    Entonces debo visualizar el grupo "Sustentos médicos"
    Y el subgrupo "Laboratorio" debe listar al menos un examen pendiente
    Y la información debe ser consistente con lo mostrado en la lista

  @superusuarioAdmision @gestorTA
  Escenario: SL-08 - Validar consistencia entre columna Sustentos de Proceso en lista y detalle
    Dado que soy un usuario con rol "Gestor de A"
    Y estoy en la Lista de Encuentros
    Y un encuentro muestra contenido en la columna "Sustentos de Proceso"
    Cuando accedo al detalle de ese encuentro
    Entonces debo visualizar el grupo "Sustentos de proceso"
    Y debe listar exámenes con estado "No imputado" o "Sin resultado"
    Y la información debe ser consistente con lo mostrado en la lista

  @superusuarioAdmision @gestorTA
  Escenario: SL-09 - Validar que exámenes Imputados y Finalizados NO aparecen en lista ni detalle
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y existe un encuentro con exámenes de laboratorio Imputados y Finalizados
    Cuando visualizo el encuentro en la Lista de Encuentros
    Entonces la columna "Sustentos Médicos" debe estar vacía o mostrar "-"
    Y la columna "Sustentos de Proceso" debe estar vacía o mostrar "-"
    Y al acceder al detalle NO debe mostrar "Sustentos médicos"
    Y NO debe mostrar "Sustentos de proceso"

  # ========================================================================
  # TÉCNICA: PRUEBAS BASADAS EN RIESGO - VALIDACIÓN DE EXPORTACIÓN
  # ========================================================================

  @superusuarioAdmision @gestorTA
  Escenario: SL-10 - Validar que sustentos de laboratorio se exportan correctamente
    Dado que soy un usuario con rol "Gestor de A"
    Y estoy en la Lista de Encuentros
    Y existen encuentros con diferentes estados de laboratorios
    Y estoy visualizando las columnas "Sustentos Médicos" y "Sustentos de Proceso"
    Cuando descargo el listado de encuentros en Excel
    Entonces el archivo debe contener la columna "Sustentos Médicos"
    Y el archivo debe contener la columna "Sustentos de Proceso"
    Y los valores deben coincidir con lo mostrado en la UI
    Y los encuentros con laboratorios imputados y finalizados deben mostrar celdas vacías

  @ejecutivoAdmision
  Escenario: SL-11 - Ejecutivo NO visualiza columna Sustentos de Proceso en exportación
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y estoy en la Lista de Encuentros
    Y he solicitado una exportación asíncrona
    Y el archivo de exportación está listo en la campana de notificaciones
    Cuando descargo el archivo desde la campana
    Entonces el archivo NO debe incluir la columna "Sustentos de Proceso"
    Y debe incluir la columna "Sustentos Médicos" si aplica para mi rol
    Y los valores de sustentos médicos deben coincidir con la UI

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE FILTROS - IMPACTO EN SUSTENTOS
  # ========================================================================

  @superusuarioAdmision @gestorTA
  Escenario: SL-12 - Filtrar por Sustento Médico "Laboratorio" muestra solo encuentros con pendientes
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y existen encuentros con diferentes estados de laboratorios
    Cuando aplico el filtro "Sustento Médico" con valor "Laboratorio"
    Entonces solo debo visualizar encuentros que tengan exámenes en estado "Pendiente y No Imputado"
    Y NO debo visualizar encuentros con exámenes "Imputados y Finalizados"
    Y todos los encuentros mostrados deben tener sustentos médicos de laboratorio pendientes

  @superusuarioAdmision @gestorTA
  Escenario: SL-13 - Filtros aplicados mantienen correcta visualización de sustentos
    Dado que soy un usuario con rol "Gestor de A"
    Y he aplicado el filtro "Estado" con valor "Pendiente"
    Y he aplicado el filtro "Sede" con valor "Auna Guardia Civil"
    Cuando visualizo los resultados filtrados
    Entonces la columna "Sustentos Médicos" debe mostrar valores correctos según el filtro
    Y la columna "Sustentos de Proceso" debe mostrar valores correctos según el filtro
    Y al acceder al detalle de cualquier encuentro la información debe ser consistente

