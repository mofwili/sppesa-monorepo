# Runbook

## Health Check

```bash
kubectl get pods -n casino -l app=casino-games
kubectl logs -f -l app=casino-games -n casino
```

## Common Issues

### Service unavailable
1. Check pod status and restart if needed
2. Check database connectivity
3. Escalate if not resolved within 15 minutes

### High error rate
1. Check logs for error patterns
2. Check downstream dependencies
3. Rollback deployment if issue introduced by recent release

## Escalation

- Team Slack: #casino-oncall
- PagerDuty: https://sportpesa.pagerduty.com/services/casino-games
