# language: es

Característica: Exportación de Lista de Encuentros de Admisión
  Como usuario autorizado del sistema AUNADOS
  Quiero exportar la lista de encuentros a formato Excel
  Para realizar análisis externos y reportes operativos

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y estoy en la pantalla "Lista de Encuentros"

  # ========================================================================
  # PARTICIÓN DE EQUIVALENCIA: TIPO DE DESCARGA POR ROL
  # Cobertura: RN-EXP-04, RN-EXP-05, RN-EXP-06, EXP-01, EXP-02
  # ========================================================================

  @superusuarioAdmision @gestorTA
  Esquema del escenario: EXP-01 - Exportación inmediata respeta filtros activos (Superusuario/Gestor)
    Dado que soy un usuario con rol "<rol>"
    Y existen <total> encuentros clasificados para Admisión
    Y he aplicado <filtros>
    Y la grilla muestra <visibles> registros
    Cuando presiono el botón "Descargar"
    Entonces la descarga debe iniciar inmediatamente
    Y el archivo debe llamarse "Lista de Encuentros de Admisión.xlsx"
    Y el archivo debe contener exactamente <visibles> registros
    Y debe respetar los filtros aplicados

    Ejemplos:
      | rol                        | total | filtros                                  | visibles |
      | Superusuario de Admisión   | 500   | sin filtros                              | 500      |
      | Gestor TA                | 500   | filtro Estado = Pendiente                | 150      |
      | Superusuario de Admisión   | 500   | búsqueda apellido = García               | 25       |
      | Gestor TA                | 500   | filtro Prioridad 1 + búsqueda nombre Juan| 8        |

  @ejecutivoAdmision
  Esquema del escenario: EXP-02 - Exportación asíncrona respeta filtros y restricciones de rol (Ejecutivo)
    Dado que soy un usuario con rol "Ejecutivo de Admisión" con usuario "<usuario>"
    Y estoy asignado a la sede "<sede>"
    Y existen <total> encuentros en el sistema
    Y <mis_encuentros> fueron creados por mí en mi sede
    Y he aplicado <filtros>
    Y la grilla muestra <visibles> registros
    Cuando presiono el botón "Descargar"
    Entonces el sistema debe registrar la solicitud
    Y NO debe iniciar descarga inmediata
    Y debe mostrar mensaje de generación en proceso
    Y el archivo debe generarse en segundo plano sin bloquear mi navegación
    Y puedo continuar usando el sistema normalmente
    Y cuando la generación finalice debo recibir notificación en la campana con:
      | Campo       | Valor                                                                |
      | Descripción | El reporte solicitado ya está listo. Tienes una 1h para descargarlo. |
      | Descripción | hace 5 minutos                                                       |
      | Acción      | link "Descargar"                                                     |
    Cuando presiono "Descargar" desde la notificación
    Entonces el archivo debe descargarse correctamente
    Y el archivo debe contener exactamente <visibles> registros
    Y todos deben ser encuentros creados por mí en mi sede

    Ejemplos:
      | usuario      | sede               | total | mis_encuentros | filtros                  | visibles |
      | ejecutivo01  | Auna Guardia Civil | 1000  | 200           | sin filtros              | 200      |
      | ejecutivo02  | Las Flores         | 1000  | 150           | filtro Estado = Tramitado| 45       |
      | ejecutivo01  | Auna Guardia Civil | 1000  | 200           | búsqueda nombre = María  | 12       |

  # ========================================================================
  # ANÁLISIS DE VALORES LÍMITE: VIGENCIA DE ARCHIVO
  # Cobertura: RN-EXP-07, RN-EXP-08
  # ========================================================================

  @ejecutivoAdmision
  Esquema del escenario: EXP-04 - Validar vigencia de archivo exportado (valores límite)
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he solicitado una exportación hace <tiempo_transcurrido> minutos
    Y el archivo fue generado exitosamente
    Cuando intento descargar el archivo desde la notificación
    Entonces <resultado>

    Ejemplos:
      | tiempo_transcurrido | resultado                                                           |
      | 30                  | debe permitir la descarga exitosamente                             |
      | 59                  | debe permitir la descarga exitosamente                             |
      | 61                  | debe mostrar mensaje de expiración y NO permitir descarga          |
      | 120                 | debe indicar que debo generar nueva solicitud                      |

  # ========================================================================
  # PRUEBAS BASADAS EN RIESGO: INTEGRIDAD DE DATOS (CRÍTICO)
  # Cobertura: EXP-02, EXP-05
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Esquema del escenario: EXP-05 - Validar coincidencia exacta entre grilla y archivo exportado
    Dado que soy un usuario con rol "<rol>" con usuario "<usuario>"
    Y estoy asignado a la sede "<sede>"
    Y existen 50 encuentros visibles para mi rol en la grilla actual
    Y el primer encuentro visible es "12345678" con paciente "García, Juan"
    Y el último encuentro visible es "87654321" con paciente "Pérez, María"
    Cuando solicito la exportación
    Y obtengo el archivo generado mediante descarga "<tipo_descarga>"
    Entonces el archivo debe contener exactamente 50 registros
    Y la fila 2 del Excel debe ser el encuentro "12345678" con paciente "García, Juan"
    Y la fila 51 del Excel debe ser el encuentro "87654321" con paciente "Pérez, María"
    Y todos los datos de cada columna deben coincidir exactamente con la grilla
    Y NO debe incluir encuentros de otras bandejas (Protocolo, Facturación)

    Ejemplos:
      | rol                      | usuario      | sede               | tipo_descarga |
      | Superusuario de Admisión | superadm01   | Todas              | inmediata     |
      | Gestor TA              | gestorta01   | Todas              | inmediata     |
      | Ejecutivo de Admisión    | ejecutivo01  | Auna Guardia Civil | asíncrona     |

  # ========================================================================
  # PRUEBAS BASADAS EN RIESGO: SEGURIDAD (CRÍTICO)
  # Cobertura: RN-EXP-03
  # ========================================================================

  @ejecutivoAdmision
  Escenario: EXP-06 - Ejecutivo NO puede acceder a exportaciones de otros usuarios (Seguridad)
    Dado que soy un usuario con rol "Ejecutivo de Admisión" con usuario "ejecutivo01"
    Y estoy asignado a la sede "Auna Guardia Civil"
    Y otro usuario "ejecutivo02" con sede "Las Flores" ha generado un reporte
    Y existen 1000 encuentros en total en el sistema:
      | Encuentros | Usuario      | Sede               |
      | 200        | ejecutivo01  | Auna Guardia Civil |
      | 180        | ejecutivo02  | Las Flores         |
      | 620        | otros        | varias sedes       |
    Cuando accedo a mi campana de notificaciones
    Entonces solo debo ver mis propias notificaciones de reportes
    Y NO debo poder acceder a reportes de "ejecutivo02"
    Y cuando descargo mi exportación debe contener únicamente 200 registros
    Y todos deben ser de mi usuario y mi sede

  # ========================================================================
  # FORMATO Y ESTRUCTURA: CALIDAD DE DATOS POR ROL
  # Cobertura: RN-EXP-09, Sección 12 y 13 de docs
  # NOTA: Validar con equipo si RN-EXP-09 (estructura estándar) significa
  # mismas columnas para todos o columnas según visibilidad de grilla
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Esquema del escenario: EXP-07 - Validar formato y estructura del archivo Excel según rol
    Dado que soy un usuario con rol "<rol>"
    Y existen múltiples encuentros visibles para mi rol
    Cuando solicito una exportación de la Lista de Encuentros
    Y obtengo el archivo generado mediante descarga "<tipo_descarga>"
    Y abro el archivo Excel
    Entonces debe cumplir con el formato estándar:
      | Aspecto            | Especificación                                        |
      | Extensión          | .xlsx                                                 |
      | Nombre             | Lista de Encuentros de Admisión.xlsx                  |
      | Encabezados        | Fila 1 con nombres de columnas                        |
      | Datos              | Desde fila 2 en adelante                              |
      | Formato Fecha      | AAAA-MM-DD (ej: 2026-06-03)                          |
      | Formato Encuentro  | Numérico 8 dígitos sin notación científica           |
      | Formato Prioridad  | Valores 1, 2 o 3                                     |
      | Sustentos múltiples| Separados por punto y coma (;)                       |
      | Formato Monto      | Decimal con separadores correctos                     |
    Y debe poder abrirse en Microsoft Excel, Google Sheets y LibreOffice
    Y el archivo debe contener exactamente <cantidad_columnas> columnas
    Y las columnas deben ser: <columnas_esperadas>

    Ejemplos:
      | rol                      | tipo_descarga | cantidad_columnas | columnas_esperadas                                                                                                                                                                              |
      | Superusuario de Admisión | inmediata     | 14                | Sede, Encuentro, Estado, Nº HC, Apellidos, Nombres, Fecha Apert., Usuario, Garante, Prioridad, Sustentos Administrativos, Sustentos Médicos, Sustento de Proceso, Monto                        |
      | Gestor TA                | inmediata     | 14                | Sede, Encuentro, Estado, Nº HC, Apellidos, Nombres, Fecha Apert., Usuario, Garante, Prioridad, Sustentos Administrativos, Sustentos Médicos, Sustento de Proceso, Monto                        |
      | Ejecutivo de Admisión    | asíncrona     | 13                | Sede, Encuentro, Estado, Nº HC, Apellidos, Nombres, Fecha Apert., Usuario, Garante, Prioridad, Sustentos Administrativos, Sustentos Médicos, Monto                                             |

  # NOTA IMPORTANTE: El Ejecutivo de Admisión exporta columnas que NO visualiza en su grilla
  # (Sede, Usuario, Sustentos Administrativos, Sustentos Médicos, Monto) pero NO exporta "Sustento de Proceso".

  @ejecutivoAdmision @happyPath
  Escenario: EXP-07A - Ejecutivo exporta columnas no visibles en grilla pero NO exporta "Sustento de Proceso"
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y mi grilla muestra únicamente las siguientes columnas:
      | Columna Visible   |
      | Encuentro         |
      | Estado            |
      | Nº HC             |
      | Apellidos         |
      | Nombres           |
      | Fecha Apert.      |
      | Prioridad         |
      | Garante           |
      | Tipo de Encuentro |
    Y existen encuentros con datos en todas las columnas
    Cuando solicito la exportación
    Y descargo el archivo desde la notificación
    Y abro el archivo Excel
    Entonces el archivo debe contener exactamente 13 columnas
    Y debe incluir columnas NO visibles en mi grilla:
      | Columna No Visible           |
      | Sede                         |
      | Usuario                      |
      | Sustentos Administrativos    |
      | Sustentos Médicos            |
      | Monto                        |
    Y debe incluir todas las columnas visibles en mi grilla
    Y NO debe incluir la columna "Sustento de Proceso"
    Y la columna "Sustento de Proceso" es la única columna de exportación excluida para este rol

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: EXP-07B - Superusuario y Gestor TA exportan todas las 14 columnas incluyendo "Sustento de Proceso"
    Dado que soy un usuario con rol "Gestor TA"
    Y mi grilla muestra las 14 columnas disponibles para mi rol
    Y existen encuentros con datos en todas las columnas
    Cuando solicito la exportación
    Y descargo el archivo
    Y abro el archivo Excel
    Entonces el archivo debe contener exactamente 14 columnas
    Y debe incluir la columna "Sustento de Proceso"
    Y todas las columnas visibles en grilla deben estar en el archivo
    Y todas las columnas del archivo son visibles en mi grilla

  # ========================================================================
  # CASOS EDGE: VALORES ESPECIALES
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Esquema del escenario: EXP-08 - Manejo de valores especiales en exportación
    Dado que soy un usuario con rol "<rol>"
    Y existen encuentros visibles para mi rol que tienen <caso_especial>
    Cuando solicito la exportación
    Y obtengo el archivo generado mediante descarga "<tipo_descarga>"
    Y reviso el archivo Excel
    Entonces <comportamiento_esperado>

    Ejemplos:
      | rol                      | tipo_descarga | caso_especial                           | comportamiento_esperado                                    |
      | Superusuario de Admisión | inmediata     | sustentos administrativos vacíos        | debe mostrar "-" en la columna correspondiente            |
      | Gestor TA              | inmediata     | múltiples sustentos administrativos     | debe separar con ";" (ej: "Carta de Garantía; SOAT")     |
      | Ejecutivo de Admisión    | asíncrona     | campos opcionales sin valor             | debe mostrar celda vacía o "-", NO "NULL" ni "undefined" |
      | Superusuario de Admisión | inmediata     | 0 registros después de filtrar          | debe generar archivo con encabezados pero sin datos      |
      | Ejecutivo de Admisión    | asíncrona     | 1 solo registro                         | debe exportar correctamente 1 fila de datos              |

  # ========================================================================
  # PAIRWISE TESTING: COMBINACIONES DE FACTORES CRÍTICOS
  # Factores: Rol, Filtros, Volumen
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Esquema del escenario: EXP-09 - Combinaciones de rol, filtros y volumen (Pairwise)
    Dado que soy un usuario con rol "<rol>"
    Y existen <volumen> encuentros visibles para mi rol
    Y he aplicado "<tipo_filtro>"
    Cuando solicito la exportación
    Entonces debe ejecutarse el tipo de descarga "<tipo_descarga>"
    Y el archivo debe contener "<volumen_exportado>" registros

    Ejemplos: # Pairwise: Cubre todas las combinaciones de 2 factores
      | rol                      | volumen | tipo_filtro      | tipo_descarga | volumen_exportado |
      | Superusuario de Admisión | 50      | sin filtros      | inmediata     | 50                |
      | Gestor TA              | 500     | con filtros      | inmediata     | 150               |
      | Ejecutivo de Admisión    | 5000    | con búsqueda     | asíncrona     | 200               |
      | Superusuario de Admisión | 5000    | con búsqueda     | inmediata     | 800               |
      | Ejecutivo de Admisión    | 50      | sin filtros      | asíncrona     | 50                |

  # ========================================================================
  # PRUEBAS BASADAS EN RIESGO: PERFORMANCE (ALTO)
  # ========================================================================

  @superusuarioAdmision @gestorTA
  Esquema del escenario: EXP-10 - Exportación de gran volumen sin degradación (Performance)
    Dado que soy un usuario con rol "<rol>"
    Y existen 5000 encuentros clasificados para Admisión
    Cuando presiono el botón "Descargar"
    Entonces el archivo debe generarse completamente en tiempo aceptable
    Y debe contener los 5000 registros correctos
    Y el archivo debe descargarse sin errores
    Y el sistema debe mantener performance aceptable

    Ejemplos:
      | rol                      |
      | Superusuario de Admisión |
      | Gestor TA              |

  @ejecutivoAdmision
  Escenario: EXP-11 - Múltiples exportaciones asíncronas simultáneas no se mezclan
    Dado que existen los siguientes usuarios autenticados con rol "Ejecutivo de Admisión":
      | Usuario      | Sede               | Encuentros_propios |
      | ejecutivo01  | Auna Guardia Civil | 200               |
      | ejecutivo02  | Las Flores         | 150               |
      | ejecutivo03  | Delgado            | 180               |
    Y cada usuario se encuentra en la pantalla "Lista de Encuentros"
    Y cada usuario visualiza únicamente encuentros de su usuario y sede
    Cuando cada usuario solicita una exportación asíncrona simultáneamente
    Y cada uno descarga su archivo después de la notificación
    Entonces cada archivo debe contener únicamente los encuentros de su usuario/sede
    Y NO debe haber mezcla de datos entre usuarios
    Y cada uno debe recibir la cantidad correcta de registros

  # ========================================================================
  # ERROR HANDLING Y DISPONIBILIDAD
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Esquema del escenario: EXP-12 - Manejo de errores en proceso de exportación
    Dado que soy un usuario con rol "<rol>"
    Y ocurre "<tipo_error>"
    Cuando intento exportar la lista de encuentros
    Entonces debe mostrarse "<mensaje_error>"
    Y debe permitirme "<accion_recuperacion>"

    Ejemplos:
      | rol                      | tipo_error                      | mensaje_error                              | accion_recuperacion          |
      | Superusuario de Admisión | error técnico en generación     | no se pudo generar el reporte             | intentar nuevamente          |
      | Ejecutivo de Admisión    | timeout en generación asíncrona | el reporte no pudo completarse            | solicitar nueva exportación  |
      | Gestor TA              | sesión expirada                 | debe autenticarse nuevamente              | redirigir al login           |


  # ========================================================================
  # COMPATIBILIDAD Y SCROLL INFINITO
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Esquema del escenario: EXP-15 - Exportación incluye todos los registros disponibles, no solo los visibles en pantalla
    Dado que soy un usuario con rol "<rol>"
    Y existen 300 encuentros disponibles para mi rol después de aplicar filtros
    Y he cargado solo los primeros 50 mediante scroll infinito
    Y visualizo únicamente 50 registros en pantalla
    Cuando presiono el botón "Descargar"
    Y obtengo el archivo generado mediante descarga "<tipo_descarga>"
    Entonces el archivo debe contener los 300 encuentros completos
    Y NO debe limitarse a los 50 visibles en pantalla
    Y debe respetar los filtros que resultaron en 300 registros

    Ejemplos:
      | rol                      | tipo_descarga |
      | Superusuario de Admisión | asíncrona     |
      | Gestor TA                | asíncrona     |
      | Ejecutivo de Admisión    | asíncrona     |

  @gestorTA @maximosFiltros
  Escenario: EXP-16 - Exportar coincidencias aplicando búsqueda, todos los filtros y filtros por encabezados
    Dado que soy un usuario con rol "Gestor TA"
    Y existen 5000 encuentros clasificados para Admisión con datos en todos los campos filtrables
    Y existen 12 encuentros que cumplen simultáneamente todos los criterios de búsqueda y filtros
    Cuando ingreso "12345678" en el buscador de encuentro
    Y aplico todos los filtros disponibles para mi rol:
      | Filtro                  | Valor               |
      | Sede                    | Auna Guardia Civil  |
      | Estado                  | Pendiente           |
      | Fecha Apertura          | 03/06/2026          |
      | Prioridad               | Prioridad 1         |
      | Usuario                 | ejecutivo01         |
      | Garante                 | MAPFRE              |
      | Tipo de Encuentro       | Ambulatorio         |
      | Sustento Administrativo | Carta de Garantía   |
      | Sustento Médico         | Laboratorio         |
      | Sustento de proceso     | Auditoría Médica    |
      | Mecanismo               | CAPITA              |
    Y aplico filtros por todos los encabezados visibles de la grilla:
      | Encabezado                 | Valor              |
      | Sede                       | Auna Guardia Civil |
      | Encuentro                  | 12345678           |
      | Estado                     | Pendiente          |
      | NHC                        | 987654             |
      | Apellidos                  | García             |
      | Nombres                    | Juan               |
      | Fecha apert.               | 03/06/2026         |
      | Prioridad                  | Prioridad 1        |
      | Usuario                    | ejecutivo01        |
      | Garante                    | MAPFRE             |
      | Tipo de Encuentro          | Ambulatorio        |
      | Sustentos Administrativos  | Carta de Garantía  |
      | Sustentos Médicos          | Laboratorio        |
      | Sustentos de Proceso       | Auditoría Médica   |
      | Monto                      | 1500.00            |
    Y la grilla muestra únicamente 12 encuentros coincidentes
    Cuando presiono el botón "Descargar"
    Entonces la descarga debe iniciar correctamente
    Y el archivo debe llamarse "Lista de Encuentros de Admisión.xlsx"
    Y el archivo debe contener exactamente 12 registros
    Y todos los registros del archivo deben coincidir exactamente con los encuentros listados en la grilla
    Y el archivo debe respetar la búsqueda por encuentro, todos los filtros aplicados y todos los filtros por encabezado
    Y NO debe incluir encuentros descartados por cualquiera de los criterios aplicados

  # ========================================================================
  # PROCESO ASÍNCRONO DE GENERACIÓN
  # Cobertura: RN-LE-008, RN-LE-009
  # Sección 15, 16 del documento 05-Lista-Encuentros.md
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: EXP-17 - Proceso asíncrono de generación (RN-LE-008)
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y visualizo encuentros en la Lista de Encuentros
    Cuando presiono el botón "Descargar"
    Entonces el sistema debe iniciar un proceso asíncrono de generación
    Y NO debe bloquear la interfaz
    Y debo poder continuar usando el sistema normalmente
    Y la descarga NO debe ser inmediata
    Y el archivo debe generarse en segundo plano

  @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: EXP-18 - Notificación cuando archivo está disponible (RN-LE-009)
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he solicitado una descarga
    Y el sistema está generando el archivo de forma asíncrona
    Cuando el archivo se encuentre disponible
    Entonces debo recibir una notificación en la campana de notificaciones
    Y la notificación debe contener el mensaje "El reporte solicitado ya está listo"
    Y la notificación debe contener el mensaje "Tienes una hora para descargarlo"
    Y la notificación debe contener un botón "Descargar"

  @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: EXP-19 - Validar estructura completa de notificación de descarga
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he solicitado una descarga hace 2 minutos
    Y el archivo ha sido generado exitosamente
    Cuando accedo a la campana de notificaciones
    Entonces debe mostrarse una notificación con:
      | Elemento        | Valor                                                  |
      | Título          | El reporte solicitado ya está listo                    |
      | Descripción     | Tienes una hora para descargarlo                       |
      | Tiempo          | hace 2 minutos                                         |
      | Acción          | Botón "Descargar"                                      |
    Y debo poder descargar el archivo presionando el botón "Descargar"

  @ejecutivoAdmision @happyPath
  Escenario: EXP-20 - Tiempo límite de 1 hora para descargar archivo (RN-LE-009)
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he solicitado una descarga
    Y el archivo fue generado hace 58 minutos
    Cuando accedo a la notificación en la campana
    Y presiono el botón "Descargar"
    Entonces el archivo debe descargarse exitosamente
    Y debe llamarse "Lista de Encuentros de Admisión.xlsx"

  @ejecutivoAdmision @unhappyPath
  Escenario: EXP-21 - Archivo expira después de 1 hora
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he solicitado una descarga
    Y el archivo fue generado hace 62 minutos
    Cuando intento descargar el archivo desde la notificación
    Entonces el sistema debe mostrar un mensaje de expiración
    Y NO debe permitir la descarga
    Y debo poder solicitar una nueva exportación

  @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: EXP-22 - Solicitar descarga no bloquea navegación
    Dado que soy un usuario con rol "Gestor TA"
    Y estoy en la pantalla "Lista de Encuentros"
    Cuando presiono el botón "Descargar"
    Entonces el sistema debe registrar la solicitud
    Y debo poder navegar a otras pantallas inmediatamente
    Y debo poder aplicar nuevos filtros
    Y debo poder buscar encuentros
    Y debo poder acceder al detalle de encuentros
    Y el archivo debe generarse en segundo plano sin interrumpir mis actividades

  @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: EXP-23 - Validar mensaje durante generación asíncrona
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Cuando presiono el botón "Descargar"
    Entonces el sistema debe mostrar un mensaje indicando que la generación está en proceso
    Y el mensaje debe informar que recibiré una notificación cuando esté listo
    Y debo poder cerrar el mensaje y continuar trabajando

  @ejecutivoAdmision @happyPath
  Escenario: EXP-24 - Múltiples solicitudes de descarga - cada una genera notificación independiente
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y solicito una primera descarga con filtro "Estado = Pendiente" a las 10:00
    Y solicito una segunda descarga con filtro "Estado = Tramitado" a las 10:05
    Y solicito una tercera descarga sin filtros a las 10:10
    Cuando las 3 descargas se generan exitosamente
    Entonces debo recibir 3 notificaciones independientes en la campana
    Y cada notificación debe permitirme descargar su archivo correspondiente
    Y el primer archivo debe contener solo encuentros con estado "Pendiente"
    Y el segundo archivo debe contener solo encuentros con estado "Tramitado"
    Y el tercer archivo debe contener todos los encuentros

  @superusuarioAdmision @gestorTA @happyPath
  Escenario: EXP-25 - Notificación persiste hasta ser descargada o hasta expirar
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y he solicitado una descarga
    Y el archivo fue generado hace 10 minutos
    Y he cerrado sesión y vuelto a iniciar sesión
    Cuando accedo a la campana de notificaciones
    Entonces la notificación de descarga debe seguir visible
    Y debo poder descargar el archivo
    Y la notificación debe mostrar "hace X minutos" actualizado

  @ejecutivoAdmision @happyPath
  Escenario: EXP-26 - Descarga asíncrona respeta restricciones de rol
    Dado que soy un usuario con rol "Ejecutivo de Admisión" asignado a "Auna Guardia Civil"
    Y existen 1000 encuentros en el sistema
    Y solo 200 fueron creados por mí en mi sede
    Cuando solicito una descarga
    Y el sistema genera el archivo de forma asíncrona
    Y recibo la notificación de archivo disponible
    Y descargo el archivo desde la notificación
    Entonces el archivo debe contener exactamente 200 registros
    Y todos deben ser encuentros creados por mí
    Y todos deben ser de mi sede "Auna Guardia Civil"
    Y NO debe incluir encuentros de otros usuarios o sedes

  @superusuarioAdmision @gestorTA @ejecutivoAdmision @unhappyPath
  Escenario: EXP-27 - Error en generación asíncrona notifica al usuario
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he solicitado una descarga
    Y ocurre un error técnico durante la generación del archivo
    Cuando el sistema detecta el error
    Entonces debo recibir una notificación en la campana
    Y la notificación debe indicar que ocurrió un error
    Y debe permitirme solicitar una nueva exportación
    Y debe mostrar un mensaje descriptivo del problema

  @superusuarioAdmision @gestorTA @ejecutivoAdmision @happyPath
  Escenario: EXP-28 - Validar que proceso asíncrono libera recursos correctamente
    Dado que soy un usuario con rol "Gestor TA"
    Y existen 5000 encuentros clasificados para Admisión
    Cuando solicito una descarga
    Entonces el proceso asíncrono debe iniciarse
    Y NO debe consumir recursos del navegador del usuario
    Y debe ejecutarse completamente en el servidor
    Y el usuario puede cerrar el navegador sin interrumpir la generación
    Cuando el usuario regresa posteriormente
    Entonces la notificación debe estar disponible si el archivo se generó
    Y debe poder descargar el archivo normalmente
