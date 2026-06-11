# language: es

Característica: Permisos y Control de Acceso en Pendientes por Facturar
  Como administrador del sistema AUNADOS
  Quiero que los permisos se apliquen correctamente en Pendientes por Facturar
  Para garantizar que cada ejecutivo solo visualice sus propios encuentros asignados

  Antecedentes:
    Dado que existen encuentros clasificados para Facturación en el sistema

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ACCESO EXCLUSIVO
  # Cobertura: Sección 3 del documento 21-Pendientes-Facturar.md
  # RN-PF-01, RN-PF-02, RN-PF-03, CS-PF-01
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @regresion
  Escenario: PERM-01 - Ejecutivo de Facturación puede acceder a Pendientes por Facturar
    Dado que soy un usuario con rol "Ejecutivo de Facturación"
    Y he iniciado sesión en el sistema
    Cuando inicio sesión correctamente
    Entonces el sistema debe mostrar la pantalla "Pendientes por Facturar" automáticamente
    Y debo poder acceder a la funcionalidad completa

  @responsableFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: PERM-02 - Responsable de Facturación NO puede acceder a Pendientes por Facturar
    Dado que soy un usuario con rol "Responsable de Facturación"
    Y he iniciado sesión en el sistema
    Cuando intento acceder a "Pendientes por Facturar"
    Entonces el sistema debe denegar el acceso
    Y debe mostrar mensaje "No tiene permisos para acceder a esta funcionalidad"

  @superusuarioAdmision @pendientesPorFacturar @unhappyPath
  Escenario: PERM-03 - Superusuario de Admisión NO puede acceder a Pendientes por Facturar
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he iniciado sesión en el sistema
    Cuando intento acceder a "Pendientes por Facturar"
    Entonces el sistema debe denegar el acceso
    Y NO debo visualizar la opción en el menú

  # ========================================================================
  # TÉCNICA: RESTRICCIONES DE VISIBILIDAD POR USUARIO
  # Cobertura: Sección 4.2, 5.2 del documento 21-Pendientes-Facturar.md
  # RN-PF-01, RN-PF-02, RN-PF-03, CS-PF-02, CS-PF-03
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @regresion
  Escenario: PERM-04 - Ejecutivo solo visualiza encuentros asignados a su usuario
    Dado que soy el ejecutivo "ejecutivo01"
    Y existen 100 encuentros clasificados para Facturación
    Y 30 encuentros están asignados a "ejecutivo01"
    Y 70 encuentros están asignados a otros ejecutivos
    Cuando accedo a "Pendientes por Facturar"
    Entonces debo visualizar únicamente 30 encuentros
    Y todos los encuentros mostrados deben estar asignados a "ejecutivo01"

  @ejecutivoFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: PERM-05 - Ejecutivo NO puede visualizar encuentros de otros ejecutivos
    Dado que soy el ejecutivo "ejecutivo01"
    Y existen encuentros asignados al "ejecutivo02"
    Cuando accedo a "Pendientes por Facturar"
    Entonces NO debo visualizar encuentros asignados al "ejecutivo02"
    Y solo debo visualizar encuentros asignados a "ejecutivo01"

  @ejecutivoFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: PERM-06 - Ejecutivo NO puede visualizar encuentros sin asignar
    Dado que soy el ejecutivo "ejecutivo01"
    Y existen encuentros en estado "Por asignar" sin ejecutivo asignado
    Cuando accedo a "Pendientes por Facturar"
    Entonces NO debo visualizar encuentros sin asignar
    Y solo debo visualizar encuentros asignados a mi usuario

  @ejecutivoFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: PERM-07 - Ejecutivo NO puede acceder a encuentro de otro ejecutivo mediante URL directa
    Dado que soy el ejecutivo "ejecutivo01"
    Y existe el encuentro "12345678" asignado al "ejecutivo02"
    Cuando intento acceder directamente al detalle del encuentro "12345678" mediante URL
    Entonces el sistema debe denegar el acceso
    Y debe mostrarse el mensaje "No tienes permisos para visualizar este encuentro"
    Y debe redirigirme a "Pendientes por Facturar"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ACCIONES PERMITIDAS
  # Cobertura: Sección 8 del documento 21-Pendientes-Facturar.md
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: PERM-08 - Ejecutivo puede procesar facturación de sus encuentros asignados
    Dado que soy el ejecutivo "ejecutivo01"
    Y tengo el encuentro "12345678" asignado
    Cuando accedo al detalle del encuentro "12345678"
    Entonces debo poder revisar la información completa
    Y debo poder ingresar datos de facturación
    Y debo poder marcar el encuentro como "Facturado"

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: PERM-09 - Ejecutivo puede devolver sus encuentros asignados
    Dado que soy el ejecutivo "ejecutivo01"
    Y tengo el encuentro "12345678" asignado
    Cuando accedo al detalle del encuentro
    Entonces debo visualizar la opción "Devolver Encuentro"
    Y debo poder devolver el encuentro con un motivo

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: PERM-10 - Ejecutivo puede agregar observaciones a sus encuentros
    Dado que soy el ejecutivo "ejecutivo01"
    Y tengo el encuentro "12345678" asignado
    Cuando accedo al detalle del encuentro
    Entonces debo poder agregar observaciones
    Y debo poder guardar notas sobre el encuentro

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE EXPORTACIÓN
  # Cobertura: Sección 14 del documento 21-Pendientes-Facturar.md
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: PERM-11 - Ejecutivo puede exportar solo sus propios encuentros
    Dado que soy el ejecutivo "ejecutivo01"
    Y tengo 30 encuentros asignados
    Y existen 70 encuentros asignados a otros ejecutivos
    Cuando exporto mi lista de pendientes
    Entonces el archivo debe contener exactamente 30 encuentros
    Y todos los encuentros deben estar asignados a "ejecutivo01"

  @ejecutivoFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: PERM-12 - Ejecutivo NO puede exportar encuentros de otros ejecutivos mediante manipulación
    Dado que soy el ejecutivo "ejecutivo01"
    Y existen encuentros asignados a "ejecutivo02"
    Cuando intento exportar manipulando parámetros de usuario
    Entonces el sistema debe denegar la operación
    Y solo debe exportar encuentros asignados a "ejecutivo01"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE FILTROS Y BÚSQUEDA
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @regresion
  Escenario: PERM-13 - Los filtros solo afectan encuentros del ejecutivo autenticado
    Dado que soy el ejecutivo "ejecutivo01"
    Y tengo 50 encuentros asignados
    Y 20 de mis encuentros tienen prioridad "Alta"
    Y existen encuentros de otros ejecutivos con prioridad "Alta"
    Cuando aplico el filtro "Prioridad" = "Alta"
    Entonces debo visualizar exactamente 20 encuentros
    Y todos deben estar asignados a "ejecutivo01"
    Y todos deben tener prioridad "Alta"

  @ejecutivoFacturacion @pendientesPorFacturar @regresion
  Escenario: PERM-14 - La búsqueda solo afecta encuentros del ejecutivo autenticado
    Dado que soy el ejecutivo "ejecutivo01"
    Y tengo 3 encuentros del paciente "García"
    Y existen 5 encuentros de "García" asignados a otros ejecutivos
    Cuando busco por "García"
    Entonces debo visualizar exactamente 3 encuentros
    Y todos deben estar asignados a "ejecutivo01"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ESTADOS
  # Cobertura: Sección 9 del documento 21-Pendientes-Facturar.md
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @regresion
  Escenario: PERM-15 - Ejecutivo puede ver todos los estados de sus encuentros asignados
    Dado que soy el ejecutivo "ejecutivo01"
    Y tengo encuentros en diferentes estados de facturación
    Cuando accedo a "Pendientes por Facturar"
    Entonces debo visualizar encuentros en estado "Asignado"
    Y debo visualizar encuentros en estado "En Proceso"
    Y debo visualizar encuentros en estado "Pendiente de Validación"
    Y debo visualizar encuentros en estado "Observado"

  @ejecutivoFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: PERM-16 - Ejecutivo NO visualiza encuentros facturados en su bandeja activa
    Dado que soy el ejecutivo "ejecutivo01"
    Y marqué 10 encuentros como "Facturado" ayer
    Cuando accedo a "Pendientes por Facturar"
    Entonces NO debo visualizar los 10 encuentros facturados
    Y solo debo visualizar encuentros pendientes de procesar

  @ejecutivoFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: PERM-17 - Ejecutivo NO visualiza encuentros devueltos en su bandeja activa
    Dado que soy el ejecutivo "ejecutivo01"
    Y devolví 5 encuentros a Admisión
    Cuando accedo a "Pendientes por Facturar"
    Entonces NO debo visualizar los 5 encuentros devueltos
    Y los encuentros devueltos no deben contarse en mi carga de trabajo

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE SEGURIDAD
  # Cobertura: Sección 18 del documento 21-Pendientes-Facturar.md
  # CS-PF-02, CS-PF-03, CS-PF-04, CS-PF-05
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: PERM-18 - Validar que todo acceso requiere autenticación previa
    Dado que NO he iniciado sesión en el sistema
    Cuando intento acceder directamente a "Pendientes por Facturar" mediante URL
    Entonces el sistema debe denegar el acceso
    Y debe redirigirme a la pantalla de login
    Y NO debe mostrar ninguna información de encuentros

  @ejecutivoFacturacion @pendientesPorFacturar @regresion
  Escenario: PERM-19 - Validar que la información visible depende del usuario autenticado
    Dado que soy el ejecutivo "ejecutivo01"
    Y he iniciado sesión correctamente
    Cuando accedo a "Pendientes por Facturar"
    Entonces debo visualizar únicamente encuentros asignados a "ejecutivo01"
    Y NO debo visualizar información de otros ejecutivos
    Y NO debo visualizar encuentros sin asignar
