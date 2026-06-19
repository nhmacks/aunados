# language: es

Característica: Gestión de Estados del Encuentro
  Como usuario autorizado del sistema AUNADOS
  Quiero cambiar el estado operativo de un encuentro
  Para registrar la situación operativa actual según mi rol y permisos

  # ========================================================================
  # ESTADO INICIAL
  # Cobertura: RN-LE-001, Sección 5 del documento 05-Lista-Encuentros.md
  # ========================================================================

  @prioridadExtrema @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: EST-01 - Validar estado inicial "Pendiente" al ingresar por primera vez (RN-LE-001)
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y existe un nuevo encuentro "12345678" que ingresa por primera vez a Admisión
    Y el encuentro ha sido clasificado por el Job de Admisión
    Cuando el encuentro aparece en la bandeja "Lista de Encuentros"
    Entonces el estado del encuentro debe ser "Pendiente"
    Y el estado debe mostrarse en la grilla
    Y el estado debe mostrarse en el detalle del encuentro

  # ========================================================================
  # CAMBIO DE ESTADO - SUPERUSUARIO
  # Cobertura: Sección 3.1, 9, 11 del documento 05-Lista-Encuentros.md
  # RN-DE-03 del documento 07-Detalle-Encuentro.md
  # Sección 3, 4 del documento 08-Estados.md
  # ========================================================================

  @prioridadAlta @superusuarioAdmision @happyPath
  Escenario: EST-02 - Superusuario cambia estado de encuentro desde detalle
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "Pendiente"
    Cuando selecciono el estado "Tramitado"
    Entonces el sistema debe mostrar el modal de confirmación
    Y el modal debe mostrar el título "¿Deseas marcar el encuentro como Tramitado?"
    Y el modal debe mostrar la descripción "El encuentro permanecerá en tu bandeja de admisión para que puedas continuar revisándolo después."
    Y el modal debe mostrar el botón "Sí, cambiar estado"
    Y el modal debe mostrar el botón "No, cancelar"
    Y el modal debe mostrar el botón cerrar "X"

  @prioridadAlta @superusuarioAdmision @happyPath
  Escenario: EST-03 - Superusuario confirma cambio de estado
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "Pendiente"
    Y he seleccionado el nuevo estado "Tramitado"
    Y el sistema muestra el modal de confirmación
    Cuando presiono el botón "Sí, cambiar estado"
    Entonces el sistema debe actualizar el estado del encuentro a "Tramitado"
    Y el sistema debe cerrar el modal
    Y el sistema debe regresar a la pantalla "Lista de Encuentros"
    Y el sistema debe actualizar la grilla
    Y el encuentro debe mostrarse con estado "Tramitado" en la grilla

  @prioridadAlta @superusuarioAdmision @happyPath
  Escenario: EST-04 - Superusuario cancela cambio de estado
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "Pendiente"
    Y he seleccionado el nuevo estado "Tramitado"
    Y el sistema muestra el modal de confirmación
    Cuando presiono el botón "No, cancelar"
    Entonces el sistema debe cerrar el modal
    Y el estado del encuentro debe permanecer como "Pendiente"
    Y el sistema debe permanecer en la pantalla "Detalle del Encuentro"

  @prioridadExtrema @superusuarioAdmision @happyPath
  Esquema del escenario: EST-05 - Superusuario puede asignar todos los estados permitidos
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "Pendiente"
    Cuando cambio el estado a "<estado>"
    Y confirmo el cambio
    Entonces el estado del encuentro debe actualizarse a "<estado>"
    Y el encuentro debe permanecer en la bandeja "Lista de Encuentros"

    Ejemplos:
      | estado                          |
      | Pago por Adelantado             |
      | Derivado a Dirección Médica     |
      | Derivado a Supervisor           |
      | Error de Vinculación            |
      | Pendiente de Revisión           |
      | Terapia en Proceso              |
      | En Proceso                      |
      | Tramitado                       |

  # ========================================================================
  # ESTADOS ESPECIALES - SALIDA DE BANDEJA
  # Cobertura: RN-LE-013, RN-LE-014, RN-LE-015
  # Sección 20, 23 del documento 05-Lista-Encuentros.md
  # Sección 7, 14 del documento 08-Estados.md
  # ========================================================================

  @autoP0 @prioridadExtrema @superusuarioAdmision @happyPath
  Escenario: EST-06 - Estado "No Facturable" provoca salida inmediata de bandeja (RN-LE-013)
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "Pendiente"
    Cuando cambio el estado a "No Facturable"
    Y confirmo el cambio
    Entonces el estado del encuentro debe actualizarse a "No Facturable"
    Y el encuentro debe salir inmediatamente de la bandeja "Lista de Encuentros"
    Y el encuentro NO debe ser visible en la grilla de Admisión
    Y el encuentro debe esperar la evaluación del Job de Admisión

  @autoP0 @prioridadExtrema @superusuarioAdmision @happyPath
  Escenario: EST-07 - Estado "Error de Facturación" provoca salida inmediata de bandeja (RN-LE-013)
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "Pendiente"
    Cuando cambio el estado a "Error de Facturación"
    Y confirmo el cambio
    Entonces el estado del encuentro debe actualizarse a "Error de Facturación"
    Y el encuentro debe salir inmediatamente de la bandeja "Lista de Encuentros"
    Y el encuentro NO debe ser visible en la grilla de Admisión
    Y el encuentro debe esperar la evaluación del Job de Admisión

  @autoP0 @prioridadExtrema @superusuarioAdmision @happyPath
  Escenario: EST-08 - Llegada a Facturación depende del Job de Admisión (RN-LE-014, RN-LE-015)
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he cambiado el estado del encuentro "12345678" a "No Facturable"
    Y el encuentro ha salido de la bandeja "Lista de Encuentros"
    Cuando el Job de Admisión ejecuta la evaluación periódica
    Entonces el Job debe determinar si el encuentro corresponde a Facturación
    Y el Responsable de Facturación visualizará el encuentro solo si el Job lo clasifica para Facturación
    Y la llegada a Facturación depende exclusivamente del Job

  # ========================================================================
  # CAMBIO DE ESTADO - EJECUTIVO DE ADMISIÓN
  # Cobertura: Sección 3.2, 10 del documento 05-Lista-Encuentros.md
  # Sección 4, 9 del documento 08-Estados.md
  # ========================================================================

  @autoP0 @prioridadExtrema @ejecutivoAdmision @happyPath
  Esquema del escenario: EST-09 - Ejecutivo puede cambiar solo estados permitidos
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "Pendiente"
    Y el encuentro fue creado por mi usuario
    Cuando cambio el estado a "<estado>"
    Y confirmo el cambio
    Entonces el estado del encuentro debe actualizarse a "<estado>"

    Ejemplos:
      | estado                          |
      | Pago por Adelantado             |
      | Derivado a Dirección Médica     |
      | Derivado a Supervisor           |
      | Error de Vinculación            |
      | Pendiente de Revisión           |
      | Terapia en Proceso              |
      | Tramitado                       |

  @autoP0 @prioridadExtrema @ejecutivoAdmision @unhappyPath
  Esquema del escenario: EST-10 - Ejecutivo NO puede asignar estados restringidos
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "Pendiente"
    Y el encuentro fue creado por mi usuario
    Cuando intento acceder al listado de estados
    Entonces NO debe mostrarse el estado "<estado_restringido>" en las opciones
    Y solo deben mostrarse los estados permitidos para mi rol

    Ejemplos:
      | estado_restringido      |
      | Pendiente               |
      | No Facturable           |
      | En Proceso              |
      | Error de Facturación    |

  # ========================================================================
  # GESTOR TA - SIN PERMISOS DE CAMBIO DE ESTADO
  # Cobertura: Sección 3.3, 11, 23 del documento 05-Lista-Encuentros.md
  # Sección 3 del documento 08-Estados.md
  # ========================================================================

  @autoP0 @prioridadExtrema @gestorTA @unhappyPath
  Escenario: EST-11 - Gestor TA NO puede cambiar estados (RN-DE-03)
    Dado que soy un usuario con rol "Gestor TA"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "Pendiente"
    Cuando visualizo la pantalla de detalle
    Entonces NO debe mostrarse ningún control de cambio de estado
    Y NO debe mostrarse ningún selector de estados
    Y NO debe mostrarse ningún botón para modificar el estado
    Y el estado debe mostrarse únicamente como información de solo lectura

  @autoP0 @prioridadExtrema @gestorTA @unhappyPath
  Escenario: EST-12 - Gestor TA visualiza estado pero no puede modificarlo
    Dado que soy un usuario con rol "Gestor TA"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "Tramitado"
    Cuando visualizo el estado en la cabecera
    Entonces debe mostrarse el estado "Tramitado" como solo lectura
    Y NO debe ser clickeable
    Y NO debe mostrar opciones de cambio
    Y la pantalla debe ser completamente informativa

  # ========================================================================
  # VALIDACIONES DE ESTADO ACTUAL
  # Cobertura: Sección 23 del documento 05-Lista-Encuentros.md
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: EST-13 - Estado actual NO debe mostrarse en el listado de opciones
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "Tramitado"
    Cuando accedo al selector de estados
    Entonces debe mostrarse el listado de estados disponibles
    Y NO debe incluirse el estado "Tramitado" en las opciones
    Y solo deben mostrarse los estados diferentes al actual

  @prioridadMedia @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: EST-14 - Validar que solo se muestran estados diferentes al actual
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "Derivado a Dirección Médica"
    Cuando accedo al selector de estados
    Entonces debe mostrarse el listado de estados permitidos para mi rol
    Y NO debe incluirse "Derivado a Dirección Médica" en las opciones
    Y debo poder seleccionar cualquier otro estado permitido

  # ========================================================================
  # CAMBIOS DE ESTADO CONCURRENTES
  # Cobertura: Sección 23 del documento 05-Lista-Encuentros.md
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: EST-15 - Cambios concurrentes: prevalece el último registrado exitosamente
    Dado que el encuentro "12345678" tiene estado "Pendiente"
    Y el usuario "Superusuario A" accede al detalle del encuentro
    Y el usuario "Ejecutivo B" accede al detalle del mismo encuentro
    Cuando el usuario "Superusuario A" cambia el estado a "En Proceso" en el tiempo T1
    Y el usuario "Ejecutivo B" cambia el estado a "Tramitado" en el tiempo T2
    Y T2 es posterior a T1
    Entonces el estado final del encuentro debe ser "Tramitado"
    Y debe prevalecer el último cambio registrado exitosamente
    Y ambos cambios deben quedar registrados en el historial

  # ========================================================================
  # ESTADOS INFORMATIVOS
  # Cobertura: Sección 23 del documento 05-Lista-Encuentros.md
  # Sección 8, 9 del documento 08-Estados.md
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: EST-16 - Estado "Derivado a Dirección Médica" es informativo
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "Pendiente"
    Cuando cambio el estado a "Derivado a Dirección Médica"
    Y confirmo el cambio
    Entonces el estado debe actualizarse a "Derivado a Dirección Médica"
    Y el encuentro debe permanecer en la bandeja "Lista de Encuentros"
    Y el estado debe tener carácter informativo
    Y NO debe provocar cambio de bandeja

  @prioridadMedia @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: EST-17 - Estado "Derivado a Supervisor" es informativo
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "Pendiente"
    Cuando cambio el estado a "Derivado a Supervisor"
    Y confirmo el cambio
    Entonces el estado debe actualizarse a "Derivado a Supervisor"
    Y el encuentro debe permanecer en la bandeja "Lista de Encuentros"
    Y el estado debe tener carácter informativo
    Y NO debe provocar cambio de bandeja

  @prioridadMedia @ejecutivoAdmision @happyPath
  Escenario: EST-18 - Estado "Terapia en Proceso" es informativo y puede ser modificado
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "Terapia en Proceso"
    Cuando accedo al selector de estados
    Entonces debo poder cambiar el estado a cualquier otro estado permitido
    Y el estado "Terapia en Proceso" debe poder ser modificado posteriormente
    Y debe tener carácter informativo

  # ========================================================================
  # HISTORIAL DE ESTADOS
  # Cobertura: RN-LE-021, RN-LE-022
  # Sección 22 del documento 05-Lista-Encuentros.md
  # Sección 18 del documento 08-Estados.md
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: EST-19 - Registro en historial al cambiar estado (RN-LE-021)
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "Pendiente"
    Cuando cambio el estado a "Tramitado"
    Y confirmo el cambio
    Entonces el sistema debe generar un nuevo registro en la tabla "toyota.visit_occurrence_status_history"
    Y el registro debe contener el encuentro "12345678"
    Y el registro debe contener el estado anterior "Pendiente"
    Y el registro debe contener el estado nuevo "Tramitado"
    Y el registro debe contener el usuario que realizó el cambio
    Y el registro debe contener la fecha actual
    Y el registro debe contener la hora actual
    Y el registro debe contener el rol del usuario

  @prioridadMedia @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: EST-20 - Registro por cada servicio asociado al encuentro (RN-LE-022)
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene 3 servicios asociados
    Y el encuentro tiene estado "Pendiente"
    Cuando cambio el estado a "Tramitado"
    Y confirmo el cambio
    Entonces el sistema debe generar 3 registros en la tabla "toyota.visit_occurrence_status_history"
    Y cada registro debe corresponder a uno de los 3 servicios
    Y cada registro debe tener el mismo estado anterior "Pendiente"
    Y cada registro debe tener el mismo estado nuevo "Tramitado"
    Y cada registro debe tener la misma fecha y hora de cambio

  @prioridadMedia @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: EST-21 - Visualizar historial completo de cambios de estado
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y el encuentro "12345678" ha tenido los siguientes cambios de estado:
      | Estado Anterior         | Estado Nuevo                | Usuario           | Fecha       |
      | Pendiente               | Tramitado                   | Ejecutivo A       | 2026-06-10  |
      | Tramitado               | Derivado a Dirección Médica | Superusuario B    | 2026-06-11  |
      | Derivado a Dirección Médica | En Proceso              | Superusuario B    | 2026-06-12  |
    Cuando accedo al historial de estados del encuentro
    Entonces debe mostrarse el registro completo de los 3 cambios
    Y cada cambio debe mostrar el usuario que lo realizó
    Y cada cambio debe mostrar la fecha y hora
    Y cada cambio debe mostrar el estado anterior y el nuevo

  # ========================================================================
  # AUDITORÍA DE CAMBIOS
  # Cobertura: Sección 18 del documento 08-Estados.md
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: EST-22 - Auditoría completa de cambio de estado
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y mi nombre de usuario es "ejecutivo.admision01"
    Y mi rol es "Ejecutivo de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "Pendiente"
    Cuando cambio el estado a "Tramitado"
    Y confirmo el cambio en la fecha "2026-06-15" a las "14:30:00"
    Entonces el registro de auditoría debe contener:
      | Campo           | Valor                     |
      | Encuentro       | 12345678                  |
      | Estado anterior | Pendiente                 |
      | Estado nuevo    | Tramitado                 |
      | Usuario         | ejecutivo.admision01      |
      | Fecha           | 2026-06-15                |
      | Hora            | 14:30:00                  |
      | Rol             | Ejecutivo de Admisión     |

  # ========================================================================
  # EXPORTACIÓN DE ESTADOS
  # Cobertura: Sección 23 del documento 05-Lista-Encuentros.md
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: EST-23 - Estados exportados deben mostrarse exactamente como son visualizados
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y visualizo encuentros en la grilla con los siguientes estados:
      | Encuentro | Estado Visualizado          |
      | 12345678  | Derivado a Dirección Médica |
      | 87654321  | Tramitado                   |
      | 11223344  | Pendiente de Revisión       |
    Cuando solicito la descarga de la información
    Y el archivo se genera exitosamente
    Entonces el archivo debe contener los estados exactamente como se visualizan:
      | Encuentro | Estado en Excel             |
      | 12345678  | Derivado a Dirección Médica |
      | 87654321  | Tramitado                   |
      | 11223344  | Pendiente de Revisión       |
    Y NO debe haber diferencias entre lo visualizado y lo exportado

  # ========================================================================
  # MODAL DE CONFIRMACIÓN - COMPORTAMIENTO DETALLADO
  # Cobertura: Sección 16 del documento 08-Estados.md
  # Sección 12 del documento 07-Detalle-Encuentro.md
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: EST-24 - Modal de confirmación se cierra con botón X
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "Pendiente"
    Y he seleccionado el nuevo estado "Tramitado"
    Y el sistema muestra el modal de confirmación
    Cuando presiono el botón cerrar "X"
    Entonces el sistema debe cerrar el modal
    Y el estado del encuentro debe permanecer como "Pendiente"
    Y el sistema debe permanecer en la pantalla "Detalle del Encuentro"

  @prioridadMedia @superusuarioAdmision @ejecutivoAdmision @happyPath
  Esquema del escenario: EST-25 - Validar mensaje dinámico en modal de confirmación
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he accedido al detalle del encuentro "12345678"
    Y el encuentro tiene estado "Pendiente"
    Cuando selecciono el estado "<nuevo_estado>"
    Entonces el modal debe mostrar el título "¿Deseas marcar el encuentro como <nuevo_estado>?"
    Y el mensaje debe ser dinámico según el estado seleccionado

    Ejemplos:
      | nuevo_estado                    |
      | Tramitado                       |
      | Derivado a Dirección Médica     |
      | No Facturable                   |
      | Error de Facturación            |

  # ========================================================================
  # FLUJO COMPLETO DE CAMBIO DE ESTADO
  # Cobertura: Sección 17 del documento 08-Estados.md
  # ========================================================================

  @prioridadMedia @superusuarioAdmision @ejecutivoAdmision @happyPath
  Escenario: EST-26 - Flujo completo de cambio de estado exitoso
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y estoy en la pantalla "Lista de Encuentros"
    Cuando selecciono el encuentro "12345678" de la grilla
    Entonces el sistema debe abrir la pantalla "Detalle del Encuentro"
    Cuando selecciono el nuevo estado "Tramitado"
    Entonces el sistema debe mostrar el modal de confirmación
    Cuando presiono "Sí, cambiar estado"
    Entonces el sistema debe registrar el cambio en la tabla "toyota.visit_occurrence_status_history"
    Y el sistema debe cerrar el modal
    Y el sistema debe retornar a la pantalla "Lista de Encuentros"
    Y el sistema debe actualizar la grilla
    Y el encuentro "12345678" debe mostrarse con estado "Tramitado"
