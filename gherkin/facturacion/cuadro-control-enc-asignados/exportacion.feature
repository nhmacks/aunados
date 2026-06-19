# language: es

Característica: Exportación del Cuadro de Control - Encuentros Asignados
  Como Responsable de Facturación o Gestor TA
  Quiero exportar el cuadro de control de encuentros asignados
  Para realizar análisis externos y reportes

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y he accedido a la pantalla "Cuadro de control - Enc. asignados"

  # ========================================================================
  # TÉCNICA: EXPORTACIÓN SIN FILTROS
  # ========================================================================

  @prioridadAlta @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: EXP-01 - Exportar cuadro de control sin filtros aplicados
    Dado que soy un usuario con rol "<rol>"
    Dado que existen 135 ejecutivos de facturación
    Y NO he aplicado ningún filtro
    Cuando presiono el botón "Descargar"
    Entonces debe iniciarse la descarga de un archivo Excel
    Y el archivo debe contener 135 registros (uno por ejecutivo)
    Y el nombre del archivo debe tener el formato "Cuadro_Control_Enc_Asignados_YYYYMMDD_HHMMSS.xlsx"
    Y debe mostrarse un mensaje "Archivo descargado exitosamente"

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |


  @prioridadAlta @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: EXP-02 - Validar columnas del archivo exportado
    Dado que soy un usuario con rol "<rol>"
    Dado que existen ejecutivos con encuentros asignados
    Cuando descargo el archivo Excel
    Y abro el archivo descargado
    Entonces el archivo debe contener las siguientes columnas en orden:
      | Columna                  |
      | Ejecutivo                |
      | Facturado hoy            |
      | Monto fact.              |
      | Por facturar             |
      | Monto por fact.          |
      | En revisión              |
      | Monto en revisión        |
      | Regularizado             |
      | Monto regul.             |
      | No facturable            |
      | Monto NF                 |
      | Error de fact.           |
      | Monto error de f.        |
      | Total pendientes         |
      | Monto total pendientes   |
      | % Total pendiente        |
      | Devuelto a adm.          |
      | Monto devuelto           |
    Y debe tener exactamente 18 columnas
    Y la fila 1 debe contener los encabezados de columnas

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |


  # ========================================================================
  # TÉCNICA: EXPORTACIÓN CON FILTROS APLICADOS
  # ========================================================================

  @prioridadAlta @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: EXP-03 - Exportación respeta filtros activos
    Dado que soy un usuario con rol "<rol>"
    Dado que existen 135 ejecutivos en total
    Y he aplicado filtros que resultan en <filtrados> ejecutivos
    Y he presionado el botón "Filtrar"
    Y la grilla muestra <filtrados> registros
    Cuando presiono el botón "Descargar"
    Entonces el archivo debe contener exactamente <filtrados> registros
    Y debe respetar los filtros aplicados
    Y NO debe incluir ejecutivos fuera de los filtros

    Ejemplos:
      | filtrados | | rol                        |
      | 25        | | Responsable de Facturación |
      | 25        | | Gestor TA                  |
      | 1         | | Responsable de Facturación |
      | 1         | | Gestor TA                  |
      | 50        | | Responsable de Facturación |
      | 50        | | Gestor TA                  |
      | 135       | | Responsable de Facturación |
      | 135       | | Gestor TA                  |


  @prioridadAlta @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: EXP-04 - Exportar con filtro de Garante específico
    Dado que soy un usuario con rol "<rol>"
    Dado que he filtrado por garante "IAFAS PÚBLICAS"
    Y la grilla muestra 30 ejecutivos
    Cuando descargo el archivo
    Entonces el archivo debe contener 30 ejecutivos
    Y todos deben tener encuentros del garante "IAFAS PÚBLICAS"
    Y el nombre del archivo debe reflejar que hay filtros aplicados

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |


  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE FORMATO DE DATOS EXPORTADOS
  # ========================================================================

  @prioridadAlta @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: EXP-05 - Validar formato de datos en archivo Excel
    Dado que soy un usuario con rol "<rol>"
    Dado que existe el ejecutivo "Luis Medrano" con los siguientes datos:
      | Campo                  | Valor        |
      | Facturado hoy          | 16           |
      | Monto fact.            | 5,401.09     |
      | Por facturar           | 0            |
      | Monto por fact.        | 0.00         |
      | En revisión            | 22           |
      | Monto en revisión      | 2,813.03     |
      | % Total pendiente      | 2.31         |
    Cuando descargo el archivo
    Y abro el archivo Excel
    Entonces la fila de "Luis Medrano" debe contener:
      | Columna              | Valor Esperado |
      | Facturado hoy        | 16             |
      | Monto fact.          | 5401.09        |
      | Por facturar         | 0              |
      | Monto por fact.      | 0.00           |
      | % Total pendiente    | 2.31           |
    Y los montos deben ser numéricos sin símbolo de moneda
    Y los porcentajes deben ser numéricos decimales
    Y las cantidades deben ser números enteros

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |


  @prioridadAlta @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: EXP-06 - Validar que el archivo puede abrirse en diferentes herramientas
    Dado que soy un usuario con rol "<rol>"
    Cuando descargo el archivo Excel
    Entonces el archivo debe poder abrirse en Microsoft Excel
    Y debe poder abrirse en Google Sheets
    Y debe poder abrirse en LibreOffice Calc
    Y todos los datos deben visualizarse correctamente
    Y el formato debe mantenerse en todas las herramientas

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |


  # ========================================================================
  # TÉCNICA: ORDEN DE REGISTROS EN EXPORTACIÓN
  # ========================================================================

  @prioridadAlta @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: EXP-07 - El orden de los ejecutivos en el archivo coincide con la grilla
    Dado que soy un usuario con rol "<rol>"
    Dado que la grilla muestra ejecutivos en un orden específico
    Y el primer ejecutivo visible es "Jenny Xamara Ponce Ega"
    Y el último ejecutivo visible es "ANDREA AMELIA PAZ CRUZ"
    Cuando descargo el archivo
    Entonces la fila 2 del Excel debe ser "Jenny Xamara Ponce Ega"
    Y la última fila del Excel debe ser "ANDREA AMELIA PAZ CRUZ"
    Y el orden debe coincidir exactamente con la grilla

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |


  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE TOTALES Y SUMATORIAS
  # ========================================================================

  @prioridadAlta @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: EXP-08 - Los totales en el archivo coinciden con las tarjetas de métricas
    Dado que soy un usuario con rol "<rol>"
    Dado que la tarjeta "Facturado hoy" muestra "S/ 7,933.70" y "Cant. 20"
    Y la tarjeta "Por facturar" muestra "S/ 40,059.53" y "Cant. 223"
    Cuando descargo el archivo
    Y sumo la columna "Facturado hoy" de todos los ejecutivos
    Entonces la suma debe ser igual a 20
    Y cuando sumo la columna "Monto fact."
    Entonces la suma debe ser aproximadamente 7,933.70
    Y cuando sumo la columna "Por facturar"
    Entonces la suma debe ser igual a 223

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |


  # ========================================================================
  # TÉCNICA: EXPORTACIÓN CON GRILLA VACÍA
  # ========================================================================

  @prioridadAlta @responsableFacturacion @gestorTA @unhappyPath
  Esquema del escenario: EXP-09 - No se puede exportar cuando no hay datos
    Dado que soy un usuario con rol "<rol>"
    Dado que he aplicado filtros que no retornan resultados
    Y la grilla muestra "0 registros encontrados"
    Cuando intento presionar el botón "Descargar"
    Entonces el botón "Descargar" debe estar deshabilitado
    Y NO debe permitirse la exportación
    Y debe mostrarse un tooltip "No hay datos para exportar"

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |


  # ========================================================================
  # TÉCNICA: MANEJO DE ERRORES EN EXPORTACIÓN
  # ========================================================================

  @prioridadAlta @responsableFacturacion @gestorTA @unhappyPath
  Esquema del escenario: EXP-10 - Manejo de errores en proceso de exportación
    Dado que soy un usuario con rol "<rol>"
    Dado que existen datos en la grilla
    Y ocurre "<tipo_error>" durante la exportación
    Cuando intento descargar el archivo
    Entonces debe mostrarse "<mensaje_error>"
    Y debe permitirme "<accion_recuperacion>"

    Ejemplos:
      | tipo_error                  | mensaje_error                         | accion_recuperacion          | | rol                        |
      | error técnico en generación | No se pudo generar el reporte         | Intentar nuevamente          | | Responsable de Facturación |
      | error técnico en generación | No se pudo generar el reporte         | Intentar nuevamente          | | Gestor TA                  |
      | timeout en generación       | El reporte no pudo completarse        | Solicitar nueva exportación  | | Responsable de Facturación |
      | timeout en generación       | El reporte no pudo completarse        | Solicitar nueva exportación  | | Gestor TA                  |
      | sesión expirada             | Debe autenticarse nuevamente          | Redirigir al login           | | Responsable de Facturación |
      | sesión expirada             | Debe autenticarse nuevamente          | Redirigir al login           | | Gestor TA                  |


  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE PERFORMANCE EN EXPORTACIÓN
  # ========================================================================

  @prioridadAlta @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: EXP-11 - Exportación de gran volumen de ejecutivos
    Dado que soy un usuario con rol "<rol>"
    Dado que existen 200 ejecutivos de facturación
    Cuando presiono el botón "Descargar"
    Entonces el archivo debe generarse completamente
    Y debe contener los 200 registros correctos
    Y el archivo debe descargarse sin errores
    Y el tiempo de generación debe ser aceptable (menos de 10 segundos)

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |


  # ========================================================================
  # TÉCNICA: NOTIFICACIÓN DE DESCARGA
  # ========================================================================

  @prioridadAlta @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: EXP-12 - Visualizar notificación cuando la descarga está lista
    Dado que soy un usuario con rol "<rol>"
    Dado que he presionado el botón "Descargar"
    Y el archivo está siendo generado
    Cuando el archivo termina de generarse
    Entonces debe mostrarse una notificación "Te notificaremos cuando tu solicitud esté lista"
    Y debe mostrarse un botón "Aceptar" en la notificación
    Y al hacer clic en "Aceptar" debe iniciarse la descarga

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |


  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE NOMBRE DE ARCHIVO
  # ========================================================================

  @prioridadAlta @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: EXP-13 - Validar formato del nombre de archivo con timestamp
    Dado que soy un usuario con rol "<rol>"
    Dado que descargo el archivo el día 16/06/2026 a las 14:30:45
    Cuando se genera el archivo
    Entonces el nombre debe seguir el patrón "Cuadro_Control_Enc_Asignados_20260616_143045.xlsx"
    Y debe incluir la fecha en formato YYYYMMDD
    Y debe incluir la hora en formato HHMMSS
    Y cada descarga debe generar un timestamp único

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |


  # ========================================================================
  # TÉCNICA: EXPORTACIÓN INCLUYE TODOS LOS REGISTROS
  # ========================================================================

  @prioridadAlta @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: EXP-14 - Exportación incluye todos los ejecutivos, no solo los visibles en pantalla
    Dado que soy un usuario con rol "<rol>"
    Dado que existen 135 ejecutivos después de aplicar filtros
    Y la grilla solo muestra los primeros 20 ejecutivos en pantalla debido al scroll
    Cuando presiono el botón "Descargar"
    Entonces el archivo debe contener los 135 ejecutivos completos
    Y NO debe limitarse a los 20 visibles en pantalla
    Y debe respetar los filtros aplicados

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Gestor TA                  |


  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE DATOS ESPECIALES
  # ========================================================================

  @prioridadAlta @responsableFacturacion @gestorTA @happyPath
  Esquema del escenario: EXP-15 - Manejo de valores especiales en exportación
    Dado que soy un usuario con rol "<rol>"
    Dado que existe un ejecutivo con "<campo>" = "<valor>"
    Cuando descargo el archivo
    Y abro el archivo Excel
    Entonces la columna "<campo>" debe mostrar "<valor_esperado>"
    Y NO debe mostrarse "NULL" ni "undefined"

    Ejemplos:
      | campo            | valor | valor_esperado | | rol                        |
      | Facturado hoy    | 0     | 0              | | Responsable de Facturación |
      | Facturado hoy    | 0     | 0              | | Gestor TA                  |
      | Monto fact.      | 0.00  | 0.00           | | Responsable de Facturación |
      | Monto fact.      | 0.00  | 0.00           | | Gestor TA                  |
      | Por facturar     | NULL  | 0              | | Responsable de Facturación |
      | Por facturar     | NULL  | 0              | | Gestor TA                  |
      | % Total pendiente| 0.00  | 0.00           | | Responsable de Facturación |
      | % Total pendiente| 0.00  | 0.00           | | Gestor TA                  |

