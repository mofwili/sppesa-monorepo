# Odds Engine

The Odds Engine is the core real-time odds calculation and market management service for SportPesa's sports betting platform. It processes live sports data feeds and computes accurate odds across thousands of concurrent markets.

## Overview

| Property | Value |
|---|---|
| Owner | Betting Team |
| Language | Java 17 |
| Framework | Spring Boot 3 |
| Database | Hazelcast (cache), Kafka (events) |
| SLA | 99.99% uptime, <50ms response |
| On-Call | betting-oncall@sportpesa.com |

## Responsibilities

- Real-time odds calculation across all sports markets
- Market creation, suspension and settlement
- Odds feed publishing to downstream consumers via Kafka
- Integration with third-party data providers (Sportradar, Betgenius)
- Liability management in conjunction with risk-management service

## Key Dependencies

```
odds-engine
├── risk-management    (liability checks before odds publish)
├── user-auth          (API authentication)
├── kafka-cluster      (odds feed publishing)
└── hazelcast-cluster  (in-memory odds cache)
```

## SLOs

| Metric | Target |
|---|---|
| Availability | 99.99% |
| Odds update latency | < 50ms p99 |
| Market settlement time | < 5 seconds |
| Error rate | < 0.01% |
