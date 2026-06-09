# dental-manager

Sistema de administración para clínicas dentales basado en SDD (Spec Driven Development).

## Stack Tecnológico
- Frontend: Angular (Node 20 LTS)
- Backend: Spring Boot (Java 21 LTS)
- Base de Datos: PostgreSQL 16
- Contenedores: Docker / Docker Compose
- CI/CD: GitHub Actions
- Calidad: SonarQube CE, ESLint (Angular), Checkstyle/PMD (Java)

## Estructura del repositorio
- CONSTITUCION-SDD.md: directrices y acuerdos del desarrollo (nuestra “constitución”).
- docs/specs/: especificaciones funcionales (Gherkin), contratos OpenAPI.
- docs/adr/: decisiones de arquitectura (ADR).
- docs/diagrams/: diagramas de arquitectura y flujos.
- frontend/: proyecto Angular (se generará con Angular CLI).
- backend/: proyecto Spring Boot (se generará con Spring Initializr).
- infra/docker-compose.yml: orquestación local (db/backend/frontend).
- .github/workflows/ci.yml: pipeline CI.

## Desarrollo local (temporal)
Mientras no existan los proyectos, solo puede levantarse la base de datos:
```bash
docker compose -f infra/docker-compose.yml up -d db