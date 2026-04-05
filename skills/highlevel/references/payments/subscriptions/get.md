# Get Subscription

- **Method:** GET
- **Path:** `/payments/subscriptions/{subscriptionId}`
- **Scopes:** `payments/subscriptions.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| subscriptionId | string | Yes | Subscription ID |

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |

## Request Example

```bash
curl -X GET "https://services.leadconnectorhq.com/payments/subscriptions/sub_abc123?locationId=ve9EPM428h8vShlRW1KT" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example

```json
{
  "subscription": {
    "id": "sub_abc123",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "contactId": "contact_xyz789",
    "status": "active",
    "planName": "Monthly Premium",
    "amount": 4999,
    "currency": "USD",
    "interval": "month",
    "intervalCount": 1,
    "currentPeriodStart": "2024-01-01T00:00:00Z",
    "currentPeriodEnd": "2024-02-01T00:00:00Z",
    "cancelAtPeriodEnd": false,
    "createdAt": "2023-06-15T10:00:00Z",
    "updatedAt": "2024-01-01T00:00:00Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing or invalid parameters |
| 401 | Unauthorized — invalid or expired token |
| 404 | Subscription not found |
| 422 | Unprocessable Entity |

## Common Use Cases

Fetch full subscription details to display billing info, check renewal dates, or verify active status.

## Gotchas

- `cancelAtPeriodEnd` indicates a pending cancellation — the subscription is still active until the period ends.
- Amounts are in cents.
