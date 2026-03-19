# API Reference

## Base URL
`https://api.sportpesa.com/${{ values.name }}/v1`

## Health Endpoints

### GET /healthz
Liveness probe — returns 200 if the service is running.

```json
{
  "status": "healthy",
  "service": "${{ values.name }}",
  "env": "production",
  "time": "2024-03-17T14:00:00Z"
}
```

### GET /readyz
Readiness probe — returns 200 when the service is ready to receive traffic.

```json
{ "status": "ready" }
```

## Service Endpoints

### GET /api/v1/ping

```json
{ "message": "pong" }
```

> Add your service-specific endpoints here as you build them out.
