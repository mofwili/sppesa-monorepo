# API Reference

## Base URL
`https://api.sportpesa.com/odds-engine/v1`

## Authentication
All endpoints require a valid JWT token in the `Authorization: Bearer <token>` header.

## Endpoints

### GET /odds/{marketId}
Returns current odds for a market.

**Parameters:**
- `marketId` (path, required) — Market identifier

**Response:**
```json
{
  "marketId": "EPL-MAN-CHE-2024",
  "status": "active",
  "outcomes": [
    { "id": "home", "name": "Manchester City", "odds": 1.85 },
    { "id": "draw", "name": "Draw", "odds": 3.40 },
    { "id": "away", "name": "Chelsea", "odds": 4.20 }
  ],
  "updatedAt": "2024-03-17T14:00:00Z"
}
```

### GET /markets
Returns all active markets.

**Query Parameters:**
- `sport` (optional) — Filter by sport (football, basketball, tennis)
- `status` (optional) — Filter by status (active, suspended, settled)
- `limit` (optional, default 50) — Page size

### POST /admin/markets/{marketId}/suspend
Suspends a market (admin only).

### POST /admin/markets/{marketId}/settle
Manually settles a market (admin only).
