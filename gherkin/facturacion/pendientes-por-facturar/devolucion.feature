# language: es

Característica: Devolución de Encuentros por Ejecutivo de Facturación
  Como Ejecutivo de Facturación
  Quiero devolver encuentros con inconsistencias a Admisión
  Para que sean subsanados por el Ejecutivo de Admisión antes de reingresar a Facturación

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Facturación"
    Y tengo encuentros asignados

  # ========================================================================
  # TÉCNICA: FLUJO COMPLETO - DEVOLUCIÓN DE ENCUENTROS
  # Cobertura: Sección 8.2, 10.2 del documento 21-Pendientes-Facturar.md
  # RN-PF-06, RN-PF-10, RN-PF-11, RN-PF-16, RN-PF-17
  # ========================================================================

  @prioridadExtrema @autoP1 @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-01 - Flujo completo de devolución con modal de confirmación y éxito
    Dado que el encuentro asignado tiene el número "12345678"
    Y he accedido al detalle del encuentro
    Y identifico que faltan sustentos médicos
    Cuando selecciono el botón "Devolver Encuentro"
    Entonces el sistema debe mostrar la sección "Devoluciones" con la lista de motivos
    Cuando selecciono el motivo "Carta de Garantía por Lab"
    Entonces el botón "Agregar Devoluciones" debe estar habilitado
    Cuando selecciono "Agregar Devoluciones"
    Entonces el sistema debe mostrar el modal con el mensaje "¿Deseas devolver el encuentro?"
    Y el modal debe mostrar las opciones "Sí, devolver", "No, cancelar" y "Cerrar (X)"
    Cuando selecciono "Sí, devolver"
    Entonces el sistema debe registrar la devolución
    Y el sistema debe mostrar el modal con el mensaje "El encuentro ha sido devuelto a Ruth Evelyn Solís vía bandeja de admisión"
    Y el modal debe mostrar el botón "Entendido"
    Cuando selecciono "Entendido"
    Entonces el sistema debe cerrar el detalle del encuentro
    Y el sistema debe retornarme a la pantalla "Pendientes por Facturar"
    Y el encuentro "12345678" debe desaparecer de mi bandeja
    Y el encuentro debe aparecer en Encuentros Devueltos de Admisión

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: DEV-02 - Validar que motivo de devolución es obligatorio (RN-PF-11)
    Dado que he accedido al detalle del encuentro
    Cuando selecciono el botón "Devolver Encuentro"
    Entonces el sistema debe mostrar la sección "Devoluciones"
    Y el botón "Agregar Devoluciones" debe estar deshabilitado
    Cuando intento seleccionar "Agregar Devoluciones" sin seleccionar ningún motivo
    Entonces el botón debe permanecer deshabilitado
    Y debe mostrarse el mensaje "Debe seleccionar al menos un motivo de devolución antes de continuar"
    Y NO debe procesarse la devolución

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Esquema del escenario: DEV-03 - Devolver encuentro por diferentes motivos
    Cuando devuelvo el encuentro por "<motivo>"
    Entonces el encuentro debe devolverse correctamente
    Y el motivo "<motivo>" debe registrarse en el historial

    Ejemplos:
      | motivo                                        |
      | Falta documentación administrativa            |
      | Error en datos del seguro                     |
      | Cobertura insuficiente                        |
      | Falta autorización de garante                 |
      | Información de paciente incompleta            |

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-04 - Cancelar devolución durante selección de motivos (RN-PF-14)
    Dado que he accedido al detalle del encuentro
    Cuando selecciono el botón "Devolver Encuentro"
    Y selecciono el motivo "Falta documentación administrativa"
    Y selecciono el motivo "Error en datos del seguro"
    Y selecciono el botón "Cancelar"
    Entonces la sección "Devoluciones" debe cerrarse
    Y todos los motivos seleccionados deben eliminarse
    Y el encuentro debe permanecer en mi bandeja
    Y NO debe procesarse ninguna devolución

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Esquema del escenario: DEV-04A - Cancelar devolución desde modal de confirmación (RN-PF-15)
    Dado que he accedido al detalle del encuentro
    Cuando selecciono el botón "Devolver Encuentro"
    Y selecciono el motivo "Cobertura insuficiente"
    Y selecciono "Agregar Devoluciones"
    Entonces el sistema debe mostrar el modal "¿Deseas devolver el encuentro?"
    Cuando cancelo mediante "<metodo_cancelacion>"
    Entonces el modal de confirmación debe cerrarse
    Y NO debe procesarse ninguna devolución
    Y debo permanecer en el detalle del encuentro
    Y los motivos seleccionados deben mantenerse

    Ejemplos:
      | metodo_cancelacion |
      | No, cancelar       |
      | X                  |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE SELECCIÓN MÚLTIPLE DE MOTIVOS
  # Cobertura: Sección 8.2.2, RN-PF-12, RN-PF-13, RN-PF-21, RN-PF-22
  # ========================================================================

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Esquema del escenario: DEV-10 - Devolver encuentro con múltiples motivos (RN-PF-21)
    Dado que he accedido al detalle del encuentro "12345678"
    Cuando selecciono el botón "Devolver Encuentro"
    Y selecciono <cantidad> motivos de devolución
    Y selecciono "Agregar Devoluciones"
    Y selecciono "Sí, devolver" en el modal de confirmación
    Entonces el sistema debe registrar la devolución con <cantidad> motivos
    Y todos los motivos deben quedar registrados en el historial

    Ejemplos:
      | cantidad |
      | 1        |
      | 2        |
      | 3        |
      | 4        |

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: DEV-11 - Validar límite máximo de 4 motivos de devolución (RN-PF-12)
    Dado que he accedido al detalle del encuentro
    Cuando selecciono el botón "Devolver Encuentro"
    Y selecciono los siguientes motivos:
      | Motivo                              |
      | Acta Conformidad                    |
      | Actualizar Datos Económicos         |
      | Adjuntar Oncosys                    |
      | Ampliación de Carta                 |
    Entonces el sistema debe permitir la selección de los 4 motivos
    Cuando intento seleccionar un quinto motivo "Área Devoluciones"
    Entonces el sistema debe bloquear la selección
    Y debe mostrarse el mensaje "Solo puede seleccionar hasta cuatro motivos de devolución"

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: DEV-12 - Validar que no se puede seleccionar el mismo motivo dos veces (RN-PF-13, RN-PF-22)
    Dado que he accedido al detalle del encuentro
    Cuando selecciono el botón "Devolver Encuentro"
    Y selecciono el motivo "Error Copago"
    Entonces el motivo "Error Copago" debe aparecer como seleccionado
    Cuando intento seleccionar nuevamente el motivo "Error Copago"
    Entonces el sistema debe bloquear la selección
    Y debe mostrarse el mensaje "No puede seleccionar el mismo motivo más de una vez"
    Y solo debe quedar una instancia del motivo "Error Copago"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE REGLAS DE NEGOCIO
  # Cobertura: RN-PF-06, RN-PF-10, RN-PF-18, RN-PF-19, RN-PF-20, RN-PF-23
  # ========================================================================

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-05 - Validar que encuentro devuelto regresa a Encuentros Devueltos de Admisión
    Dado que he devuelto el encuentro "12345678" con motivo "Falta documentación"
    Cuando el Ejecutivo de Admisión accede a "Encuentros Devueltos"
    Entonces el Ejecutivo de Admisión debe visualizar el encuentro "12345678"
    Y el encuentro debe mostrar estado "Devuelto"
    Y debe visualizarse el motivo "Falta documentación"
    Y el Superusuario de Admisión también debe poder visualizar el encuentro en "Encuentros Devueltos"

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-06 - Encuentro devuelto debe ser subsanado por Admisión antes de regresar a Facturación
    Dado que he devuelto el encuentro "12345678" con motivo "Falta documentación administrativa"
    Y el encuentro está en "Encuentros Devueltos" de Admisión
    Cuando el Ejecutivo de Admisión subsana las inconsistencias
    Y el Ejecutivo de Admisión envía el encuentro de vuelta a Facturación
    Entonces el encuentro debe regresar a "Lista de Encuentros por Asignar"
    Y el Responsable de Facturación debe poder reasignarlo a un Ejecutivo de Facturación

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-08 - Visualizar historial de devoluciones en detalle del encuentro
    Dado que un encuentro ha sido devuelto 2 veces
    Y la primera devolución fue por "Falta documentación"
    Y la segunda devolución fue por "Error en datos del seguro"
    Cuando accedo al historial del encuentro
    Entonces debe mostrarse el registro de las 2 devoluciones
    Y cada devolución debe mostrar fecha, hora, ejecutivo y motivo

  # ========================================================================
  # TÉCNICA: REGISTRO DE COMENTARIOS
  # Cobertura: Sección 7 del documento 18-Encuentros-Devueltos.md
  # RN-ED-004, RN-ED-005, RN-ED-006, RN-ED-007
  # ========================================================================

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-13 - Devolver encuentro sin registrar comentarios (RN-ED-004)
    Dado que he accedido al detalle del encuentro "12345678"
    Cuando selecciono el botón "Devolver Encuentro"
    Y selecciono el motivo "Acta Conformidad"
    Y NO ingreso ningún comentario
    Y selecciono "Agregar Devoluciones"
    Y selecciono "Sí, devolver" en el modal de confirmación
    Entonces el sistema debe registrar la devolución exitosamente
    Y la devolución debe completarse sin comentarios
    Y el encuentro debe aparecer en Encuentros Devueltos de Admisión

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-14 - Devolver encuentro registrando comentarios (RN-ED-005)
    Dado que he accedido al detalle del encuentro "12345678"
    Cuando selecciono el botón "Devolver Encuentro"
    Y selecciono el motivo "Adjuntar Oncosys"
    Y ingreso el comentario "Se requiere adjuntar resultado de biopsia del paciente"
    Y selecciono "Agregar Devoluciones"
    Y selecciono "Sí, devolver" en el modal de confirmación
    Entonces el sistema debe registrar la devolución exitosamente
    Y el comentario debe quedar registrado en el historial
    Y el Ejecutivo de Admisión debe poder visualizar el comentario

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-15 - Validar límite máximo de 400 caracteres en comentarios (RN-ED-006)
    Dado que he accedido al detalle del encuentro
    Cuando selecciono el botón "Devolver Encuentro"
    Y selecciono el motivo "Error Beneficio"
    Y ingreso un comentario de exactamente 400 caracteres
    Entonces el sistema debe aceptar el comentario
    Y el botón "Agregar Devoluciones" debe estar habilitado

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: DEV-16 - Validar que no se puede exceder 400 caracteres en comentarios (RN-ED-007)
    Dado que he accedido al detalle del encuentro
    Cuando selecciono el botón "Devolver Encuentro"
    Y selecciono el motivo "Duplicidad de Gastos"
    Y intento ingresar un comentario de 401 caracteres
    Entonces el sistema debe bloquear la entrada adicional
    Y debe mostrarse el mensaje "Ha alcanzado el límite máximo de 400 caracteres"
    Y el botón "Agregar Devoluciones" debe estar deshabilitado hasta ajustar el contenido

  # ========================================================================
  # TÉCNICA: HISTORIAL CON INDICADORES VISUALES
  # Cobertura: Sección 19 del documento 18-Encuentros-Devueltos.md
  # RN-ED-017
  # ========================================================================

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-17 - Visualizar indicadores visuales de motivos subsanados (RN-ED-017)
    Dado que el encuentro "12345678" fue devuelto con los motivos:
      | Motivo                       |
      | Ampliación de Carta          |
      | Carta de Garantía por Imagen |
      | Error CIE10                  |
    Y el Ejecutivo de Admisión subsanó los motivos "Ampliación de Carta" y "Error CIE10"
    Y el encuentro fue reasignado a mi usuario
    Cuando accedo al historial de devoluciones del encuentro
    Entonces debo visualizar el motivo "Ampliación de Carta" con el indicador "✓"
    Y debo visualizar el motivo "Error CIE10" con el indicador "✓"
    Y el motivo "Carta de Garantía por Imagen" NO debe mostrar el indicador "✓"

  # ========================================================================
  # TÉCNICA: NUEVA DEVOLUCIÓN
  # Cobertura: Secciones 20-23 del documento 18-Encuentros-Devueltos.md
  # RN-ED-018, RN-ED-019, RN-ED-020, RN-ED-021, RN-ED-022, RN-ED-023, RN-ED-024
  # ========================================================================

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-18 - Botón "Nueva Devolución" solo disponible para encuentros previamente devueltos (RN-ED-018)
    Dado que tengo asignado el encuentro "11111111" que nunca ha sido devuelto
    Y tengo asignado el encuentro "22222222" que fue devuelto anteriormente
    Cuando accedo al detalle del encuentro "11111111"
    Entonces NO debo visualizar el botón "Nueva Devolución"
    Y solo debo visualizar el botón "Devolver Encuentro"
    Cuando accedo al detalle del encuentro "22222222"
    Entonces debo visualizar el botón "Nueva Devolución"
    Y también debo visualizar el botón "Devolver Encuentro"

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-19 - Confirmar nueva devolución con modal específico (RN-ED-019)
    Dado que el encuentro "12345678" fue devuelto anteriormente
    Y el encuentro ha sido reasignado a mi usuario
    Cuando accedo al detalle del encuentro
    Y selecciono el botón "Nueva Devolución"
    Entonces el sistema debe mostrar un modal con el mensaje "¿Deseas devolver nuevamente el encuentro?"
    Y debe mostrar el submensaje "Al continuar, se reemplazarán las devoluciones actuales por las nuevas."
    Y debe mostrar el submensaje "Esta acción no se puede deshacer."
    Y el modal debe mostrar las opciones "Sí, devolver", "No, cancelar" y "X"

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-20 - Registrar nueva devolución exitosamente (RN-ED-020, RN-ED-021, RN-ED-022)
    Dado que el encuentro "12345678" fue devuelto anteriormente por "Error Copago"
    Y el encuentro ha sido reasignado a mi usuario
    Cuando selecciono el botón "Nueva Devolución"
    Y selecciono "Sí, devolver" en el modal de confirmación
    Entonces el sistema debe mostrar la sección "Devoluciones"
    Cuando selecciono los nuevos motivos:
      | Motivo                      |
      | Carta de Garantía por Imagen |
      | Doble Garante               |
    Y ingreso el comentario "Garante incorrecto en sistema"
    Y selecciono "Agregar Devoluciones"
    Y selecciono "Sí, devolver" en el modal de confirmación final
    Entonces el sistema debe registrar la nueva devolución
    Y debe mostrarse el mensaje "El encuentro ha sido devuelto a César Augusto Melgar Obregón vía bandeja de admisión"
    Y los motivos anteriores deben ser reemplazados por los nuevos
    Y la nueva devolución debe quedar registrada en el historial

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-21 - Cancelar nueva devolución en modal inicial (RN-ED-019)
    Dado que el encuentro "12345678" fue devuelto anteriormente
    Y el encuentro ha sido reasignado a mi usuario
    Cuando accedo al detalle del encuentro
    Y selecciono el botón "Nueva Devolución"
    Entonces el sistema debe mostrar el modal "¿Deseas devolver nuevamente el encuentro?"
    Cuando selecciono "No, cancelar"
    Entonces el modal debe cerrarse
    Y NO debe procesarse ninguna nueva devolución
    Y debo permanecer en el detalle del encuentro

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-22 - Eliminar motivo antes de registrar nueva devolución (RN-ED-023)
    Dado que estoy registrando una nueva devolución para el encuentro "12345678"
    Y he seleccionado los siguientes motivos:
      | Motivo                 |
      | CG Ampliatoria         |
      | CG Anulada             |
      | CG Errada              |
    Cuando selecciono el botón "X" junto al motivo "CG Anulada"
    Entonces el motivo "CG Anulada" debe eliminarse de la lista
    Y solo deben quedar los motivos "CG Ampliatoria" y "CG Errada"
    Y puedo continuar seleccionando hasta 2 motivos adicionales

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-23 - Validar restricciones de motivos en nueva devolución (RN-ED-020, RN-ED-021, RN-ED-022)
    Dado que estoy registrando una nueva devolución para el encuentro "12345678"
    Cuando intento confirmar sin seleccionar ningún motivo
    Entonces el botón "Agregar Devoluciones" debe estar deshabilitado
    Cuando selecciono 4 motivos diferentes
    Y intento seleccionar un quinto motivo
    Entonces el sistema debe bloquear la selección
    Cuando intento seleccionar el mismo motivo dos veces
    Entonces el sistema debe bloquear la selección duplicada

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE EXPORTACIÓN
  # Cobertura: Sección 14 del documento 21-Pendientes-Facturar.md
  # ========================================================================

  @prioridadExtrema @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-09 - Exportar solo incluye encuentros activos en mi bandeja
    Dado que tengo 30 encuentros asignados activos
    Y he devuelto 5 encuentros a Admisión
    Cuando exporto mi lista de "Pendientes por Facturar"
    Entonces el archivo debe contener exactamente 30 encuentros
    Y NO debe incluir los 5 encuentros devueltos
