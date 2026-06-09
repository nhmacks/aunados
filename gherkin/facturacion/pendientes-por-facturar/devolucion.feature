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
  # RN-PF-06, RN-PF-10
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @regresion
  Escenario: PPF-01 - Devolver encuentro con al menos un motivo obligatorio
    Cuando devuelve el encuentro indicando al menos un motivo
    Entonces el encuentro desaparece de su bandeja
    Y el encuentro debe visualizarse en Encuentros Devueltos del Ejecutivo de Admisión
    Y el encuentro debe visualizarse en Encuentros Devueltos del Superusuario de Admisión

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-01 - Devolver encuentro por falta de sustentos médicos
    Dado que el encuentro asignado tiene el número "12345678"
    Y he accedido al detalle del encuentro
    Y identifico que faltan sustentos médicos
    Cuando selecciono "Devolver Encuentro"
    Y ingreso el motivo "Faltan sustentos médicos: resultado de biopsia"
    Y confirmo la devolución
    Entonces el sistema debe actualizar el estado a "Devuelto"
    Y el encuentro debe desaparecer de mi bandeja "Pendientes por Facturar"
    Y el encuentro debe aparecer en Encuentros Devueltos de Admisión
    Y debe mostrarse el mensaje "Encuentro devuelto exitosamente"

  @ejecutivoFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: DEV-02 - Validar que motivo de devolución es obligatorio
    Dado que he seleccionado "Devolver Encuentro"
    Cuando intento confirmar la devolución sin ingresar motivo
    Entonces el botón "Confirmar" debe estar deshabilitado
    Y debe mostrarse el mensaje "Debe ingresar un motivo de devolución antes de continuar"
    Y NO debe procesarse la devolución

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
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

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-04 - Cancelar devolución de encuentro
    Dado que he seleccionado "Devolver Encuentro"
    Y he ingresado un motivo de devolución
    Cuando selecciono el botón "Cancelar"
    Entonces el modal de devolución debe cerrarse
    Y el encuentro debe permanecer en mi bandeja
    Y NO debe procesarse ninguna devolución

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE REGLAS DE NEGOCIO
  # Cobertura: RN-PF-06, RN-PF-10
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-05 - Validar que encuentro devuelto regresa a Encuentros Devueltos de Admisión
    Dado que he devuelto el encuentro "12345678" con motivo "Falta documentación"
    Cuando el Ejecutivo de Admisión accede a "Encuentros Devueltos"
    Entonces el Ejecutivo de Admisión debe visualizar el encuentro "12345678"
    Y el encuentro debe mostrar estado "Devuelto"
    Y debe visualizarse el motivo "Falta documentación"
    Y el Superusuario de Admisión también debe poder visualizar el encuentro en "Encuentros Devueltos"

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-06 - Encuentro devuelto debe ser subsanado por Admisión antes de regresar a Facturación
    Dado que he devuelto el encuentro "12345678" con motivo "Falta documentación administrativa"
    Y el encuentro está en "Encuentros Devueltos" de Admisión
    Cuando el Ejecutivo de Admisión subsana las inconsistencias
    Y el Ejecutivo de Admisión envía el encuentro de vuelta a Facturación
    Entonces el encuentro debe regresar a "Lista de Encuentros por Asignar"
    Y el Responsable de Facturación debe poder reasignarlo a un Ejecutivo de Facturación

  # ========================================================================
  # TÉCNICA: AUDITORÍA Y TRAZABILIDAD
  # Cobertura: Sección 16 del documento 21-Pendientes-Facturar.md
  # RN-PF-07
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-07 - Registrar devolución en auditoría
    Dado que he devuelto un encuentro con motivo "Falta autorización"
    Cuando se completa la devolución
    Entonces el sistema debe registrar en auditoría:
      | Campo                  | Valor                           |
      | Acción                 | Devolución de encuentro         |
      | Usuario                | ejecutivo01                     |
      | Rol                    | Ejecutivo de Facturación        |
      | Número de Encuentro    | 12345678                        |
      | Motivo                 | Falta autorización              |
      | Fecha y Hora           | [timestamp actual]              |

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-08 - Visualizar historial de devoluciones en detalle del encuentro
    Dado que un encuentro ha sido devuelto 2 veces
    Y la primera devolución fue por "Falta documentación"
    Y la segunda devolución fue por "Error en datos del seguro"
    Cuando accedo al historial del encuentro
    Entonces debe mostrarse el registro de las 2 devoluciones
    Y cada devolución debe mostrar fecha, hora, ejecutivo y motivo

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE EXPORTACIÓN
  # Cobertura: Sección 14 del documento 21-Pendientes-Facturar.md
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @funcional
  Escenario: PPF-02 - Validar que encuentros devueltos no se incluyan en el reporte
    Dado que existe un encuentro devuelto
    Cuando el Ejecutivo de Facturación descarga el reporte
    Entonces el encuentro devuelto no debe visualizarse en el reporte

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: DEV-09 - Exportar solo incluye encuentros activos en mi bandeja
    Dado que tengo 30 encuentros asignados activos
    Y he devuelto 5 encuentros a Admisión
    Cuando exporto mi lista de "Pendientes por Facturar"
    Entonces el archivo debe contener exactamente 30 encuentros
    Y NO debe incluir los 5 encuentros devueltos
