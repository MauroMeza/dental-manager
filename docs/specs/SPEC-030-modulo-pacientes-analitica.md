---
description: Analítica de Pacientes (funnel, segmentación y KPIs operativos)
---

# Objetivo
Proveer visibilidad de conversión, comportamiento y demografía de pacientes para mejorar asistencia, aceptación de presupuestos y cobranza.

# Alcance
- Funnel de conversión: agendada → confirmada → presupuesto aceptado.
- Series temporales por etapa.
- Segmentaciones: Edad, Género, Comuna, Medios de pago, Categoría de acciones, Estado de las citas.
- KPIs globales: total pacientes, deuda acumulada, asistencia promedio, presupuestos pendientes (5 años).
- “Ver detalles” en cada métrica (tabla/exportación).

# Definiciones de métricas
- Citas agendadas: citas creadas en el período filtrado.
- Citas confirmadas: citas con estado confirmado (tel/email/WhatsApp/online) dentro del período.
- Presupuestos aceptados: presupuestos marcados como aceptados en el período (regla exacta a definir).
- Asistencia promedio: atendidas / programadas del período.
- Deuda acumulada: suma de saldos abiertos asociados a pacientes.
- Presupuestos pendientes: suma de presupuestos no aceptados (últimos 5 años).

# Datos y modelo (alto nivel)
- Hechos: cita, confirmación (con canal), presupuesto (estado), pago/deuda.
- Dimensiones: fecha (mes/año), clínica, paciente (edad/género/comuna), medio de pago, categoría de acción, estado de cita.

# UI / Flujos
- Filtros: mes/año desde–hasta, clínica; botones Filtrar/Actualizar; sello de “Última actualización”.
- Paneles: funnel + serie temporal; tarjetas con KPIs; segmentaciones tipo donut.
- “Ver detalles”: abre tabla exportable (CSV/XLSX) coherente con los filtros activos.

# Historias (Gherkin)
```gherkin
Feature: Analítica de pacientes

Scenario: Ver tasa de aceptación mensual
  Given selecciono un rango de 12 meses y una clínica
  When aplico "Filtrar"
  Then el funnel y la serie temporal muestran confirmación y aceptación por mes

Scenario: Segmentar por medios de pago
  Given tengo filtros aplicados
  When abro "Medios de pago"
  Then veo participación por método y puedo exportar el detalle
```

# RNF
- Rendimiento: p95 < 500 ms en panel principal; preagregados por mes/clínica.
- Consistencia: todas las vistas respetan filtros globales.
- Auditoría: registrar usuario y filtros en exportaciones.

# Preguntas abiertas
- ¿Unidad exacta de “Presupuestos pendientes” (monto, cantidad, ventana variable)?
- ¿Segmentaciones editables/configurables por clínica?
