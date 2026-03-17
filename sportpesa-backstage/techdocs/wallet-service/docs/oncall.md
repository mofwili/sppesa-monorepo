# On-Call Guide

## Alert Reference

| Alert | Severity | Action |
|---|---|---|
| `wallet_deposit_failure_rate_high` | P1 | Check payment-gateway, escalate |
| `wallet_balance_query_latency` | P2 | Check MySQL replica, restart pods |
| `wallet_withdrawal_stuck` | P2 | Check KYC/fraud pipeline |
| `wallet_service_down` | P1 | Immediate escalation |

## Contacts

- Payments Team Lead: payments-lead@sportpesa.com
- Slack: #payments-oncall
- PagerDuty: https://sportpesa.pagerduty.com/services/wallet-service
