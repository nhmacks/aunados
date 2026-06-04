# 02-Protocolo.md

# Módulo de Protocolo

## 1. Objetivo

La bandeja de Protocolo tiene como finalidad concentrar aquellos encuentros que ya cumplieron las validaciones administrativas, médicas y de proceso requeridas para salir de Admisión, pero que aún no han alcanzado la antigüedad necesaria para ser enviados a Facturación.

Esta bandeja actúa como una etapa intermedia de control operativo antes del proceso de facturación.

---

# 2. Relación con el Job de Admisión

La clasificación de encuentros hacia Protocolo es responsabilidad exclusiva del Job de Admisión.

Ningún usuario podrá mover manualmente un encuentro desde Admisión hacia Protocolo.

Ningún cambio de estado operativo provocará el ingreso o salida de un encuentro de esta bandeja.

---

# 3. Requisitos para Ingresar a Protocolo

Un encuentro podrá ingresar a la bandeja de Protocolo únicamente cuando cumpla todas las condiciones siguientes:

## 3.1 Documentación Administrativa

- Completa.
- Sin sustentos administrativos pendientes.

## 3.2 Sustentos Médicos

- Completos.
- Sin laboratorios pendientes.

## 3.3 Sustentos de Proceso

- Todos los laboratorios imputados.

## 3.4 Clasificación por Antigüedad

Además de cumplir las condiciones anteriores, deberá encontrarse dentro del rango de antigüedad permitido.

---

# 4. Reglas de Clasificación

## 4.1 Consulta Externa No Oncosalud

### Condiciones

- Documentación administrativa completa.
- Laboratorios completos.
- Laboratorios imputados.
- Menor a 7 días desde su creación.

### Resultado

El encuentro será clasificado en Protocolo.

---

## 4.2 Consulta Externa Oncosalud

### Condiciones

- Documentación administrativa completa.
- Laboratorios completos.
- Laboratorios imputados.
- Menor o igual a 31 días desde su creación.

### Resultado

El encuentro será clasificado en Protocolo.

---

## 4.3 Emergencia

### Condiciones

- Documentación administrativa completa.
- Laboratorios completos.
- Laboratorios imputados.
- Menor o igual a 2 días desde su creación.

### Resultado

El encuentro será clasificado en Protocolo.

---

# 5. Salida de Protocolo

La salida de Protocolo será determinada únicamente por el Job de Admisión.

---

## 5.1 Consulta Externa No Oncosalud

### Condición

Mayor a 7 días.

### Resultado

Facturación.

---

## 5.2 Consulta Externa Oncosalud

### Condición

Mayor a 31 días.

### Resultado

Facturación.

---

## 5.3 Emergencia

### Condición

Mayor a 2 días.

### Resultado

Facturación.

---

# 6. Principios Funcionales

## PF-PRO-01

La bandeja de Protocolo no corrige documentación administrativa.

## PF-PRO-02

La bandeja de Protocolo no corrige sustentos médicos.

## PF-PRO-03

La bandeja de Protocolo no corrige laboratorios no imputados.

## PF-PRO-04

Todo encuentro visible en Protocolo debe haber superado las validaciones de Admisión.

## PF-PRO-05

La permanencia en Protocolo depende exclusivamente de la antigüedad del encuentro.

---

# 7. Relación entre Estados y Protocolo

Los estados operativos son independientes de la clasificación.

Ejemplo:

Bandeja:
- Protocolo

Estado:
- Tramitado

Resultado:
- El encuentro continuará en Protocolo hasta que el Job determine su pase a Facturación.

---

# 8. Escenarios de Ejemplo

## Escenario 1

### Datos

Tipo:
- Consulta Externa No Oncosalud

Antigüedad:
- 3 días

Documentación:
- Completa

Laboratorios:
- Completos

Imputación:
- Completa

### Resultado

Protocolo.

---

## Escenario 2

### Datos

Tipo:
- Consulta Externa No Oncosalud

Antigüedad:
- 9 días

Documentación:
- Completa

Laboratorios:
- Completos

Imputación:
- Completa

### Resultado

Facturación.

---

## Escenario 3

### Datos

Tipo:
- Emergencia

Antigüedad:
- 1 día

Documentación:
- Completa

Laboratorios:
- Completos

Imputación:
- Completa

### Resultado

Protocolo.

---

## Escenario 4

### Datos

Tipo:
- Emergencia

Antigüedad:
- 4 días

Documentación:
- Completa

Laboratorios:
- Completos

Imputación:
- Completa

### Resultado

Facturación.

---

# 9. Reglas de Negocio Asociadas

- RN35
- RN36
- RN37
- RN38
- RN39
- RN49
- RN52
- RN53
- RN54

---

# 10. Dependencias

La correcta clasificación de Protocolo depende de:

- XHIS.
- Job de Admisión.
- Información de laboratorios.
- Información de sustentos administrativos.
- Información de imputación de exámenes.

---

# 11. Consideraciones Importantes

La bandeja de Protocolo no constituye una aprobación manual.

La existencia de un encuentro en esta bandeja significa únicamente que:

1. Cumplió todas las validaciones requeridas.
2. Aún no alcanzó la antigüedad necesaria para ser enviado a Facturación.
3. El Job de Admisión lo clasificó como candidato para Protocolo.
