# Arquitectura de Escenarios de Prueba

## Regla General

Los escenarios de prueba deben organizarse por:

Módulo
→ Funcionalidad
→ Subfuncionalidad
→ Escenarios

Nunca organizar por perfil.

Nunca crear carpetas por rol.

---

## Estructura Oficial

gherkin/

* admision

  * cuadro-control
  * encuentros-devueltos
  * lista-encuentros

    * visualizacion.feature
    * filtros.feature
    * ordenamiento.feature
    * exportacion.feature
    * permisos.feature
    * detalle-encuentro

      * visualizacion.feature
      * estados.feature
      * sustentos.feature
      * datos-seguro.feature
      * datos-encuentro.feature

* protocolo

* facturacion

* beneficios

* seguridad

---

## Regla de Roles

Los roles deben modelarse mediante tags.

Ejemplos:

@superusuarioAdmision

@ejecutivoAdmision

@gestorTA

@responsableFacturacion

@ejecutivoFacturacion

Nunca crear carpetas separadas por rol.

---

## Regla de Escenarios

Si una funcionalidad es utilizada por varios perfiles:

Incorrecto:

* lista-encuentros-superusuario.feature
* lista-encuentros-ejecutivo.feature
* lista-encuentros-gestor.feature

Correcto:

* visualizacion.feature

Y dentro:

@superusuarioAdmision
Scenario: Visualizar todos los encuentros

@ejecutivoAdmision
Scenario: Visualizar encuentros propios

@gestorTA
Scenario: Visualizar todos los encuentros

---

## Regla de Nuevas Funcionalidades

Antes de crear un archivo feature nuevo:

1. Verificar si la funcionalidad ya existe.
2. Verificar si corresponde a una funcionalidad principal.
3. Verificar si corresponde a una subfuncionalidad.
4. Evitar duplicar escenarios.

---

## Regla de Documentación

Toda nueva funcionalidad deberá indicar:

* Módulo
* Funcionalidad
* Subfuncionalidad
* Roles involucrados
* Archivo feature donde será documentada

Antes de generar escenarios el agente deberá informar dónde serán ubicados.
