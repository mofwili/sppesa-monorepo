# Runbook

## Common Issues

### Deposit not reflecting

**Steps:**
1. Check payment-gateway logs for transaction ID
2. Verify RabbitMQ message delivered: check `wallet.deposits` queue
3. Check MySQL for transaction record: `SELECT * FROM transactions WHERE external_ref = '<txn_id>'`
4. If payment confirmed but wallet not updated, trigger manual reconciliation
5. Contact payments-lead if >50 affected transactions

### Withdrawal stuck in pending

**Steps:**
1. Check KYC status for player: `GET /kyc/{userId}/status`
2. Check fraud score: review fraud-detection service logs
3. If KYC approved and no fraud flag, check payment-gateway connectivity
4. Manually release withdrawal via admin API if all checks pass

### High balance query latency

**Steps:**
1. Check MySQL replica lag: `SHOW SLAVE STATUS\G`
2. Check connection pool: `kubectl describe pod -l app=wallet-service -n payments`
3. Restart pods if connection pool exhausted: `kubectl rollout restart deployment wallet-service -n payments`

## Key Commands

```bash
kubectl get pods -n payments -l app=wallet-service
kubectl logs -f -l app=wallet-service -n payments
kubectl rollout restart deployment wallet-service -n payments
```
