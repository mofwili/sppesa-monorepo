# Architecture

## High-Level Design

The Odds Engine follows an event-driven architecture consuming sports data feeds and publishing computed odds to Kafka topics consumed by the betting frontend and other downstream services.

```
Sports Data Feeds
      │
      ▼
┌─────────────────┐     ┌──────────────────┐
│  Feed Processor │────▶│  Odds Calculator  │
└─────────────────┘     └────────┬─────────┘
                                  │
                    ┌─────────────▼───────────┐
                    │     Hazelcast Cache      │
                    │   (live odds store)      │
                    └─────────────┬───────────┘
                                  │
                    ┌─────────────▼───────────┐
                    │      Kafka Producer      │
                    │  topic: odds.updates     │
                    └─────────────────────────┘
```

## Components

### Feed Processor
Consumes raw sports events from Sportradar and Betgenius WebSocket feeds, normalises the data and triggers odds recalculation.

### Odds Calculator
Core engine implementing the pricing model. Uses mathematical models to compute fair odds, applies margin and adjusts for liability exposure from the risk-management service.

### Hazelcast Cache
All live odds are stored in Hazelcast for sub-millisecond read access. The cache is replicated across all cluster nodes for high availability.

### Kafka Producer
Publishes odds update events to the `odds.updates` topic consumed by the betting API and frontend.

## Scaling Strategy

The service scales horizontally. Each pod processes a partition of the sports feed. Hazelcast handles state synchronisation across pods.
