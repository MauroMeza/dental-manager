---
description: Decisiones de tecnología base (Frontend, Backend, CI/CD, Calidad)
status: Accepted
date: 2026-06-24
---

# Contexto
Se requiere una plataforma web moderna con front Angular y backend Java, con alta productividad, ecosistema maduro y CI/CD en GitHub.

# Decisión
- Frontend: Angular 22 (standalone), Angular Material, TailwindCSS v4, ESLint + sonarjs.
- Node: 22.x (npm 10.x) con fijación por proyecto/CI.
- Backend: Spring Boot 3.3.0, Java 21, JPA, Actuator.
- Base de datos: PostgreSQL 16.
- Calidad: ESLint (FE), Checkstyle + PMD + JaCoCo (BE).
- CI: GitHub Actions (Node 22 para FE, Java 21 para BE; SonarCloud opcional por secreto), cachés por lockfile y repositorio Maven.
- Contenedores: Docker multi-stage para FE/BE, compose para dev/infra local.

## Opciones consideradas
- React + Vite: +Ecosistema, -Curva y cambio respecto a preferencia de Angular.
- Spring Boot 3.3 vs Quarkus/Micronaut: +Productividad y comunidad, +Integración con stack actual.
- MySQL vs PostgreSQL: PostgreSQL por características avanzadas y extensiones.

## Consecuencias
- Curva de aprendizaje alineada al equipo (Angular/Spring).
- Compatibilidad con LTS (Java 21) y últimas versiones estables (Angular 22, Boot 3.3).
- CI reproducible con matrices de versiones controladas.

## Referencias
- SPEC-001 Visión de plataforma
- Workflow CI en .github/workflows/ci.yml
