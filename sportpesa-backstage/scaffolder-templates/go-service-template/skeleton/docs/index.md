# ${{ values.name }}

${{ values.description }}

## Overview

| Property | Value |
|---|---|
| Owner | ${{ values.owner }} |
| Domain | ${{ values.domain }} |
| Language | Go 1.22 |
| Framework | Gin |
| Port | ${{ values.port }} |
| Namespace | ${{ values.namespace }} |
| Lifecycle | ${{ values.lifecycle }} |

## Endpoints

| Method | Path | Description |
|---|---|---|
| GET | `/healthz` | Liveness probe |
| GET | `/readyz` | Readiness probe |
| GET | `/api/v1/ping` | Ping endpoint |

## Local Development

```bash
# Clone the repo
git clone https://github.com/mofwili/sppesa-monorepo.git
cd services/${{ values.name }}

# Run locally
go run ./cmd/server

# Run tests
go test ./...

# Build Docker image
docker build -t ${{ values.name }}:local .
docker run -p ${{ values.port }}:${{ values.port }} ${{ values.name }}:local
```

## Environment Variables

| Variable | Default | Description |
|---|---|---|
| `PORT` | `${{ values.port }}` | HTTP server port |
| `APP_ENV` | `development` | Application environment |
