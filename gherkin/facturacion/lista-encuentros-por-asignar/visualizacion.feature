# language: es

Característica: Visualización de Lista de Encuentros para Asignar
  Como Responsable de Facturación
  Quiero visualizar la lista de encuentros para asignar
  Para gestionar la asignación de encuentros a ejecutivos de facturación

  Antecedentes:
    Dado que he iniciado sesión en el sistema
    Y soy un usuario con rol "Responsable de Facturación"

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE ESTRUCTURA - ELEMENTOS DE UI
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: VIS-01 - Visualizar elementos principales de la pantalla Lista de Encuentros para Asignar
    Dado que estoy en el sistema AUNADOS
    Cuando accedo a la bandeja "Lista de encuentros para asignar"
    Entonces debe mostrarse el label "Lista de encuentros para asignar"
    Y debe mostrarse la caja de texto "Buscar por nombre, apellido o nro de encuentro"
    Y debe mostrarse el botón "Asignar" deshabilitado
    Y debe mostrarse el botón "Clasificar" deshabilitado
    Y debe mostrarse el botón "Descargar" habilitado
    Y debe mostrarse el botón "Restablecer vista" habilitado
    Y debe mostrarse el label con formato "###### Registros encontrados"

  @responsableFacturacion @happyPath
  Escenario: VIS-02 - Visualizar columnas de la tabla de encuentros para asignar
    Dado que estoy en el sistema AUNADOS
    Y he accedido a la bandeja "Lista de encuentros para asignar"
    Cuando visualizo la tabla de encuentros
    Entonces debe mostrarse la tabla con los siguientes encabezados en orden:
      | Columna            |
      | Encuentro          |
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
  # TÉCNICA: VALIDACIÓN DE ESTADOS INICIALES - BOTONES
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: VIS-03 - Validar estado inicial de botones sin selección de encuentros
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y NO he seleccionado ningún encuentro
    Cuando visualizo los botones de acción
    Entonces el botón "Asignar" debe estar deshabilitado
    Y el botón "Clasificar" debe estar deshabilitado
    Y el botón "Descargar" debe estar habilitado
    Y el botón "Restablecer vista" debe estar habilitado

  @responsableFacturacion @happyPath
  Escenario: VIS-04 - Validar habilitación de botones al seleccionar un encuentro
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen encuentros en estado "Por asignar"
    Cuando selecciono un encuentro de la tabla
    Entonces el botón "Asignar" debe estar habilitado
    Y el botón "Clasificar" debe estar habilitado
    Y el botón "Descargar" debe estar habilitado
    Y el botón "Restablecer vista" debe estar habilitado

  @responsableFacturacion @happyPath
  Esquema del escenario: VIS-04B - Validar contador de encuentros seleccionados
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen <total> encuentros para asignar
    Cuando selecciono <seleccionados> encuentros de la tabla
    Entonces debe mostrarse "<seleccionados> registro seleccionado de <total>"

    Ejemplos:
      | total | seleccionados |
      | 25040 | 1             |
      | 500   | 5             |
      | 1000  | 10            |
      | 100   | 50            |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE CONTADOR DE REGISTROS
  # ========================================================================

  @responsableFacturacion @happyPath
  Esquema del escenario: VIS-05 - Visualizar contador de registros encontrados
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen "<cantidad>" encuentros para asignar
    Cuando visualizo el contador de registros
    Entonces debe mostrarse "<cantidad> Registros encontrados"

    Ejemplos:
      | cantidad |
      | 0        |
      | 1        |
      | 50       |
      | 1000     |

  # ========================================================================
  # TÉCNICA: VALIDACIÓN DE BÚSQUEDA
  # ========================================================================

  @responsableFacturacion @happyPath
  Escenario: VIS-06 - Buscar encuentro por nombre del paciente
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen encuentros del paciente "Juan Carlos García"
    Cuando ingreso "Juan Carlos" en la caja de búsqueda
    Entonces debe mostrarse únicamente los encuentros que coincidan con "Juan Carlos" en nombres
    Y el contador debe actualizarse con la cantidad de resultados encontrados

  @responsableFacturacion @happyPath
  Escenario: VIS-07 - Buscar encuentro por apellido del paciente
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existen encuentros del paciente con apellido "García Pérez"
    Cuando ingreso "García" en la caja de búsqueda
    Entonces debe mostrarse únicamente los encuentros que coincidan con "García" en apellidos
    Y el contador debe actualizarse con la cantidad de resultados encontrados

  @responsableFacturacion @happyPath
  Escenario: VIS-08 - Buscar encuentro por número de encuentro
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y existe el encuentro con número "12345678"
    Cuando ingreso "12345678" en la caja de búsqueda
    Entonces debe mostrarse únicamente el encuentro "12345678"
    Y el contador debe mostrar "1 Registros encontrados"

  @responsableFacturacion @happyPath
  Escenario: VIS-09 - Limpiar búsqueda con botón Restablecer vista
    Dado que he accedido a la bandeja "Lista de encuentros para asignar"
    Y he realizado una búsqueda por "García"
    Y el sistema muestra resultados filtrados
    Cuando selecciono el botón "Restablecer vista"
    Entonces la caja de búsqueda debe limpiarse
    Y debe mostrarse todos los encuentros para asignar
    Y el contador debe mostrar la cantidad total de encuentros
