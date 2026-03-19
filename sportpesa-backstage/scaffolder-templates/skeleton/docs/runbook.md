# Runbook

## Health Check

```bash
kubectl get pods -n ${{ values.namespace }} -l app=${{ values.name }}
kubectl logs -f -l app=${{ values.name }} -n ${{ values.namespace }}
```

## Rollout Issues

### Canary stuck / not progressing
```bash
kubectl argo rollouts get rollout ${{ values.name }} -n ${{ values.namespace }}
kubectl argo rollouts promote ${{ values.name }} -n ${{ values.namespace }}
```

### Rollout degraded — abort immediately
```bash
kubectl argo rollouts abort ${{ values.name }} -n ${{ values.namespace }}
kubectl argo rollouts undo ${{ values.name }} -n ${{ values.namespace }}
```

### Pod crashlooping
```bash
kubectl describe pod -l app=${{ values.name }} -n ${{ values.namespace }}
kubectl logs -l app=${{ values.name }} -n ${{ values.namespace }} --previous
```

## Escalation

- Slack: #${{ values.domain }}-oncall
- Team: ${{ values.owner }}
