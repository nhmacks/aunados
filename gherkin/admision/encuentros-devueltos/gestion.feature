# language: es

Característica: Gestión de Encuentros Devueltos
  Como Ejecutivo de Admisión
  Quiero gestionar encuentros devueltos desde Facturación
  Para subsanar inconsistencias y reenviarlos al flujo correcto

  # ========================================================================
  # TÉCNICA: RESOLVER ENCUENTRO DEVUELTO
  # Cobertura: Sección 6.3, 7.1 del documento 18-Encuentros-Devueltos.md
  # RN-ED-05, RN-ED-06
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: GEST-01 - Resolver encuentro devuelto y reenviarlo a Facturación
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y tengo el encuentro devuelto "12345678"
    Y el motivo de devolución fue "Falta documentación administrativa"
    Cuando subsano las inconsistencias del encuentro
    Y marco el encuentro como "Resuelto"
    Entonces el encuentro debe regresar a "Lista de Encuentros por Asignar" de Facturación
    Y el Responsable de Facturación debe poder reasignarlo
    Y debe mostrarse el mensaje "Encuentro resuelto exitosamente"

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: GEST-02 - Cambiar estado de encuentro devuelto a No facturable
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y tengo el encuentro devuelto "12345678"
    Y he analizado el encuentro
    Cuando cambio el estado a "No facturable"
    Entonces el encuentro debe actualizarse con estado "No facturable"
    Y el encuentro debe desaparecer de la bandeja "Encuentros Devueltos"
    Y el encuentro debe pasar automáticamente a la bandeja del Responsable de Facturación
    Y debe mostrarse el mensaje "Estado actualizado correctamente"

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: GEST-03 - Cambiar estado de encuentro devuelto
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y tengo el encuentro devuelto "12345678"
    Cuando cambio el estado a "<estado>"
    Entonces el encuentro debe actualizarse con estado "<estado>"
    Y el encuentro debe desaparecer de la bandeja "Encuentros Devueltos"
    Y el encuentro debe pasar automáticamente a la bandeja del Responsable de Facturación

    Ejemplos:
      | estado               |
      | Error de facturación |
      | Regularizado         |

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: GEST-04 - Agregar observaciones al resolver encuentro devuelto
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y tengo el encuentro devuelto "12345678"
    Cuando agrego la observación "Documentación completada el 08/06/2024"
    Y marco el encuentro como "Resuelto"
    Entonces la observación debe guardarse en el historial del encuentro
    Y debe mostrarse en el detalle del encuentro

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE PERMISOS
  # Cobertura: RN-ED-04
  # ========================================================================

  @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Escenario: GEST-05 - Ejecutivo NO puede resolver encuentros de otros ejecutivos
    Dado que soy el ejecutivo "ejecutivo01"
    Y he iniciado sesión en el sistema
    Y existe el encuentro devuelto "12345678" creado por "ejecutivo02"
    Cuando intento acceder al encuentro "12345678"
    Entonces el sistema debe denegar el acceso
    Y debe mostrarse el mensaje "No tienes permisos para gestionar este encuentro"

  @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Escenario: GEST-06 - Ejecutivo NO puede resolver encuentros de otras sedes
    Dado que soy el ejecutivo "ejecutivo01" de la sede "Auna Guardia Civil"
    Y he iniciado sesión en el sistema
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
  Escenario: GEST-07 - Regularizar encuentro devuelto (RN-ED-013)
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y tengo el encuentro devuelto "12345678"
    Y el motivo de devolución fue "Carta de Garantía por Laboratorio"
    Cuando corrijo las observaciones registradas
    Y marco el encuentro como "Regularizado"
    Entonces el encuentro debe cambiar su estado a "Regularizado"
    Y el encuentro debe desaparecer de la bandeja "Encuentros Devueltos"
    Y el encuentro debe pasar automáticamente a la bandeja del Responsable de Facturación
    Y debe mostrarse el mensaje "Encuentro regularizado exitosamente"

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: GEST-08 - Reenviar encuentro regularizado a Facturación (RN-ED-014)
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y he regularizado el encuentro "12345678"
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
  Escenario: GEST-09 - Visualizar encuentro devuelto sin comentarios (RN-ED-004, RN-ED-025)
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y tengo el encuentro devuelto "12345678"
    Y la devolución fue registrada sin comentarios
    Cuando accedo al detalle del encuentro
    Entonces debo visualizar los motivos de devolución
    Y NO debo visualizar ningún comentario asociado
    Y debo visualizar el estado del encuentro como "Devuelto"
    Y NO debo visualizar la fecha de devolución
    Y NO debo visualizar el usuario que realizó la devolución

  @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: GEST-10 - Visualizar encuentro devuelto con comentarios (RN-ED-005, RN-ED-025)
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y tengo el encuentro devuelto "12345678"
    Y la devolución fue registrada con el comentario "Se requiere adjuntar resultado de biopsia del paciente"
    Cuando accedo al detalle del encuentro
    Entonces debo visualizar los motivos de devolución
    Y debo visualizar el comentario "Se requiere adjuntar resultado de biopsia del paciente"
    Y debo visualizar el estado del encuentro como "Devuelto"
    Y NO debo visualizar la fecha de devolución
    Y NO debo visualizar el usuario que realizó la devolución

  # ========================================================================
  # TÉCNICA: GESTIÓN DE ENCUENTROS POR SUPERUSUARIO
  # Cobertura: Funcionalidad exclusiva del Superusuario de Admisión
  # ========================================================================

  @superusuarioAdmision @encuentrosDevueltos @happyPath
  Escenario: GEST-11 - Superusuario visualiza checkboxes para marcar motivos como subsanados
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he iniciado sesión en el sistema
    Y existe el encuentro devuelto "12345678" con los siguientes motivos:
      | Motivo                            |
      | Carta de Garantía por Laboratorio |
      | Acta Conformidad                  |
    Cuando accedo al detalle del encuentro
    Entonces debo visualizar checkboxes junto a cada motivo de devolución
    Y debo poder marcar o desmarcar cada motivo
    Y debo visualizar un campo de comentarios con límite de 400 caracteres
    Y debo visualizar un dropdown de estado

  @superusuarioAdmision @encuentrosDevueltos @unhappyPath
  Escenario: GEST-12 - Estado Regularizado se deshabilita al desmarcar un motivo
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he iniciado sesión en el sistema
    Y existe el encuentro devuelto "12345678" con 3 motivos de devolución
    Y he marcado los 3 motivos como subsanados
    Y el estado "Regularizado" está disponible en el dropdown
    Cuando desmarco uno de los motivos
    Entonces el estado "Regularizado" debe desaparecer del dropdown
    Y NO debo poder seleccionar "Regularizado" como estado

  @superusuarioAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: GEST-13 - Superusuario puede cambiar estado independientemente de los checkboxes
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he iniciado sesión en el sistema
    Y existe el encuentro devuelto "12345678" con motivos de devolución
    Y he marcado "<checkboxes_marcados>" de "<total_checkboxes>" motivos
    Cuando accedo al dropdown de estado
    Entonces debo visualizar las siguientes opciones de estado:
      | Estado disponible          |
      | Pago por adelantado        |
      | No facturable              |
      | Derivado a D.M             |
      | Derivado a Supervisor      |
      | Error de vinculación       |
      | Pendiente de revisión      |
      | Terapia en proceso         |
      | Error de facturación       |
    Y la opción "Regularizado" debe estar "<estado_regularizado>"

    Ejemplos:
      | checkboxes_marcados | total_checkboxes | estado_regularizado |
      | 0                   | 3                | no disponible       |
      | 1                   | 3                | no disponible       |
      | 2                   | 3                | no disponible       |
      | 3                   | 3                | disponible          |
      | 1                   | 1                | disponible          |

  @superusuarioAdmision @encuentrosDevueltos @happyPath
  Escenario: GEST-14 - Superusuario regulariza encuentro marcando todos los motivos y cambiando estado
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he iniciado sesión en el sistema
    Y existe el encuentro devuelto "12345678" con los siguientes motivos:
      | Motivo                            |
      | Carta de Garantía por Laboratorio |
    Cuando accedo al detalle del encuentro
    Y marco el checkbox de "Carta de Garantía por Laboratorio"
    Y selecciono el estado "Regularizado" del dropdown
    Y confirmo el cambio de estado
    Entonces el encuentro debe cambiar su estado a "Regularizado"
    Y el encuentro debe desaparecer de la bandeja "Encuentros Devueltos"
    Y el encuentro debe pasar automáticamente a la bandeja del Responsable de Facturación
    Y debe mostrarse el mensaje "Encuentro regularizado exitosamente"

  @superusuarioAdmision @encuentrosDevueltos @happyPath
  Escenario: GEST-15 - Superusuario agrega comentarios al gestionar encuentro devuelto
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he iniciado sesión en el sistema
    Y existe el encuentro devuelto "12345678" con motivos de devolución
    Cuando accedo al detalle del encuentro
    Y ingreso el comentario "Se subsanó la documentación faltante el 16/06/2026"
    Y marco todos los motivos como subsanados
    Y selecciono el estado "Regularizado"
    Y confirmo el cambio de estado
    Entonces el comentario debe guardarse en el historial del encuentro
    Y el encuentro debe cambiar su estado a "Regularizado"
    Y el encuentro debe desaparecer de la bandeja "Encuentros Devueltos"
    Y el encuentro debe pasar automáticamente a la bandeja del Responsable de Facturación

  @superusuarioAdmision @encuentrosDevueltos @unhappyPath
  Escenario: GEST-16 - Validar límite de 400 caracteres en comentarios del Superusuario
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he iniciado sesión en el sistema
    Y existe el encuentro devuelto "12345678"
    Cuando accedo al detalle del encuentro
    Y intento ingresar un comentario de 401 caracteres
    Entonces el sistema debe limitar el texto a 400 caracteres
    Y debe mostrarse el contador "0/400"
