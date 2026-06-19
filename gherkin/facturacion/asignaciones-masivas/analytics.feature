# language: es

Característica: Registro de Eventos en Amplitude - Asignaciones Masivas
  Como responsable de analítica del sistema
  Quiero registrar eventos de usuario en Amplitude
  Para analizar el comportamiento y uso de la funcionalidad de asignaciones masivas

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación"

  # ========================================================================
  # TÉCNICA: EVENTOS DE NAVEGACIÓN
  # ========================================================================

  @prioridadBaja @responsableFacturacion @amplitude @happyPath
  Escenario: ANLT-01 - Registrar evento al ingresar a la bandeja de asignaciones masivas
    Cuando accedo a la bandeja "Asignaciones masivas"
    Entonces se debe registrar un evento en Amplitude con nombre "PAGINA_VER_ASIGNACIONES"
    Y se debe registrar el nombre y apellido del usuario
    Y se debe registrar el usuario
    Y se debe registrar el correo del usuario
    Y se debe registrar la fecha y hora del evento
    Y se debe registrar el rol del usuario "Responsable de Facturación"

  # ========================================================================
  # TÉCNICA: EVENTOS DE BÚSQUEDA Y FILTROS
  # ========================================================================

  @prioridadBaja @responsableFacturacion @amplitude @happyPath
  Esquema del escenario: ANLT-02 - Registrar evento al seleccionar el botón Buscar
    Dado que he accedido a la bandeja "Asignaciones masivas"
    Y he seleccionado una fecha de inicio válida
    Y he seleccionado una fecha fin válida
    Y he seleccionado "<cantidad_garantes>" en el filtro de tipo de garante
    Cuando selecciono el botón "Buscar"
    Entonces se debe registrar un evento en Amplitude con nombre "BOTON_CLICK_BUSCAR"
    Y se debe registrar el nombre y apellido del usuario
    Y se debe registrar el usuario
    Y se debe registrar el correo del usuario
    Y se debe registrar la fecha y hora del evento
    Y se debe registrar el rol del usuario
    Y se debe registrar la fecha de inicio del filtro
    Y se debe registrar la fecha fin del filtro
    Y se debe registrar el tipo de garante del filtro "<cantidad_garantes>"
    Y se debe registrar la cantidad de registros encontrados
    Y se debe registrar la cantidad de encuentros encontrados
    Y se debe registrar el monto total encontrado

    Ejemplos:
      | cantidad_garantes        |
      | un tipo de garante       |
      | 5 tipos de garante       |
      | todos los tipos de garante |

  @prioridadBaja @responsableFacturacion @amplitude @happyPath
  Esquema del escenario: ANLT-03 - Registrar evento al seleccionar el botón Limpiar
    Dado que he accedido a la bandeja "Asignaciones masivas"
    Y he aplicado filtros con "<cantidad_garantes>"
    Y he seleccionado el botón "Buscar"
    Y el sistema muestra resultados
    Cuando selecciono el botón "Limpiar"
    Entonces se debe registrar un evento en Amplitude con nombre "BOTON_CLICK_LIMPIAR"
    Y se debe registrar el nombre y apellido del usuario
    Y se debe registrar el usuario
    Y se debe registrar el correo del usuario
    Y se debe registrar la fecha y hora del evento
    Y se debe registrar el rol del usuario
    Y se debe registrar la fecha de inicio del filtro
    Y se debe registrar la fecha fin del filtro
    Y se debe registrar el tipo de garante del filtro "<cantidad_garantes>"
    Y se debe registrar la cantidad de registros encontrados antes de limpiar
    Y se debe registrar la cantidad de encuentros encontrados antes de limpiar
    Y se debe registrar el monto total encontrado antes de limpiar

    Ejemplos:
      | cantidad_garantes        |
      | sin tipo de garante      |
      | un tipo de garante       |
      | 5 tipos de garante       |
      | todos los tipos de garante |

  # ========================================================================
  # TÉCNICA: EVENTOS DE ASIGNACIÓN - BOTÓN PRINCIPAL
  # ========================================================================

  @prioridadBaja @responsableFacturacion @amplitude @happyPath
  Esquema del escenario: ANLT-04 - Registrar evento al seleccionar el botón Asignar en la bandeja
    Dado que he accedido a la bandeja "Asignaciones masivas"
    Y he aplicado filtros válidos y realizado búsqueda
    Y he seleccionado "<cantidad_registros>" registros de la tabla de resultados
    Cuando selecciono el botón "Asignar"
    Entonces se debe registrar un evento en Amplitude con nombre "BOTON_CLICK_ASIGNAR"
    Y se debe registrar el nombre y apellido del usuario
    Y se debe registrar el usuario
    Y se debe registrar el correo del usuario
    Y se debe registrar la fecha y hora del evento
    Y se debe registrar el rol del usuario
    Y se debe registrar la fecha de inicio del filtro
    Y se debe registrar la fecha fin del filtro
    Y se debe registrar el tipo de garante del filtro
    Y se debe registrar la cantidad de registros seleccionados "<cantidad_registros>"
    Y se debe registrar la cantidad de encuentros de los registros seleccionados
    Y se debe registrar el monto total de los registros seleccionados

    Ejemplos:
      | cantidad_registros |
      | 1                  |
      | 10                 |
      | 20                 |

  # ========================================================================
  # TÉCNICA: EVENTOS DE ASIGNACIÓN - MODAL
  # ========================================================================

  @prioridadBaja @responsableFacturacion @amplitude @happyPath
  Esquema del escenario: ANLT-05 - Registrar evento al asignar exitosamente en el modal
    Dado que he seleccionado "<cantidad_registros>" registros de la tabla
    Y he abierto el modal de asignación
    Y he seleccionado un ejecutivo de facturación
    Y he configurado sedes para cada garante
    Y he ingresado cantidades válidas para todas las sedes
    Cuando selecciono el botón "Asignar" del modal
    Entonces se debe registrar un evento en Amplitude con nombre "BOTON_CLICK_ASIGNAR_MODAL"
    Y se debe registrar el nombre y apellido del usuario
    Y se debe registrar el usuario
    Y se debe registrar el correo del usuario
    Y se debe registrar la fecha y hora del evento
    Y se debe registrar el rol del usuario
    Y se debe registrar la fecha de inicio del filtro
    Y se debe registrar la fecha fin del filtro
    Y se debe registrar el tipo de garante del filtro
    Y se debe registrar la cantidad de registros seleccionados
    Y se debe registrar la cantidad total de encuentros de los registros seleccionados
    Y se debe registrar el monto facturado total de los registros seleccionados
    Y se debe registrar las sedes configuradas para los registros seleccionados
    Y se debe registrar la cantidad total a asignar

    Ejemplos:
      | cantidad_registros |
      | 1                  |
      | 10                 |
      | 20                 |

  @prioridadBaja @responsableFacturacion @amplitude @unhappyPath
  Escenario: ANLT-06 - Registrar evento al intentar asignar sin seleccionar ejecutivo
    Dado que he seleccionado registros de la tabla
    Y he abierto el modal de asignación
    Y NO he seleccionado un ejecutivo de facturación
    Cuando intento seleccionar el botón "Asignar" del modal (deshabilitado)
    Entonces se debe registrar un evento en Amplitude con nombre "BOTON_CLICK_ASIGNAR_MODAL"
    Y se debe registrar el nombre y apellido del usuario
    Y se debe registrar el usuario
    Y se debe registrar el correo del usuario
    Y se debe registrar la fecha y hora del evento
    Y se debe registrar el rol del usuario
    Y se debe registrar la fecha de inicio del filtro
    Y se debe registrar la fecha fin del filtro
    Y se debe registrar el tipo de garante del filtro
    Y se debe registrar la cantidad de registros seleccionados
    Y se debe registrar la cantidad total de encuentros
    Y se debe registrar el monto facturado total
    Y NO se debe registrar sedes (valor vacío o null)
    Y NO se debe registrar cantidad a asignar (valor vacío o null)
    Y se debe registrar un campo adicional "error" con valor "sin_ejecutivo_seleccionado"

  # ========================================================================
  # TÉCNICA: EVENTOS DE CANCELACIÓN
  # ========================================================================

  @prioridadBaja @responsableFacturacion @amplitude @happyPath
  Escenario: ANLT-07 - Registrar evento al cancelar la asignación en el modal
    Dado que he seleccionado registros de la tabla
    Y he abierto el modal de asignación
    Y he configurado ejecutivo, sedes y cantidades
    Cuando selecciono el botón "Cancelar" del modal
    Entonces se debe registrar un evento en Amplitude con nombre "BOTON_CLICK_CANCELAR_MODAL"
    Y se debe registrar el nombre y apellido del usuario
    Y se debe registrar el usuario
    Y se debe registrar el correo del usuario
    Y se debe registrar la fecha y hora del evento
    Y se debe registrar el rol del usuario
    Y se debe registrar la fecha de inicio del filtro
    Y se debe registrar la fecha fin del filtro
    Y se debe registrar el tipo de garante del filtro
    Y se debe registrar la cantidad de registros seleccionados
    Y se debe registrar la cantidad total de encuentros
    Y se debe registrar el monto facturado total
    Y NO se debe registrar sedes (valor vacío o null)
    Y NO se debe registrar cantidad a asignar (valor vacío o null)

  # ========================================================================
  # TÉCNICA: EVENTOS DE SELECCIÓN
  # ========================================================================

  @prioridadBaja @responsableFacturacion @amplitude @happyPath
  Escenario: ANLT-08 - Registrar evento al seleccionar un ejecutivo en el modal
    Dado que he seleccionado registros de la tabla
    Y he abierto el modal de asignación
    Cuando selecciono un ejecutivo de facturación "Carlos Ramírez"
    Entonces se debe registrar un evento en Amplitude con nombre "SELECT_CAMBIO_EJECUTIVO_MODAL"
    Y se debe registrar el nombre y apellido del usuario
    Y se debe registrar el usuario
    Y se debe registrar el correo del usuario
    Y se debe registrar la fecha y hora del evento
    Y se debe registrar el rol del usuario
    Y se debe registrar el ejecutivo seleccionado "Carlos Ramírez"

  @prioridadBaja @responsableFacturacion @amplitude @happyPath
  Escenario: ANLT-09 - Registrar evento al cambiar de ejecutivo en el modal
    Dado que he seleccionado un ejecutivo "María López"
    Y he configurado sedes y cantidades
    Cuando cambio el ejecutivo a "Pedro Sánchez"
    Entonces se debe registrar un evento en Amplitude con nombre "SELECT_CAMBIO_EJECUTIVO_MODAL"
    Y se debe registrar el ejecutivo anterior "María López"
    Y se debe registrar el ejecutivo nuevo "Pedro Sánchez"
    Y se debe registrar un campo adicional "accion" con valor "cambio_ejecutivo"

  # ========================================================================
  # TÉCNICA: METADATOS COMUNES EN TODOS LOS EVENTOS
  # ========================================================================

  @prioridadBaja @responsableFacturacion @amplitude @happyPath
  Escenario: ANLT-10 - Validar que todos los eventos registran metadatos comunes del usuario
    Dado que realizo cualquier acción que genera un evento en Amplitude
    Cuando se registra el evento
    Entonces el evento debe incluir los siguientes campos obligatorios:
      | Campo                | Tipo   | Ejemplo                    |
      | nombre_completo      | string | Juan Carlos García Pérez   |
      | usuario              | string | jgarcia                    |
      | correo               | string | jgarcia@aunados.com        |
      | fecha_evento         | date   | 2026-06-06                 |
      | hora_evento          | time   | 14:30:25                   |
      | rol                  | string | Responsable de Facturación |
      | timestamp            | number | 1717689025000              |

  @prioridadBaja @responsableFacturacion @amplitude @unhappyPath
  Escenario: ANLT-11 - Validar que eventos NO registran datos sensibles de pacientes
    Dado que realizo una asignación que incluye encuentros de pacientes
    Cuando se registran eventos en Amplitude
    Entonces los eventos NO deben incluir:
      | Dato Sensible          |
      | Nombres de pacientes   |
      | Apellidos de pacientes |
      | Número de encuentro    |
      | NHC                    |
      | Diagnósticos           |
      | Datos médicos          |
    Y solo deben registrarse metadatos agregados (cantidades, montos totales, etc.)

  # ========================================================================
  # TÉCNICA: EVENTOS DE ORDENAMIENTO
  # ========================================================================

  @prioridadBaja @responsableFacturacion @amplitude @happyPath
  Esquema del escenario: ANLT-12 - Registrar evento al ordenar tabla de resultados
    Dado que he realizado una búsqueda con resultados
    Y la tabla muestra múltiples registros
    Cuando selecciono ordenar por "<criterio_ordenamiento>"
    Entonces se debe registrar un evento en Amplitude con nombre "TABLA_ORDENAR_RESULTADOS"
    Y se debe registrar el nombre y apellido del usuario
    Y se debe registrar el usuario
    Y se debe registrar el correo del usuario
    Y se debe registrar la fecha y hora del evento
    Y se debe registrar el rol del usuario
    Y se debe registrar el criterio de ordenamiento "<criterio_ordenamiento>"
    Y se debe registrar el orden aplicado "ascendente" o "descendente"

    Ejemplos:
      | criterio_ordenamiento  |
      | Garante                |
      | Cantidad de encuentros |
      | Monto por facturar     |

  # ========================================================================
  # TÉCNICA: EVENTOS DE GESTIÓN DE SEDES
  # ========================================================================

  @prioridadBaja @responsableFacturacion @amplitude @happyPath
  Escenario: ANLT-13 - Registrar evento al agregar una sede en el modal
    Dado que he abierto el modal de asignación
    Y he seleccionado un ejecutivo
    Cuando agrego una sede "Delgado" para un garante
    Entonces se debe registrar un evento en Amplitude con nombre "MODAL_AGREGAR_SEDE"
    Y se debe registrar la sede agregada "Delgado"
    Y se debe registrar el garante al que se agregó la sede
    Y se debe registrar el nombre y apellido del usuario
    Y se debe registrar la fecha y hora del evento

  @prioridadBaja @responsableFacturacion @amplitude @happyPath
  Escenario: ANLT-14 - Registrar evento al eliminar una sede en el modal
    Dado que he configurado 3 sedes para un garante
    Cuando elimino la sede "San Isidro"
    Entonces se debe registrar un evento en Amplitude con nombre "MODAL_ELIMINAR_SEDE"
    Y se debe registrar la sede eliminada "San Isidro"
    Y se debe registrar la cantidad que tenía configurada la sede
    Y se debe registrar el garante del que se eliminó la sede
    Y se debe registrar el nombre y apellido del usuario

  @prioridadBaja @responsableFacturacion @amplitude @happyPath
  Escenario: ANLT-15 - Registrar evento al modificar cantidad de una sede
    Dado que he configurado una sede "Guardia Civil" con cantidad 10
    Cuando cambio la cantidad a 25
    Entonces se debe registrar un evento en Amplitude con nombre "MODAL_MODIFICAR_CANTIDAD_SEDE"
    Y se debe registrar la sede "Guardia Civil"
    Y se debe registrar la cantidad anterior "10"
    Y se debe registrar la cantidad nueva "25"
    Y se debe registrar el garante correspondiente

  # ========================================================================
  # TÉCNICA: EVENTOS DE ERROR Y VALIDACIÓN
  # ========================================================================

  @prioridadBaja @responsableFacturacion @amplitude @unhappyPath
  Escenario: ANLT-16 - Registrar evento cuando asignación falla por error del servidor
    Dado que he configurado una asignación válida
    Cuando intento confirmar la asignación
    Y ocurre un error en el servidor
    Entonces se debe registrar un evento en Amplitude con nombre "ERROR_ASIGNACION_MASIVA"
    Y se debe registrar el tipo de error "error_servidor"
    Y se debe registrar el código de error HTTP
    Y se debe registrar el mensaje de error
    Y se debe registrar todos los metadatos de la asignación que falló

  @prioridadBaja @responsableFacturacion @amplitude @unhappyPath
  Escenario: ANLT-17 - Registrar evento cuando validación bloquea asignación
    Dado que intento asignar una cantidad mayor al disponible
    Cuando el sistema bloquea la asignación por validación
    Entonces se debe registrar un evento en Amplitude con nombre "VALIDACION_BLOQUEADA_ASIGNACION"
    Y se debe registrar el tipo de validación "cantidad_excede_disponible"
    Y se debe registrar la cantidad intentada
    Y se debe registrar la cantidad disponible
    Y se debe registrar la sede afectada

  # ========================================================================
  # TÉCNICA: EVENTOS DE ÉXITO
  # ========================================================================

  @prioridadBaja @responsableFacturacion @amplitude @happyPath
  Escenario: ANLT-18 - Registrar evento de éxito completo de asignación masiva
    Dado que he completado exitosamente una asignación de 50 encuentros
    Entonces se debe registrar un evento en Amplitude con nombre "ASIGNACION_MASIVA_EXITOSA"
    Y se debe registrar la cantidad total de encuentros asignados "50"
    Y se debe registrar la cantidad de garantes procesados
    Y se debe registrar la cantidad de sedes configuradas
    Y se debe registrar el ejecutivo al que se asignaron
    Y se debe registrar el tiempo total de la operación en segundos
    Y se debe registrar el nombre y apellido del usuario
    Y se debe registrar la fecha y hora del evento
