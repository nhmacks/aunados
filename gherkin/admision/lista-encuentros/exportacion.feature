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
    Y cuando el archivo esté listo debo recibir notificación en la campana
    Y el archivo debe contener exactamente <visibles> registros
    Y todos deben ser encuentros creados por mí en mi sede

    Ejemplos:
      | usuario      | sede               | total | mis_encuentros | filtros                  | visibles |
      | ejecutivo01  | Auna Guardia Civil | 1000  | 200           | sin filtros              | 200      |
      | ejecutivo02  | Las Flores         | 1000  | 150           | filtro Estado = Tramitado| 45       |
      | ejecutivo01  | Auna Guardia Civil | 1000  | 200           | búsqueda nombre = María  | 12       |

  # ========================================================================
  # TRANSICIÓN DE ESTADOS: FLUJO COMPLETO ASÍNCRONO
  # Cobertura: RN-EXP-04, RN-EXP-07, RN-EXP-08
  # ========================================================================

  @ejecutivoAdmision
  Escenario: EXP-03 - Flujo completo de exportación asíncrona desde solicitud hasta descarga
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y existen 150 encuentros visibles para mi rol
    # Estado: Inicial
    Cuando presiono el botón "Descargar"
    Entonces el sistema debe registrar la solicitud
    # Estado: Procesando
    Y el archivo debe generarse en segundo plano sin bloquear mi navegación
    Y puedo continuar usando el sistema normalmente
    # Estado: Listo
    Y cuando la generación finalice debo recibir notificación con:
      | Campo       | Valor                                                                  |
      | Título      | Reporte disponible                                                     |
      | Descripción | El reporte solicitado ya está listo. Tienes una hora para descargarlo.|
      | Acción      | Botón Descargar                                                        |
    # Estado: Descargado
    Cuando presiono "Descargar" desde la notificación
    Entonces el archivo debe descargarse correctamente
    Y debe contener los 150 registros solicitados

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
  # Cobertura: EXP-02, EXP-03, EXP-05
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: EXP-05 - Validar coincidencia exacta entre grilla y archivo exportado
    Dado que visualizo 50 encuentros en la grilla actual
    Y el primer encuentro visible es "12345678" con paciente "García, Juan"
    Y el último encuentro visible es "87654321" con paciente "Pérez, María"
    Cuando descargo la exportación
    Entonces el archivo debe contener exactamente 50 registros
    Y la fila 2 del Excel debe ser el encuentro "12345678" con paciente "García, Juan"
    Y la fila 51 del Excel debe ser el encuentro "87654321" con paciente "Pérez, María"
    Y todos los datos de cada columna deben coincidir exactamente con la grilla
    Y NO debe incluir encuentros de otras bandejas (Protocolo, Facturación)

  # ========================================================================
  # PRUEBAS BASADAS EN RIESGO: SEGURIDAD (CRÍTICO)
  # Cobertura: EXP-03, RN-EXP-03
  # ========================================================================

  @ejecutivoAdmision
  Escenario: EXP-06 - Ejecutivo NO puede acceder a exportaciones de otros usuarios (Seguridad)
    Dado que soy el usuario "ejecutivo01" con sede "Auna Guardia Civil"
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
    Y descargo un archivo de exportación con múltiples registros
    Cuando abro el archivo Excel
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
      | rol                      | cantidad_columnas | columnas_esperadas                                                                                                                                                                              |
      | Superusuario de Admisión | 14                | Sede, Encuentro, Estado, NHC, Apellidos, Nombres, Fecha de Apertura, Usuario, Garante, Prioridad, Sustentos Administrativos, Sustentos Médicos, Sustentos de Proceso, Monto                   |
      | Gestor TA              | 14                | Sede, Encuentro, Estado, NHC, Apellidos, Nombres, Fecha de Apertura, Usuario, Garante, Prioridad, Sustentos Administrativos, Sustentos Médicos, Sustentos de Proceso, Monto                   |
      | Ejecutivo de Admisión    | 9                 | Encuentro, Estado, NHC, Apellidos, Nombres, Fecha de Apertura, Prioridad, Garante, Tipo de Encuentro                                                                                           |

  # NOTA IMPORTANTE: Si RN-EXP-09 se interpreta como "todos los roles exportan las mismas 14 columnas",
  # entonces el Ejecutivo exportaría columnas que NO puede ver en la grilla (Sede, Usuario, Sustentos, Monto).
  # Esto debe validarse desde perspectiva de seguridad y UX antes de implementación.

  # ========================================================================
  # CASOS EDGE: VALORES ESPECIALES
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Esquema del escenario: EXP-08 - Manejo de valores especiales en exportación
    Dado que descargo una exportación con encuentros que tienen <caso_especial>
    Cuando reviso el archivo Excel
    Entonces <comportamiento_esperado>

    Ejemplos:
      | caso_especial                           | comportamiento_esperado                                    |
      | sustentos administrativos vacíos        | debe mostrar "-" en la columna correspondiente            |
      | múltiples sustentos administrativos     | debe separar con ";" (ej: "Carta de Garantía; SOAT")     |
      | campos opcionales sin valor             | debe mostrar celda vacía o "-", NO "NULL" ni "undefined" |
      | 0 registros después de filtrar          | debe generar archivo con encabezados pero sin datos      |
      | 1 solo registro                         | debe exportar correctamente 1 fila de datos              |

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
  Escenario: EXP-10 - Exportación de gran volumen sin degradación (Performance)
    Dado que soy un usuario con rol "Superusuario de Admisión"
    Y existen 5000 encuentros clasificados para Admisión
    Cuando presiono el botón "Descargar"
    Entonces el archivo debe generarse completamente en tiempo aceptable
    Y debe contener los 5000 registros correctos
    Y el archivo debe descargarse sin errores
    Y el sistema debe mantener performance aceptable

  @ejecutivoAdmision
  Escenario: EXP-11 - Múltiples exportaciones asíncronas simultáneas no se mezclan
    Dado que 3 ejecutivos diferentes solicitan exportaciones simultáneamente:
      | Usuario      | Sede               | Encuentros_propios |
      | ejecutivo01  | Auna Guardia Civil | 200               |
      | ejecutivo02  | Las Flores         | 150               |
      | ejecutivo03  | Delgado            | 180               |
    Cuando cada uno descarga su archivo después de la notificación
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
  # AUDITORÍA Y TRAZABILIDAD
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: EXP-13 - Registrar auditoría completa de cada exportación
    Dado que realizo una exportación con 75 registros filtrados por Estado = Pendiente
    Cuando la exportación se completa exitosamente
    Entonces el sistema debe registrar en auditoría:
      | Campo                 | Información registrada                    |
      | Usuario               | Mi nombre de usuario                      |
      | Rol                   | Mi rol actual                             |
      | Fecha y Hora          | Timestamp exacto de la exportación        |
      | Cantidad de registros | 75                                        |
      | Filtros aplicados     | Estado = Pendiente                        |
      | Tipo de descarga      | Inmediata o Asíncrona según rol           |
      | Estado generación     | Exitosa                                   |
      | IP de origen          | Dirección IP del usuario                  |

  # ========================================================================
  # TABLA DE DECISIÓN: VALIDACIÓN DE REGLAS DE NEGOCIO
  # Cobertura: Todas las RN-EXP consolidadas
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Esquema del escenario: EXP-14 - Validar reglas de negocio según contexto (Tabla de decisión)
    Dado que soy un usuario con rol "<rol>"
    Y hay filtros activos = <filtros_activos>
    Y hay búsqueda activa = <busqueda_activa>
    Y han pasado <tiempo_minutos> minutos desde generación (solo async)
    Cuando solicito o intento descargar la exportación
    Entonces tipo de descarga = "<tipo_descarga>"
    Y respeta filtros = <respeta_filtros>
    Y respeta búsqueda = <respeta_busqueda>
    Y respeta restricciones de rol = <respeta_rol>
    Y estado disponibilidad = "<disponibilidad>"

    Ejemplos: # Tabla de decisión consolidada
      | rol                      | filtros_activos | busqueda_activa | tiempo_minutos | tipo_descarga | respeta_filtros | respeta_busqueda | respeta_rol | disponibilidad |
      | Superusuario de Admisión | Sí              | No              | N/A            | inmediata     | Sí              | N/A              | Sí          | inmediata      |
      | Gestor TA              | No              | Sí              | N/A            | inmediata     | N/A             | Sí               | Sí          | inmediata      |
      | Ejecutivo de Admisión    | Sí              | Sí              | 30             | asíncrona     | Sí              | Sí               | Sí          | disponible     |
      | Ejecutivo de Admisión    | No              | No              | 65             | asíncrona     | N/A             | N/A              | Sí          | expirado       |
      | Superusuario de Admisión | Sí              | Sí              | N/A            | inmediata     | Sí              | Sí               | Sí          | inmediata      |

  # ========================================================================
  # COMPATIBILIDAD Y SCROLL INFINITO
  # ========================================================================

  @superusuarioAdmision @gestorTA @ejecutivoAdmision
  Escenario: EXP-15 - Exportación incluye todos los registros disponibles, no solo los visibles en pantalla
    Dado que existen 300 encuentros disponibles después de aplicar filtros
    Y he cargado solo los primeros 50 mediante scroll infinito
    Y visualizo únicamente 50 registros en pantalla
    Cuando presiono el botón "Descargar"
    Entonces el archivo debe contener los 300 encuentros completos
    Y NO debe limitarse a los 50 visibles en pantalla
    Y debe respetar los filtros que resultaron en 300 registros
