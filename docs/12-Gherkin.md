# 12-Gherkin.md

# Escenarios Gherkin - Sistema AUNADOS

## Objetivo

Este documento contiene escenarios funcionales en formato Gherkin que sirven como base para:

- QA Manual.
- QA Automatización.
- UAT.
- Validaciones funcionales.
- Trazabilidad con Casos de Uso y Reglas de Negocio.

---

# Feature: Visualización de Lista de Encuentros

## Escenario 01 - Carga inicial exitosa

```gherkin
Scenario: Visualizar lista de encuentros al iniciar sesión
Given que el usuario inicia sesión correctamente
When el sistema carga la pantalla principal
Then debe mostrar la Lista de Encuentros
And debe mostrar los primeros 50 registros
And debe mostrar los encuentros más recientes primero
```

---

## Escenario 02 - Scroll infinito

```gherkin
Scenario: Cargar registros adicionales
Given que existen más de 50 encuentros
When el usuario llega al final de la grilla
Then el sistema debe cargar 50 registros adicionales
And no debe recargar la página
```

---

## Escenario 03 - Lista vacía

```gherkin
Scenario: No existen encuentros para mostrar
Given que no existen encuentros visibles para el usuario
When la Lista de Encuentros es cargada
Then debe mostrarse el mensaje de error funcional
And debe indicarse que no se puede mostrar información
```

---

# Feature: Búsqueda General

## Escenario 04 - Buscar por nombre

```gherkin
Scenario: Buscar encuentro por nombre
Given que existen encuentros asociados al nombre Juan
When el usuario ingresa Juan
And presiona Enter
Then el sistema debe mostrar únicamente coincidencias
```

---

## Escenario 05 - Buscar por apellido

```gherkin
Scenario: Buscar encuentro por apellido
Given que existen encuentros asociados al apellido Pérez
When el usuario busca Pérez
Then el sistema debe mostrar coincidencias
```

---

## Escenario 06 - Buscar por número de encuentro

```gherkin
Scenario: Buscar por número de encuentro
Given que existe el encuentro 12345678
When el usuario busca 12345678
Then el sistema debe mostrar exactamente un resultado
```

---

## Escenario 07 - Búsqueda sin coincidencias

```gherkin
Scenario: No existen coincidencias
Given que no existe información asociada al criterio buscado
When el usuario ejecuta la búsqueda
Then debe mostrarse el mensaje No encontramos resultados para atender
```

---

# Feature: Filtro por Sede

## Escenario 08

```gherkin
Scenario: Filtrar por una sede
Given que existen encuentros de múltiples sedes
When el usuario selecciona la sede Auna Guardia Civil
And presiona Aplicar
Then la grilla debe mostrar únicamente encuentros de esa sede
```
---

## Escenario 09

```gherkin
Scenario: Filtrar múltiples sedes
Given que existen varias sedes
When el usuario selecciona dos sedes
And presiona Aplicar
Then debe visualizar encuentros de ambas sedes
```

---

# Feature: Filtro por Estado

## Escenario 10

```gherkin
Scenario: Filtrar encuentros pendientes
Given que existen encuentros en diferentes estados
When el usuario selecciona Pendiente
Then solo deben visualizarse encuentros pendientes
```

---

## Escenario 11

```gherkin
Scenario: Filtrar múltiples estados
Given que existen múltiples estados
When el usuario selecciona Pendiente y Tramitado
Then deben visualizarse ambos estados
```

---

# Feature: Filtro por Fecha

## Escenario 12

```gherkin
Scenario: Filtrar fecha exacta
Given que existen encuentros del 03/06/2026
When el usuario filtra por fecha exacta
Then el sistema debe mostrar únicamente esos encuentros
```

---

## Escenario 13

```gherkin
Scenario: Filtrar entre fechas
Given que existen encuentros en diferentes fechas
When el usuario filtra entre dos fechas
Then el sistema debe mostrar solo encuentros dentro del rango
```

---

## Escenario 14

```gherkin
Scenario: Filtrar antes de una fecha
Given que existen encuentros históricos
When el usuario filtra antes de una fecha
Then solo deben visualizarse registros anteriores
```

---

# Feature: Prioridad

## Escenario 15

```gherkin
Scenario: Filtrar prioridad 1
Given que existen encuentros de múltiples prioridades
When el usuario selecciona prioridad 1
Then únicamente deben visualizarse encuentros prioridad 1
```
---

## Escenario 16

```gherkin
Scenario: Intentar seleccionar dos prioridades
Given que el filtro prioridad permite selección única
When el usuario intenta seleccionar dos prioridades
Then el sistema debe mantener una sola selección
```

---

# Feature: Tipo de Encuentro

## Escenario 17

```gherkin
Scenario: Filtrar ambulatorio
Given que existen encuentros ambulatorios y de emergencia
When el usuario selecciona Ambulatorio
Then solo deben visualizarse encuentros ambulatorios
```
---

## Escenario 18

```gherkin
Scenario: Filtrar emergencia
Given que existen encuentros ambulatorios y de emergencia
When el usuario selecciona Emergencia
Then solo deben visualizarse encuentros de emergencia
```

---

# Feature: Detalle del Encuentro

## Escenario 19

```gherkin
Scenario: Visualizar detalle
Given que existe un encuentro visible
When el usuario selecciona el encuentro
Then el sistema debe abrir el detalle
And debe mostrar datos del paciente
And debe mostrar datos del seguro
```

---

## Escenario 20

```gherkin
Scenario: Visualizar agrupador Datos del Encuentro
Given que el usuario se encuentra en el detalle
When expande el agrupador Datos del Encuentro
Then debe visualizar los campos definidos
```

---

# Feature: Cambio de Estado

## Escenario 21

```gherkin
Scenario: Cambiar estado exitosamente
Given que el usuario tiene permisos
When selecciona un nuevo estado
And confirma el cambio
Then el sistema debe actualizar el estado
```

---

## Escenario 22

```gherkin
Scenario: Cancelar cambio de estado
Given que el modal de confirmación está abierto
When el usuario selecciona Cancelar
Then el estado debe permanecer igual
```

---

# Feature: No Facturable

## Escenario 23

```gherkin
Scenario: Marcar encuentro como No Facturable
Given que el usuario es Superusuario
When selecciona No Facturable
And confirma
Then el encuentro debe desaparecer de Admisión
```

---

## Escenario 24

```gherkin
Scenario: Reevaluación posterior
Given que un encuentro fue marcado como No Facturable
When el Job de Admisión se ejecuta nuevamente
Then debe reevaluar la clasificación
```

---

# Feature: Error de Facturación

## Escenario 25

```gherkin
Scenario: Marcar encuentro con Error de Facturación
Given que el usuario es Superusuario
When selecciona Error de Facturación
Then el encuentro debe salir temporalmente de Admisión
```

---

# Feature: Exportación

## Escenario 26

```gherkin
Scenario: Exportación inmediata
Given que el usuario es Superusuario
When selecciona Descargar
Then debe iniciar la descarga inmediatamente
```

---

## Escenario 27

```gherkin
Scenario: Exportación asíncrona
Given que el usuario es Ejecutivo
When selecciona Descargar
Then el sistema debe generar el reporte en segundo plano
```

---

## Escenario 28

```gherkin
Scenario: Descargar desde notificación
Given que el reporte está disponible
When el usuario selecciona Descargar desde la campana
Then debe descargarse el archivo
```

---

# Feature: Seguridad

## Escenario 29

```gherkin
Scenario: Ejecutivo intenta visualizar encuentros ajenos
Given que existen encuentros creados por otro usuario
When el Ejecutivo accede a la Lista de Encuentros
Then no debe visualizar esos encuentros
```

---

## Escenario 30

```gherkin
Scenario: Ejecutivo intenta usar filtro de sede
Given que el Ejecutivo accede al sistema
When visualiza los filtros disponibles
Then no debe visualizar el filtro de sede
```

---

# Feature: Job de Admisión

## Escenario 31

```gherkin
Scenario: Clasificación a Admisión
Given que un encuentro tiene documentación pendiente
When el Job ejecuta la clasificación
Then el encuentro debe permanecer en Admisión
```

---

## Escenario 32

```gherkin
Scenario: Clasificación a Protocolo
Given que el encuentro cumple requisitos
And tiene menos de 7 días
When el Job ejecuta la clasificación
Then debe clasificarse en Protocolo
```

---

## Escenario 33

```gherkin
Scenario: Clasificación a Facturación
Given que el encuentro cumple requisitos
And supera la antigüedad permitida
When el Job ejecuta la clasificación
Then debe clasificarse en Facturación
```
