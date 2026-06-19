# language: es

Característica: Ordenamiento de Encuentros Devueltos
  Como Gestor TA o Superusuario de Admisión
  Quiero ordenar la grilla de encuentros devueltos por diferentes columnas
  Para facilitar el análisis y gestión de los encuentros

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO POR COLUMNAS
  # Cobertura: Sección 13 del documento 18-Encuentros-Devueltos.md
  # ========================================================================

  @prioridadMedia @gestorTA @superusuarioAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: ORD-01 - Ordenar encuentros devueltos por columnas disponibles
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Y tengo múltiples encuentros devueltos en la grilla
    Cuando selecciono ordenar por la columna "<columna>" en forma "<direccion>"
    Entonces los encuentros deben ordenarse por "<columna>" en forma "<direccion>"
    Y el orden debe mantenerse al hacer scroll

    Ejemplos:
      | rol                      | columna      | direccion   |
      | Gestor TA                | Encuentro    | Ascendente  |
      | Gestor TA                | Encuentro    | Descendente |
      | Superusuario de Admisión | Apellidos    | Ascendente  |
      | Superusuario de Admisión | Apellidos    | Descendente |
      | Gestor TA                | Nombres      | Ascendente  |
      | Gestor TA                | Nombres      | Descendente |
      | Superusuario de Admisión | NºHC         | Ascendente  |
      | Superusuario de Admisión | NºHC         | Descendente |
      | Gestor TA                | Usuario      | Ascendente  |
      | Gestor TA                | Usuario      | Descendente |
      | Superusuario de Admisión | Garante      | Ascendente  |
      | Superusuario de Admisión | Garante      | Descendente |
      | Gestor TA                | Fecha apert. | Ascendente  |
      | Gestor TA                | Fecha apert. | Descendente |
      | Superusuario de Admisión | Monto        | Ascendente  |
      | Superusuario de Admisión | Monto        | Descendente |

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO POR EJECUTIVO DE ADMISIÓN
  # ========================================================================

  @prioridadMedia @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: ORD-02 - Ejecutivo de Admisión ordena por columnas disponibles
    Dado que soy un usuario con rol "Ejecutivo de Admisión"
    Y he iniciado sesión en el sistema
    Y tengo múltiples encuentros devueltos en la grilla
    Cuando selecciono ordenar por la columna "<columna>" en forma "<direccion>"
    Entonces los encuentros deben ordenarse por "<columna>" en forma "<direccion>"
    Y el orden debe mantenerse al hacer scroll

    Ejemplos:
      | columna           | direccion   |
      | Encuentro         | Ascendente  |
      | Encuentro         | Descendente |
      | NºHC              | Ascendente  |
      | NºHC              | Descendente |
      | Apellidos         | Ascendente  |
      | Apellidos         | Descendente |
      | Nombres           | Ascendente  |
      | Nombres           | Descendente |
      | Fecha apert.      | Ascendente  |
      | Fecha apert.      | Descendente |
      | Garante           | Ascendente  |
      | Garante           | Descendente |
      | Tipo de encuentro | Ascendente  |
      | Tipo de encuentro | Descendente |

  @prioridadMedia @gestorTA @superusuarioAdmision @encuentrosDevueltos @unhappyPath
  Escenario: ORD-02B - Gestor TA y Superusuario NO pueden ordenar por Tipo de encuentro
    Dado que soy un usuario con rol "Gestor TA"
    Y he iniciado sesión en el sistema
    Y tengo encuentros devueltos en la grilla
    Cuando visualizo la grilla de encuentros devueltos
    Entonces la columna "Tipo de encuentro" NO debe permitir ordenamiento
    Y la columna "Usuario" debe permitir ordenamiento
    Y la columna "Monto" debe permitir ordenamiento

  # ========================================================================
  # TÉCNICA: ORDEN POR DEFECTO
  # ========================================================================

  @prioridadMedia @gestorTA @superusuarioAdmision @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Escenario: ORD-03 - Orden por defecto al acceder a Encuentros Devueltos
    Dado que soy un usuario con rol "Gestor TA"
    Y he iniciado sesión en el sistema
    Y tengo encuentros devueltos con diferentes fechas de devolución
    Cuando accedo a la bandeja "Encuentros Devueltos"
    Entonces los encuentros deben mostrarse ordenados por fecha de devolución descendente
    Y los encuentros más recientes deben aparecer primero

  # ========================================================================
  # TÉCNICA: PERSISTENCIA DEL ORDENAMIENTO
  # ========================================================================

  @prioridadMedia @gestorTA @superusuarioAdmision @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: ORD-04 - El ordenamiento se mantiene al aplicar filtros
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Y tengo encuentros devueltos en la grilla
    Y he ordenado la grilla por "<columna>" en forma "<direccion>"
    Cuando aplico un filtro por "<filtro>"
    Entonces los resultados filtrados deben mantener el orden por "<columna>" en forma "<direccion>"

    Ejemplos:
      | rol                      | columna           | direccion   | filtro               |
      | Gestor TA                | Apellidos         | Ascendente  | Estado = Devuelto    |
      | Superusuario de Admisión | Monto             | Descendente | Prioridad = Alta     |
      | Gestor TA                | Usuario           | Ascendente  | Sede = Guardia Civil |
      | Ejecutivo de Admisión    | Tipo de encuentro | Ascendente  | Estado = Devuelto    |

  @prioridadMedia @gestorTA @superusuarioAdmision @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: ORD-05 - El ordenamiento se mantiene al realizar búsqueda
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Y tengo encuentros devueltos en la grilla
    Y he ordenado la grilla por "<columna>" en forma "<direccion>"
    Cuando realizo una búsqueda por "<criterio_busqueda>"
    Entonces los resultados de búsqueda deben mantener el orden por "<columna>" en forma "<direccion>"

    Ejemplos:
      | rol                      | columna      | direccion   | criterio_busqueda |
      | Gestor TA                | Encuentro    | Ascendente  | García            |
      | Superusuario de Admisión | Fecha apert. | Descendente | 12345678          |
      | Ejecutivo de Admisión    | NºHC         | Ascendente  | García            |

  # ========================================================================
  # TÉCNICA: CAMBIO DE ORDENAMIENTO
  # ========================================================================

  @prioridadMedia @gestorTA @superusuarioAdmision @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: ORD-06 - Cambiar ordenamiento de una columna a otra
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Y tengo encuentros devueltos en la grilla
    Y he ordenado la grilla por "<columna_inicial>" en forma "<direccion_inicial>"
    Cuando cambio el ordenamiento a la columna "<columna_nueva>" en forma "<direccion_nueva>"
    Entonces el ordenamiento anterior debe cancelarse
    Y los encuentros deben ordenarse por "<columna_nueva>" en forma "<direccion_nueva>"

    Ejemplos:
      | rol                      | columna_inicial   | direccion_inicial | columna_nueva | direccion_nueva |
      | Gestor TA                | Apellidos         | Ascendente        | Monto         | Descendente     |
      | Superusuario de Admisión | Usuario           | Descendente       | Encuentro     | Ascendente      |
      | Ejecutivo de Admisión    | Tipo de encuentro | Ascendente        | Apellidos     | Descendente     |

  # ========================================================================
  # TÉCNICA: ORDENAMIENTO CON VALORES NULOS O ESPECIALES
  # ========================================================================

  @prioridadMedia @gestorTA @superusuarioAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: ORD-07 - Ordenamiento con valores vacíos o nulos
    Dado que soy un usuario con rol "Gestor TA"
    Y he iniciado sesión en el sistema
    Y tengo encuentros devueltos donde algunos tienen "<campo>" vacío o nulo
    Cuando ordeno por la columna "<campo>" en forma "<direccion>"
    Entonces los registros con valores vacíos o nulos deben aparecer "<posicion>"

    Ejemplos:
      | campo   | direccion   | posicion      |
      | Garante | Ascendente  | al final      |
      | Garante | Descendente | al principio  |
      | Usuario | Ascendente  | al final      |
      | Monto   | Descendente | al principio  |

  # ========================================================================
  # TÉCNICA: INDICADOR VISUAL DE ORDENAMIENTO
  # ========================================================================

  @prioridadMedia @gestorTA @superusuarioAdmision @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: ORD-08 - Indicador visual muestra columna y dirección de ordenamiento activo
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Y tengo encuentros devueltos en la grilla
    Cuando ordeno por la columna "<columna>" en forma "<direccion>"
    Entonces debe mostrarse un indicador visual en la columna "<columna>"
    Y el indicador debe mostrar la dirección "<direccion>"

    Ejemplos:
      | rol                      | columna           | direccion   |
      | Gestor TA                | Apellidos         | Ascendente  |
      | Superusuario de Admisión | Monto             | Descendente |
      | Ejecutivo de Admisión    | Tipo de encuentro | Ascendente  |

  # ========================================================================
  # TÉCNICA: RESTAURAR ORDEN POR DEFECTO
  # ========================================================================

  @prioridadMedia @gestorTA @superusuarioAdmision @ejecutivoAdmision @encuentrosDevueltos @happyPath
  Esquema del escenario: ORD-09 - Restablecer vista restaura orden por defecto
    Dado que soy un usuario con rol "<rol>"
    Y he iniciado sesión en el sistema
    Y tengo encuentros devueltos en la grilla
    Y he ordenado la grilla por "<columna>" en forma "<direccion>"
    Cuando selecciono "Restablecer vista"
    Entonces el ordenamiento debe volver al orden por defecto
    Y los encuentros deben mostrarse ordenados por fecha de devolución descendente

    Ejemplos:
      | rol                      | columna           | direccion   |
      | Gestor TA                | Monto             | Descendente |
      | Superusuario de Admisión | Usuario           | Ascendente  |
      | Ejecutivo de Admisión    | Tipo de encuentro | Descendente |
