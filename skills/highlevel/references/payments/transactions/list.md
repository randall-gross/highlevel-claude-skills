# List Transactions

- **Method:** GET
- **Path:** `/payments/transactions`
- **Scopes:** `payments/transactions.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| contactId | string | No | Filter by contact ID |
| limit | number | No | Number of results per page |
| offset | number | No | Pagination offset |

## Request Example

```bash
curl -X GET "https://services.leadconnectorhq.com/payments/transactions?locationId=ve9EPM428h8vShlRW1KT&limit=20&offset=0" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example

```json
{
  "transactions": [
    {
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
      "createdAt": "2024-01-15T10:05:00Z"
    }
  ],
  "total": 500,
  "limit": 20,
  "offset": 0
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing or invalid parameters |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity |

## Common Use Cases

Display transaction history for reporting, reconciliation, or customer payment history views.

## Gotchas

- Uses `limit`/`offset` pagination.
- Amounts are in cents.
- Transactions include both one-time charges and subscription renewals.
