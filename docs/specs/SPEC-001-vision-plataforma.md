---
description: Visión del producto y alcance inicial (SaaS y Standalone)
---

# Resumen ejecutivo
Plataforma moderna para administración integral de clínicas dentales, con foco en valor agregado respecto a herramientas existentes, operando como **SaaS multi-tenant** y con variante **Standalone** (single-tenant) desplegable en infraestructura del cliente.

# Contexto y objetivo
- Cubrir la mayor parte de procesos administrativos de una clínica dental: agendamiento, presupuestos, seguimiento de tratamientos, CRM/contacto, promociones, pagos, RR.HH., stock/insumos, integraciones (pagos, chatbot, etc.).
- Objetivo: entregar una solución end-to-end, escalable y segura, que permita operar una o múltiples clínicas bajo un mismo tenant o múltiples tenants.

# Alcance (alto nivel)
- Núcleo operacional de clínica
  - Agenda de horas, calendario y recordatorios
  - Presupuestos y aprobación por el paciente
  - Seguimiento de tratamientos y fichas clínicas
  - Pagos (integración con pasarelas)
- CRM y marketing
  - Gestión de leads/clientes potenciales, campañas y promociones
  - Comunicaciones omnicanal (email/SMS/WhatsApp/chatbot)
- RR.HH.
  - Contratación, onboarding y gestión básica de personal
- Inventario/insumos
  - Stock, reposición y control de consumos
- Integraciones externas
  - Pasarelas de pago, chatbot, proveedores de insumos
- Plataforma de administración (SaaS)
  - Alta/baja de clínicas (tenants), planes, facturación y gobierno
- Variante Standalone
  - Misma base funcional, limitada a un solo tenant (una clínica)

Out of scope (Fase 1)
- Contabilidad avanzada y tributaria completa
- BI avanzado (quedará en Fase 2 como dashboards ampliados)

# Personas y stakeholders
- Recepcionista, Administrador de clínica, Odontólogo, Paciente, Marketing/RR.HH., Dueño/Operador multi-clínica.

# Requisitos no funcionales
- Seguridad: OAuth2/OIDC, RBAC por rol y por tenant, auditoría.
- Multi-tenant: aislamiento lógico por tenant (SaaS) y modo single-tenant (Standalone).
- Disponibilidad/Desempeño: objetivos iniciales 99.5% uptime, p95 < 300 ms en operaciones críticas.
- Privacidad/Compliance: protección de datos de salud según normativas locales, GDPR cuando aplique.
- Observabilidad: logs estructurados, métricas y trazas.
- I18n: soporte inicial ES, extensible a EN/pt.

# Estrategia de entrega (MVP → Fases)
- MVP
  - Autenticación y RBAC
  - Gestión de pacientes y agenda
  - Presupuestos y registro de pagos (integración con una pasarela)
  - Base de tratamientos
  - Panel administrativo mínimo para 1 tenant (SaaS y Standalone)
- Fase 2
  - CRM/marketing, campañas, chatbot
  - Inventario/stock
  - Multi-tenant completo con alta/baja de clínicas y planes

# Arquitectura y stack (decisiones actuales)
- Frontend: Angular 22 (standalone), Angular Material, TailwindCSS v4, ESLint + sonarjs.
- Backend: Spring Boot 3.3.0, Java 21, JPA, Actuator.
- DB: PostgreSQL 16.
- Infra: Docker (multi-stage), docker-compose para dev.
- CI: GitHub Actions (lint, test, build; Checkstyle/PMD/JaCoCo; SonarCloud opcional por secreto).

# Métricas de éxito
- Tasa de no-show reducida mediante recordatorios.
- Tiempo promedio de agendamiento < 2 min.
- % de presupuestos aprobados.
- Tiempo de cobro y conciliación de pagos.

# Riesgos y supuestos
- Cumplimiento regulatorio de datos de salud varía por país.
- Integraciones con pasarelas sujetas a SLA de terceros.
- Complejidad de multi-tenant en SaaS (aislamiento y facturación).

# Trazabilidad
- ADR-001 Tecnología base
- Diagramas C4 (pendiente en diagrams/)
