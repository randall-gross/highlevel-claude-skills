# List Subscriptions

- **Method:** GET
- **Path:** `/payments/subscriptions`
- **Scopes:** `payments/subscriptions.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| contactId | string | No | Filter by contact ID |
| status | string | No | Filter by subscription status |

## Request Example

```bash
curl -X GET "https://services.leadconnectorhq.com/payments/subscriptions?locationId=ve9EPM428h8vShlRW1KT&status=active" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example

```json
{
  "subscriptions": [
    {
      "id": "sub_abc123",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "contactId": "contact_xyz789",
      "status": "active",
      "planName": "Monthly Premium",
      "amount": 4999,
      "currency": "USD",
      "interval": "month",
      "currentPeriodStart": "2024-01-01T00:00:00Z",
      "currentPeriodEnd": "2024-02-01T00:00:00Z",
      "createdAt": "2023-06-15T10:00:00Z"
    }
  ],
  "total": 25
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing or invalid parameters |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity |

## Common Use Cases

Display active subscriptions for a location or look up all subscriptions for a specific contact.

## Gotchas

- Amounts are in cents (4999 = $49.99).
- Status values typically include `active`, `canceled`, `past_due`, `trialing`.
