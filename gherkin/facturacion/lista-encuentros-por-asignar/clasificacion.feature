# language: es

Característica: Clasificación de Encuentros en Lista para Asignar
  Como Responsable de Facturación
  Quiero clasificar encuentros según su estado de facturación
  Para organizar y priorizar el trabajo de facturación

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación"
    Y he accedido a la bandeja "Lista de encuentros para asignar"

  # ========================================================================
  # TÉCNICA: PARTICIÓN DE EQUIVALENCIA - CLASIFICACIONES VÁLIDAS
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @happyPath
  Esquema del escenario: CLAS-01 - Clasificar encuentro exitosamente
    Dado que existen encuentros sin clasificación
    Y he seleccionado un encuentro sin clasificación
    Y he seleccionado el botón "Clasificar"
    Y se ha abierto el modal de clasificación
    Y el modal muestra el título "Cambiar clasificación de 1 encuentro seleccionado"
    Cuando selecciono la clasificación "<clasificacion>" del dropdown
    Y selecciono el botón "Clasificar" del modal
    Entonces se debe procesar correctamente la clasificación
    Y el encuentro debe cambiar a la clasificación "<clasificacion>"
    Y debe mostrarse un mensaje de confirmación "Encuentro clasificado exitosamente"
    Y la columna "Clasific." debe mostrar "<clasificacion_abreviada>"

    Ejemplos:
      | clasificacion              | clasificacion_abreviada |
      | Facturar con hospitalario  | Fact. Hosp.            |
      | Imp Fact Fin               | Imp Fact Fin           |
      | Imp Por Liq Fin His        | Imp Liq Fin            |
      | Pendiente en consulta      | Pend. Consulta         |
      | Pendiente por convenio     | Pend. Convenio         |
      | No Facturar                | No Fact.               |
      | Por Asignar                | Por Asignar            |
      | No facturar farmacia       | No Fact. Farm.         |
      | No facturar admisión       | No Fact. Adm.          |

  @prioridadExtrema @responsableFacturacion @happyPath
  Esquema del escenario: CLAS-02 - Reclasificar encuentro con clasificación existente
    Dado que existe un encuentro con clasificación "<clasificacion_actual>"
    Y he seleccionado el encuentro
    Y he seleccionado el botón "Clasificar"
    Y se ha abierto el modal de clasificación
    Y el modal muestra el título "Cambiar clasificación de 1 encuentro seleccionado"
    Cuando selecciono la clasificación "<nueva_clasificacion>" del dropdown
    Y selecciono el botón "Clasificar" del modal
    Entonces se debe procesar correctamente la reclasificación
    Y el encuentro debe cambiar de "<clasificacion_actual>" a "<nueva_clasificacion>"
    Y debe mostrarse un mensaje de confirmación "Encuentro reclasificado exitosamente"

    Ejemplos:
      | clasificacion_actual       | nueva_clasificacion        |
      | Por Asignar                | Facturar con hospitalario  |
      | Pendiente en consulta      | No Facturar                |
      | No facturar farmacia       | Por Asignar                |
      | Pendiente por convenio     | Imp Fact Fin               |

  # ========================================================================
  # TÉCNICA: CLASIFICACIÓN MASIVA
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @happyPath
  Escenario: CLAS-03 - Clasificar múltiples encuentros a la vez
    Dado que existen 5 encuentros sin clasificación
    Y he seleccionado 5 encuentros
    Y he seleccionado el botón "Clasificar"
    Y se ha abierto el modal de clasificación
    Y el modal muestra el título "Cambiar clasificación de 5 encuentros seleccionados"
    Cuando selecciono la clasificación "Por Asignar" del dropdown
    Y selecciono el botón "Clasificar" del modal
    Entonces se deben clasificar los 5 encuentros como "Por Asignar"
    Y debe mostrarse un mensaje de confirmación "5 encuentros clasificados exitosamente"
    Y todos los encuentros deben mostrar "Por Asignar" en la columna "Clasific."

  @prioridadExtrema @responsableFacturacion @happyPath
  Escenario: CLAS-04 - Clasificar encuentros de diferentes clasificaciones actuales
    Dado que he seleccionado 2 encuentros con clasificación "Pendiente en consulta"
    Y he seleccionado 3 encuentros con clasificación "Por Asignar"
    Y he seleccionado el botón "Clasificar"
    Y se ha abierto el modal de clasificación
    Y el modal muestra el título "Cambiar clasificación de 5 encuentros seleccionados"
    Cuando selecciono la clasificación "No Facturar" del dropdown
    Y selecciono el botón "Clasificar" del modal
    Entonces se deben reclasificar los 5 encuentros a "No Facturar"
    Y debe mostrarse un mensaje de confirmación "5 encuentros reclasificados exitosamente"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE MODAL DE CLASIFICACIÓN
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @happyPath
  Esquema del escenario: CLAS-05A - Validar título dinámico del modal según cantidad de encuentros seleccionados
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen encuentros para clasificar
    Cuando selecciono <cantidad> encuentros
    Y selecciono el botón "Clasificar"
    Entonces debe abrirse el modal de clasificación
    Y debe mostrarse el título "Cambiar clasificación de <cantidad> <texto> seleccionado<plural>"

    Ejemplos:
      | cantidad | texto      | plural |
      | 1        | encuentro  |        |
      | 5        | encuentros | s      |
      | 10       | encuentros | s      |
      | 50       | encuentros | s      |

  @prioridadExtrema @responsableFacturacion @happyPath
  Escenario: CLAS-05 - Visualizar opciones de clasificación en modal
    Dado que he seleccionado un encuentro
    Cuando selecciono el botón "Clasificar"
    Entonces debe abrirse el modal de clasificación
    Y debe mostrarse el título "Cambiar clasificación de 1 encuentro seleccionado"
    Y debe mostrarse el dropdown "Selecciona una opción"
    Y debe mostrarse el texto "*Campos obligatorios"
    Y el dropdown debe contener todas las clasificaciones disponibles:
      | Clasificación              |
      | Facturar con hospitalario  |
      | Imp Fact Fin               |
      | Imp Por Liq Fin His        |
      | Pendiente en consulta      |
      | Pendiente por convenio     |
      | No Facturar                |
      | Por Asignar                |
      | No facturar farmacia       |
      | No facturar admisión       |
    Y debe mostrarse el botón "Clasificar" deshabilitado
    Y debe mostrarse el botón "Cancelar" habilitado

  @prioridadExtrema @responsableFacturacion @happyPath
  Escenario: CLAS-06 - Habilitar botón Clasificar al seleccionar clasificación del dropdown
    Dado que he seleccionado un encuentro
    Y he abierto el modal de clasificación
    Y el botón "Clasificar" está deshabilitado
    Cuando selecciono la clasificación "Por Asignar" del dropdown
    Entonces el botón "Clasificar" debe habilitarse
    Y la clasificación "Por Asignar" debe estar seleccionada en el dropdown

  @prioridadExtrema @responsableFacturacion @happyPath
  Escenario: CLAS-07 - Cancelar clasificación de encuentro
    Dado que he seleccionado un encuentro con clasificación "Pendiente en consulta"
    Y he abierto el modal de clasificación
    Y he seleccionado la clasificación "No Facturar"
    Cuando selecciono el botón "Cancelar"
    Entonces el modal debe cerrarse
    Y el encuentro debe mantener su clasificación original "Pendiente en consulta"
    Y NO debe procesarse ningún cambio de clasificación

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE REGLAS DE NEGOCIO
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @happyPath
  Escenario: CLAS-08 - Validar que clasificación persiste después de cerrar modal
    Dado que he clasificado un encuentro como "Facturar con hospitalario"
    Y he cerrado el modal de clasificación
    Cuando refresco la página
    Y vuelvo a acceder a la bandeja "Lista de encuentros para asignar"
    Entonces el encuentro debe seguir mostrando "Facturar con hospitalario" en la columna "Clasific."
    Y la clasificación debe estar guardada en el sistema

  @prioridadExtrema @responsableFacturacion @happyPath
  Escenario: CLAS-09 - Clasificar encuentro como "Por Asignar" permite asignación posterior
    Dado que he clasificado un encuentro como "Por Asignar"
    Y el encuentro está en estado "Por asignar"
    Cuando deselecciono el encuentro
    Y vuelvo a seleccionarlo
    Entonces el botón "Asignar" debe estar habilitado
    Y debo poder asignar el encuentro a un ejecutivo de facturación

  @prioridadExtrema @responsableFacturacion @unhappyPath
  Escenario: CLAS-10 - Clasificar encuentro como "No Facturar" impide asignación
    Dado que he clasificado un encuentro como "No Facturar"
    Cuando deselecciono el encuentro
    Y vuelvo a seleccionarlo
    Entonces el botón "Asignar" debe permanecer deshabilitado
    Y NO debo poder asignar el encuentro a ningún ejecutivo

  # ========================================================================
  # TÉCNICA: CASOS EDGE - SITUACIONES ESPECIALES
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @unhappyPath
  Escenario: CLAS-11 - Clasificar encuentro ya asignado a ejecutivo
    Dado que existe un encuentro asignado al "Ejecutivo A"
    Y el encuentro fue devuelto a la bandeja "Lista de encuentros para asignar"
    Y he seleccionado el encuentro
    Cuando clasifico el encuentro como "No Facturar"
    Entonces se debe procesar correctamente la clasificación
    Y el encuentro NO debe volver a asignarse automáticamente al "Ejecutivo A"
    Y debe permanecer en la bandeja "Lista de encuentros para asignar"

  @prioridadExtrema @responsableFacturacion @happyPath
  Escenario: CLAS-12 - Validar historial de clasificaciones
    Dado que un encuentro ha sido clasificado 3 veces:
      | Clasificación anterior     | Clasificación nueva        |
      | Sin clasificación          | Por Asignar                |
      | Por Asignar                | Pendiente en consulta      |
      | Pendiente en consulta      | No Facturar                |
    Cuando accedo al historial del encuentro
    Entonces debe mostrarse el registro de las 3 clasificaciones
    Y cada clasificación debe mostrar fecha, hora y usuario que la realizó
    Y la clasificación actual debe ser "No Facturar"

  @prioridadExtrema @responsableFacturacion @unhappyPath
  Escenario: CLAS-13 - Deseleccionar encuentro cierra modal de clasificación
    Dado que he seleccionado un encuentro
    Y he abierto el modal de clasificación
    Cuando deselecciono el encuentro desde la grilla
    Entonces el modal de clasificación debe cerrarse automáticamente
    Y NO debe procesarse ninguna clasificación
    Y el botón "Clasificar" debe volver a estado deshabilitado
