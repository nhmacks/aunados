# 03-Facturacion.md

# Módulo de Facturación

## 1. Objetivo

La bandeja de Facturación tiene como finalidad concentrar los encuentros que ya completaron todas las validaciones administrativas, médicas y de proceso requeridas por la organización y que, además, han superado el tiempo máximo de permanencia permitido en Protocolo.

Los encuentros visibles en esta bandeja se consideran candidatos para el proceso de facturación.

---

# 2. Alcance

La bandeja de Facturación forma parte del flujo operativo general:

XHIS → Job de Admisión → Admisión → Protocolo → Facturación

La ubicación de un encuentro dentro de Facturación será determinada exclusivamente por el Job de Admisión.

---

# 3. Responsabilidad del Job de Admisión

## 3.1 Fuente de Verdad

El Job de Admisión es la única entidad responsable de:

- Clasificar encuentros.
- Reclasificar encuentros.
- Retornar encuentros a bandejas anteriores cuando corresponda.
- Validar reglas de negocio.
- Determinar la bandeja final del encuentro.

## 3.2 Restricción

Ningún usuario podrá mover manualmente un encuentro desde Admisión o Protocolo hacia Facturación.

---

# 4. Condiciones Generales para Ingresar a Facturación

Todo encuentro deberá cumplir simultáneamente:

## 4.1 Documentación Administrativa

- Completa.
- Sin pendientes.

## 4.2 Sustentos Médicos

- Completos.
- Sin laboratorios pendientes.

## 4.3 Sustentos de Proceso

- Todos los laboratorios imputados.

## 4.4 Antigüedad

Debe superar el tiempo máximo permitido en Protocolo.

---

# 5. Reglas de Clasificación

## 5.1 Consulta Externa No Oncosalud

### Condiciones

- Documentación completa.
- Laboratorios completos.
- Laboratorios imputados.
- Más de 7 días desde su creación.

### Resultado

Facturación.

---

## 5.2 Consulta Externa Oncosalud

### Condiciones

- Documentación completa.
- Laboratorios completos.
- Laboratorios imputados.
- Más de 31 días desde su creación.

### Resultado

Facturación.

---

## 5.3 Emergencia

### Condiciones

- Documentación completa.
- Laboratorios completos.
- Laboratorios imputados.
- Más de 2 días desde su creación.

### Resultado

Facturación.

---

# 6. Relación entre Estados y Facturación

Los estados operativos no determinan la clasificación del encuentro.

La bandeja de Facturación depende exclusivamente de las reglas evaluadas por el Job de Admisión.

---

# 7. Estado No Facturable

## 7.1 Descripción

Estado operativo asignable por el Superusuario de Admisión.

## 7.2 Comportamiento

Cuando un encuentro es marcado como:

No Facturable

el sistema:

1. Actualiza el estado.
2. Retira el encuentro de la bandeja de Admisión.
3. Espera una nueva ejecución del Job de Admisión.

## 7.3 Consideración Importante

El estado No Facturable NO garantiza que el encuentro permanecerá en Facturación.

---

# 8. Estado Error de Facturación

## 8.1 Descripción

Estado operativo asignable por el Superusuario de Admisión.

## 8.2 Comportamiento

Cuando un encuentro es marcado como:

Error de Facturación

el sistema:

1. Actualiza el estado.
2. Retira temporalmente el encuentro de Admisión.
3. Espera la siguiente ejecución del Job.

## 8.3 Consideración Importante

El encuentro será reevaluado utilizando las reglas estándar de clasificación.

---

# 9. Reevaluación de Encuentros

## 9.1 Evaluación Periódica

Durante cada ejecución del Job:

- Se reevalúan encuentros.
- Se validan reglas vigentes.
- Se determina la bandeja correcta.

---

## 9.2 Posibles Resultados

### Caso 1

Cumple reglas de Facturación.

Resultado:

Permanece en Facturación.

---

### Caso 2

No cumple reglas de Facturación.

Resultado:

Regresa a Admisión.

---

### Caso 3

Cumple reglas de Protocolo.

Resultado:

Es reclasificado a Protocolo.

---

# 10. Principios Funcionales

## PF-FAC-01

La clasificación es automática.

## PF-FAC-02

Los estados operativos son independientes de la clasificación.

## PF-FAC-03

La bandeja de Facturación representa la clasificación vigente determinada por el Job.

## PF-FAC-04

La existencia de un encuentro en Facturación no implica aprobación manual.

## PF-FAC-05

Toda reclasificación puede modificar la bandeja del encuentro.

---

# 11. Casos de Ejemplo

## Escenario 1

Tipo:

Consulta Externa No Oncosalud

Antigüedad:

10 días

Documentación:

Completa

Laboratorios:

Completos

Imputación:

Completa

Resultado:

Facturación.

---

## Escenario 2

Tipo:

Consulta Externa Oncosalud

Antigüedad:

20 días

Resultado:

Protocolo.

---

## Escenario 3

Tipo:

Consulta Externa Oncosalud

Antigüedad:

35 días

Resultado:

Facturación.

---

## Escenario 4

Tipo:

Emergencia

Antigüedad:

5 días

Resultado:

Facturación.

---

# 12. Riesgos Operativos

## Riesgo 1

Información incompleta proveniente de XHIS.

Impacto:

Clasificación incorrecta.

---

## Riesgo 2

Laboratorios pendientes no actualizados.

Impacto:

Encuentro permanece indebidamente en Admisión.

---

## Riesgo 3

Errores en la imputación.

Impacto:

Bloqueo del avance del encuentro.

---

# 13. Dependencias

La bandeja de Facturación depende de:

- XHIS.
- Job de Admisión.
- Sustentos administrativos.
- Sustentos médicos.
- Imputación de laboratorios.
- Reglas de antigüedad.

---

# 14. Reglas de Negocio Asociadas

- RN39
- RN49
- RN52
- RN53
- RN54
- RN68
- RN69
- RN70
- RN71
- RN72

---

# 15. Consideraciones Finales

La bandeja de Facturación constituye el resultado final del proceso de clasificación realizado por el Job de Admisión.

Los usuarios gestionan estados operativos, pero nunca determinan directamente la bandeja final de un encuentro.

La clasificación siempre dependerá de las reglas de negocio vigentes y de la evaluación automática realizada por el Job de Admisión.
