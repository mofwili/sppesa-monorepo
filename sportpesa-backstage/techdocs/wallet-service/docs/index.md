# Wallet Service

The Wallet Service manages all player financial accounts at SportPesa including deposits, withdrawals, balance management and transaction history.

## Overview

| Property | Value |
|---|---|
| Owner | Payments Team |
| Language | Java 17 |
| Framework | Spring Boot 3 |
| Database | MySQL (transactions), RabbitMQ (events) |
| SLA | 99.999% uptime, <200ms response |
| On-Call | payments-oncall@sportpesa.com |

## Responsibilities

- Player wallet creation and management
- Deposit processing with real-time balance updates
- Withdrawal requests with fraud and KYC checks
- Transaction history and reporting
- Bonus wallet management
- Integration with payment-gateway for fund movements

## Key Dependencies

```
wallet-service
├── payment-gateway   (fund movement execution)
├── kyc-service       (withdrawal verification)
├── mysql-db          (transaction ledger)
└── rabbitmq-cluster  (async events)
```

## SLOs

| Metric | Target |
|---|---|
| Availability | 99.999% |
| Deposit processing | < 200ms p99 |
| Withdrawal processing | < 2 seconds p99 |
| Balance query | < 50ms p99 |
