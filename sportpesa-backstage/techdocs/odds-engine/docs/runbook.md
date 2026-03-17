# Runbook

## Common Issues

### High odds latency (>50ms p99)

**Symptoms:** Grafana alert `odds_latency_high`, customer complaints about stale odds.

**Steps:**
1. Check Hazelcast cluster health: `kubectl exec -it hazelcast-0 -n platform -- hz-healthcheck`
2. Check Kafka consumer lag: `kubectl exec -it kafka-0 -n platform -- kafka-consumer-groups.sh --describe --group odds-engine`
3. Check pod CPU/memory: `kubectl top pods -n betting -l app=odds-engine`
4. If Kafka lag >10k, scale up pods: `kubectl scale deployment odds-engine -n betting --replicas=6`
5. If Hazelcast memory >85%, trigger eviction: restart hazelcast pods one at a time

### Market settlement failure

**Symptoms:** Unsettled markets in dashboard, alert `market_settlement_failed`.

**Steps:**
1. Check settlement logs: `kubectl logs -l app=odds-engine -n betting | grep SETTLEMENT_FAILED`
2. Identify affected market IDs from logs
3. Trigger manual settlement via admin API: `POST /admin/markets/{marketId}/settle`
4. Escalate to betting team lead if >10 markets affected

### Feed disconnect

**Symptoms:** Alert `feed_disconnect`, odds not updating.

**Steps:**
1. Check feed processor logs: `kubectl logs -l app=odds-engine -n betting | grep FEED`
2. Restart feed processor pod: `kubectl rollout restart deployment odds-engine -n betting`
3. If issue persists, check Sportradar status page
4. Failover to Betgenius feed via config: set `odds.feed.primary=betgenius` in ConfigMap

## Escalation Path

1. On-call engineer (PagerDuty)
2. Betting Team Lead
3. CTO (P1 incidents only)
