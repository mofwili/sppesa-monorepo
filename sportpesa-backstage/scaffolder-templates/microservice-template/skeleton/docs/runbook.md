# Runbook

## Health Check

```bash
kubectl get pods -n ${{ values.namespace }} -l app=${{ values.name }}
kubectl logs -f -l app=${{ values.name }} -n ${{ values.namespace }}
```

## Common Issues

Document common issues and their resolutions here.

## Escalation

- Slack: #${{ values.domain }}-oncall
- Team: ${{ values.owner }}
