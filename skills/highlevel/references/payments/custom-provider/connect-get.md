# Fetch Provider Config

- **Method:** GET
- **Path:** `/payments/custom-provider/connect`
- **Scopes:** `payments/custom-provider.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |

## Request Example

```bash
curl -X GET "https://services.leadconnectorhq.com/payments/custom-provider/connect?locationId=ve9EPM428h8vShlRW1KT" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
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
    "config": {
      "apiKey": "pk_***masked***",
      "webhookUrl": "https://example.com/webhook"
    },
    "createdAt": "2024-01-10T08:00:00Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing or invalid locationId |
| 401 | Unauthorized — invalid or expired token |
| 404 | No provider config found |
| 422 | Unprocessable Entity |

## Common Use Cases

Check if a custom payment provider is configured and connected for a location.

## Gotchas

- Returns 404 if no custom provider has been configured, not an empty object.
- Sensitive config values (API keys) are masked in the response.
