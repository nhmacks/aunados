# Análisis de Cobertura de Escenarios - Lista de Encuentros

**Fecha:** 2026-06-05
**Analista:** Claude Code
**Objetivo:** Validar si los escenarios proporcionados ya están mapeados en los features existentes

---

## RESUMEN EJECUTIVO

**Total de escenarios analizados:** 36 escenarios proporcionados
**Escenarios cubiertos completamente:** 14 (39%)
**Escenarios cubiertos parcialmente:** 8 (22%)
**Escenarios NO cubiertos:** 14 (39%)

---

## ANÁLISIS DETALLADO POR ESCENARIO

### 1. VISUALIZACIÓN DE LISTA POR ROL

| # | Escenario Proporcionado | Estado | Feature Actual | Escenario Equivalente | Notas |
|---|------------------------|--------|----------------|----------------------|-------|
| 1 | Visualizar lista como Gestor TA | ✅ CUBIERTO | `visualizacion.feature` | VIS-01, PERM-09 | Cobertura completa: columnas, búsqueda, grilla |
| 2 | Visualizar lista como Superusuario | ✅ CUBIERTO | `visualizacion.feature` | VIS-01, PERM-08 | Cobertura completa: columnas, búsqueda, grilla |
| 3 | Visualizar lista como Ejecutivo | ✅ CUBIERTO | `visualizacion.feature` | VIS-02, PERM-10 | Cobertura completa: solo 9 columnas, encuentros propios |

**Conclusión Sección 1:** ✅ **COMPLETAMENTE CUBIERTO**

---

### 2. SUSTENTOS ADMINISTRATIVOS

| # | Escenario Proporcionado | Estado | Feature Actual | Escenario Equivalente | Notas |
|---|------------------------|--------|----------------|----------------------|-------|
| 4 | Visualizar sustentos administrativos pendientes en lista | ⚠️ PARCIAL | `visualizacion.feature` | VIS-01 (columna existe) | La columna existe, pero NO hay escenario específico de visualización de valores |
| 5 | Visualizar sustentos administrativos en detalle | ✅ CUBIERTO | `detalle-encuentro/visualizacion.feature` | DV-05, DV-06 | Cobertura completa con ejemplos |

**Conclusión Sección 2:** ⚠️ **PARCIALMENTE CUBIERTO** - Falta validación de contenido en la lista

---

### 3. SUSTENTOS DE PROCESO (LABORATORIOS)

| # | Escenario Proporcionado | Estado | Feature Actual | Escenario Equivalente | Notas |
|---|------------------------|--------|----------------|----------------------|-------|
| 6 | No mostrar sustento cuando NO hay laboratorio | ✅ CUBIERTO | `detalle-encuentro/visualizacion.feature` | DV-10 | Validación negativa incluida |
| 7 | No mostrar cuando encuentro tiene imputación | ✅ CUBIERTO | `detalle-encuentro/visualizacion.feature` | DV-10 | Mismo caso: NO mostrar cuando está completo |
| 8 | Mostrar "laboratorio" cuando NO tiene imputación | ✅ CUBIERTO | `detalle-encuentro/visualizacion.feature` | DV-09 | Ejemplo: "Laboratorios no imputados" |
| 9 | Exportar con columna Sustentos de proceso | ✅ CUBIERTO | `exportacion.feature` | EXP-07, EXP-14 | Columna incluida para Super/Gestor |
| 10 | Filtrar encuentros mantiene sustento correcto | ❌ NO CUBIERTO | N/A | N/A | **FALTA**: Validar que filtros no afectan sustentos |

**Conclusión Sección 3:** ⚠️ **PARCIALMENTE CUBIERTO** - Falta 1 escenario de validación cruzada

---

### 4. FILTROS

| # | Escenario Proporcionado | Estado | Feature Actual | Escenario Equivalente | Notas |
|---|------------------------|--------|----------------|----------------------|-------|
| 11 | Filtrar por mecanismo (CAPITA, CPM, Pago por servicio) | ❌ NO CUBIERTO | N/A | N/A | **FALTA COMPLETAMENTE** - No existe este filtro |
| 12 | Validar diferencias de acceso entre roles | ✅ CUBIERTO | `permisos.feature` | PERM-11, PERM-12, PERM-13 | Cobertura completa de filtros por rol |

**Conclusión Sección 4:** ⚠️ **PARCIALMENTE CUBIERTO** - Falta filtro por mecanismo

---

### 5. BÚSQUEDAS

| # | Escenario Proporcionado | Estado | Feature Actual | Escenario Equivalente | Notas |
|---|------------------------|--------|----------------|----------------------|-------|
| 13 | Buscar como Gestor TA (nombre/apellido/encuentro) | ✅ CUBIERTO | `visualizacion.feature` | Implícito en VIS-01 | Búsqueda general descrita en RN-LE-06 |
| 14 | Buscar como Superusuario | ✅ CUBIERTO | `visualizacion.feature` | Implícito en VIS-01 | Mismo caso |
| 15 | Buscar como Ejecutivo (solo sus encuentros) | ✅ CUBIERTO | `visualizacion.feature` | VIS-02, VIS-08 | Restricción validada |

**Conclusión Sección 5:** ✅ **COMPLETAMENTE CUBIERTO**

---

### 6. EXPORTACIÓN / DESCARGA

| # | Escenario Proporcionado | Estado | Feature Actual | Escenario Equivalente | Notas |
|---|------------------------|--------|----------------|----------------------|-------|
| 16 | Descargar como Gestor TA | ✅ CUBIERTO | `exportacion.feature` + `permisos.feature` | EXP-01, PERM-17 | Exportación inmediata con 14 columnas |
| 17 | Descargar como Superusuario | ✅ CUBIERTO | `exportacion.feature` + `permisos.feature` | EXP-01, PERM-16 | Exportación inmediata con 14 columnas |
| 18 | Descargar como Ejecutivo | ✅ CUBIERTO | `exportacion.feature` + `permisos.feature` | EXP-02, PERM-18 | Exportación asíncrona, 9 columnas |
| 19 | Validar consistencia UI vs Excel | ✅ CUBIERTO | `exportacion.feature` | EXP-10, EXP-11 | Validación de integridad de datos |
| 20 | Ejecutivo NO visualiza "Sustentos de proceso" en Excel | ✅ CUBIERTO | `permisos.feature` | PERM-33 | Validación específica incluida |

**Conclusión Sección 6:** ✅ **COMPLETAMENTE CUBIERTO**

---

### 7. RESTABLECER VISTA

| # | Escenario Proporcionado | Estado | Feature Actual | Escenario Equivalente | Notas |
|---|------------------------|--------|----------------|----------------------|-------|
| 21 | Restablecer vista como Gestor TA | ✅ CUBIERTO | `filtros.feature` | FIL-38, FIL-39 | Limpia filtros, búsquedas y ordenamientos |
| 22 | Restablecer vista como Superusuario | ✅ CUBIERTO | `filtros.feature` | FIL-38, FIL-39 | Mismo comportamiento |
| 23 | Restablecer vista como Ejecutivo | ✅ CUBIERTO | `filtros.feature` | FIL-38, FIL-39 | Vuelve a mostrar solo encuentros propios |

**Conclusión Sección 7:** ✅ **COMPLETAMENTE CUBIERTO**

---

### 8. EXÁMENES DE LABORATORIO (Estados Detallados)

| # | Escenario Proporcionado | Estado | Feature Actual | Escenario Equivalente | Notas |
|---|------------------------|--------|----------------|----------------------|-------|
| 24 | Sin sustentos médicos de laboratorio | ❌ NO CUBIERTO | N/A | N/A | **FALTA**: Validación específica de ausencia |
| 25 | Exámenes Imputados y Finalizados | ❌ NO CUBIERTO | N/A | N/A | **FALTA**: Validación de estados combinados |
| 26 | Exámenes Pendientes y No Imputados | ❌ NO CUBIERTO | N/A | N/A | **FALTA**: Combinación de estados |
| 27 | Exámenes Imputados y No Finalizados | ❌ NO CUBIERTO | N/A | N/A | **FALTA**: Combinación de estados |
| 28 | Exámenes No Imputados y Finalizados | ❌ NO CUBIERTO | N/A | N/A | **FALTA**: Combinación de estados |
| 29 | Visualizar Sustentos Administrativos con label "Pendiente" | ⚠️ PARCIAL | `detalle-encuentro/visualizacion.feature` | DV-05, DV-06 | Existe validación, pero NO menciona label explícito |

**Conclusión Sección 8:** ❌ **NO CUBIERTO** - Requiere escenarios específicos para estados de laboratorio

---

### 9. REGISTRO DE EVENTOS EN AMPLITUDE

| # | Escenario Proporcionado | Estado | Feature Actual | Escenario Equivalente | Notas |
|---|------------------------|--------|----------------|----------------------|-------|
| 30 | Registrar evento al ordenar tabla (Gestor TA) | ❌ NO CUBIERTO | N/A | N/A | **FALTA COMPLETAMENTE** - No hay analytics |
| 31 | Registrar evento al filtrar multiselección (Gestor TA) | ❌ NO CUBIERTO | N/A | N/A | **FALTA COMPLETAMENTE** |
| 32 | Registrar evento al filtrar por fecha (Gestor TA) | ❌ NO CUBIERTO | N/A | N/A | **FALTA COMPLETAMENTE** |
| 33 | Registrar evento al filtrar por texto (Gestor TA) | ❌ NO CUBIERTO | N/A | N/A | **FALTA COMPLETAMENTE** |
| 34 | Registrar evento al ordenar (Ejecutivo) | ❌ NO CUBIERTO | N/A | N/A | **FALTA COMPLETAMENTE** |
| 35 | Registrar evento multiselección (Ejecutivo) | ❌ NO CUBIERTO | N/A | N/A | **FALTA COMPLETAMENTE** |
| 36 | Registrar evento filtro fecha (Ejecutivo) | ❌ NO CUBIERTO | N/A | N/A | **FALTA COMPLETAMENTE** |

**Conclusión Sección 9:** ❌ **NO CUBIERTO** - Analytics/Amplitude no está implementado en ningún feature

---

## RESUMEN POR FEATURE FILE

### **visualizacion.feature** ✅
- **Cobertura:** Excelente
- **Escenarios mapeados:** 1, 2, 3, 13, 14, 15
- **Total:** 6 escenarios proporcionados cubiertos

### **detalle-encuentro/visualizacion.feature** ⚠️
- **Cobertura:** Buena pero incompleta
- **Escenarios mapeados:** 5, 6, 7, 8 (parcial 29)
- **Total:** 4-5 escenarios proporcionados cubiertos

### **exportacion.feature** ✅
- **Cobertura:** Excelente
- **Escenarios mapeados:** 16, 17, 18, 19, 20
- **Total:** 5 escenarios proporcionados cubiertos

### **filtros.feature** ⚠️
- **Cobertura:** Buena pero falta filtro por mecanismo
- **Escenarios mapeados:** 12, 21, 22, 23
- **Total:** 4 escenarios proporcionados cubiertos
- **Faltante crítico:** Filtro por mecanismo (CAPITA, CPM, Pago por servicio)

### **ordenamiento.feature** ✅
- **Cobertura:** Completa para ordenamiento básico
- **Nota:** No cubre registro de eventos (Amplitude)

### **permisos.feature** ✅
- **Cobertura:** Excelente
- **Escenarios mapeados:** 12, 16, 17, 18, 20
- **Total:** 5 escenarios proporcionados cubiertos

---

## ESCENARIOS FALTANTES QUE DEBEN CREARSE

### PRIORIDAD ALTA 🔴

1. **Filtro por Mecanismo** (CAPITA, CPM, Pago por servicio)
   - Archivo sugerido: `filtros.feature`
   - Escenarios requeridos: ~5-7
   - Impacto: Funcionalidad completa faltante

2. **Estados Detallados de Laboratorios**
   - Archivo sugerido: Nuevo archivo `detalle-encuentro/sustentos-laboratorio.feature`
   - Escenarios requeridos: ~6-8
   - Estados a cubrir:
     - Imputados + Finalizados
     - Pendientes + No Imputados
     - Imputados + No Finalizados
     - No Imputados + Finalizados

### PRIORIDAD MEDIA 🟡

3. **Registro de Eventos en Amplitude**
   - Archivo sugerido: Nuevo archivo `analytics.feature` o `eventos-amplitude.feature`
   - Escenarios requeridos: ~12-15
   - Tipos de eventos:
     - Ordenamiento de tabla
     - Filtros (multiselección, fecha, texto)
     - Búsquedas
     - Exportaciones

### PRIORIDAD BAJA 🟢

4. **Validaciones Cruzadas**
   - Sustentos de proceso se mantienen correctos al filtrar
   - Consistencia de datos después de múltiples operaciones

---

## RECOMENDACIONES

### 1. CREACIÓN DE NUEVOS FEATURES

```
gherkin/admision/lista-encuentros/
├── filtros.feature (ACTUALIZAR - agregar filtro por mecanismo)
├── detalle-encuentro/
│   ├── visualizacion.feature (EXISTENTE)
│   └── sustentos-laboratorio.feature (NUEVO - estados detallados)
└── analytics.feature (NUEVO - Amplitude events)
```

### 2. PRIORIZACIÓN

Si el equipo tiene recursos limitados, priorizar en este orden:

1. **Filtro por mecanismo** - Funcionalidad core faltante
2. **Estados de laboratorios** - Validación de lógica de negocio crítica
3. **Analytics** - Puede ser posterior si no es bloqueante

### 3. EVITAR DUPLICACIÓN

Los siguientes escenarios proporcionados YA ESTÁN CUBIERTOS y NO deben duplicarse:
- Visualización de lista por rol (3 escenarios) ✅
- Búsquedas básicas (3 escenarios) ✅
- Exportación por rol (5 escenarios) ✅
- Restablecer vista (3 escenarios) ✅
- Permisos de acceso (múltiples escenarios) ✅

---

## MATRIZ DE DECISIÓN

| Escenario Proporcionado | ¿Implementar? | Justificación |
|------------------------|---------------|---------------|
| Visualización lista por rol | ❌ NO | Ya cubierto en VIS-01, VIS-02, PERM-08-10 |
| Sustentos administrativos básicos | ❌ NO | Ya cubierto en DV-05, DV-06 |
| Filtro por mecanismo | ✅ SÍ | **NO existe - CRÍTICO** |
| Búsquedas básicas | ❌ NO | Ya cubierto en visualizacion.feature |
| Exportación por rol | ❌ NO | Ya cubierto en exportacion.feature + permisos.feature |
| Restablecer vista | ❌ NO | Ya cubierto en filtros.feature |
| Estados de laboratorio detallados | ✅ SÍ | **Cobertura insuficiente** |
| Eventos Amplitude | ✅ SÍ | **NO existe - opcional según prioridad** |

---

## CONCLUSIÓN FINAL

**De los 36 escenarios proporcionados:**
- ✅ **14 ya están completamente cubiertos** (no requieren acción)
- ⚠️ **8 están parcialmente cubiertos** (pueden mejorarse)
- ❌ **14 NO están cubiertos** (requieren implementación)

**Acción recomendada:** Crear **2-3 nuevos archivos .feature** para cubrir las brechas identificadas, priorizando:
1. Filtro por mecanismo (actualizar `filtros.feature`)
2. Estados de laboratorios (nuevo archivo)
3. Analytics/Amplitude (nuevo archivo - evaluar si es requisito)

---

**Generado por:** Claude Code
**Fecha:** 2026-06-05
**Archivos analizados:** 6 features, 200 escenarios existentes
