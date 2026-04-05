# Create Provider Config

- **Method:** POST
- **Path:** `/payments/custom-provider/connect`
- **Scopes:** `payments/custom-provider.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| providerId | string | Yes | Provider integration ID |
| liveMode | boolean | No | Enable live mode (default: false) |
| config | object | Yes | Provider-specific configuration |
| config.apiKey | string | Yes | Provider API key |
| config.secretKey | string | Yes | Provider secret key |
| config.webhookUrl | string | No | Webhook endpoint URL |

## Request Example

```bash
curl -X POST "https://services.leadconnectorhq.com/payments/custom-provider/connect" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28" \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "providerId": "provider_abc123",
    "liveMode": false,
    "config": {
      "apiKey": "pk_test_abc123",
      "secretKey": "sk_test_xyz789",
      "webhookUrl": "https://example.com/webhook"
    }
  }'
```

## Response Example

```json
{
  "provider": {
    "locationId": "ve9EPM428h8vShlRW1KT",
    "providerId": "provider_abc123",
    "name": "Custom Gateway",
    "connected": true,
    "liveMode": false,
    "createdAt": "2024-01-10T08:00:00Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing required fields or invalid config |
| 401 | Unauthorized — invalid or expired token |
| 409 | Provider already connected for this location |
| 422 | Unprocessable Entity |

## Common Use Cases

Connect a custom payment gateway (e.g., Authorize.net, Square) to a HighLevel location.

## Gotchas

- A location can only have one custom provider connected at a time. Disconnect the existing one first.
- Start with `liveMode: false` to test before going live.
- The `providerId` must reference an existing integration created via the provider endpoint.
