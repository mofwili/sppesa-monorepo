# API Reference

## Base URL
`https://api.sportpesa.com/wallet/v1`

## Endpoints

### GET /wallet/{userId}/balance
Returns player wallet balance.

### POST /wallet/{userId}/deposit
Initiates a deposit. Delegates to payment-gateway.

### POST /wallet/{userId}/withdraw
Initiates a withdrawal request with KYC and fraud checks.

### GET /wallet/{userId}/transactions
Returns paginated transaction history.
