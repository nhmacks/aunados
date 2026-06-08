@analytics
@facturacion
@listaEncuentros
@acciones

Característica: Analytics - Responsable de Facturación - Lista de Encuentros - Acciones

  Como área de negocio
  Quiero registrar los eventos Analytics generados en la funcionalidad Lista de Encuentros
  Para analizar el comportamiento de los usuarios dentro del sistema.

  ########################################################################
  # LOGIN
  ########################################################################

  @login
  Esquema del escenario: ANA-LGN-01 Registrar evento de login exitoso

    Dado que soy un usuario con rol "<rol>"

    Cuando inicio sesión correctamente

    Entonces se registra en Amplitude el evento "LOGIN_EXITOSO"

    Y se registra la metadata del usuario

    Ejemplos:
      | rol                        |
      | Responsable de Facturación |
      | Ejecutivo de Facturación   |
      | Ejecutivo de Admisión      |
      | Super Usuario Admisión     |
      | Gestor TA                  |

  ########################################################################
  # INGRESO A LISTA DE ENCUENTROS
  ########################################################################

  @navegacion
  Escenario: ANA-LST-01 Registrar ingreso a Lista de Encuentros
    Dado que soy un usuario con rol "Responsable de Facturación"
    Y he iniciado sesión correctamente
    Cuando ingreso a la funcionalidad "Lista de Encuentros"
    Entonces se registra en Amplitude el evento "PAGINA_VIEW_LISTA_ENCUENTROS"
    Y se registra la metadata del usuario

  ########################################################################
  # BÚSQUEDA
  ########################################################################

  @busqueda
  Esquema del escenario: ANA-LST-02 Registrar evento de búsqueda
    Dado que soy un usuario con rol "Responsable de Facturación"
    Y he iniciado sesión correctamente
    Y me encuentro en la funcionalidad "Lista de Encuentros"
    Cuando realizo una búsqueda por "<tipoBusqueda>"
    Entonces se registra en Amplitude el evento "INPUT_BUSQUEDA"
    Y se registra la metadata del usuario

    Ejemplos:
      | tipoBusqueda    |
      | nombre          |
      | apellido        |
      | nro de encuentro|

  ########################################################################
  # ASIGNACIÓN
  ########################################################################

  @asignacion
  Esquema del escenario: ANA-LST-03 Registrar selección del botón Asignar
    Dado que soy un usuario con rol "Responsable de Facturación"
    Y me encuentro en la funcionalidad "Lista de Encuentros"
    Y he seleccionado "<cantidad>" encuentros
    Cuando selecciono el botón "Asignar"
    Entonces se registra en Amplitude el evento "BOTON_CLICK_ASIGNAR"
    Y se registra la cantidad de encuentros seleccionados

    Ejemplos:
      | cantidad |
      | 1         |
      | 50        |
      | 100       |

  @asignacion
  Esquema del escenario: ANA-LST-04 Registrar confirmación de asignación
    Dado que soy un usuario con rol "Responsable de Facturación"
    Y me encuentro en la funcionalidad "Lista de Encuentros"
    Y tengo abierto el modal de asignación
    Y he seleccionado "<cantidad>" encuentros
    Y he seleccionado un ejecutivo
    Cuando confirmo la asignación
    Entonces se registra en Amplitude el evento "BOTON_CLICK_ASIGNAR_MODAL"
    Y se registra el ejecutivo seleccionado
    Y se registra la cantidad de encuentros seleccionados

    Ejemplos:
      | cantidad |
      | 1         |
      | 50        |
      | 100       |

  @asignacion
  Esquema del escenario: ANA-LST-05 Registrar cancelación de asignación
    Dado que soy un usuario con rol "Responsable de Facturación"
    Y me encuentro en la funcionalidad "Lista de Encuentros"
    Y tengo abierto el modal de asignación
    Y el ejecutivo fue "<estado>"
    Cuando cancelo la asignación
    Entonces se registra en Amplitude el evento "BOTON_CLICK_CANCELAR_MODAL"

    Ejemplos:
      | estado            |
      | seleccionado      |
      | no seleccionado   |

  ########################################################################
  # CLASIFICACIÓN
  ########################################################################

  @clasificacion
  Esquema del escenario: ANA-LST-06 Registrar apertura del modal de clasificación
    Dado que soy un usuario con rol "Responsable de Facturación"
    Y me encuentro en la funcionalidad "Lista de Encuentros"
    Y he seleccionado "<cantidad>" encuentros
    Cuando selecciono el botón "Clasificar"
    Entonces se registra en Amplitude el evento "BOTON_CLICK_CLASIFICAR_MODAL"
    Y se registra la cantidad de encuentros seleccionados

    Ejemplos:
      | cantidad |
      | 1         |
      | 50        |
      | 100       |

  @clasificacion
  Esquema del escenario: ANA-LST-07 Registrar selección de clasificación
    Dado que soy un usuario con rol "Responsable de Facturación"
    Y me encuentro en la funcionalidad "Lista de Encuentros"
    Y tengo abierto el modal de clasificación
    Cuando selecciono la clasificación "<clasificacion>"
    Entonces se registra en Amplitude el evento "SELECT_CHANGE_CLASIFICACION"
    Y se registra la clasificación seleccionada

    Ejemplos:
      | clasificacion             |
      | Facturar con hospitalario |
      | Imp Fact Fin              |
      | Imp Por Liq Fin His       |
      | Pendiente en consulta     |
      | Pendiente por convenio    |
      | No Facturar               |
      | Por Asignar               |
      | No facturar farmacia      |
      | No facturar Admisión      |

  @clasificacion
  Escenario: ANA-LST-08 Registrar confirmación de clasificación
    Dado que soy un usuario con rol "Responsable de Facturación"
    Y me encuentro en la funcionalidad "Lista de Encuentros"
    Y tengo abierto el modal de clasificación
    Y he seleccionado una clasificación
    Cuando confirmo la clasificación
    Entonces se registra en Amplitude el evento "BOTON_CLICK_CONFIRMAR_CLASIFICAR_MODAL"

  @clasificacion
  Esquema del escenario: ANA-LST-09 Registrar cancelación de clasificación
    Dado que soy un usuario con rol "Responsable de Facturación"
    Y me encuentro en la funcionalidad "Lista de Encuentros"
    Y tengo abierto el modal de clasificación
    Cuando cierro el modal mediante "<accion>"
    Entonces se registra en Amplitude el evento "BOTON_CLICK_CANCELAR_CLASIFICAR_MODAL"

    Ejemplos:
      | accion   |
      | Cancelar |
      | X         |

  ########################################################################
  # RESTABLECER VISTA
  ########################################################################

  @restablecerVista
  Escenario: ANA-LST-10 Registrar selección del botón Restablecer Vista
    Dado que soy un usuario con rol "Responsable de Facturación"
    Y me encuentro en la funcionalidad "Lista de Encuentros"
    Cuando selecciono el botón "Restablecer"
    Entonces se registra en Amplitude el evento "BOTON_CLICK_RESTABLECER_VISTA"

  ########################################################################
  # SELECCIÓN MASIVA
  ########################################################################

  @seleccionMasiva
  Escenario: ANA-LST-11 Registrar selección masiva de encuentros
    Dado que soy un usuario con rol "Responsable de Facturación"
    Y me encuentro en la funcionalidad "Lista de Encuentros"
    Cuando selecciono el checkbox masivo
    Entonces se registra en Amplitude el evento "CHECKBOX_CHANGE_MASIVO"
    Y se registra la cantidad de encuentros seleccionados