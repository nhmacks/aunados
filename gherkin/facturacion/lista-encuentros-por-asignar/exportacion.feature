# language: es

Característica: Exportación de Lista de Encuentros para Asignar
  Como Responsable de Facturación
  Quiero exportar la lista de encuentros para asignar a un archivo Excel
  Para realizar análisis y reportes fuera del sistema

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación"
    Y he accedido a la bandeja "Lista de encuentros para asignar"

  # ========================================================================
  # TÉCNICA: EXPORTACIÓN SIN FILTROS
  # ========================================================================

  @responsableFacturacion
  Escenario: EXP-01 - Exportar lista completa de encuentros sin filtros
    Dado que existen 100 encuentros para asignar
    Y NO he aplicado ningún filtro
    Y NO he realizado ninguna búsqueda
    Cuando selecciono el botón "Descargar"
    Entonces debe iniciarse la descarga de un archivo Excel
    Y el archivo debe contener los 100 encuentros
    Y el nombre del archivo debe tener el formato "encuentros_para_asignar_YYYYMMDD_HHMMSS.xlsx"
    Y debe mostrarse un mensaje "Archivo descargado exitosamente"

  @responsableFacturacion
  Escenario: EXP-02 - Validar columnas en archivo exportado sin filtros
    Dado que existen encuentros para asignar
    Y NO he aplicado filtros
    Cuando descargo el archivo Excel
    Entonces el archivo debe contener las siguientes columnas en orden:
      | Columna            |
      | Encuentros         |
      | Clasific.          |
      | Sede               |
      | Apellidos          |
      | Nombres            |
      | Garante            |
      | Tipo de encuentro  |
      | Producto           |
      | Beneficio          |
      | Fecha apert.       |
      | Mec.               |
      | Servicio básico    |
      | Por Fact. Fin      |
      | Por Liq. Fin       |
      | Fact. Fin          |

  # ========================================================================
  # TÉCNICA: EXPORTACIÓN CON FILTROS
  # ========================================================================

  @responsableFacturacion
  Escenario: EXP-03 - Exportar lista de encuentros después de aplicar filtros
    Dado que existen 100 encuentros para asignar
    Y he aplicado el filtro "Estado" con valor "Por asignar"
    Y el filtro muestra 30 encuentros
    Cuando selecciono el botón "Descargar"
    Entonces debe iniciarse la descarga de un archivo Excel
    Y el archivo debe contener únicamente los 30 encuentros filtrados
    Y el archivo NO debe incluir los 70 encuentros que no cumplen el filtro
    Y debe mostrarse un mensaje "Archivo con filtros aplicados descargado exitosamente"

  @responsableFacturacion
  Escenario: EXP-04 - Exportar después de aplicar múltiples filtros
    Dado que existen encuentros para asignar
    Y he aplicado el filtro "Estado" con valor "Por asignar"
    Y he aplicado el filtro "Sede" con valor "Auna Guardia Civil"
    Y he aplicado el filtro "Garante" con valor "Pacífico EPS"
    Y los filtros muestran 15 encuentros
    Cuando selecciono el botón "Descargar"
    Entonces el archivo debe contener únicamente los 15 encuentros que cumplen todos los filtros
    Y todos los encuentros deben tener estado "Por asignar"
    Y todos los encuentros deben tener sede "Auna Guardia Civil"
    Y todos los encuentros deben tener garante "Pacífico EPS"

  @responsableFacturacion
  Escenario: EXP-05 - Exportar después de realizar búsqueda
    Dado que existen encuentros para asignar
    Y he realizado una búsqueda por apellido "García"
    Y la búsqueda muestra 8 encuentros
    Cuando selecciono el botón "Descargar"
    Entonces el archivo debe contener únicamente los 8 encuentros encontrados
    Y todos los encuentros deben tener "García" en el apellido

  @responsableFacturacion
  Escenario: EXP-06 - Exportar después de aplicar filtros y búsqueda combinados
    Dado que existen encuentros para asignar
    Y he aplicado el filtro "Estado" con valor "Error de facturación"
    Y he realizado una búsqueda por "12345"
    Y los resultados muestran 3 encuentros
    Cuando selecciono el botón "Descargar"
    Entonces el archivo debe contener únicamente los 3 encuentros que cumplen ambas condiciones
    Y todos deben tener estado "Error de facturación"
    Y todos deben contener "12345" en número de encuentro, nombre o apellido

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE CONTENIDO EXPORTADO
  # ========================================================================

  @responsableFacturacion
  Escenario: EXP-07 - Validar consistencia entre UI y archivo exportado
    Dado que estoy visualizando 25 encuentros en la grilla
    Y el primer encuentro visible tiene número "12345678"
    Y el encuentro "12345678" tiene garante "Pacífico EPS"
    Cuando descargo el archivo Excel
    Y abro el archivo descargado
    Entonces la primera fila debe contener el encuentro "12345678"
    Y el encuentro "12345678" debe tener garante "Pacífico EPS" en el Excel
    Y todos los datos deben coincidir exactamente con lo mostrado en la UI

  @responsableFacturacion
  Escenario: EXP-08 - Validar formato de fechas en archivo exportado
    Dado que existen encuentros con fecha de apertura "05/06/2026"
    Cuando descargo el archivo Excel
    Y abro el archivo descargado
    Entonces la columna "Fecha apert." debe mostrar las fechas en formato "DD/MM/YYYY"
    Y las fechas deben ser editables en Excel
    Y NO deben mostrarse como texto

  @responsableFacturacion
  Escenario: EXP-09 - Validar valores vacíos en archivo exportado
    Dado que existen encuentros sin clasificación
    Y existen encuentros sin garante
    Cuando descargo el archivo Excel
    Y abro el archivo descargado
    Entonces las celdas sin datos deben mostrarse vacías o con "-"
    Y NO deben mostrarse como "NULL" o "undefined"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ESTADO DEL BOTÓN
  # ========================================================================

  @responsableFacturacion
  Escenario: EXP-10 - Validar que botón Descargar siempre está habilitado
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Cuando visualizo el botón "Descargar"
    Entonces el botón debe estar habilitado
    Y debe ser posible hacer clic en él

  @responsableFacturacion
  Escenario: EXP-11 - Descargar cuando no hay encuentros para asignar
    Dado que NO existen encuentros para asignar
    Y el contador muestra "0 Registros encontrados"
    Cuando selecciono el botón "Descargar"
    Entonces debe descargarse un archivo Excel vacío
    Y el archivo debe contener únicamente los encabezados de columnas
    Y debe mostrarse un mensaje "No hay datos para exportar"

  @responsableFacturacion
  Escenario: EXP-12 - Descargar cuando búsqueda no arroja resultados
    Dado que existen encuentros para asignar
    Y he realizado una búsqueda por "XXXXXX"
    Y la búsqueda muestra "0 Registros encontrados"
    Cuando selecciono el botón "Descargar"
    Entonces debe descargarse un archivo Excel vacío
    Y el archivo debe contener únicamente los encabezados de columnas
    Y debe mostrarse un mensaje "No hay datos que coincidan con la búsqueda"

  # ========================================================================
  # TÉCNICA: CASOS EDGE - GRANDES VOLÚMENES
  # ========================================================================

  @responsableFacturacion
  Escenario: EXP-13 - Exportar lista con gran volumen de encuentros
    Dado que existen 5000 encuentros para asignar
    Cuando selecciono el botón "Descargar"
    Entonces debe mostrarse un mensaje "Generando archivo, por favor espere..."
    Y el archivo debe descargarse exitosamente
    Y el archivo debe contener los 5000 encuentros
    Y el proceso NO debe exceder 30 segundos

  @responsableFacturacion
  Escenario: EXP-14 - Validar límite de exportación
    Dado que existen 15000 encuentros para asignar
    Cuando selecciono el botón "Descargar"
    Entonces debe mostrarse un mensaje de advertencia "La exportación está limitada a 10000 registros. Por favor aplique filtros."
    Y NO debe descargarse ningún archivo
    Y debo poder aplicar filtros para reducir el número de registros

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ORDEN
  # ========================================================================

  @responsableFacturacion
  Escenario: EXP-15 - Exportar respetando orden de columnas de la UI
    Dado que he ordenado la tabla por "Fecha apert." descendente
    Y los encuentros se muestran ordenados del más reciente al más antiguo
    Cuando descargo el archivo Excel
    Entonces el archivo debe respetar el mismo orden
    Y el primer registro debe ser el encuentro más reciente
    Y el último registro debe ser el encuentro más antiguo

  @responsableFacturacion
  Escenario: EXP-16 - Exportar después de aplicar múltiples ordenamientos
    Dado que he ordenado la tabla por "Sede" ascendente
    Y luego he ordenado por "Fecha apert." descendente
    Cuando descargo el archivo Excel
    Entonces el archivo debe reflejar únicamente el último ordenamiento aplicado
    Y los encuentros deben estar ordenados por "Fecha apert." descendente

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE FORMATO DE ARCHIVO
  # ========================================================================

  @responsableFacturacion
  Escenario: EXP-17 - Validar que el archivo descargado es un Excel válido
    Dado que existen encuentros para asignar
    Cuando descargo el archivo
    Entonces el archivo debe tener extensión ".xlsx"
    Y el archivo debe poder abrirse en Microsoft Excel
    Y el archivo debe poder abrirse en Google Sheets
    Y el archivo debe tener formato de tabla con filtros habilitados

  @responsableFacturacion
  Escenario: EXP-18 - Validar encabezados con formato destacado
    Dado que existen encuentros para asignar
    Cuando descargo el archivo Excel
    Y abro el archivo
    Entonces la primera fila debe contener los encabezados
    Y los encabezados deben tener formato destacado (negrita)
    Y los encabezados deben tener color de fondo diferente al de los datos
    Y debe habilitarse el filtro automático de Excel en los encabezados
