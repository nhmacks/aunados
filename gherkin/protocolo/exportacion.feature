# language: es

Característica: Exportación de Encuentros en Protocolo
  Como Gestor TA
  Quiero exportar la información de encuentros en protocolo
  Para realizar análisis y reportes fuera del sistema

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Gestor TA"
    Y he accedido a la pantalla "Encuentros en Protocolo"

  # ========================================================================
  # TÉCNICA: EXPORTACIÓN SIN FILTROS
  # ========================================================================

  @gestorTA
  Escenario: EXP-01 - Descargar todos los encuentros sin filtros aplicados
    Dado que existen 100 encuentros en protocolo
    Y NO he aplicado ningún filtro
    Y visualizo los 100 encuentros en la grilla
    Cuando selecciono el botón "Descargar"
    Entonces debe iniciarse la descarga de un archivo Excel
    Y el archivo debe contener los 100 encuentros
    Y el nombre del archivo debe tener el formato "encuentros_protocolo_YYYYMMDD_HHMMSS.xlsx"
    Y debe mostrarse un mensaje "Archivo descargado exitosamente"

  @gestorTA
  Escenario: EXP-02 - Validar columnas en archivo exportado sin filtros
    Dado que existen encuentros en protocolo
    Y NO he aplicado filtros
    Cuando descargo el archivo Excel
    Y abro el archivo descargado
    Entonces el archivo debe contener las siguientes columnas en orden:
      | Columna            |
      | Encuentro          |
      | Tipo de Encuentro  |
      | Tipo de Protocolo  |
      | Fecha de Apertura  |
      | Sede               |
      | Apellidos          |
      | Nombres            |
      | Garante            |
      | Producto           |
      | Beneficio          |
      | Mecanismo          |
      | Monto              |

  # ========================================================================
  # TÉCNICA: EXPORTACIÓN CON FILTROS
  # ========================================================================

  @gestorTA
  Escenario: EXP-03 - Descargar encuentros con filtro Solo Positivos aplicado
    Dado que existen 60 encuentros positivos y 40 encuentros negativos
    Y he activado el filtro "Solo Positivos"
    Y la grilla muestra únicamente 60 encuentros positivos
    Cuando selecciono el botón "Descargar"
    Entonces el archivo debe contener únicamente los 60 encuentros positivos
    Y NO debe incluir los 40 encuentros negativos
    Y debe mostrarse un mensaje "Archivo con filtros aplicados descargado exitosamente"

  @gestorTA
  Escenario: EXP-04 - Descargar encuentros con búsqueda aplicada
    Dado que existen 100 encuentros en protocolo
    Y he realizado una búsqueda por "García"
    Y la búsqueda muestra 15 encuentros
    Cuando selecciono el botón "Descargar"
    Entonces el archivo debe contener únicamente los 15 encuentros encontrados
    Y todos los encuentros deben tener "García" en nombres o apellidos

  @gestorTA
  Escenario: EXP-05 - Descargar encuentros con filtros por columna aplicados
    Dado que existen encuentros en protocolo
    Y he aplicado filtro en "Sede" = "Auna Guardia Civil"
    Y he aplicado filtro en "Garante" = "Pacífico EPS"
    Y los filtros muestran 25 encuentros
    Cuando selecciono el botón "Descargar"
    Entonces el archivo debe contener únicamente los 25 encuentros que cumplen los filtros
    Y todos deben tener Sede = "Auna Guardia Civil"
    Y todos deben tener Garante = "Pacífico EPS"

  @gestorTA
  Escenario: EXP-06 - Descargar con múltiples filtros combinados
    Dado que he aplicado búsqueda por "Juan"
    Y he activado el filtro "Solo Positivos"
    Y he aplicado filtro en "Tipo de Encuentro" = "Ambulatorio"
    Y los resultados muestran 8 encuentros
    Cuando selecciono el botón "Descargar"
    Entonces el archivo debe contener únicamente los 8 encuentros que cumplen todos los criterios
    Y todos deben coincidir con "Juan" en nombres
    Y todos deben ser "Positivo"
    Y todos deben ser "Ambulatorio"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE CONTENIDO EXPORTADO
  # ========================================================================

  @gestorTA
  Escenario: EXP-07 - Validar consistencia entre UI y archivo exportado
    Dado que visualizo 33 encuentros en la grilla
    Y el primer encuentro visible tiene número "12345678"
    Y el encuentro "12345678" tiene garante "Pacífico EPS"
    Cuando descargo el archivo Excel
    Y abro el archivo descargado
    Entonces el archivo debe contener exactamente 33 encuentros
    Y el encuentro "12345678" debe estar en el archivo
    Y el encuentro "12345678" debe tener garante "Pacífico EPS" en el Excel
    Y todos los datos deben coincidir exactamente con lo mostrado en la UI

  @gestorTA
  Escenario: EXP-08 - Validar formato de fechas en archivo exportado
    Dado que existen encuentros con fecha de apertura "05/06/2026"
    Cuando descargo el archivo Excel
    Y abro el archivo descargado
    Entonces la columna "Fecha de Apertura" debe mostrar las fechas en formato "DD/MM/YYYY"
    Y las fechas deben ser editables en Excel
    Y NO deben mostrarse como texto plano

  @gestorTA
  Escenario: EXP-09 - Validar formato de montos en archivo exportado
    Dado que existen encuentros con monto "S/ 1,250.00"
    Cuando descargo el archivo Excel
    Y abro el archivo descargado
    Entonces la columna "Monto" debe mostrar los montos con símbolo de moneda
    Y los montos deben incluir 2 decimales
    Y los montos deben ser valores numéricos en Excel (no texto)

  @gestorTA
  Escenario: EXP-10 - Validar valores vacíos en archivo exportado
    Dado que existen encuentros sin "Producto" asignado
    Cuando descargo el archivo Excel
    Y abro el archivo descargado
    Entonces las celdas sin datos deben mostrarse vacías o con "-"
    Y NO deben mostrarse como "NULL" o "undefined"
    Y el formato debe ser consistente en todo el archivo

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ESTADO DEL BOTÓN
  # ========================================================================

  @gestorTA
  Escenario: EXP-11 - Validar que botón Descargar siempre está habilitado
    Cuando accedo a la pantalla "Encuentros en Protocolo"
    Entonces el botón "Descargar" debe estar habilitado
    Y debo poder hacer clic en él en cualquier momento
    Y esto aplica incluso si no hay encuentros en la grilla

  @gestorTA
  Escenario: EXP-12 - Descargar cuando no hay encuentros disponibles
    Dado que NO existen encuentros en protocolo
    Y el contador muestra "0 registros encontrados"
    Cuando selecciono el botón "Descargar"
    Entonces debe descargarse un archivo Excel vacío
    Y el archivo debe contener únicamente los encabezados de las 12 columnas
    Y debe mostrarse un mensaje "No hay datos para exportar"

  @gestorTA
  Escenario: EXP-13 - Descargar cuando búsqueda no arroja resultados
    Dado que he realizado una búsqueda por "XXXXXXX"
    Y la búsqueda muestra "0 registros encontrados"
    Cuando selecciono el botón "Descargar"
    Entonces debe descargarse un archivo Excel vacío
    Y el archivo debe contener únicamente los encabezados
    Y debe mostrarse un mensaje "No hay datos que coincidan con la búsqueda"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE FORMATO DE ARCHIVO
  # ========================================================================

  @gestorTA
  Escenario: EXP-14 - Validar que el archivo descargado es un Excel válido
    Dado que existen encuentros en protocolo
    Cuando descargo el archivo
    Entonces el archivo debe tener extensión ".xlsx"
    Y el archivo debe poder abrirse en Microsoft Excel
    Y el archivo debe poder abrirse en Google Sheets
    Y el archivo debe poder abrirse en LibreOffice Calc

  @gestorTA
  Escenario: EXP-15 - Validar encabezados con formato destacado
    Dado que existen encuentros en protocolo
    Cuando descargo el archivo Excel
    Y abro el archivo
    Entonces la primera fila debe contener los encabezados
    Y los encabezados deben tener formato destacado (negrita)
    Y los encabezados deben tener color de fondo diferente al de los datos
    Y debe habilitarse el filtro automático de Excel en los encabezados

  @gestorTA
  Escenario: EXP-16 - Validar nombre del archivo descargado
    Dado que la fecha actual es "06/06/2026" y la hora es "14:30:25"
    Cuando descargo el archivo
    Entonces el nombre del archivo debe ser "encuentros_protocolo_20260606_143025.xlsx"
    Y el formato debe ser consistente "encuentros_protocolo_YYYYMMDD_HHMMSS.xlsx"
    Y el archivo debe guardarse en la carpeta de descargas del navegador

  # ========================================================================
  # TÉCNICA: CASOS EDGE - GRANDES VOLÚMENES
  # ========================================================================

  @gestorTA
  Escenario: EXP-17 - Exportar lista con gran volumen de encuentros
    Dado que existen 5000 encuentros en protocolo
    Cuando selecciono el botón "Descargar"
    Entonces debe mostrarse un mensaje "Generando archivo, por favor espere..."
    Y el archivo debe descargarse exitosamente
    Y el archivo debe contener los 5000 encuentros
    Y el proceso NO debe exceder 30 segundos

  @gestorTA
  Escenario: EXP-18 - Validar límite de exportación si aplica
    Dado que existen 15000 encuentros en protocolo
    Cuando selecciono el botón "Descargar"
    Entonces el sistema debe procesar la descarga
    Y debe descargarse el archivo con todos los encuentros disponibles
    O debe mostrarse un mensaje si hay un límite establecido "La exportación está limitada a X registros. Por favor aplique filtros."

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ORDEN
  # ========================================================================

  @gestorTA
  Escenario: EXP-19 - Validar que el archivo respeta el orden de la grilla
    Dado que he ordenado la grilla por "Fecha de Apertura" descendente
    Y los encuentros se muestran del más reciente al más antiguo
    Cuando descargo el archivo Excel
    Y abro el archivo
    Entonces los encuentros deben estar ordenados por "Fecha de Apertura" descendente
    Y el primer registro debe ser el encuentro más reciente
    Y el último registro debe ser el encuentro más antiguo

  @gestorTA
  Escenario: EXP-20 - Exportar con orden por defecto si no hay ordenamiento aplicado
    Dado que NO he aplicado ningún ordenamiento personalizado en la grilla
    Cuando descargo el archivo Excel
    Y abro el archivo
    Entonces los encuentros deben exportarse en el orden por defecto del sistema
    Y el orden debe ser consistente entre múltiples descargas
