# language: es

Característica: Reglas de Negocio en Asignación Masiva
  Como Responsable de Facturación
  Quiero que el sistema aplique las reglas de negocio correctamente
  Para asegurar que solo se asignen encuentros en estados válidos

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación"
    Y he accedido a la bandeja "Asignaciones masivas"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ESTADOS PERMITIDOS
  # ========================================================================

  @responsableFacturacion @happyPath
  Esquema del escenario: RN-01 - Solo se contabilizan encuentros en estado "Por asignar" por garante y sede
    Dado que existen encuentros para el garante "<garante>" en la sede "<sede>" con los siguientes estados:
      | Estado               | Cantidad |
      | Por asignar          | 5        |
      | No facturable        | 3        |
      | Error de facturación | 2        |
      | Regularizado         | 1        |
    Y he aplicado filtros válidos de fecha
    Y he seleccionado todos los tipos de garante
    Cuando realizo una búsqueda
    Entonces el sistema debe mostrar el garante "<garante>"
    Y para la sede "<sede>" debe mostrarse "Cantidad de encuentros: 5"
    Y NO deben contabilizarse los encuentros en otros estados
    Y el total disponible debe ser únicamente los 5 encuentros en "Por asignar"

    Ejemplos:
      | garante        | sede         |
      | MAPFRE SEGUROS | Delgado      |
      | RIMAC SEGUROS  | San Isidro   |
      | PACIFICO EPS   | Guardia Civil|

  @responsableFacturacion @happyPath
  Esquema del escenario: RN-02 - Asignar solo encuentros en estado "Por asignar"
    Dado que he seleccionado "<cantidad_garantes>" garantes con encuentros en múltiples estados
    Y cada garante tiene encuentros "Por asignar" y encuentros en otros estados
    Y he abierto el modal de asignación masiva
    Y he seleccionado un ejecutivo de facturación
    Y he configurado sedes y cantidades válidas
    Cuando selecciono el botón "Asignar" del modal
    Entonces se deben asignar únicamente los encuentros en estado "Por asignar"
    Y los encuentros en otros estados NO deben asignarse
    Y debe mostrarse un mensaje "X encuentros asignados exitosamente"
    Y el sistema debe registrar el evento en Amplitude con nombre "BOTON_CLICK_ASIGNAR_MODAL"

    Ejemplos:
      | cantidad_garantes |
      | 1 garante         |
      | 5 garantes        |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE SEDE SIN ENCUENTROS VÁLIDOS
  # ========================================================================

  @responsableFacturacion @unhappyPath
  Esquema del escenario: RN-03 - Sede sin encuentros en estado "Por asignar" bloquea el flujo
    Dado que existen encuentros para el garante "<garante>" en la sede "<sede>" con los siguientes estados:
      | Estado               | Cantidad |
      | Por asignar          | 0        |
      | No facturable        | 3        |
      | Error de facturación | 2        |
      | Regularizado         | 1        |
    Y he aplicado filtros válidos
    Y he realizado una búsqueda
    Cuando selecciono el garante "<garante>"
    Y selecciono el botón "Asignar"
    Entonces debe mostrarse un mensaje de error "El garante <garante> no tiene encuentros en estado 'Por asignar' disponibles"
    Y el sistema debe bloquear la asignación
    Y NO debe permitirse abrir el modal de asignación
    Y el botón "Asignar" debe permanecer deshabilitado

    Ejemplos:
      | garante        | sede       |
      | MAPFRE SEGUROS | Delgado    |
      | RIMAC SEGUROS  | San Isidro |

  @responsableFacturacion @unhappyPath
  Escenario: RN-04 - Garante con al menos una sede sin encuentros "Por asignar" bloquea asignación
    Dado que el garante "MAPFRE SEGUROS" tiene:
      | Sede          | Por asignar | Otros estados |
      | Delgado       | 5           | 10            |
      | San Isidro    | 0           | 5             |
      | Guardia Civil | 10          | 3             |
    Y he aplicado filtros y realizado búsqueda
    Cuando selecciono el garante "MAPFRE SEGUROS"
    Y intento asignar encuentros
    Entonces debe mostrarse un mensaje "El garante tiene sedes sin encuentros en estado 'Por asignar': San Isidro"
    Y el sistema debe bloquear la asignación hasta que se resuelva
    Y debo poder deseleccionar el garante para continuar

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE DISTRIBUCIÓN POR SEDE
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: RN-05 - Solo se pueden asignar encuentros de sedes con estado "Por asignar"
    Dado que el garante "PACIFICO EPS" tiene encuentros "Por asignar" en 3 sedes:
      | Sede          | Cantidad Por asignar |
      | Delgado       | 20                   |
      | San Isidro    | 15                   |
      | Guardia Civil | 10                   |
    Y he abierto el modal de asignación
    Y he seleccionado un ejecutivo
    Cuando configuro asignación para las 3 sedes
    Entonces solo debo poder seleccionar de las sedes que tienen encuentros "Por asignar"
    Y NO deben aparecer sedes sin encuentros en este estado
    Y la cantidad máxima por sede debe coincidir con los encuentros "Por asignar"

  @responsableFacturacion @unhappyPath
  Escenario: RN-06 - Validar que cantidad asignada no excede "Por asignar" de la sede
    Dado que la sede "Delgado" del garante "MAPFRE" tiene:
      | Estado               | Cantidad |
      | Por asignar          | 20       |
      | No facturable        | 10       |
    Y he abierto el modal de asignación
    Y he seleccionado un ejecutivo
    Y he seleccionado la sede "Delgado"
    Cuando intento asignar 25 encuentros (más de los 20 "Por asignar")
    Entonces debe mostrarse un error "La cantidad no puede exceder los 20 encuentros disponibles en estado 'Por asignar'"
    Y el botón "Asignar" del modal debe permanecer deshabilitado
    Y NO debe permitirse completar la asignación

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE PERMISOS POR ROL
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: RN-07 - Solo Responsable de Facturación puede acceder a asignaciones masivas
    Dado que soy un usuario con rol "Responsable de Facturación"
    Cuando accedo al módulo de Facturación
    Entonces debo visualizar la opción "Asignaciones masivas"
    Y debo poder acceder a la bandeja
    Y debo poder realizar asignaciones masivas

  @ejecutivoFacturacion @unhappyPath
  Escenario: RN-08 - Ejecutivo de Facturación NO puede acceder a asignaciones masivas
    Dado que soy un usuario con rol "Ejecutivo de Facturación"
    Cuando accedo al módulo de Facturación
    Entonces NO debo visualizar la opción "Asignaciones masivas"
    Y si intento acceder directamente a la URL, debe mostrarse "Acceso denegado"
    Y debo ser redirigido a mi pantalla de inicio

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE INTEGRIDAD DE DATOS
  # ========================================================================

  @responsableFacturacion @unhappyPath
  Escenario: RN-09 - Validar que la suma de cantidades por sede no excede el total del garante
    Dado que el garante "MAPFRE" tiene 50 encuentros "Por asignar" distribuidos en 3 sedes:
      | Sede          | Cantidad |
      | Delgado       | 20       |
      | San Isidro    | 15       |
      | Guardia Civil | 15       |
    Y he abierto el modal de asignación
    Y he seleccionado un ejecutivo
    Cuando configuro:
      | Sede          | Cantidad a asignar |
      | Delgado       | 20                 |
      | San Isidro    | 15                 |
      | Guardia Civil | 16                 |
    Entonces debe mostrarse un error "La suma de cantidades (51) excede el total disponible (50)"
    Y el sistema debe marcar el campo con error
    Y el botón "Asignar" debe permanecer deshabilitado

  @responsableFacturacion @happyPath
  Escenario: RN-10 - Permitir asignación parcial de encuentros del garante
    Dado que el garante "RIMAC" tiene 100 encuentros "Por asignar"
    Y he abierto el modal de asignación
    Y he seleccionado un ejecutivo
    Cuando configuro asignar solo 50 encuentros
    Entonces el sistema debe permitir la asignación parcial
    Y deben quedar 50 encuentros "Por asignar" sin asignar
    Y el garante debe permanecer visible en la bandeja con los 50 restantes

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ACTUALIZACIÓN DE ESTADO
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: RN-11 - Encuentros asignados cambian de estado correctamente
    Dado que he asignado 30 encuentros en estado "Por asignar" a un ejecutivo
    Cuando la asignación se completa exitosamente
    Entonces los 30 encuentros deben cambiar al estado correspondiente del ejecutivo
    Y los encuentros deben aparecer en la bandeja del ejecutivo asignado
    Y el contador de encuentros "Por asignar" del garante debe decrementar en 30
    Y el historial de asignación debe registrar el cambio

  @responsableFacturacion @unhappyPath
  Escenario: RN-12 - Validar que asignación fallida no modifica estados
    Dado que he configurado una asignación de 50 encuentros
    Y ocurre un error en el servidor durante el proceso
    Cuando la asignación falla
    Entonces los encuentros deben permanecer en estado "Por asignar"
    Y NO deben asignarse al ejecutivo
    Y debe mostrarse un mensaje de error "No se pudo completar la asignación. Intente nuevamente"
    Y el garante debe permanecer en la bandeja con los 50 encuentros disponibles

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE CONCURRENCIA
  # ========================================================================

  @responsableFacturacion @unhappyPath
  Escenario: RN-13 - Bloquear asignación si otro usuario asignó los mismos encuentros
    Dado que he seleccionado un garante con 30 encuentros "Por asignar"
    Y he abierto el modal y configurado la asignación
    Y otro usuario asigna los mismos 30 encuentros simultáneamente
    Cuando intento confirmar mi asignación
    Entonces debe mostrarse un mensaje "Los encuentros ya han sido asignados por otro usuario"
    Y mi asignación debe cancelarse
    Y debo poder actualizar la bandeja para ver el estado actual

  @responsableFacturacion @happyPath
  Escenario: RN-14 - Permitir asignación si hay encuentros suficientes después de asignación concurrente
    Dado que un garante tiene 100 encuentros "Por asignar"
    Y he configurado asignar 50 encuentros
    Y otro usuario asigna 30 encuentros del mismo garante simultáneamente
    Cuando intento confirmar mi asignación de 50
    Entonces el sistema debe validar que quedan 70 encuentros disponibles (100-30)
    Y debe permitir mi asignación de 50 encuentros
    Y deben quedar 20 encuentros "Por asignar" disponibles (70-50)
