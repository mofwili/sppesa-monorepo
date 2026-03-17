# Architecture

The Wallet Service uses a double-entry ledger pattern to ensure financial accuracy. Every balance change creates two ledger entries.

## Components

- **Ledger Engine** — Double-entry transaction recording in MySQL
- **Balance Cache** — Redis cache for real-time balance reads
- **Event Publisher** — RabbitMQ events for downstream consumers
- **Reconciliation Job** — Nightly reconciliation against payment-gateway

## Transaction Flow

```
Player Request
     │
     ▼
Wallet API ──▶ KYC Check ──▶ Fraud Check
     │
     ▼
Ledger Engine ──▶ MySQL
     │
     ▼
Event Publisher ──▶ RabbitMQ (wallet.events)
```
