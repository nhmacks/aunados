# language: es

Característica: Exportación de Pendientes por Facturar
  Como Ejecutivo de Facturación
  Quiero exportar mi lista de encuentros pendientes
  Para realizar análisis y reportes fuera del sistema

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Ejecutivo de Facturación"
    Y he accedido a "Pendientes por Facturar"

  # ========================================================================
  # TÉCNICA: EXPORTACIÓN ASÍNCRONA
  # Cobertura: Sección 14 del documento 21-Pendientes-Facturar.md
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: EXP-01 - Solicitar exportación asíncrona de pendientes
    Dado que tengo 80 encuentros asignados
    Cuando selecciono la opción "Exportar"
    Entonces el sistema debe mostrar el mensaje "Tu reporte se está generando"
    Y el archivo NO debe descargarse inmediatamente
    Y debe generarse una notificación en la campana cuando esté listo

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: EXP-02 - Descargar archivo exportado desde campana
    Dado que he solicitado una exportación
    Y el archivo ha sido generado
    Y recibí notificación en la campana
    Cuando accedo a la campana de notificaciones
    Y selecciono el enlace de descarga
    Entonces el archivo XLSX debe descargarse correctamente
    Y el archivo debe contener todos mis encuentros asignados

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: EXP-03 - Validar vigencia de archivo exportado (1 hora)
    Dado que he solicitado una exportación
    Y el archivo fue generado hace 1 hora y 5 minutos
    Cuando intento descargar el archivo desde la campana
    Entonces debe mostrarse el mensaje "El archivo ha expirado"
    Y debe permitirme generar una nueva exportación

  # ========================================================================
  # TÉCNICA: CONTENIDO DE LA EXPORTACIÓN
  # Cobertura: Sección 14.3 del documento 21-Pendientes-Facturar.md
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: EXP-04 - Exportar incluye todas las columnas visibles
    Dado que tengo encuentros asignados
    Cuando exporto mi lista de pendientes
    Entonces el archivo XLSX debe incluir las siguientes columnas:
      | Columna              |
      | Número de Encuentro  |
      | Estado               |
      | NHC                  |
      | Apellidos            |
      | Nombres              |
      | Fecha de Apertura    |
      | Fecha de Asignación  |
      | Tipo de Encuentro    |
      | Garante              |
      | Producto             |
      | Sede                 |
      | Prioridad            |
      | Monto                |
      | Observaciones        |

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: EXP-05 - Exportar respeta filtros aplicados
    Dado que tengo 100 encuentros asignados
    Y he aplicado un filtro de "Prioridad" = "Alta"
    Y el filtro retorna 25 encuentros
    Cuando exporto la lista
    Entonces el archivo debe contener exactamente 25 encuentros
    Y todos los encuentros deben tener prioridad "Alta"

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: EXP-06 - Exportar respeta búsqueda activa
    Dado que tengo encuentros asignados
    Y he realizado una búsqueda por "García"
    Y la búsqueda retorna 8 encuentros
    Cuando exporto la lista
    Entonces el archivo debe contener exactamente 8 encuentros
    Y todos los encuentros deben corresponder a la búsqueda "García"

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: EXP-07 - Exportar solo incluye encuentros del ejecutivo autenticado
    Dado que soy el ejecutivo "ejecutivo01"
    Y tengo 30 encuentros asignados
    Y existen 70 encuentros asignados a otros ejecutivos
    Cuando exporto mi lista
    Entonces el archivo debe contener exactamente 30 encuentros
    Y todos los encuentros deben estar asignados a "ejecutivo01"

  @ejecutivoFacturacion @pendientesPorFacturar @funcional
  Escenario: EXP-08 - Exportar NO incluye encuentros devueltos
    Dado que tengo 30 encuentros asignados activos
    Y he devuelto 5 encuentros al Responsable
    Cuando exporto mi lista
    Entonces el archivo debe contener exactamente 30 encuentros
    Y NO debe incluir los 5 encuentros devueltos

  @ejecutivoFacturacion @pendientesPorFacturar @funcional
  Escenario: EXP-09 - Exportar NO incluye encuentros ya facturados
    Dado que tengo 25 encuentros pendientes
    Y he facturado 10 encuentros hoy
    Cuando exporto mi lista
    Entonces el archivo debe contener exactamente 25 encuentros
    Y NO debe incluir los 10 encuentros facturados

  # ========================================================================
  # TÉCNICA: FORMATO Y ESTRUCTURA DEL ARCHIVO
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: EXP-10 - Validar formato del archivo exportado
    Dado que he solicitado una exportación
    Cuando descargo el archivo generado
    Entonces el archivo debe tener formato XLSX
    Y el nombre del archivo debe incluir la fecha de generación
    Y el nombre del archivo debe incluir mi usuario
    Y debe tener el formato "PendientesPorFacturar_ejecutivo01_20240608_143000.xlsx"

  @ejecutivoFacturacion @pendientesPorFacturar @happyPath
  Escenario: EXP-11 - Exportar sin filtros incluye todos los encuentros asignados
    Dado que tengo 150 encuentros asignados
    Y NO he aplicado ningún filtro
    Cuando exporto la lista
    Entonces el archivo debe contener exactamente 150 encuentros
    Y debe incluir todos mis encuentros asignados

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE PERMISOS
  # ========================================================================

  @ejecutivoFacturacion @pendientesPorFacturar @unhappyPath
  Escenario: EXP-12 - Ejecutivo NO puede exportar encuentros de otros ejecutivos
    Dado que soy el ejecutivo "ejecutivo01"
    Y existen encuentros asignados a "ejecutivo02"
    Cuando intento exportar mediante manipulación de parámetros
    Entonces el sistema debe denegar la operación
    Y solo debe exportar encuentros asignados a "ejecutivo01"

