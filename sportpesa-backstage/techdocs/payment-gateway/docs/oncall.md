# On-Call Guide

## Key Commands

```bash
# Check pods
kubectl get pods -n payments -l app=payment-gateway

# Restart service
kubectl rollout restart deployment payment-gateway -n payments

# View logs
kubectl logs -f -l app=payment-gateway -n payments
```

## Contacts

- Slack: #payments-oncall
- Email: payments-oncall@sportpesa.com
