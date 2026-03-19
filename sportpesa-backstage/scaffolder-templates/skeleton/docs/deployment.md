# Deployment

## GitOps Flow

This service uses **GitHub Actions + ArgoCD + Argo Rollouts** for deployment.

```
git push → GitHub Actions → Docker image → ArgoCD → Argo Rollouts canary → Production
```

## Canary Rollout Strategy

Every new deployment goes through a canary process:

| Step | Traffic | Duration |
|---|---|---|
| Initial canary | ${{ values.canaryWeight }}% | 2 minutes |
| Analysis (success rate check) | ${{ values.canaryWeight }}% | Auto |
| Mid canary | 50% | 2 minutes |
| Full promotion | 100% | - |

If the success rate drops below 95% during analysis, the rollout is automatically aborted and traffic returns to the stable version.

## Manual Rollout Commands

```bash
# Check rollout status
kubectl argo rollouts get rollout ${{ values.name }} -n ${{ values.namespace }}

# Watch live rollout progress
kubectl argo rollouts get rollout ${{ values.name }} -n ${{ values.namespace }} --watch

# Manually promote canary to next step
kubectl argo rollouts promote ${{ values.name }} -n ${{ values.namespace }}

# Abort a bad rollout
kubectl argo rollouts abort ${{ values.name }} -n ${{ values.namespace }}

# Undo to previous version
kubectl argo rollouts undo ${{ values.name }} -n ${{ values.namespace }}
```

## ArgoCD

The ArgoCD application auto-syncs on every push to `main` that changes files under `services/${{ values.name }}/k8s/`.

- ArgoCD UI: http://argocd.sportpesa.com/applications/${{ values.name }}
- Auto-sync: enabled
- Self-heal: enabled
- Pruning: enabled
