# language: es

Característica: Ordenamiento de Lista de Encuentros para Asignar
  Como Responsable de Facturación
  Quiero ordenar la tabla de encuentros por diferentes columnas
  Para priorizar y gestionar eficientemente la asignación de encuentros

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación"
    Y he accedido a la bandeja "Lista de encuentros para asignar"

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO DE 3 ESTADOS (ASC → DESC → NINGUNO)
  # ========================================================================

  @prioridadMedia @responsableFacturacion @happyPath
  Esquema del escenario: ORD-01 - Primer clic ordena ascendente (menor a mayor)
    Dado que existen múltiples encuentros en la tabla
    Y la tabla NO está ordenada por "<columna>"
    Cuando hago clic en el encabezado de la columna "<columna>"
    Entonces la tabla debe ordenarse por "<columna>" de forma ascendente
    Y debe mostrarse un indicador visual de orden ascendente (↑) en "<columna>"
    Y los datos deben reorganizarse de menor a mayor

    Ejemplos:
      | columna           |
      | Encuentro         |
      | Clasific.         |
      | Sede              |
      | Apellidos         |
      | Nombres           |
      | Garante           |
      | Tipo de encuentro |
      | Producto          |
      | Beneficio         |
      | Fecha apert.      |
      | Mec.              |
      | Servicio básico   |
      | Por Fact. Fin     |
      | Por Liq. Fin      |
      | Fact. Fin         |

  @prioridadMedia @responsableFacturacion @happyPath
  Esquema del escenario: ORD-02 - Segundo clic ordena descendente (mayor a menor)
    Dado que la tabla está ordenada por "<columna>" ascendente
    Y se muestra el indicador de orden ascendente (↑)
    Cuando hago clic nuevamente en el encabezado de la columna "<columna>"
    Entonces la tabla debe ordenarse por "<columna>" de forma descendente
    Y el indicador debe cambiar a orden descendente (↓)
    Y los datos deben reorganizarse de mayor a menor

    Ejemplos:
      | columna           |
      | Encuentro         |
      | Sede              |
      | Apellidos         |
      | Garante           |
      | Por Fact. Fin     |
      | Fecha apert.      |

  @prioridadMedia @responsableFacturacion @happyPath
  Esquema del escenario: ORD-03 - Tercer clic quita el ordenamiento
    Dado que la tabla está ordenada por "<columna>" descendente
    Y se muestra el indicador de orden descendente (↓)
    Cuando hago clic por tercera vez en el encabezado de la columna "<columna>"
    Entonces el ordenamiento debe eliminarse
    Y el indicador visual debe desaparecer
    Y la tabla debe volver a su orden original (por defecto)

    Ejemplos:
      | columna      |
      | Encuentro    |
      | Apellidos    |
      | Sede         |
      | Por Fact. Fin|

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ORDEN CORRECTO - COLUMNAS DE TEXTO
  # ========================================================================

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-04 - Ordenar alfabéticamente columna Apellidos ascendente
    Dado que la tabla tiene encuentros de pacientes con diferentes apellidos
    Cuando ordeno por "Apellidos" ascendente
    Entonces los apellidos deben mostrarse en orden alfabético A-Z
    Y los pacientes con apellidos que empiezan con "A" deben aparecer primero

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-05 - Ordenar alfabéticamente columna Sede descendente
    Dado que existen encuentros de múltiples sedes
    Cuando ordeno por "Sede" descendente
    Entonces las sedes deben mostrarse en orden alfabético Z-A

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-06 - Ordenar por columna Garante
    Dado que existen encuentros con diferentes garantes
    Cuando ordeno por "Garante" ascendente
    Entonces los garantes deben ordenarse alfabéticamente
    Y los encuentros deben agruparse por garante

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ORDEN CORRECTO - COLUMNAS NUMÉRICAS
  # ========================================================================

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-07 - Ordenar por número de Encuentro ascendente
    Dado que existen encuentros con diferentes números
    Cuando ordeno por "Encuentro" ascendente
    Entonces los números de encuentro deben ordenarse numéricamente
    Y los encuentros con números menores deben aparecer primero

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-08 - Ordenar por montos Por Fact. Fin descendente
    Dado que existen encuentros con diferentes montos en "Por Fact. Fin"
    Cuando ordeno por "Por Fact. Fin" descendente
    Entonces los montos deben ordenarse numéricamente
    Y los encuentros con mayores montos deben aparecer primero

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-09 - Ordenar por montos Por Liq. Fin ascendente
    Dado que existen encuentros con diferentes montos en "Por Liq. Fin"
    Cuando ordeno por "Por Liq. Fin" ascendente
    Entonces los montos menores deben aparecer primero
    Y los valores cero deben aparecer al inicio

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ORDEN CORRECTO - COLUMNAS DE FECHA
  # ========================================================================

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-10 - Ordenar por Fecha apert. ascendente
    Dado que existen encuentros con diferentes fechas de apertura
    Cuando ordeno por "Fecha apert." ascendente
    Entonces las fechas deben ordenarse cronológicamente
    Y los encuentros más antiguos deben aparecer primero

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-11 - Ordenar por Fecha apert. descendente
    Dado que existen encuentros con diferentes fechas de apertura
    Cuando ordeno por "Fecha apert." descendente
    Entonces las fechas deben ordenarse cronológicamente inverso
    Y los encuentros más recientes deben aparecer primero

  # ========================================================================
  # TÉCNICA: CAMBIO DE COLUMNA DE ORDENAMIENTO
  # ========================================================================

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-12 - Cambiar de una columna a otra elimina orden previo
    Dado que la tabla está ordenada por "Apellidos" ascendente
    Cuando hago clic en el encabezado "Por Fact. Fin"
    Entonces el ordenamiento por "Apellidos" debe eliminarse
    Y la tabla debe ordenarse por "Por Fact. Fin" ascendente
    Y solo debe mostrarse un indicador de ordenamiento activo en "Por Fact. Fin"

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-13 - Solo una columna puede estar ordenada a la vez
    Dado que la tabla está ordenada por "Sede" descendente
    Cuando hago clic en el encabezado "Garante"
    Entonces debe mostrarse el indicador de ordenamiento solo en "Garante"
    Y NO debe mostrarse indicador en "Sede"
    Y la tabla debe ordenarse únicamente por "Garante" ascendente

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO CON BÚSQUEDA ACTIVA
  # ========================================================================

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-14 - Ordenar después de aplicar búsqueda
    Dado que he buscado encuentros por "García"
    Y la tabla muestra 50 encuentros filtrados
    Cuando ordeno por "Por Fact. Fin" descendente
    Entonces solo los 50 encuentros filtrados deben ordenarse
    Y el encuentro con mayor "Por Fact. Fin" debe aparecer primero

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-15 - Mantener ordenamiento al realizar búsqueda
    Dado que he ordenado la tabla por "Fecha apert." descendente
    Cuando busco encuentros por número "12345"
    Entonces el ordenamiento por "Fecha apert." descendente debe mantenerse
    Y los resultados de búsqueda deben mostrarse en el orden correcto

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO Y SELECCIÓN DE REGISTROS
  # ========================================================================

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-16 - La selección se mantiene después de ordenar
    Dado que he seleccionado 5 encuentros con sus checkboxes marcados
    Cuando ordeno la tabla por "Apellidos" ascendente
    Entonces los 5 encuentros deben seguir seleccionados
    Y sus checkboxes deben permanecer marcados
    Y el contador debe seguir mostrando "5 registro seleccionado de X"

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-17 - Ordenar no afecta la funcionalidad de selección
    Dado que he ordenado la tabla por "Sede" descendente
    Cuando selecciono encuentros de la tabla ordenada
    Entonces los checkboxes deben funcionar correctamente
    Y el contador de selección debe actualizarse
    Y los botones "Asignar" y "Clasificar" deben habilitarse

  # ========================================================================
  # TÉCNICA: INDICADORES VISUALES
  # ========================================================================

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-18 - Validar indicadores visuales de ordenamiento
    Dado que la tabla NO está ordenada
    Cuando hago clic en "Por Fact. Fin"
    Entonces debe mostrarse un ícono de flecha ascendente (↑) en el encabezado "Por Fact. Fin"
    Y el encabezado debe destacarse visualmente
    Cuando hago clic nuevamente en "Por Fact. Fin"
    Entonces debe mostrarse un ícono de flecha descendente (↓)
    Cuando hago clic por tercera vez en "Por Fact. Fin"
    Entonces el ícono debe desaparecer completamente

  # ========================================================================
  # TÉCNICA: MANEJO DE VALORES ESPECIALES
  # ========================================================================

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-19 - Ordenar columnas con valores vacíos o nulos
    Dado que existen encuentros con campo "Mec." vacío
    Y existen encuentros con campo "Mec." con valor
    Cuando ordeno por "Mec." ascendente
    Entonces los encuentros con campo vacío deben aparecer primero
    Y luego deben aparecer los encuentros con valor en orden alfabético

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-20 - Ordenar montos con valores cero
    Dado que existen encuentros con "Por Fact. Fin" = S/ 0.00
    Y existen encuentros con "Por Fact. Fin" > S/ 0.00
    Cuando ordeno por "Por Fact. Fin" ascendente
    Entonces los encuentros con S/ 0.00 deben aparecer primero
    Y luego deben aparecer los montos mayores en orden creciente

  # ========================================================================
  # TÉCNICA: RESTABLECER VISTA
  # ========================================================================

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-21 - Restablecer vista elimina el ordenamiento
    Dado que he ordenado la tabla por "Garante" descendente
    Y he realizado una búsqueda
    Cuando presiono el botón "Restablecer vista"
    Entonces el ordenamiento debe eliminarse
    Y la tabla debe volver a su orden original
    Y NO debe mostrarse ningún indicador de ordenamiento

  # ========================================================================
  # TÉCNICA: PERSISTENCIA DEL ORDENAMIENTO
  # ========================================================================

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-22 - El ordenamiento persiste al hacer scroll
    Dado que he ordenado la tabla por "Apellidos" ascendente
    Cuando hago scroll vertical en la tabla
    Entonces el ordenamiento debe mantenerse
    Y el indicador visual debe seguir siendo visible en el encabezado

  @prioridadMedia @responsableFacturacion @unhappyPath
  Escenario: ORD-23 - El ordenamiento NO persiste al recargar la página
    Dado que he ordenado la tabla por "Por Fact. Fin" descendente
    Cuando refresco la página del navegador
    Entonces el ordenamiento debe eliminarse
    Y la tabla debe volver a su orden original por defecto
    Y NO debe mostrarse ningún indicador de ordenamiento

  # ========================================================================
  # TÉCNICA: PERFORMANCE CON GRANDES VOLÚMENES
  # ========================================================================

  @prioridadMedia @responsableFacturacion @happyPath
  Escenario: ORD-24 - Ordenar tabla con gran cantidad de encuentros
    Dado que existen más de 25000 encuentros en la tabla
    Cuando ordeno por "Fecha apert." descendente
    Entonces todos los encuentros deben ordenarse correctamente
    Y el ordenamiento debe completarse en menos de 2 segundos
    Y la tabla debe ser navegable mediante scroll
