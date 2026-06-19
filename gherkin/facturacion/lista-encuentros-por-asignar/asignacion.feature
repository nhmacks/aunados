# language: es

Característica: Asignación de Encuentros a Ejecutivos de Facturación
  Como Responsable de Facturación
  Quiero asignar encuentros a ejecutivos de facturación
  Para distribuir la carga de trabajo de facturación

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación"
    Y he accedido a la bandeja "Lista de encuentros para asignar"

  # ========================================================================
  # TÉCNICA: PARTICIÓN DE EQUIVALENCIA - ASIGNACIÓN POR ESTADO
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @happyPath
  Esquema del escenario: ASIG-01 - Asignar encuentro a ejecutivo sin encuentros en su bandeja
    Dado que existe un ejecutivo de facturación sin encuentros asignados
    Y existen encuentros en estado "<estado>"
    Y he seleccionado un encuentro en estado "<estado>"
    Y he seleccionado el botón "Asignar"
    Cuando selecciono un ejecutivo para asignar el encuentro
    Y selecciono el botón "Asignar" en el modal de asignación
    Entonces se debe asignar el encuentro al ejecutivo seleccionado
    Y el encuentro debe desaparecer de mi bandeja "Lista de encuentros para asignar"
    Y debe mostrarse un mensaje de confirmación "Encuentro asignado exitosamente"
    Y el contador de registros debe decrementar en 1

    Ejemplos:
      | estado               |
      | Por asignar          |
      | Error de facturación |
      | No facturable        |
      | Regularizado         |

  @prioridadExtrema @responsableFacturacion @happyPath
  Esquema del escenario: ASIG-02 - Asignar encuentro a ejecutivo que ya tiene encuentros en su bandeja
    Dado que existe un ejecutivo de facturación con encuentros asignados
    Y existen encuentros en estado "<estado>"
    Y he seleccionado un encuentro en estado "<estado>"
    Y he seleccionado el botón "Asignar"
    Cuando selecciono un ejecutivo para asignar el encuentro
    Y selecciono el botón "Asignar" en el modal de asignación
    Entonces se debe asignar el encuentro al ejecutivo seleccionado
    Y el encuentro debe desaparecer de mi bandeja "Lista de encuentros para asignar"
    Y debe mostrarse un mensaje de confirmación "Encuentro asignado exitosamente"
    Y el encuentro debe agregarse a la bandeja del ejecutivo seleccionado
    Y el contador de registros debe decrementar en 1

    Ejemplos:
      | estado               |
      | Por asignar          |
      | Error de facturación |
      | No facturable        |
      | Regularizado         |

  @prioridadExtrema @responsableFacturacion @happyPath
  Esquema del escenario: ASIG-03 - Asignar encuentro a ejecutivo que devolvió encuentros a admisión
    Dado que existe un ejecutivo de facturación que devolvió encuentros a admisión
    Y el ejecutivo NO tiene encuentros en su bandeja actual
    Y existen encuentros en estado "<estado>"
    Y he seleccionado un encuentro en estado "<estado>"
    Y he seleccionado el botón "Asignar"
    Cuando selecciono el ejecutivo que devolvió encuentros
    Y selecciono el botón "Asignar" en el modal de asignación
    Entonces se debe asignar el encuentro al ejecutivo seleccionado
    Y el encuentro debe desaparecer de mi bandeja "Lista de encuentros para asignar"
    Y debe mostrarse un mensaje de confirmación "Encuentro asignado exitosamente"
    Y el contador de registros debe decrementar en 1

    Ejemplos:
      | estado               |
      | Por asignar          |
      | Error de facturación |
      | No facturable        |
      | Regularizado         |

  # ========================================================================
  # TÉCNICA: ASIGNACIÓN MASIVA
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @happyPath
  Escenario: ASIG-04 - Asignar múltiples encuentros a un ejecutivo
    Dado que existe un ejecutivo de facturación sin encuentros asignados
    Y existen 5 encuentros en estado "Por asignar"
    Y he seleccionado 5 encuentros en estado "Por asignar"
    Y he seleccionado el botón "Asignar"
    Cuando selecciono un ejecutivo para asignar los encuentros
    Y selecciono el botón "Asignar" en el modal de asignación
    Entonces se deben asignar los 5 encuentros al ejecutivo seleccionado
    Y los 5 encuentros deben desaparecer de mi bandeja "Lista de encuentros para asignar"
    Y debe mostrarse un mensaje de confirmación "5 encuentros asignados exitosamente"
    Y el contador de registros debe decrementar en 5

  @prioridadExtrema @responsableFacturacion @happyPath
  Escenario: ASIG-05 - Asignar encuentros de diferentes estados a un ejecutivo
    Dado que existe un ejecutivo de facturación
    Y existen encuentros en diferentes estados
    Y he seleccionado 2 encuentros en estado "Por asignar"
    Y he seleccionado 1 encuentro en estado "Error de facturación"
    Y he seleccionado 1 encuentro en estado "Regularizado"
    Y he seleccionado el botón "Asignar"
    Cuando selecciono un ejecutivo para asignar los encuentros
    Y selecciono el botón "Asignar" en el modal de asignación
    Entonces se deben asignar los 4 encuentros al ejecutivo seleccionado
    Y los 4 encuentros deben desaparecer de mi bandeja
    Y debe mostrarse un mensaje de confirmación "4 encuentros asignados exitosamente"

  # ========================================================================
  # TÉCNICA: PRUEBAS NEGATIVAS - ESTADOS NO PERMITIDOS
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @unhappyPath
  Esquema del escenario: ASIG-06 - Validar que NO se puede asignar encuentro con estado no permitido
    Dado que existen encuentros en estado "<estado_no_permitido>"
    Cuando selecciono un encuentro en estado "<estado_no_permitido>"
    Entonces el botón "Asignar" debe permanecer deshabilitado
    Y NO debo poder asignar el encuentro a ningún ejecutivo

    Ejemplos:
      | estado_no_permitido      |
      | Facturar con hospitalario|
      | Imp. Fact. Fin           |
      | Imp. Liq. Fin.           |
      | Pendiente en consulta    |
      | Pendiente por convenio   |
      | No facturar              |
      | No facturar farmacia     |
      | No facturar admisión     |

  @prioridadExtrema @responsableFacturacion @unhappyPath
  Escenario: ASIG-07 - Validar mensaje de error al intentar asignar estado no permitido
    Dado que existen encuentros en estado "Imp. Fact. Fin"
    Y he seleccionado un encuentro en estado "Imp. Fact. Fin"
    Cuando intento hacer clic en el botón "Asignar" (deshabilitado)
    Entonces el botón NO debe responder
    Y NO debe abrirse el modal de asignación
    Y debe mostrarse un tooltip "No se pueden asignar encuentros en este estado"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE FLUJO COMPLETO
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @happyPath
  Escenario: ASIG-08 - Cancelar asignación de encuentro
    Dado que existen encuentros en estado "Por asignar"
    Y he seleccionado un encuentro en estado "Por asignar"
    Y he seleccionado el botón "Asignar"
    Y se ha abierto el modal de asignación
    Cuando selecciono el botón "Cancelar" en el modal
    Entonces el modal debe cerrarse
    Y el encuentro debe permanecer seleccionado en mi bandeja
    Y NO debe asignarse a ningún ejecutivo
    Y el botón "Asignar" debe permanecer habilitado

  @prioridadExtrema @responsableFacturacion @happyPath
  Escenario: ASIG-09 - Validar lista de ejecutivos disponibles para asignación
    Dado que existen 5 ejecutivos de facturación activos en el sistema
    Y he seleccionado un encuentro en estado "Por asignar"
    Cuando selecciono el botón "Asignar"
    Entonces debe abrirse el modal de asignación
    Y debe mostrarse una lista con los 5 ejecutivos disponibles
    Y cada ejecutivo debe mostrar su nombre completo
    Y cada ejecutivo debe mostrar la cantidad de encuentros asignados actualmente

  @prioridadExtrema @responsableFacturacion @happyPath
  Escenario: ASIG-10 - Deseleccionar encuentro después de abrir modal de asignación
    Dado que he seleccionado un encuentro en estado "Por asignar"
    Y he seleccionado el botón "Asignar"
    Y se ha abierto el modal de asignación
    Cuando cierro el modal sin asignar
    Y deselecciono el encuentro en la grilla
    Entonces el botón "Asignar" debe volver a estado deshabilitado
    Y el encuentro debe permanecer en mi bandeja
    Y NO debe haberse realizado ninguna asignación

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE REGLAS DE NEGOCIO
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @happyPath
  Escenario: ASIG-11 - Validar que solo Responsable de Facturación puede asignar encuentros
    Dado que soy un usuario con rol "Responsable de Facturación"
    Cuando accedo a la bandeja "Lista de encuentros para asignar"
    Entonces debo visualizar el botón "Asignar"
    Y debo poder asignar encuentros a ejecutivos

  @prioridadExtrema @responsableFacturacion @happyPath
  Escenario: ASIG-12 - Reasignar encuentro previamente asignado
    Dado que existe un encuentro asignado al "Ejecutivo A"
    Y el encuentro fue devuelto a la bandeja "Lista de encuentros para asignar"
    Y el encuentro está en estado "Error de facturación"
    Cuando selecciono el encuentro
    Y asigno el encuentro al "Ejecutivo B"
    Entonces el encuentro debe asignarse exitosamente al "Ejecutivo B"
    Y NO debe quedar asignado al "Ejecutivo A"
    Y el historial de asignaciones debe registrar ambas asignaciones
