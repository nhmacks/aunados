# language: es

Característica: Exportación de Encuentros Devueltos
  Como usuario autorizado del sistema AUNADOS
  Quiero exportar la lista de encuentros devueltos a formato Excel
  Para realizar análisis externos y reportes operativos

  # ========================================================================
  # PARTICIÓN DE EQUIVALENCIA: TIPO DE DESCARGA POR ROL
  # Cobertura: Sección 13 del documento 18-Encuentros-Devueltos.md
  # ========================================================================

  @prioridadAlta @gestorTA @superusuarioAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: EXP-01 - Exportación respeta filtros activos
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Y existen <total> encuentros devueltos
    Y he aplicado <filtros>
    Y la grilla muestra <visibles> registros
    Cuando presiono el botón "Descargar"
    Entonces la descarga debe iniciar inmediatamente
    Y el archivo debe llamarse "Encuentros_Devueltos_<hash>.xlsx"
    Y el archivo debe contener exactamente <visibles> registros
    Y debe respetar los filtros aplicados

    Ejemplos:
      | rol                        | total | filtros                                  | visibles |
      | Superusuario de Admisión   | 500   | sin filtros                              | 500      |
      | Gestor TA                  | 500   | filtro Estado = Devuelto                 | 150      |
      | Superusuario de Admisión   | 500   | búsqueda apellido = García               | 25       |
      | Gestor TA                  | 500   | filtro Prioridad Alta + búsqueda Juan    | 8        |

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: EXP-02 - Exportación respeta filtros y restricciones de rol (Ejecutivo)
    Dado que soy un usuario con rol "Ejecutivo de Admisión" con usuario "<usuario>"
    Y he iniciado sesión en el sistema
    Y estoy asignado a la sede "<sede>"
    Y existen <total> encuentros devueltos en el sistema
    Y <mis_encuentros> fueron creados por mí en mi sede
    Y he aplicado <filtros>
    Y la grilla muestra <visibles> registros
    Cuando presiono el botón "Descargar"
    Entonces la descarga debe iniciar inmediatamente
    Y el archivo debe llamarse "Encuentros_Devueltos_<hash>.xlsx"
    Y el archivo debe contener exactamente <visibles> registros
    Y todos deben ser encuentros creados por mí en mi sede
    Y debe respetar los filtros aplicados

    Ejemplos:
      | usuario      | sede               | total | mis_encuentros | filtros                  | visibles |
      | ejecutivo01  | Auna Guardia Civil | 1000  | 200            | sin filtros              | 200      |
      | ejecutivo02  | Las Flores         | 1000  | 150            | filtro Estado = Devuelto | 45       |
      | ejecutivo01  | Auna Guardia Civil | 1000  | 200            | búsqueda nombre = María  | 12       |

  # ========================================================================
  # PRUEBAS BASADAS EN RIESGO: INTEGRIDAD DE DATOS (CRÍTICO)
  # ========================================================================

  @prioridadAlta @gestorTA @superusuarioAdmision @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: EXP-03 - Validar coincidencia exacta entre grilla y archivo exportado
    Dado que soy un usuario con rol "<rol>" con usuario "<usuario>"
    Y he iniciado sesión en el sistema
    Y estoy asignado a la sede "<sede>"
    Y existen 50 encuentros devueltos visibles para mi rol en la grilla actual
    Y el primer encuentro visible es "12345678" con paciente "García, Juan"
    Y el último encuentro visible es "87654321" con paciente "Pérez, María"
    Cuando solicito la exportación
    Entonces el archivo debe contener exactamente 50 registros
    Y la fila 2 del Excel debe ser el encuentro "12345678" con paciente "García, Juan"
    Y la fila 51 del Excel debe ser el encuentro "87654321" con paciente "Pérez, María"
    Y todos los datos de cada columna deben coincidir exactamente con la grilla

    Ejemplos:
      | rol                      | usuario      | sede               |
      | Superusuario de Admisión | superadm01   | Todas              |
      | Gestor TA                | gestorta01   | Todas              |
      | Ejecutivo de Admisión    | ejecutivo01  | Auna Guardia Civil |

  # ========================================================================
  # PRUEBAS BASADAS EN RIESGO: SEGURIDAD (CRÍTICO)
  # ========================================================================

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Escenario: EXP-04 - Ejecutivo NO puede exportar encuentros de otros usuarios (Seguridad)
    Dado que soy un usuario con rol "Ejecutivo de Admisión" con usuario "ejecutivo01"
    Y he iniciado sesión en el sistema
    Y estoy asignado a la sede "Auna Guardia Civil"
    Y existen 1000 encuentros devueltos en total en el sistema:
      | Encuentros | Usuario      | Sede               |
      | 200        | ejecutivo01  | Auna Guardia Civil |
      | 180        | ejecutivo02  | Las Flores         |
      | 620        | otros        | varias sedes       |
    Cuando descargo la exportación de Encuentros Devueltos
    Entonces el archivo debe contener únicamente 200 registros
    Y todos deben ser de mi usuario y mi sede
    Y NO debe incluir encuentros de "ejecutivo02" ni de otros usuarios

  # ========================================================================
  # FORMATO Y ESTRUCTURA: CALIDAD DE DATOS POR ROL
  # Cobertura: Sección 13 del documento 18-Encuentros-Devueltos.md
  # NOTA IMPORTANTE: Todos los roles exportan las mismas 15 columnas
  # ========================================================================

  @prioridadAlta @gestorTA @superusuarioAdmision @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: EXP-05 - Validar formato y estructura del archivo Excel
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Y existen múltiples encuentros devueltos visibles para mi rol
    Cuando solicito una exportación de Encuentros Devueltos
    Y abro el archivo Excel
    Entonces debe cumplir con el formato estándar:
      | Aspecto                     | Especificación                                        |
      | Extensión                   | .xlsx                                                 |
      | Nombre                      | Encuentros_Devueltos_<hash>.xlsx                      |
      | Encabezados                 | Fila 1 con nombres de columnas                        |
      | Datos                       | Desde fila 2 en adelante                              |
      | Formato Fecha               | DD/MM/AAAA (ej: 03/06/2026)                           |
      | Formato Encuentro           | Numérico 8 dígitos sin notación científica            |
      | Formato Prioridad           | Alta, Media, Baja                                     |
      | Devoluciones múltiples      | Separados por coma (,)                                |
      | Formato Monto               | Decimal con separadores correctos                     |
    Y debe poder abrirse en Microsoft Excel, Google Sheets y LibreOffice
    Y el archivo debe contener exactamente 15 columnas
    Y las columnas deben ser: Sede, Encuentro, Estado, Nº HC, Apellidos, Nombres, Fecha Apert., Usuario, Garante, Tipo encuentro, Prioridad, Devoluciones administrativas, Devoluciones médicas, Devoluciones de proceso, Monto

    Ejemplos:
      | rol                      |
      | Superusuario de Admisión |
      | Gestor TA                |
      | Ejecutivo de Admisión    |

  # NOTA IMPORTANTE: El Ejecutivo de Admisión exporta columnas que NO visualiza en su grilla
  # (Sede, Usuario, Devoluciones administrativas, Devoluciones médicas, Devoluciones de proceso)

  # ========================================================================
  # VALIDACIÓN DE COLUMNAS POR ROL
  # ========================================================================

  @prioridadAlta @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: EXP-06 - Ejecutivo exporta columnas que no visualiza en la grilla
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y visualizo en la grilla solo 10 columnas
    Y NO visualizo las columnas: Sede, Usuario, Devoluciones administrativas, Devoluciones médicas, Devoluciones de proceso
    Cuando descargo la exportación de Encuentros Devueltos
    Y abro el archivo Excel
    Entonces el archivo debe contener 15 columnas
    Y debe incluir la columna "Sede"
    Y debe incluir la columna "Usuario"
    Y debe incluir la columna "Devoluciones administrativas"
    Y debe incluir la columna "Devoluciones médicas"
    Y debe incluir la columna "Devoluciones de proceso"

  @prioridadAlta @gestorTA @superusuarioAdmision @encuentrosDevueltos @happyPath
  Escenario: EXP-07 - Gestor TA y Superusuario exportan las mismas columnas que visualizan
    Dado que soy un usuario con rol "Gestor TA"
    Y he iniciado sesión en el sistema
    Y visualizo en la grilla 15 columnas
    Cuando descargo la exportación de Encuentros Devueltos
    Y abro el archivo Excel
    Entonces el archivo debe contener exactamente las 15 columnas que visualizo en la grilla

  # ========================================================================
  # CASOS EDGE: VALORES ESPECIALES
  # ========================================================================

  @prioridadAlta @gestorTA @superusuarioAdmision @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: EXP-08 - Manejo de valores especiales en exportación
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Y existe un encuentro devuelto con los siguientes datos:
      | Campo                        | Valor              |
      | Apellidos                    | <apellido>         |
      | Devoluciones administrativas | <dev_admin>        |
      | Devoluciones médicas         | <dev_medica>       |
      | Devoluciones de proceso      | <dev_proceso>      |
    Cuando descargo la exportación
    Y abro el archivo Excel
    Entonces la columna "Apellidos" debe mostrar "<apellido_esperado>"
    Y la columna "Devoluciones administrativas" debe mostrar "<dev_admin_esperado>"
    Y la columna "Devoluciones médicas" debe mostrar "<dev_medica_esperado>"
    Y la columna "Devoluciones de proceso" debe mostrar "<dev_proceso_esperado>"

    Ejemplos:
      | rol                      | apellido          | dev_admin                           | dev_medica              | dev_proceso          | apellido_esperado | dev_admin_esperado                  | dev_medica_esperado     | dev_proceso_esperado |
      | Gestor TA                | O'Brien           | Acta Conformidad                    | -                       | -                    | O'Brien           | Acta Conformidad                    | -                       | -                    |
      | Superusuario de Admisión | García-Pérez      | -                                   | Carta de Garantía       | -                    | García-Pérez      | -                                   | Carta de Garantía       | -                    |
      | Ejecutivo de Admisión    | De la Cruz        | Acta Conformidad, Datos Económicos  | Error CIE10             | Duplicidad de Gastos | De la Cruz        | Acta Conformidad, Datos Económicos  | Error CIE10             | Duplicidad de Gastos |

  # ========================================================================
  # TÉCNICA: VALORES DE FRONTERA - MONTOS MÍNIMOS, PROMEDIO Y MÁXIMOS
  # ========================================================================

  @prioridadAlta @gestorTA @superusuarioAdmision @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: EXP-08B - Validar exportación de montos mínimos, promedio y máximos
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Y existen encuentros devueltos con montos variados:
      | Encuentro | Monto      |
      | 11111111  | <monto>    |
    Cuando descargo la exportación
    Y abro el archivo Excel
    Entonces la columna "Monto" debe mostrar el valor "<monto_esperado>"
    Y el formato debe incluir separador de miles y dos decimales
    Y NO debe haber truncamiento ni desbordamiento

    Ejemplos:
      | rol                      | monto        | monto_esperado | tipo_valor    |
      | Gestor TA                | 0.00         | 0.00           | Mínimo        |
      | Gestor TA                | 0.01         | 0.01           | Mínimo límite |
      | Superusuario de Admisión | 100.50       | 100.50         | Bajo          |
      | Ejecutivo de Admisión    | 1250.00      | 1,250.00       | Promedio bajo |
      | Gestor TA                | 5000.00      | 5,000.00       | Promedio      |
      | Superusuario de Admisión | 25000.00     | 25,000.00      | Promedio alto |
      | Ejecutivo de Admisión    | 50000.00     | 50,000.00      | Alto          |
      | Gestor TA                | 100000.00    | 100,000.00     | Muy alto      |
      | Superusuario de Admisión | 500000.00    | 500,000.00     | Máximo        |
      | Ejecutivo de Admisión    | 9999999.99   | 9,999,999.99   | Máximo límite |

  # ========================================================================
  # COMPATIBILIDAD Y SCROLL INFINITO
  # ========================================================================

  @prioridadAlta @gestorTA @superusuarioAdmision @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: EXP-09 - Exportación incluye todos los registros, no solo los visibles en pantalla
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Y existen 300 encuentros devueltos disponibles para mi rol después de aplicar filtros
    Y he cargado solo los primeros 50 mediante scroll infinito
    Y visualizo únicamente 50 registros en pantalla
    Cuando presiono el botón "Descargar"
    Entonces el archivo debe contener los 300 encuentros completos
    Y NO debe limitarse a los 50 visibles en pantalla
    Y debe respetar los filtros que resultaron en 300 registros

    Ejemplos:
      | rol                      |
      | Superusuario de Admisión |
      | Gestor TA                |
      | Ejecutivo de Admisión    |

  # ========================================================================
  # ERROR HANDLING Y SIN RESULTADOS
  # ========================================================================

  @prioridadAlta @gestorTA @superusuarioAdmision @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Escenario: EXP-10 - No se puede exportar cuando no hay encuentros devueltos
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y NO tengo encuentros devueltos
    Y se muestra el mensaje "No encontramos resultados por atender"
    Cuando visualizo la pantalla de Encuentros Devueltos
    Entonces el botón "Descargar" debe estar deshabilitado
    Y NO debe permitir exportar

  @prioridadAlta @gestorTA @superusuarioAdmision @ejecutivoAdmision @encuentrosDevueltos @unhappyPath
  Esquema del escenario: EXP-11 - Manejo de errores en proceso de exportación
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Y ocurre "<tipo_error>"
    Cuando intento exportar los encuentros devueltos
    Entonces debe mostrarse "<mensaje_error>"
    Y debe permitirme "<accion_recuperacion>"

    Ejemplos:
      | rol                      | tipo_error                   | mensaje_error                              | accion_recuperacion          |
      | Superusuario de Admisión | error técnico en generación  | No se pudo generar el reporte              | Intentar nuevamente          |
      | Ejecutivo de Admisión    | timeout en generación        | El reporte no pudo completarse             | Solicitar nueva exportación  |
      | Gestor TA                | sesión expirada              | Debe autenticarse nuevamente               | Redirigir al login           |

  # ========================================================================
  # PRUEBAS BASADAS EN RIESGO: PERFORMANCE (ALTO)
  # ========================================================================

  @prioridadAlta @gestorTA @superusuarioAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: EXP-12 - Exportación de gran volumen sin degradación (Performance)
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Y existen 5000 encuentros devueltos
    Cuando presiono el botón "Descargar"
    Entonces el archivo debe generarse completamente en tiempo aceptable
    Y debe contener los 5000 registros correctos
    Y el archivo debe descargarse sin errores
    Y el sistema debe mantener performance aceptable

    Ejemplos:
      | rol                      |
      | Superusuario de Admisión |
      | Gestor TA                |

  # ========================================================================
  # VALIDACIÓN DE NOMBRE DE ARCHIVO
  # ========================================================================

  @prioridadAlta @gestorTA @superusuarioAdmision @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: EXP-13 - Validar formato del nombre de archivo con hash único
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Y tengo encuentros devueltos disponibles
    Cuando descargo la exportación
    Entonces el nombre del archivo debe seguir el patrón "Encuentros_Devueltos_<hash>.xlsx"
    Y el hash debe tener 8 caracteres alfanuméricos
    Y cada descarga debe generar un hash diferente

    Ejemplos:
      | rol                      |
      | Superusuario de Admisión |
      | Gestor TA                |
      | Ejecutivo de Admisión    |
