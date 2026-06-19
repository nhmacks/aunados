# language: es

Característica: Reasignación de Encuentros Regularizados
  Como Responsable de Facturación
  Quiero reasignar encuentros regularizados que regresan desde Admisión
  Para que sean procesados nuevamente por un Ejecutivo de Facturación

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación"

  # ========================================================================
  # TÉCNICA: REASIGNACIÓN DE ENCUENTROS REGULARIZADOS
  # Cobertura: Secciones 16-18 del documento 18-Encuentros-Devueltos.md
  # RN-ED-014, RN-ED-015, RN-ED-016
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @encuentrosRegularizados @happyPath
  Escenario: REAS-01 - Recibir encuentro regularizado desde Admisión (RN-ED-014)
    Dado que el Ejecutivo de Admisión regularizó el encuentro "12345678"
    Y el encuentro fue reenviado a Facturación
    Cuando accedo a "Lista de Encuentros por Asignar"
    Entonces debo visualizar el encuentro "12345678"
    Y el encuentro debe tener estado "Regularizado"
    Y el encuentro NO debe estar asignado a ningún ejecutivo
    Y puedo asignarlo a cualquier Ejecutivo de Facturación

  @prioridadExtrema @responsableFacturacion @encuentrosRegularizados @happyPath
  Escenario: REAS-02 - Reasignar encuentro regularizado al mismo ejecutivo (RN-ED-015)
    Dado que tengo el encuentro regularizado "12345678" sin asignar
    Y el encuentro fue procesado anteriormente por "ejecutivo01"
    Cuando asigno el encuentro al "ejecutivo01"
    Entonces el encuentro debe asignarse exitosamente
    Y el encuentro debe aparecer en la bandeja "Pendientes por Facturar" del "ejecutivo01"
    Y debe mostrarse el mensaje "Encuentro asignado exitosamente"

  @prioridadExtrema @responsableFacturacion @encuentrosRegularizados @happyPath
  Escenario: REAS-03 - Reasignar encuentro regularizado a ejecutivo diferente (RN-ED-015)
    Dado que tengo el encuentro regularizado "12345678" sin asignar
    Y el encuentro fue procesado anteriormente por "ejecutivo01"
    Cuando asigno el encuentro al "ejecutivo02"
    Entonces el encuentro debe asignarse exitosamente
    Y el encuentro debe aparecer en la bandeja "Pendientes por Facturar" del "ejecutivo02"
    Y el "ejecutivo01" NO debe visualizar el encuentro en su bandeja

  @prioridadExtrema @responsableFacturacion @encuentrosRegularizados @happyPath
  Escenario: REAS-04 - Validar que estado se conserva después de reasignación (RN-ED-016)
    Dado que el encuentro "12345678" tiene estado "Regularizado"
    Cuando asigno el encuentro al "ejecutivo01"
    Entonces el encuentro debe mantener el estado "Regularizado"
    Y el estado NO debe cambiar por la reasignación
    Y el ejecutivo debe poder visualizar el historial de devoluciones

  @prioridadExtrema @responsableFacturacion @encuentrosRegularizados @happyPath
  Esquema del escenario: REAS-05 - Conservar diferentes estados durante reasignación (RN-ED-016)
    Dado que el encuentro "12345678" tiene estado "<estado>"
    Cuando asigno el encuentro a un Ejecutivo de Facturación
    Entonces el encuentro debe mantener el estado "<estado>"
    Y la reasignación NO debe modificar el estado del encuentro

    Ejemplos:
      | estado               |
      | Regularizado         |
      | No Facturable        |
      | Error de Facturación |

  # ========================================================================
  # TÉCNICA: VISUALIZACIÓN DE HISTORIAL EN REASIGNACIÓN
  # Cobertura: Sección 19 del documento 18-Encuentros-Devueltos.md
  # RN-ED-017
  # ========================================================================

  @prioridadExtrema @responsableFacturacion @encuentrosRegularizados @happyPath
  Escenario: REAS-06 - Visualizar historial de devoluciones del encuentro regularizado
    Dado que tengo el encuentro regularizado "12345678" sin asignar
    Y el encuentro fue devuelto anteriormente con los motivos:
      | Motivo                      |
      | CG Ampliatoria              |
      | Código de Autorización Usado|
    Y el encuentro incluye el comentario "Verificar código de autorización en sistema AUNA"
    Cuando accedo al detalle del encuentro
    Entonces debo visualizar el historial completo de devoluciones
    Y debo visualizar los 2 motivos de devolución
    Y debo visualizar el comentario registrado
    Y debo visualizar el usuario que realizó la devolución
    Y debo visualizar la fecha y hora de la devolución

