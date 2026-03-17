# On-Call Guide

## Key Commands

```bash
# Check pods
kubectl get pods -n payments -l app=kyc-service

# Restart service
kubectl rollout restart deployment kyc-service -n payments

# View logs
kubectl logs -f -l app=kyc-service -n payments
```

## Contacts

- Slack: #payments-oncall
- Email: payments-oncall@sportpesa.com
