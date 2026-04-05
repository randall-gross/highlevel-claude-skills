# Disconnect Provider

- **Method:** POST
- **Path:** `/payments/custom-provider/disconnect`
- **Scopes:** `payments/custom-provider.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |

## Request Example

```bash
curl -X POST "https://services.leadconnectorhq.com/payments/custom-provider/disconnect" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28" \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT"
  }'
```

## Response Example

```json
{
  "success": true
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing locationId |
| 401 | Unauthorized — invalid or expired token |
| 404 | No provider connected for this location |
| 422 | Unprocessable Entity |

## Common Use Cases

Remove a custom payment provider connection when switching providers or reverting to HighLevel's default payment processing.

## Gotchas

- This is a POST, not a DELETE, despite the destructive action.
- Disconnecting does not cancel active subscriptions or refund orders — it only removes the provider config.
- Existing orders and transactions remain in the system.
