---
description: Síntesis de intake del PO (fuentes en info/) y mapa de capacidades
---

# Resumen ejecutivo
A partir del material provisto por el PO (imágenes y PDFs en `info/`), se levantan capacidades clave del sistema tipo Dentalink, definiendo alcance de MVP y fases siguientes para una plataforma SaaS multi-tenant con variante Standalone.

# Fuentes revisadas (info/)
- Capturas navegación superior (módulos): `opciones superiores.png`
- Pantallas de cajas: `CAJAS CERRADAS.png`, `cajas cerradas.pdf`, `cajas abierta.pdf`, `MI CAJA.pdf`
- Reportes sobre cajas: `Captura de pantalla_22-6-2026_16115_biobiodental.dentalink.cl.jpeg`
- Agenda: `agenda.pdf`, `agenda diaria global.pdf`, `agenda semanal doctor.pdf`
- Pacientes: `pacientes análisis.pdf`, `pacientes configuración.pdf`, `pacientes habilitado.pdf`

# Hallazgos clave
- Módulos visibles en navegación: Agenda, Pacientes, Cajas, Recaudación, Administración, Reportes, CRM, (Mi caja / Buscar caja).
- Gestión de cajas:
  - Vistas de "Cajas abiertas" y "Cajas cerradas" con filtros: usuario, fecha apertura, fecha cierre.
  - Acción "Abrir caja" y sección "Mi caja".
  - Advertencia en listados: los resúmenes de estas secciones no incluyen pagos por descuentos de planilla.
  - Menú "Reportes" asociado a cajas, con opciones:
    - Resumen de recaudación últimos 10 días
    - Resumen cajas
    - Pagos recibidos por período
    - Pagos recibidos por período por profesional
    - Resumen Excel de cajas entre dos fechas
- Agenda con vistas diaria/semanal y foco en doctores (agenda semanal doctor).
- Módulo Pacientes con opciones de configuración y análisis.

# Mapa de capacidades (alto nivel)
- Agenda y atención
  - Agenda diaria/semanal, por profesional, recordatorios y administración de disponibilidad.
- Pacientes
  - Alta/edición, habilitación, configuración de campos, análisis básico.
- Cajas y recaudación
  - Apertura/cierre de caja, Mi caja, búsqueda de caja.
  - Reportes operacionales (período, profesional, últimos 10 días) y exportación.
  - Regla explícita: exclusión de pagos por descuentos de planilla en ciertos resúmenes.
- Pagos e integraciones
  - Integración con pasarelas de pago; conciliación básica.
- CRM/Promociones (futuro)
  - Gestión de leads, campañas y comunicación omnicanal.
- Administración (SaaS)
  - Tenants, planes, gobierno y auditoría. En Standalone, administración local del cliente.

# MVP propuesto
- Autenticación y RBAC por rol (Recepción, Caja, Administración, Profesional).
- Agenda básica (diaria/semanal por doctor) con recordatorios.
- Pacientes: CRUD esencial y habilitación.
- Cajas: abrir/cerrar caja, Mi caja, listado de cerradas con filtros, reportes por período, exportación.
- Pagos: integración con una pasarela y registro de cobros.
- Reportes mínimos: recaudación últimos 10 días, por período, por profesional.

# Fases siguientes
- CRM y promociones, campañas y chatbot.
- Inventario/stock de insumos.
- Administración SaaS completa (onboarding de clínicas, facturación, planes).
- BI y dashboards avanzados.

# Requisitos no funcionales (RNF)
- Seguridad: OAuth2/OIDC, RBAC, auditoría de operaciones de caja.
- Multi-tenant: aislamiento lógico por tenant (SaaS) y modo single-tenant (Standalone).
- Observabilidad: logs estructurados por tenant y usuario.
- Privacidad: tratamiento de datos de salud conforme normativa local.
- Disponibilidad y desempeño: p95 < 300 ms en operaciones críticas.

# Riesgos y preguntas abiertas
- ¿Cómo y dónde se consideran "descuentos por planilla" en reportes? ¿Reporte específico aparte?
- Alcance de "Recaudación" vs "Cajas": límites funcionales.
- Profundidad de análisis en módulo Pacientes (KPIs, cohortes, etc.).

# Métricas de éxito
- % no-show reducido por recordatorios.
- % aprobación de presupuestos y tiempos de cobro.
- Tiempo de apertura/cierre de caja y conciliación diaria.

# Trazabilidad
- Ver `SPEC-001-vision-plataforma.md` y `ADR-001-tecnologia-base.md`.
- Próximo documento detallado: `SPEC-010-modulo-cajas.md`.

---

## Detalle adicional desde “Mi caja”
- Filtros en cajas cerradas: Usuario, Fecha apertura, Fecha cierre.
- Columnas estándar por caja: Usuario, Apertura, Cierre, Detalle, Total abonos, Total gastos, Saldo cierre.
- Detalle de movimientos (“Transacciones de la caja”): Paciente, Medio de pago, Convenio, Vencimiento, # referencia, # Boleta.
- Regla de reportería: excluir pagos por “descuentos por planilla” de ciertos resúmenes.
- Requerimiento de configuración: definir “medios de pago considerados” en reportes de caja.

## Detalle adicional desde “Cajas cerradas”
- Filtros: Usuario, Fecha apertura, Fecha cierre; acciones “Filtrar” y “Quitar filtros”.
- Columnas del listado: Usuario, Apertura, Cierre, Detalle, Total abonos, Total gastos, Saldo cierre.
- Navegación relacionada: Reportes, Mi caja, Buscar caja, Abrir caja.
- Listado histórico (mensual) con montos formateados por fila.

## Detalle adicional desde “Agenda”
- Vistas: Diaria, Semanal, Diaria global; módulo de Reprogramación.
- Filtros por profesional y estados (notificado/confirmado por canal, no confirmado, en sala de espera, atendido, no asiste, reagendado) y motivos de anulación.
- Búsqueda por paciente/ID; botón de “Imprimir”; auto–refresh tras 40 s.
- Cita muestra: Hora, Paciente, Doctor, Estado, Situación de saldo, etiqueta “Diagnóstico”, Box, accesos a datos personales.
- Slots con duración flexible; soporte multi–box/sala.

## Detalle adicional desde “Pacientes › Análisis”
- Funnel de conversión (agendada → confirmada → presupuesto aceptado) con KPIs y evolución temporal.
- Filtros por período (mes/año desde–hasta) y por clínica; control de “Actualizar” con sello de última actualización.
- Segmentaciones: Edad, Género, Comuna, Medios de pago, Categoría de acciones, Estado de las citas.
- Métricas globales: total de pacientes, deuda acumulada, asistencia promedio, presupuestos pendientes (últimos 5 años) con “Ver detalles”.

## Detalle adicional desde “Pacientes › Configuración”
- Matriz de configuración por contexto que controla visibilidad (“Presente”) y obligatoriedad (“Requerido”) de campos del paciente.
- Contextos: Nuevo paciente, Crear paciente al agendar, Agenda online, Check-in.
- Reglas: “Requerido” implica “Presente”; cambios persistidos con auditoría multi-tenant.

## Detalle adicional desde “Pacientes › Habilitados”
- Acciones superiores: Buscar por nombre/apellido, filtro por Número, filtro por Tratamiento, acción “Buscar”, menú “Descargar”, botón “Agregar pacientes”.
- Opción “Recauda con link de pago” visible en la cabecera (integración de cobro por enlace).
- Columnas del listado: # (ID), Nombre, Apellidos, Tratamientos (conteo), Deudas (ej. “No tiene”), menú de acciones por fila (⋮).
- Ordenamiento por columnas (ej. Nombre con indicador ascendente/descendente).
- Reglas candidatas: indicadores de deuda sincronizados con módulo de pagos; filtros combinables por número/tratamiento/búsqueda textual; creación rápida respeta la matriz de configuración de campos.

---

## Documentos a generar/actualizar
- Crear: `SPEC-010-modulo-cajas.md` (cajas, mi caja, reportes), `SPEC-020-modulo-agenda.md` (agenda y reprogramación), `SPEC-030-modulo-pacientes-analitica.md` (funnel/segmentación/KPIs), `SPEC-031-modulo-pacientes-configuracion.md` (matriz de campos), `SPEC-032-modulo-pacientes-gestion.md` (listado/habilitados y CRUD).
- Mantener este SPEC actualizado a medida que ingresen más fuentes del PO.
