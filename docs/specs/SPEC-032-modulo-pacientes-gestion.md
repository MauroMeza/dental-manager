---
description: Gestión de Pacientes (listado/habilitados, búsqueda, filtros y acciones)
---

# Objetivo
Administrar el listado de pacientes habilitados, con capacidades de búsqueda, filtrado por número/tratamiento, ordenamiento, descarga y alta/edición.

# Alcance
- Listado de pacientes habilitados.
- Búsqueda por nombre/apellido y filtros por Número y Tratamiento.
- Acciones superiores: Descargar, Agregar pacientes, Recauda con link de pago.
- Acciones por fila (menú ⋮): ver/editar, atajos clínicos/administrativos (a definir).

# UI / Flujos
- Barra superior: "Buscar por nombre o apellido…", selector de "Número", filtro de "Tratamiento", botón "Buscar".
- Acciones: menú "Descargar" (formatos CSV/XLSX), botón "Agregar pacientes".
- Opción visible: "Recauda con link de pago" (integración de cobro por enlace al paciente).
- Tabla con columnas: # (ID), Nombre, Apellidos, Tratamientos (conteo), Deudas (estado).
- Ordenamiento por columnas (ej. Nombre asc/desc). Menú de acciones por fila (⋮).

# Datos y modelo (alto nivel)
- Paciente: id, nombres, apellidos, contacto, estado_habilitacion, deuda_total, tratamientos_activos (conteo), creado_en.
- TratamientoPaciente: id, paciente_id, profesional_id, estado, creado_en.
- Enlaces de Pago: id, paciente_id, monto, estado[pendiente|pagado|vencido], url, creado_en.

# Historias (Gherkin)
```gherkin
Feature: Listado de pacientes habilitados

Scenario: Buscar por nombre/apellido
  Given estoy en "Pacientes > Habilitados"
  When escribo "Ana" en la búsqueda y presiono Buscar
  Then el listado muestra solo pacientes cuyo nombre o apellido contienen "Ana"

Scenario: Filtrar por tratamiento
  Given el filtro de Tratamiento
  When selecciono un tratamiento específico
  Then la tabla muestra pacientes con ese tratamiento asociado

Scenario: Crear paciente desde listado
  Given el botón "Agregar pacientes"
  When completo el formulario mínimo requerido
  Then se crea el paciente respetando la matriz de configuración (Presente/Requerido)

Scenario: Recaudar con link de pago
  Given un paciente con deuda > 0
  When selecciono "Recauda con link de pago"
  Then se genera un enlace de pago asociado y queda visible su estado
```

# RNF
- Rendimiento: p95 < 300 ms en búsqueda y filtros típicos (con paginación/virtualización).
- Consistencia: los indicadores de deuda se sincronizan con el módulo de pagos/caja.
- Seguridad: permisos por rol, visibilidad por tenant/sucursal.

# Preguntas abiertas
- ¿Qué acciones específicas expone el menú por fila (⋮)?
- ¿Formatos y alcance de "Descargar"? ¿Con qué columnas y filtros activos?
- ¿Flujo de validación al crear pacientes desde el listado (captura rápida vs formulario completo)?
