# Architecture

## Overview

`${{ values.name }}` is a Go REST API service built with the Gin framework, deployed on Kubernetes via ArgoCD with Argo Rollouts canary strategy.

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Go 1.22 |
| Framework | Gin |
| Container | Docker (scratch base) |
| Orchestration | Kubernetes |
| CI | GitHub Actions |
| CD | ArgoCD |
| Rollout strategy | Argo Rollouts (canary) |

## Request Flow

```
Client → Nginx Ingress → Stable/Canary Service → Rollout Pods → Handler → Response
```

## Repository Structure

```
services/${{ values.name }}/
├── cmd/server/         # Main entry point
├── internal/
│   ├── config/         # Configuration loading
│   ├── handler/        # HTTP handlers and route registration
│   └── middleware/     # Logger, recovery, CORS
├── k8s/
│   ├── rollout.yaml    # Argo Rollout + Services + AnalysisTemplate
│   └── argocd-app.yaml # ArgoCD Application manifest
├── docs/               # TechDocs
├── Dockerfile
├── go.mod
├── mkdocs.yml
└── catalog-info.yaml
```
