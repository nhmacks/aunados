# language: es

Característica: Cambio de Estado del Encuentro
  Como Ejecutivo de Facturación
  Quiero cambiar manualmente el estado de un encuentro desde su detalle
  Para gestionar adecuadamente el flujo de facturación según las necesidades del proceso

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Facturación"

  # ========================================================================
  # TÉCNICA: ACCESO A CAMBIO DE ESTADO
  # Cobertura: Sección 8.4.1 del documento 21-Pendientes-Facturar.md
  # RN-PF-24, RN-PF-25
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: EST-01 - Acceder a lista de estados disponibles desde detalle del encuentro (RN-PF-24, RN-PF-25)
    Dado que tengo encuentros en la bandeja "Pendientes por Facturar"
    Y he accedido al detalle del encuentro "12345678" con estado "Por facturar"
    Cuando visualizo la sección "Estado"
    Entonces debe mostrarse el estado actual del encuentro
    Y debe mostrarse un desplegable con los siguientes estados disponibles:
      | Estado        |
      | En revisión   |
      | Facturado     |

  # ========================================================================
  # TÉCNICA: CAMBIAR ESTADO A "POR FACTURAR"
  # Cobertura: Sección 8.4.3 del documento 21-Pendientes-Facturar.md
  # RN-PF-24, RN-PF-25, RN-PF-26, RN-PF-28, RN-PF-31
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: EST-02 - Cambiar estado a "Por facturar" exitosamente (RN-PF-24, RN-PF-26, RN-PF-28)
    Dado que he accedido al detalle del encuentro "12345678"
    Y el estado actual del encuentro es "En revisión"
    Cuando selecciono el estado "Por facturar" del desplegable
    Entonces debe mostrarse un modal de confirmación
    Y el modal debe mostrar el mensaje "¿Deseas marcar el encuentro como por facturar?"
    Y el modal debe mostrar el submensaje "El encuentro será marcado como por facturar, listo para el proceso de facturación."
    Y el modal debe mostrar el botón "No, cancelar"
    Y el modal debe mostrar el botón "Sí, cambiar estado"
    Y el modal debe mostrar el botón "X" para cerrar
    Cuando selecciono "Sí, cambiar estado"
    Entonces el sistema debe actualizar el estado del encuentro a "Por facturar"
    Y el sistema debe cerrar la pantalla de detalle
    Y el sistema debe retornar a la bandeja "Pendientes por Facturar"
    Y el sistema debe recargar la pantalla
    Y el encuentro "12345678" debe mostrarse en la grilla con estado "Por facturar"

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: EST-03 - Validar que encuentro permanece en bandeja al cambiar a "Por facturar" (RN-PF-28)
    Dado que he accedido al detalle del encuentro "12345678"
    Cuando cambio el estado a "Por facturar"
    Y selecciono "Sí, cambiar estado" en el modal de confirmación
    Entonces el encuentro "12345678" debe permanecer en mi bandeja "Pendientes por Facturar"
    Y el encuentro NO debe desaparecer de la grilla

  # ========================================================================
  # TÉCNICA: CAMBIAR ESTADO A "EN REVISIÓN"
  # Cobertura: Sección 8.4.4 del documento 21-Pendientes-Facturar.md
  # RN-PF-24, RN-PF-25, RN-PF-26, RN-PF-28, RN-PF-31
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: EST-05 - Cambiar estado a "En revisión" exitosamente (RN-PF-24, RN-PF-26, RN-PF-28)
    Dado que he accedido al detalle del encuentro "12345678"
    Y el estado actual del encuentro es "Por facturar"
    Cuando selecciono el estado "En revisión" del desplegable
    Entonces debe mostrarse un modal de confirmación
    Y el modal debe mostrar el mensaje "¿Deseas marcar el encuentro como en revisión?"
    Y el modal debe mostrar el submensaje "El encuentro quedará en tu bandeja para que puedas seguir trabajándolo cuando lo necesites."
    Y el modal debe mostrar el botón "No, cancelar"
    Y el modal debe mostrar el botón "Sí, cambiar estado"
    Y el modal debe mostrar el botón "X" para cerrar
    Cuando selecciono "Sí, cambiar estado"
    Entonces el sistema debe actualizar el estado del encuentro a "En revisión"
    Y el sistema debe cerrar la pantalla de detalle
    Y el sistema debe retornar a la bandeja "Pendientes por Facturar"
    Y el sistema debe recargar la pantalla
    Y el encuentro "12345678" debe mostrarse en la grilla con estado "En revisión"

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: EST-06 - Validar que el encuentro permanece en bandeja al cambiar a "En revisión" (RN-PF-28)
    Dado que he accedido al detalle del encuentro "12345678"
    Cuando cambio el estado a "En revisión"
    Y selecciono "Sí, cambiar estado" en el modal de confirmación
    Entonces el encuentro "12345678" debe permanecer en mi bandeja "Pendientes por Facturar"
    Y el encuentro NO debe desaparecer de la grilla

  # ========================================================================
  # TÉCNICA: CAMBIAR ESTADO A "FACTURADO"
  # Cobertura: Sección 8.4.5 del documento 21-Pendientes-Facturar.md
  # RN-PF-24, RN-PF-25, RN-PF-26, RN-PF-29, RN-PF-30, RN-PF-31
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: EST-08 - Cambiar estado a "Facturado" exitosamente (RN-PF-24, RN-PF-26, RN-PF-29)
    Dado que he accedido al detalle del encuentro "12345678"
    Y el estado actual del encuentro es "Por facturar"
    Cuando selecciono el estado "Facturado" del desplegable
    Entonces debe mostrarse un modal de confirmación
    Y el modal debe mostrar el mensaje "¿Deseas marcar el encuentro como facturado?"
    Y el modal debe mostrar el submensaje "Al marcar el encuentro como facturado, ya no podrás hacer cambios ni devolverlo."
    Y el modal debe mostrar el botón "No, cancelar"
    Y el modal debe mostrar el botón "Sí, cambiar estado"
    Y el modal debe mostrar el botón "X" para cerrar
    Cuando selecciono "Sí, cambiar estado"
    Entonces el sistema debe actualizar el estado del encuentro a "Facturado"
    Y el sistema debe cerrar la pantalla de detalle
    Y el sistema debe retornar a la bandeja "Pendientes por Facturar"
    Y el sistema debe recargar la pantalla
    Y el encuentro "12345678" NO debe mostrarse en la grilla
    Y el encuentro debe haber salido de la bandeja "Pendientes por Facturar"

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: EST-09 - Validar que el encuentro desaparece de bandeja al cambiar a "Facturado" (RN-PF-29)
    Dado que tengo 5 encuentros en la bandeja "Pendientes por Facturar"
    Y he accedido al detalle del encuentro "12345678"
    Cuando cambio el estado a "Facturado"
    Y selecciono "Sí, cambiar estado" en el modal de confirmación
    Entonces el sistema debe retornar a la bandeja "Pendientes por Facturar"
    Y debo visualizar únicamente 4 encuentros en la grilla
    Y el encuentro "12345678" NO debe aparecer en la lista

  @ejecutivoFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: EST-10 - Validar que el encuentro "Facturado" no puede modificarse ni devolverse (RN-PF-30)
    Dado que el encuentro "12345678" tiene estado "Facturado"
    Cuando intento acceder al detalle del encuentro "12345678"
    Entonces el sistema NO debe permitir el acceso
    Y el encuentro NO debe aparecer en la bandeja "Pendientes por Facturar"

  # ========================================================================
  # TÉCNICA: CANCELAR CAMBIO DE ESTADO
  # Cobertura: Sección 8.4 del documento 21-Pendientes-Facturar.md
  # RN-PF-27
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Esquema del escenario: EST-12 - Cancelar cambio de estado para cualquier opción de estado (RN-PF-27)
    Dado que he accedido al detalle del encuentro "12345678"
    Y el estado actual del encuentro es "Por facturar"
    Cuando selecciono el estado "<nuevo_estado>" del desplegable
    Y se muestra el modal de confirmación
    Y cancelo la operación mediante "<metodo_cancelacion>"
    Entonces el modal debe cerrarse
    Y NO debe realizarse ninguna modificación de estado
    Y el estado del encuentro debe permanecer como "Por facturar"
    Y debo permanecer en la pantalla de detalle del encuentro

    Ejemplos:
      | nuevo_estado  | metodo_cancelacion |
      | En revisión   | No, cancelar       |
      | En revisión   | X                  |
      | Facturado     | No, cancelar       |
      | Facturado     | X                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE MODALES ESPECÍFICOS
  # Cobertura: Sección 15.1 del documento 21-Pendientes-Facturar.md
  # RN-PF-26
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Esquema del escenario: EST-13 - Validar mensajes específicos de modal para cada estado (RN-PF-26)
    Dado que he accedido al detalle del encuentro "12345678"
    Cuando selecciono el estado "<estado>" del desplegable
    Entonces debe mostrarse un modal de confirmación
    Y el modal debe mostrar el mensaje "<mensaje_principal>"
    Y el modal debe mostrar el submensaje "<submensaje>"

    Ejemplos:
      | estado        | mensaje_principal                               | submensaje                                                                                    |
      | Por facturar  | ¿Deseas marcar el encuentro como por facturar?  | El encuentro será marcado como por facturar, listo para el proceso de facturación.            |
      | En revisión   | ¿Deseas marcar el encuentro como en revisión?   | El encuentro quedará en tu bandeja para que puedas seguir trabajándolo cuando lo necesites.   |
      | Facturado     | ¿Deseas marcar el encuentro como facturado?     | Al marcar el encuentro como facturado ya no podrás hacer cambios ni devolverlo.               |

  # ========================================================================
  # TÉCNICA: FLUJO COMPLETO DE CAMBIO DE ESTADO
  # Cobertura: Sección 10.4 del documento 21-Pendientes-Facturar.md
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: EST-14 - Flujo completo de cambio de estado desde "Por facturar" hasta "Facturado"
    Dado que he accedido al detalle del encuentro "12345678"
    Y el estado actual del encuentro es "Por facturar"
    Cuando cambio el estado a "En revisión"
    Y selecciono "Sí, cambiar estado" en el modal de confirmación
    Entonces el sistema debe retornar a la bandeja "Pendientes por Facturar"
    Y el encuentro "12345678" debe mostrarse con estado "En revisión"
    Cuando accedo nuevamente al detalle del encuentro "12345678"
    Y cambio el estado a "Por facturar"
    Y selecciono "Sí, cambiar estado" en el modal de confirmación
    Entonces el encuentro "12345678" debe mostrarse con estado "Por facturar"
    Cuando accedo nuevamente al detalle del encuentro "12345678"
    Y cambio el estado a "Facturado"
    Y selecciono "Sí, cambiar estado" en el modal de confirmación
    Entonces el encuentro "12345678" NO debe aparecer en la bandeja "Pendientes por Facturar"

  @ejecutivoFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: EST-15 - Validar que encuentro "Facturado" no permite nueva devolución (RN-PF-30)
    Dado que el encuentro "12345678" tiene estado "Facturado"
    Cuando el sistema evalúa opciones disponibles para el encuentro
    Entonces la opción "Devolver Encuentro" NO debe estar disponible
    Y el encuentro NO debe poder ser devuelto a Admisión
    Y el encuentro debe ser considerado como finalizado
