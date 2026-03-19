#!/bin/bash
# ArgoCD + Argo Rollouts installation for SportPesa Kubernetes cluster

set -e

echo "=== Installing ArgoCD ==="
kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "=== Waiting for ArgoCD to be ready ==="
kubectl wait --for=condition=available deployment/argocd-server -n argocd --timeout=300s

echo "=== Patching ArgoCD server to NodePort ==="
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'

echo "=== Installing Argo Rollouts ==="
kubectl create namespace argo-rollouts --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml

echo "=== Waiting for Argo Rollouts to be ready ==="
kubectl wait --for=condition=available deployment/argo-rollouts -n argo-rollouts --timeout=300s

echo "=== Installing Argo Rollouts kubectl plugin ==="
curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-linux-amd64
chmod +x kubectl-argo-rollouts-linux-amd64
mv kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts

echo "=== Getting ArgoCD initial admin password ==="
kubectl -n argocd get secret argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d
echo ""

echo "=== ArgoCD NodePort ==="
kubectl get svc argocd-server -n argocd

echo ""
echo "=== Installation complete! ==="
echo "ArgoCD UI: http://10.4.2.56:<NodePort>"
echo "Username: admin"
echo "Password: (shown above)"
