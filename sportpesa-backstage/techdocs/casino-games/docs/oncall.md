# On-Call Guide

## Key Commands

```bash
# Check pods
kubectl get pods -n casino -l app=casino-games

# Restart service
kubectl rollout restart deployment casino-games -n casino

# View logs
kubectl logs -f -l app=casino-games -n casino
```

## Contacts

- Slack: #casino-oncall
- Email: casino-oncall@sportpesa.com
