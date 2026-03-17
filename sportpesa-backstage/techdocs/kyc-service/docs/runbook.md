# Runbook

## Health Check

```bash
kubectl get pods -n payments -l app=kyc-service
kubectl logs -f -l app=kyc-service -n payments
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

- Team Slack: #payments-oncall
- PagerDuty: https://sportpesa.pagerduty.com/services/kyc-service
