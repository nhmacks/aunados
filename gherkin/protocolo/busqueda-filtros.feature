# language: es

Característica: Búsqueda y Filtros en Encuentros en Protocolo
  Como Gestor TA
  Quiero buscar y filtrar encuentros en protocolo
  Para localizar rápidamente la información que necesito

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Gestor TA"
    Y he accedido a la pantalla "Encuentros en Protocolo"

  # ========================================================================
  # TÉCNICA: BÚSQUEDA GENERAL
  # ========================================================================

  @gestorTA @happyPath
  Escenario: FIL-01 - Buscar encuentro por número de encuentro
    Dado que existen encuentros en protocolo
    Y existe el encuentro con número "12345678"
    Cuando ingreso "12345678" en la caja de búsqueda
    Y presiono la tecla Enter
    Entonces la grilla debe mostrar únicamente el encuentro "12345678"
    Y el contador debe mostrar "1 registros encontrados"

  @gestorTA @happyPath
  Escenario: FIL-02 - Buscar encuentro por nombres del paciente
    Dado que existen encuentros en protocolo
    Y existen encuentros del paciente con nombres "Juan Carlos"
    Cuando ingreso "Juan Carlos" en la caja de búsqueda
    Y presiono la tecla Enter
    Entonces la grilla debe mostrar únicamente los encuentros con nombres que coincidan con "Juan Carlos"
    Y el contador debe actualizarse con la cantidad de resultados encontrados

  @gestorTA @happyPath
  Escenario: FIL-03 - Buscar encuentro por apellidos del paciente
    Dado que existen encuentros en protocolo
    Y existen encuentros del paciente con apellidos "García Pérez"
    Cuando ingreso "García" en la caja de búsqueda
    Y presiono la tecla Enter
    Entonces la grilla debe mostrar únicamente los encuentros con apellidos que coincidan con "García"
    Y el contador debe actualizarse con la cantidad de resultados encontrados

  @gestorTA @unhappyPath
  Escenario: FIL-04 - Búsqueda sin resultados
    Dado que existen encuentros en protocolo
    Cuando ingreso "XXXXXXX" en la caja de búsqueda
    Y presiono la tecla Enter
    Entonces la grilla NO debe mostrar resultados
    Y el contador debe mostrar "0 registros encontrados"
    Y debe mostrarse un mensaje "No se encontraron coincidencias"

  @gestorTA @happyPath
  Escenario: FIL-05 - Limpiar búsqueda manualmente
    Dado que he realizado una búsqueda por "García"
    Y la grilla muestra resultados filtrados
    Cuando limpio el contenido de la caja de búsqueda
    Y presiono la tecla Enter
    Entonces la grilla debe mostrar todos los encuentros nuevamente
    Y el contador debe mostrar el total de encuentros disponibles

  # ========================================================================
  # TÉCNICA: FILTRO SOLO POSITIVOS
  # ========================================================================

  @gestorTA @happyPath
  Escenario: FIL-06 - Validar estado inicial del filtro Solo Positivos
    Cuando accedo a la pantalla "Encuentros en Protocolo"
    Entonces el selector "Solo Positivos" debe estar desactivado
    Y la grilla debe mostrar encuentros positivos y negativos

  @gestorTA @happyPath
  Escenario: FIL-07 - Activar filtro Solo Positivos
    Dado que existen 20 encuentros con "Tipo de Protocolo" = "Positivo"
    Y existen 15 encuentros con "Tipo de Protocolo" = "Negativo"
    Y el contador muestra "35 registros encontrados"
    Cuando activo el selector "Solo Positivos"
    Entonces la grilla debe mostrar únicamente los 20 encuentros positivos
    Y el contador debe actualizarse a "20 registros encontrados"
    Y NO deben mostrarse encuentros negativos

  @gestorTA @happyPath
  Escenario: FIL-08 - Desactivar filtro Solo Positivos
    Dado que he activado el filtro "Solo Positivos"
    Y la grilla muestra únicamente 20 encuentros positivos
    Cuando desactivo el selector "Solo Positivos"
    Entonces la grilla debe mostrar nuevamente los 35 encuentros (positivos y negativos)
    Y el contador debe actualizarse a "35 registros encontrados"

  @gestorTA @unhappyPath
  Escenario: FIL-09 - Filtro Solo Positivos sin encuentros positivos disponibles
    Dado que existen únicamente encuentros con "Tipo de Protocolo" = "Negativo"
    Cuando activo el selector "Solo Positivos"
    Entonces la grilla NO debe mostrar resultados
    Y el contador debe mostrar "0 registros encontrados"
    Y debe mostrarse un mensaje "No hay encuentros positivos disponibles"

  # ========================================================================
  # TÉCNICA: FILTROS POR ENCABEZADO DE COLUMNA
  # ========================================================================

  @gestorTA @happyPath
  Esquema del escenario: FIL-10 - Filtrar por columnas específicas
    Dado que existen encuentros con diferentes valores en "<columna>"
    Cuando aplico un filtro en la columna "<columna>" con valor "<valor>"
    Entonces la grilla debe mostrar únicamente los encuentros que coincidan con "<valor>" en "<columna>"
    Y el contador debe actualizarse con la cantidad de resultados
    Y los demás encuentros deben ocultarse

    Ejemplos:
      | columna            | valor                              |
      | Tipo de Encuentro  | Consulta Externa No Oncosalud      |
      | Tipo de Encuentro  | Consulta Externa Oncosalud         |
      | Tipo de Encuentro  | Emergencia                         |
      | Tipo de Encuentro  | Ambulatorio                        |
      | Tipo de Protocolo  | Positivo                           |
      | Tipo de Protocolo  | Negativo                           |
      | Sede               | Auna Guardia Civil                 |
      | Sede               | Auna San Isidro                    |
      | Garante            | Pacífico EPS                       |
      | Garante            | MAPFRE Seguros                     |
      | Producto           | Salud EPS Pacífico                 |
      | Beneficio          | Consulta Ambulatoria               |

  @gestorTA @happyPath
  Escenario: FIL-11 - Filtrar por rango de fechas en Fecha de Apertura
    Dado que existen encuentros con diferentes fechas de apertura
    Cuando aplico un filtro de rango en la columna "Fecha de Apertura"
    Y selecciono fecha inicio "01/05/2026"
    Y selecciono fecha fin "31/05/2026"
    Entonces la grilla debe mostrar únicamente los encuentros con fecha de apertura entre "01/05/2026" y "31/05/2026"
    Y el contador debe actualizarse correctamente

  @gestorTA @unhappyPath
  Escenario: FIL-12 - Validar que columnas sin filtro no permiten filtrado
    Dado que estoy visualizando la grilla
    Cuando intento aplicar un filtro en la columna "Encuentro"
    Entonces NO debe mostrarse ninguna opción de filtrado
    Y la columna "Encuentro" NO debe permitir filtros
    Y lo mismo aplica para "Apellidos", "Nombres", "Mecanismo" y "Monto"

  # ========================================================================
  # TÉCNICA: COMBINACIÓN DE FILTROS
  # ========================================================================

  @gestorTA @happyPath
  Escenario: FIL-13 - Combinar múltiples filtros por columna
    Dado que existen encuentros en protocolo
    Cuando aplico un filtro en "Tipo de Encuentro" con valor "Ambulatorio"
    Y aplico un filtro en "Sede" con valor "Auna Guardia Civil"
    Y aplico un filtro en "Garante" con valor "Pacífico EPS"
    Entonces la grilla debe mostrar únicamente los encuentros que cumplan los 3 filtros simultáneamente
    Y el contador debe mostrar la cantidad de encuentros que cumplen todos los criterios

  @gestorTA @happyPath
  Escenario: FIL-14 - Combinar búsqueda general con filtro Solo Positivos
    Dado que existen encuentros del paciente "García"
    Y algunos son positivos y otros negativos
    Cuando ingreso "García" en la búsqueda
    Y presiono Enter
    Y activo el selector "Solo Positivos"
    Entonces la grilla debe mostrar únicamente los encuentros de "García" que sean positivos
    Y el contador debe reflejar solo los encuentros que cumplan ambos criterios

  @gestorTA @happyPath
  Escenario: FIL-15 - Combinar búsqueda general con filtros por columna
    Dado que existen encuentros en protocolo
    Cuando ingreso "Juan" en la búsqueda
    Y presiono Enter
    Y aplico un filtro en "Sede" con valor "Auna San Isidro"
    Entonces la grilla debe mostrar únicamente los encuentros que:
      - Coincidan con "Juan" en nombres o apellidos
      - Y tengan sede "Auna San Isidro"
    Y el contador debe reflejar solo los que cumplan ambos criterios

  @gestorTA @happyPath
  Escenario: FIL-16 - Combinar filtro Solo Positivos con filtros por columna
    Dado que existen encuentros en protocolo
    Cuando activo el selector "Solo Positivos"
    Y aplico un filtro en "Tipo de Encuentro" con valor "Ambulatorio"
    Y aplico un filtro en "Garante" con valor "MAPFRE Seguros"
    Entonces la grilla debe mostrar únicamente los encuentros que cumplan los 3 criterios:
      - Tipo de Protocolo = Positivo
      - Tipo de Encuentro = Ambulatorio
      - Garante = MAPFRE Seguros
    Y el contador debe reflejar el total de encuentros que cumplen todos los filtros

  # ========================================================================
  # TÉCNICA: RESTABLECER VISTA
  # ========================================================================

  @gestorTA @happyPath
  Escenario: FIL-17 - Restablecer vista limpia todos los filtros aplicados
    Dado que he aplicado una búsqueda por "García"
    Y he activado el filtro "Solo Positivos"
    Y he aplicado filtros en "Sede" y "Garante"
    Y la grilla muestra resultados filtrados
    Cuando selecciono el botón "Restablecer Vista"
    Entonces la caja de búsqueda debe limpiarse
    Y el selector "Solo Positivos" debe desactivarse
    Y todos los filtros por columna deben eliminarse
    Y la grilla debe mostrar todos los encuentros disponibles
    Y el contador debe mostrar el total de encuentros en protocolo

  @gestorTA @happyPath
  Escenario: FIL-18 - Restablecer vista cuando no hay filtros aplicados
    Dado que NO he aplicado ningún filtro
    Y visualizo todos los encuentros en protocolo
    Cuando selecciono el botón "Restablecer Vista"
    Entonces la pantalla debe permanecer igual
    Y NO debe haber cambios visuales
    Y el contador debe mantenerse igual

  @gestorTA @happyPath
  Escenario: FIL-19 - Validar que Restablecer Vista está siempre habilitado
    Cuando accedo a la pantalla "Encuentros en Protocolo"
    Entonces el botón "Restablecer Vista" debe estar habilitado
    Y debo poder hacer clic en él en cualquier momento
    Y esto debe aplicar independientemente de si hay filtros activos o no

  # ========================================================================
  # TÉCNICA: ACTUALIZACIÓN DINÁMICA DEL CONTADOR
  # ========================================================================

  @gestorTA @happyPath
  Escenario: FIL-20 - Validar actualización dinámica del contador al aplicar filtros
    Dado que existen 100 encuentros en protocolo
    Y el contador muestra "100 registros encontrados"
    Cuando aplico un filtro en "Tipo de Protocolo" = "Positivo"
    Y el filtro reduce los resultados a 60 encuentros
    Entonces el contador debe actualizarse inmediatamente a "60 registros encontrados"
    Y NO debe requerirse recargar la página

  @gestorTA @happyPath
  Escenario: FIL-21 - Validar actualización del contador al combinar filtros progresivamente
    Dado que existen 100 encuentros en protocolo
    Cuando aplico un filtro en "Sede" que reduce a 50 encuentros
    Entonces el contador debe mostrar "50 registros encontrados"
    Cuando aplico un segundo filtro en "Garante" que reduce a 20 encuentros
    Entonces el contador debe actualizarse a "20 registros encontrados"
    Cuando aplico un tercer filtro en "Tipo de Encuentro" que reduce a 10 encuentros
    Entonces el contador debe actualizarse a "10 registros encontrados"

  # ========================================================================
  # TÉCNICA: PERSISTENCIA DE FILTROS
  # ========================================================================

  @gestorTA @unhappyPath
  Escenario: FIL-22 - Validar que filtros NO persisten al recargar la página
    Dado que he aplicado múltiples filtros
    Y la grilla muestra resultados filtrados
    Cuando recargo la página (F5)
    Entonces todos los filtros deben eliminarse
    Y el selector "Solo Positivos" debe estar desactivado
    Y la caja de búsqueda debe estar vacía
    Y la grilla debe mostrar todos los encuentros disponibles

  @gestorTA @unhappyPath
  Escenario: FIL-23 - Validar que filtros NO persisten al salir y volver a entrar
    Dado que he aplicado filtros en la pantalla
    Cuando salgo de la pantalla "Encuentros en Protocolo"
    Y vuelvo a acceder a la pantalla
    Entonces la pantalla debe cargarse en su estado inicial
    Y NO deben aplicarse los filtros previos
    Y todos los encuentros deben mostrarse

  # ========================================================================
  # TÉCNICA: FILTROS ESPECÍFICOS POR TIPO DE ENCUENTRO
  # ========================================================================

  @gestorTA @happyPath
  Escenario: FIL-24 - Filtrar únicamente Consulta Externa No Oncosalud
    Dado que existen 30 encuentros tipo "Consulta Externa No Oncosalud"
    Y existen 20 encuentros tipo "Consulta Externa Oncosalud"
    Y existen 15 encuentros tipo "Emergencia"
    Cuando aplico un filtro en "Tipo de Encuentro" con valor "Consulta Externa No Oncosalud"
    Entonces la grilla debe mostrar únicamente los 30 encuentros de tipo "Consulta Externa No Oncosalud"
    Y el contador debe mostrar "30 registros encontrados"
    Y NO deben mostrarse encuentros de otros tipos

  @gestorTA @happyPath
  Escenario: FIL-25 - Filtrar únicamente Consulta Externa Oncosalud
    Dado que existen 30 encuentros tipo "Consulta Externa No Oncosalud"
    Y existen 20 encuentros tipo "Consulta Externa Oncosalud"
    Y existen 15 encuentros tipo "Emergencia"
    Cuando aplico un filtro en "Tipo de Encuentro" con valor "Consulta Externa Oncosalud"
    Entonces la grilla debe mostrar únicamente los 20 encuentros de tipo "Consulta Externa Oncosalud"
    Y el contador debe mostrar "20 registros encontrados"
    Y NO deben mostrarse encuentros de otros tipos

  @gestorTA @happyPath
  Escenario: FIL-26 - Filtrar únicamente Emergencia
    Dado que existen 30 encuentros tipo "Consulta Externa No Oncosalud"
    Y existen 20 encuentros tipo "Consulta Externa Oncosalud"
    Y existen 15 encuentros tipo "Emergencia"
    Cuando aplico un filtro en "Tipo de Encuentro" con valor "Emergencia"
    Entonces la grilla debe mostrar únicamente los 15 encuentros de tipo "Emergencia"
    Y el contador debe mostrar "15 registros encontrados"
    Y NO deben mostrarse encuentros de otros tipos

  @gestorTA @happyPath
  Escenario: FIL-27 - Combinar filtro de tipo de encuentro con Solo Positivos
    Dado que existen encuentros tipo "Consulta Externa No Oncosalud" positivos y negativos
    Y he aplicado filtro en "Tipo de Encuentro" = "Consulta Externa No Oncosalud"
    Cuando activo el selector "Solo Positivos"
    Entonces la grilla debe mostrar únicamente encuentros que cumplan ambas condiciones:
      - Tipo de Encuentro = "Consulta Externa No Oncosalud"
      - Tipo de Protocolo = "Positivo"
    Y el contador debe reflejar solo los que cumplan ambos criterios
