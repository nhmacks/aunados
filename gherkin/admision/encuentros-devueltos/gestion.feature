# language: es

Característica: Gestión de Encuentros Devueltos
  Como Ejecutivo de Admisión
  Quiero gestionar encuentros devueltos desde Facturación
  Para subsanar inconsistencias y reenviarlos al flujo correcto

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Admisión"
    Y tengo encuentros devueltos asignados

  # ========================================================================
  # TÉCNICA: RESOLVER ENCUENTRO DEVUELTO
  # Cobertura: Sección 6.3, 7.1 del documento 18-Encuentros-Devueltos.md
  # RN-ED-05, RN-ED-06
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: GEST-01 - Resolver encuentro devuelto y reenviarlo a Facturación
    Dado que tengo el encuentro devuelto "12345678"
    Y el motivo de devolución fue "Falta documentación administrativa"
    Cuando subsano las inconsistencias del encuentro
    Y marco el encuentro como "Resuelto"
    Entonces el encuentro debe regresar a "Lista de Encuentros por Asignar" de Facturación
    Y el Responsable de Facturación debe poder reasignarlo
    Y debe mostrarse el mensaje "Encuentro resuelto exitosamente"

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: GEST-02 - Cambiar estado de encuentro devuelto a No facturable
    Dado que tengo el encuentro devuelto "12345678"
    Y he analizado el encuentro
    Cuando cambio el estado a "No facturable"
    Entonces el encuentro debe actualizarse con estado "No facturable"
    Y el encuentro NO debe regresar a Facturación
    Y debe mostrarse el mensaje "Estado actualizado correctamente"

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: GEST-03 - Cambiar estado de encuentro devuelto
    Dado que tengo el encuentro devuelto "12345678"
    Cuando cambio el estado a "<estado>"
    Entonces el encuentro debe actualizarse con estado "<estado>"

    Ejemplos:
      | estado               |
      | Error de facturación |
      | Regularizado         |

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: GEST-04 - Agregar observaciones al resolver encuentro devuelto
    Dado que tengo el encuentro devuelto "12345678"
    Cuando agrego la observación "Documentación completada el 08/06/2024"
    Y marco el encuentro como "Resuelto"
    Entonces la observación debe guardarse en el historial del encuentro
    Y debe mostrarse en el detalle del encuentro

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE RESOLUCIÓN
  # Cobertura: RN-ED-01, RN-ED-05
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Escenario: GEST-05 - Validar que encuentro devuelto no avanza hasta ser resuelto
    Dado que tengo el encuentro devuelto "12345678" en estado "Devuelto"
    Cuando el Job de Admisión ejecuta la clasificación
    Entonces el encuentro NO debe avanzar al flujo de Protocolo o Facturación
    Y debe permanecer en "Encuentros Devueltos"
    Y debe requerir resolución manual

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: GEST-06 - Encuentro resuelto regresa a evaluación del Job de Admisión
    Dado que marqué el encuentro "12345678" como "Resuelto"
    Cuando el Job de Admisión ejecuta la siguiente evaluación
    Entonces el encuentro debe ser reevaluado por el Job
    Y debe clasificarse según las reglas de negocio actuales
    Y debe salir de "Encuentros Devueltos"

  # ========================================================================
  # TÉCNICA: ESCALAMIENTO
  # Cobertura: Sección 7.2 del documento 18-Encuentros-Devueltos.md
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: GEST-07 - Escalar encuentro devuelto a Supervisor
    Dado que tengo el encuentro devuelto "12345678"
    Y no puedo resolver la inconsistencia
    Cuando selecciono "Derivar a Supervisor"
    Y confirmo el escalamiento
    Entonces el estado del encuentro debe actualizarse a "Derivado a Supervisor"
    Y el sistema debe notificar al Supervisor
    Y el encuentro debe salir de mi bandeja

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: GEST-08 - Escalar encuentro devuelto a Dirección Médica
    Dado que tengo el encuentro devuelto "12345678"
    Y la inconsistencia requiere revisión médica
    Cuando selecciono "Derivar a Dirección Médica"
    Y confirmo el escalamiento
    Entonces el estado debe actualizarse a "Derivado a Dirección Médica"
    Y el sistema debe notificar a Dirección Médica
    Y el encuentro debe salir de mi bandeja

  # ========================================================================
  # TÉCNICA: HISTORIAL DE DEVOLUCIONES
  # Cobertura: Sección 8.3, RN-ED-02, RN-ED-06 del documento 18-Encuentros-Devueltos.md
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: GEST-09 - Visualizar historial de devoluciones múltiples
    Dado que el encuentro "12345678" ha sido devuelto 3 veces
    Y la primera devolución fue por "Falta documentación"
    Y la segunda devolución fue por "Error en datos del seguro"
    Y la tercera devolución fue por "Cobertura insuficiente"
    Cuando accedo al historial del encuentro
    Entonces debe mostrarse el registro de las 3 devoluciones
    Y cada devolución debe mostrar fecha, hora, usuario y motivo
    Y cada devolución debe mostrar la fecha de resolución si aplica

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE PERMISOS
  # Cobertura: RN-ED-04
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Escenario: GEST-11 - Ejecutivo NO puede resolver encuentros de otros ejecutivos
    Dado que soy el ejecutivo "ejecutivo01"
    Y existe el encuentro devuelto "12345678" creado por "ejecutivo02"
    Cuando intento acceder al encuentro "12345678"
    Entonces el sistema debe denegar el acceso
    Y debe mostrarse el mensaje "No tienes permisos para gestionar este encuentro"

  @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Escenario: GEST-12 - Ejecutivo NO puede resolver encuentros de otras sedes
    Dado que soy el ejecutivo "ejecutivo01" de la sede "Auna Guardia Civil"
    Y existe el encuentro devuelto "12345678" de la sede "Auna Cañete"
    Cuando intento acceder al encuentro "12345678"
    Entonces el sistema debe denegar el acceso
    Y solo debo poder gestionar encuentros de mi sede


  # ========================================================================
  # TÉCNICA: REGULARIZACIÓN Y REENVÍO
  # Cobertura: Secciones 15-16 del documento 18-Encuentros-Devueltos.md
  # RN-ED-013, RN-ED-014
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: GEST-14 - Regularizar encuentro devuelto (RN-ED-013)
    Dado que tengo el encuentro devuelto "12345678"
    Y el motivo de devolución fue "Carta de Garantía por Laboratorio"
    Cuando corrijo las observaciones registradas
    Y marco el encuentro como "Regularizado"
    Entonces el encuentro debe abandonar la bandeja "Encuentros Devueltos"
    Y el encuentro debe cambiar su estado a "Regularizado"
    Y debe mostrarse el mensaje "Encuentro regularizado exitosamente"

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: GEST-15 - Reenviar encuentro regularizado a Facturación (RN-ED-014)
    Dado que he regularizado el encuentro "12345678"
    Cuando reenvío el encuentro a Facturación
    Entonces el encuentro NO debe ser asignado automáticamente
    Y el encuentro debe ser recibido por el Responsable de Facturación
    Y el encuentro debe aparecer en "Lista de Encuentros por Asignar"
    Y el Responsable de Facturación debe poder asignarlo a un Ejecutivo de Facturación

  # ========================================================================
  # TÉCNICA: VISUALIZACIÓN DE COMENTARIOS
  # Cobertura: Sección 7 del documento 18-Encuentros-Devueltos.md
  # RN-ED-004, RN-ED-005
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: GEST-16 - Visualizar encuentro devuelto sin comentarios (RN-ED-004, RN-ED-025)
    Dado que tengo el encuentro devuelto "12345678"
    Y la devolución fue registrada sin comentarios
    Cuando accedo al detalle del encuentro
    Entonces debo visualizar los motivos de devolución
    Y NO debo visualizar ningún comentario asociado
    Y debo visualizar el estado del encuentro como "Devuelto"
    Y NO debo visualizar la fecha de devolución
    Y NO debo visualizar el usuario que realizó la devolución

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: GEST-17 - Visualizar encuentro devuelto con comentarios (RN-ED-005, RN-ED-025)
    Dado que tengo el encuentro devuelto "12345678"
    Y la devolución fue registrada con el comentario "Se requiere adjuntar resultado de biopsia del paciente"
    Cuando accedo al detalle del encuentro
    Entonces debo visualizar los motivos de devolución
    Y debo visualizar el comentario "Se requiere adjuntar resultado de biopsia del paciente"
    Y debo visualizar el estado del encuentro como "Devuelto"
    Y NO debo visualizar la fecha de devolución
    Y NO debo visualizar el usuario que realizó la devolución
