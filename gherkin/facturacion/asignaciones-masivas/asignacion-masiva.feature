# language: es

Característica: Asignación Masiva de Encuentros
  Como Responsable de Facturación
  Quiero asignar masivamente encuentros a ejecutivos de facturación
  Para distribuir eficientemente la carga de trabajo por garante y sede

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación"
    Y he accedido a la bandeja "Asignaciones masivas"
    Y he aplicado filtros de fecha válidos
    Y he seleccionado tipos de garante
    Y he realizado una búsqueda exitosa

  # ========================================================================
  # TÉCNICA: FLUJO COMPLETO DE ASIGNACIÓN MASIVA EXITOSA
  # ========================================================================

  @responsableFacturacion
  Esquema del escenario: ASIG-01 - Asignar encuentros masivos exitosamente
    Dado que he seleccionado "<cantidad_garantes>" garantes válidos de la tabla de resultados
    Y cada garante tiene encuentros disponibles en estado "Por asignar"
    Y he seleccionado el botón "Asignar"
    Y se ha abierto el modal de asignación masiva
    Y he seleccionado un ejecutivo de facturación para asignar
    Cuando selecciono una sede para cada garante
    Y ingreso una cantidad válida de encuentros para todas las sedes seleccionadas
    Y selecciono el botón "Asignar" del modal
    Entonces se debe procesar exitosamente la asignación de los encuentros
    Y los encuentros deben asignarse al ejecutivo seleccionado
    Y debe mostrarse un mensaje "Encuentros asignados exitosamente"
    Y los garantes asignados deben desaparecer de mi bandeja
    Y el modal debe cerrarse automáticamente

    Ejemplos:
      | cantidad_garantes |
      | 1 garante         |
      | 2 garantes        |
      | 10 garantes       |

  # ========================================================================
  # TÉCNICA: VALIDACIONES DE SELECCIÓN DE GARANTES
  # ========================================================================

  @responsableFacturacion
  Escenario: ASIG-02 - Validar habilitación del botón Asignar al seleccionar garantes
    Dado que estoy visualizando los resultados de búsqueda
    Y el botón "Asignar" está deshabilitado
    Cuando selecciono 1 garante de la tabla de resultados
    Entonces el botón "Asignar" debe habilitarse
    Y debo poder hacer clic en el botón "Asignar"

  @responsableFacturacion
  Escenario: ASIG-03 - Deseleccionar todos los garantes deshabilita botón Asignar
    Dado que he seleccionado 3 garantes de la tabla
    Y el botón "Asignar" está habilitado
    Cuando deselecciono los 3 garantes
    Entonces el botón "Asignar" debe deshabilitarse
    Y NO debo poder abrir el modal de asignación

  # ========================================================================
  # TÉCNICA: VALIDACIONES DEL MODAL DE ASIGNACIÓN - SEDE
  # ========================================================================

  @responsableFacturacion
  Esquema del escenario: ASIG-04 - Garante sin sede indicada bloquea el flujo
    Dado que he seleccionado "<cantidad_garantes>" de la tabla
    Y he abierto el modal de asignación masiva
    Y he seleccionado un ejecutivo de facturación
    Cuando NO indico una sede para al menos un garante
    Entonces el botón "Asignar" del modal debe estar deshabilitado
    Y debe mostrarse un indicador visual en el garante sin sede
    Y NO debe permitirse completar la asignación

    Ejemplos:
      | cantidad_garantes |
      | 1 garante         |
      | 2 garantes        |
      | 10 garantes       |

  @responsableFacturacion
  Esquema del escenario: ASIG-05 - Eliminar sede incompleta habilita el botón Asignar
    Dado que he seleccionado "<cantidad_garantes>" de la tabla
    Y he abierto el modal de asignación masiva
    Y he seleccionado un ejecutivo de facturación
    Y he agregado una sede para un garante
    Y la sede NO tiene cantidad indicada
    Y el botón "Asignar" del modal está deshabilitado
    Cuando elimino la sede sin cantidad indicada
    Entonces el botón "Asignar" del modal debe habilitarse
    Y debo poder completar la asignación con las sedes restantes

    Ejemplos:
      | cantidad_garantes |
      | 1 garante         |
      | 2 garantes        |
      | 10 garantes       |

  @responsableFacturacion
  Esquema del escenario: ASIG-06 - Eliminar todas las sedes bloquea el flujo
    Dado que he seleccionado "<cantidad_garantes>" de la tabla
    Y he abierto el modal de asignación masiva
    Y he seleccionado un ejecutivo de facturación
    Y he agregado sedes para los garantes
    Cuando elimino todas las sedes de todos los garantes
    Entonces el botón "Asignar" del modal debe estar deshabilitado
    Y NO debe permitirse completar la asignación
    Y debe mostrarse un mensaje "Debe seleccionar al menos una sede para asignar"

    Ejemplos:
      | cantidad_garantes |
      | 1 garante         |
      | 2 garantes        |
      | 10 garantes       |

  # ========================================================================
  # TÉCNICA: VALIDACIONES DEL MODAL - CANTIDAD A ASIGNAR
  # ========================================================================

  @responsableFacturacion
  Esquema del escenario: ASIG-07 - Garante con cantidad a asignar pendiente bloquea el flujo
    Dado que he seleccionado "<cantidad_garantes>" garantes válidos de la tabla
    Y he abierto el modal de asignación masiva
    Y he seleccionado un ejecutivo de facturación
    Y he seleccionado una sede para cada garante
    Cuando NO indico la cantidad a asignar en al menos una sede
    Entonces el botón "Asignar" del modal debe estar deshabilitado
    Y debe mostrarse un indicador visual en la sede sin cantidad
    Y NO debe permitirse completar la asignación

    Ejemplos:
      | cantidad_garantes |
      | 1 garante         |
      | 2 garantes        |
      | 10 garantes       |

  @responsableFacturacion
  Escenario: ASIG-08 - Sede con cantidad en cero bloquea flujo de asignación masiva
    Dado que he seleccionado un garante de la tabla
    Y he abierto el modal de asignación masiva
    Y he seleccionado un ejecutivo de facturación
    Y he seleccionado una sede para el garante
    Cuando ingreso cantidad igual a 0 en la sede
    Entonces el botón "Asignar" del modal debe estar deshabilitado
    Y debe mostrarse un mensaje de error "La cantidad debe ser mayor a 0"
    Y NO debe permitirse completar la asignación

  @responsableFacturacion
  Escenario: ASIG-09 - Cantidad mayor al disponible bloquea el flujo
    Dado que he seleccionado un garante con 50 encuentros disponibles
    Y he abierto el modal de asignación masiva
    Y he seleccionado un ejecutivo de facturación
    Y he seleccionado una sede para el garante
    Cuando ingreso una cantidad de 51 (mayor al total disponible)
    Entonces el botón "Asignar" del modal debe estar deshabilitado
    Y debe mostrarse un mensaje de error "La cantidad no puede ser mayor a 50 encuentros disponibles"
    Y el campo de cantidad debe marcarse con error visual
    Y NO debe permitirse completar la asignación

  @responsableFacturacion
  Escenario: ASIG-10 - Cantidad válida habilita botón Asignar
    Dado que he seleccionado un garante con 50 encuentros disponibles
    Y he abierto el modal de asignación masiva
    Y he seleccionado un ejecutivo de facturación
    Y he seleccionado una sede para el garante
    Cuando ingreso una cantidad de 30 (menor al total disponible)
    Entonces el botón "Asignar" del modal debe habilitarse
    Y NO debe mostrarse ningún mensaje de error
    Y debo poder completar la asignación

  # ========================================================================
  # TÉCNICA: VALIDACIONES DE SELECCIÓN DE EJECUTIVO
  # ========================================================================

  @responsableFacturacion
  Escenario: ASIG-11 - Abrir modal sin ejecutivo mantiene botón deshabilitado
    Dado que he seleccionado garantes de la tabla
    Y he abierto el modal de asignación masiva
    Cuando visualizo el modal sin seleccionar ejecutivo
    Entonces el botón "Asignar" del modal debe estar deshabilitado
    Y debe mostrarse el campo "Seleccionar ejecutivo" vacío
    Y debe mostrarse un mensaje "Seleccione un ejecutivo para continuar"

  @responsableFacturacion
  Escenario: ASIG-12 - Seleccionar ejecutivo habilita configuración de sedes
    Dado que he seleccionado garantes de la tabla
    Y he abierto el modal de asignación masiva
    Y el campo "Seleccionar ejecutivo" está vacío
    Cuando selecciono un ejecutivo de facturación
    Entonces debe habilitarse la sección de configuración de sedes
    Y debo poder agregar sedes para cada garante
    Y debe mostrarse la información del ejecutivo seleccionado

  @responsableFacturacion
  Escenario: ASIG-13 - Cambiar ejecutivo limpia configuración de sedes
    Dado que he seleccionado un ejecutivo de facturación
    Y he configurado sedes y cantidades para los garantes
    Cuando cambio a un ejecutivo diferente
    Entonces debe mostrarse un mensaje de confirmación "Al cambiar de ejecutivo se perderá la configuración de sedes. ¿Desea continuar?"
    Y al confirmar, todas las sedes y cantidades deben limpiarse
    Y debo poder configurar nuevamente sedes para el nuevo ejecutivo

  # ========================================================================
  # TÉCNICA: GESTIÓN DE SEDES MÚLTIPLES POR GARANTE
  # ========================================================================

  @responsableFacturacion
  Escenario: ASIG-14 - Agregar múltiples sedes para un mismo garante
    Dado que he seleccionado un garante con encuentros en 3 sedes diferentes
    Y he abierto el modal de asignación masiva
    Y he seleccionado un ejecutivo de facturación
    Cuando agrego la "Sede Delgado" con cantidad 10
    Y agrego la "Sede San Isidro" con cantidad 15
    Y agrego la "Sede Guardia Civil" con cantidad 20
    Entonces el garante debe mostrar 3 sedes configuradas
    Y el total a asignar para el garante debe ser 45 encuentros
    Y el botón "Asignar" del modal debe estar habilitado

  @responsableFacturacion
  Escenario: ASIG-15 - Eliminar una sede válida mantiene botón habilitado si quedan sedes
    Dado que he configurado 3 sedes válidas para un garante
    Y el botón "Asignar" del modal está habilitado
    Cuando elimino una de las 3 sedes configuradas
    Entonces deben quedar 2 sedes configuradas
    Y el botón "Asignar" del modal debe permanecer habilitado
    Y el total a asignar debe actualizarse correctamente

  @responsableFacturacion
  Escenario: ASIG-16 - Eliminar última sede de un garante deshabilita botón
    Dado que he configurado 1 sede válida para un garante
    Y el botón "Asignar" del modal está habilitado
    Cuando elimino la única sede configurada
    Entonces el garante debe quedar sin sedes
    Y el botón "Asignar" del modal debe deshabilitarse
    Y debe mostrarse un mensaje "El garante debe tener al menos una sede asignada"

  # ========================================================================
  # TÉCNICA: CANCELACIÓN Y CIERRE DE MODAL
  # ========================================================================

  @responsableFacturacion
  Escenario: ASIG-17 - Cancelar asignación masiva en el modal
    Dado que he seleccionado garantes de la tabla
    Y he abierto el modal de asignación masiva
    Y he configurado ejecutivo, sedes y cantidades
    Cuando selecciono el botón "Cancelar" del modal
    Entonces debe mostrarse un mensaje de confirmación "¿Está seguro que desea cancelar la asignación?"
    Y al confirmar, el modal debe cerrarse
    Y NO debe realizarse ninguna asignación
    Y los garantes deben permanecer seleccionados en la tabla
    Y toda la configuración del modal debe descartarse

  @responsableFacturacion
  Escenario: ASIG-18 - Cerrar modal con X pierde configuración
    Dado que he configurado ejecutivo, sedes y cantidades en el modal
    Cuando selecciono el botón "X" para cerrar el modal
    Entonces debe mostrarse un mensaje de confirmación "Tiene cambios sin guardar. ¿Desea cerrar el modal?"
    Y al confirmar, el modal debe cerrarse
    Y toda la configuración debe perderse

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TOTALES Y RESUMEN
  # ========================================================================

  @responsableFacturacion
  Escenario: ASIG-19 - Visualizar resumen de asignación antes de confirmar
    Dado que he configurado completamente la asignación masiva
    Y he seleccionado 3 garantes con un total de 100 encuentros
    Y he configurado sedes y cantidades válidas
    Cuando visualizo la sección de resumen del modal
    Entonces debe mostrarse "Total de garantes seleccionados: 3"
    Y debe mostrarse "Total de encuentros a asignar: 100"
    Y debe mostrarse el ejecutivo seleccionado
    Y debe mostrarse el desglose por garante y sede

  @responsableFacturacion
  Escenario: ASIG-20 - Validar que el total a asignar no excede el disponible global
    Dado que he seleccionado 2 garantes
    Y el Garante A tiene 30 encuentros disponibles
    Y el Garante B tiene 50 encuentros disponibles
    Y he configurado para Garante A: 30 encuentros
    Y he configurado para Garante B: 50 encuentros
    Cuando reviso el resumen
    Entonces debe mostrarse "Total disponible: 80"
    Y debe mostrarse "Total a asignar: 80"
    Y debe mostrarse "Disponible después de asignar: 0"
    Y el botón "Asignar" debe estar habilitado
