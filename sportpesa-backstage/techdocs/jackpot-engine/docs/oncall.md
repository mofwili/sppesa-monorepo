# On-Call Guide

## Key Commands

```bash
# Check pods
kubectl get pods -n casino -l app=jackpot-engine

# Restart service
kubectl rollout restart deployment jackpot-engine -n casino

# View logs
kubectl logs -f -l app=jackpot-engine -n casino
```

## Contacts

- Slack: #casino-oncall
- Email: casino-oncall@sportpesa.com
