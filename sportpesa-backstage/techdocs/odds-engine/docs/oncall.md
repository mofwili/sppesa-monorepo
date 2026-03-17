# On-Call Guide

## Alert Reference

| Alert | Severity | Action |
|---|---|---|
| `odds_latency_high` | P2 | Scale pods, check Hazelcast |
| `market_settlement_failed` | P1 | Manual settle, escalate |
| `feed_disconnect` | P1 | Restart, failover feed |
| `odds_engine_down` | P1 | Immediate escalation |
| `kafka_consumer_lag_high` | P2 | Scale consumers |

## Key Commands

```bash
# Check pod health
kubectl get pods -n betting -l app=odds-engine

# View live logs
kubectl logs -f -l app=odds-engine -n betting

# Scale up
kubectl scale deployment odds-engine -n betting --replicas=6

# Rolling restart
kubectl rollout restart deployment odds-engine -n betting

# Check Hazelcast
kubectl exec -it hazelcast-0 -n platform -- hz-healthcheck

# Check Kafka lag
kubectl exec -it kafka-0 -n platform -- kafka-consumer-groups.sh \
  --bootstrap-server localhost:9092 \
  --describe --group odds-engine
```

## Contacts

- Betting Team Lead: betting-lead@sportpesa.com
- PagerDuty: https://sportpesa.pagerduty.com/services/odds-engine
- Slack: #betting-oncall
