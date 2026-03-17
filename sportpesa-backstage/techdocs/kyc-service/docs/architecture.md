# Architecture

See the service overview for high-level architecture. This page covers internal component design.

## Components

- **API Layer** — REST endpoints with JWT authentication
- **Business Logic** — Core service logic
- **Data Layer** — Database access and caching
- **Event Bus** — Async messaging via Kafka/RabbitMQ
