# Get Transaction

- **Method:** GET
- **Path:** `/payments/transactions/{transactionId}`
- **Scopes:** `payments/transactions.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| transactionId | string | Yes | Transaction ID |

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |

## Request Example

```bash
curl -X GET "https://services.leadconnectorhq.com/payments/transactions/txn_abc123?locationId=ve9EPM428h8vShlRW1KT" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example

```json
{
  "transaction": {
    "id": "txn_abc123",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "contactId": "contact_xyz789",
    "amount": 9999,
    "currency": "USD",
    "status": "succeeded",
    "type": "charge",
    "orderId": "order_abc123",
    "subscriptionId": null,
    "paymentMethod": "card",
    "cardLast4": "4242",
    "cardBrand": "visa",
    "refundedAmount": 0,
    "createdAt": "2024-01-15T10:05:00Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing or invalid parameters |
| 401 | Unauthorized — invalid or expired token |
| 404 | Transaction not found |
| 422 | Unprocessable Entity |

## Common Use Cases

Retrieve full transaction details for receipt generation, dispute resolution, or refund processing.

## Gotchas

- `refundedAmount` may be partial — check against `amount` to determine if fully or partially refunded.
- Amounts are in cents.
