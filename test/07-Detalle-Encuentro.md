# 07-Detalle-Encuentro.md

# Detalle del Encuentro

## 1. Objetivo

La pantalla Detalle del Encuentro permite consultar toda la información asociada a un encuentro clasificado en la bandeja de Admisión.

Esta pantalla centraliza la información necesaria para que los usuarios puedan:

- Revisar datos del paciente.
- Revisar datos del encuentro.
- Revisar datos del seguro.
- Revisar documentación pendiente.
- Revisar sustentos médicos pendientes.
- Gestionar estados operativos del encuentro.
- Dar seguimiento al proceso administrativo.

---

# 2. Acceso

## 2.1 Origen

El acceso se realiza desde:

Lista de Encuentros.

---

## 2.2 Flujo

1. El usuario ingresa a Lista de Encuentros.
2. Selecciona un encuentro.
3. El sistema abre la pantalla Detalle del Encuentro.
4. Se muestra toda la información disponible según el rol.

---

# 3. Roles con Acceso

- Superusuario de Admisión
- Gestor de A
- Ejecutivo de Admisión

---

# 4. Restricciones Generales

La pantalla tiene carácter informativo.

Los usuarios no podrán modificar:

- Datos del paciente.
- Datos del encuentro.
- Datos del seguro.
- Sustentos administrativos.
- Sustentos médicos.
- Sustentos de proceso.

La única acción permitida es la actualización del estado operativo del encuentro según los permisos del rol.

---

# 5. Cabecera del Encuentro

## 5.1 Título Principal

En la parte superior de la pantalla se visualizará:

Encuentro {Número de Encuentro}

Ejemplo:

Encuentro 12345678

---

## 5.2 Estado del Encuentro

Ubicación:

Esquina superior derecha.

Se visualizará el estado operativo actual del encuentro.

Ejemplos:

- Pendiente
- Tramitado
- Derivado a Dirección Médica
- Error de Vinculación

---

## 5.3 Sustentos Pendientes

Debajo del título podrán visualizarse agrupaciones informativas.

### Sustentos Administrativos Pendientes

Solo se mostrarán cuando existan pendientes.

Ejemplos:

- Carta de Garantía
- Hoja SITEDS
- Denuncia Policial
- SOAT Tarjeta Física

### Sustentos Médicos Pendientes

Solo se mostrarán cuando existan pendientes.

Ejemplos:

- Laboratorio

### Sustentos de Proceso Pendientes

Solo se mostrarán cuando existan pendientes.

Ejemplos:

- Laboratorios no imputados

---

# 6. Información General

## 6.1 Datos del Paciente

Se visualizarán:

- Nombres
- Apellidos
- Número de Historia Clínica (NHC)

---

## 6.2 Ejecutivo Responsable

Se mostrará el nombre completo del ejecutivo asociado al encuentro.

---

# 7. Agrupador Datos del Encuentro

## Descripción

Agrupador expandible que contiene información operativa del encuentro.

---

## Campos

### Número de Encuentro

Formato:

Numérico de 8 dígitos.

Ejemplo:

12345678

---

### Fecha de Apertura

Formato:

DD/MM/YYYY

Ejemplo:

03/06/2026

---

### Tipo de Encuentro

Valores posibles:

- Ambulatorio
- Emergencia

---

### Prestación

Ejemplo:

ADM00050

---

# 8. Agrupador Datos del Seguro

## Descripción

Agrupador expandible que contiene información del seguro asociado.

---

## Campos

### Garante

Ejemplos:

- Pacífico EPS
- MAPFRE EPS
- Oncosalud

---

### Producto

Ejemplo:

Salud EPS Pacífico

---

### Plan Copago

Ejemplo:

Salud EPS Pacífico

---

### Beneficio

Ejemplo:

Consulta Ambulatoria

---

### Código de Autorización

Ejemplo:

AUT-987654

---

# 9. Visualización para Ejecutivo de Admisión

## Información Disponible

Puede visualizar:

- Cabecera del encuentro.
- Estado actual.
- Datos del paciente.
- Datos del encuentro.
- Datos del seguro.
- Sustentos pendientes.

---

## Cambio de Estado

Puede asignar:

- Pago por Adelantado
- Derivado a Dirección Médica
- Derivado a Supervisor
- Error de Vinculación
- Pendiente de Revisión
- Terapia de Proceso
- Tramitado

---

# 10. Visualización para Superusuario y Gestor de A

## Información Disponible

Visualiza toda la información disponible para el Ejecutivo.

Adicionalmente:

- Sustentos agrupados.
- Mayor visibilidad operativa.
- Estados especiales.

---

## Cambio de Estado

Puede asignar:

- Pago por Adelantado
- No Facturable
- Derivado a Dirección Médica
- Derivado a Supervisor
- Error de Vinculación
- Pendiente de Revisión
- Terapia de Proceso
- En Proceso
- Error de Facturación
- Tramitado

---

# 11. Cambio de Estado

## Objetivo

Permitir registrar la situación operativa actual del encuentro.

---

## Consideración Importante

Los estados operativos NO determinan la bandeja donde se encuentra el encuentro.

La clasificación seguirá siendo responsabilidad exclusiva del Job de Admisión.

---

# 12. Modal de Confirmación

## Apertura

Se mostrará inmediatamente después de seleccionar un nuevo estado.

---

## Componentes

### Botón Cerrar

X

---

### Mensaje

Ejemplo:

¿Deseas marcar el encuentro como Derivado a Dirección Médica?

---

### Descripción

El encuentro permanecerá en tu bandeja de admisión para que puedas continuar revisándolo después.

---

### Botones

#### Confirmar

Sí, cambiar estado

#### Cancelar

No, cancelar

---

# 13. Comportamiento del Cambio de Estado

## Confirmar

El sistema:

1. Actualiza el estado.
2. Guarda el cambio.
3. Cierra el modal.
4. Regresa a Lista de Encuentros.
5. Actualiza la grilla.

---

## Cancelar

El sistema:

1. Cierra el modal.
2. No modifica el estado.
3. Permanece en el detalle.

---

# 14. Estados Especiales

## No Facturable

Disponible únicamente para:

- Superusuario
- Gestor de A

### Comportamiento

Retira temporalmente el encuentro de la bandeja de Admisión.

La siguiente ejecución del Job determinará la bandeja correcta.

---

## Error de Facturación

Disponible únicamente para:

- Superusuario
- Gestor de A

### Comportamiento

Retira temporalmente el encuentro de la bandeja de Admisión.

La siguiente ejecución del Job determinará la bandeja correcta.

---

# 15. Relación entre Estados y Bandejas

## Regla Fundamental

Estado Operativo ≠ Bandeja

Ejemplo:

Bandeja:

Admisión

Estado:

Tramitado

Resultado:

El encuentro continúa en Admisión hasta que el Job determine otra clasificación.

---

# 16. Auditoría

Toda acción deberá registrar:

- Usuario.
- Fecha.
- Hora.
- Estado anterior.
- Estado nuevo.
- Encuentro afectado.

---

# 17. Reglas de Negocio

## RN-DE-01

El detalle es accesible desde Lista de Encuentros.

## RN-DE-02

La información es de solo lectura.

## RN-DE-03

Los usuarios únicamente podrán modificar estados permitidos para su rol.

## RN-DE-04

Los estados operativos no participan en la clasificación.

## RN-DE-05

No Facturable y Error de Facturación provocan la salida temporal de Admisión.

## RN-DE-06

El Job de Admisión determinará posteriormente la bandeja definitiva.

## RN-DE-07

Los sustentos se mostrarán únicamente cuando existan pendientes.

---

# 18. Fuente de Verdad

La pantalla Detalle del Encuentro constituye la vista oficial de consulta operativa de un encuentro y debe reflejar fielmente la información vigente proveniente de XHIS y la clasificación realizada por el Job de Admisión.
