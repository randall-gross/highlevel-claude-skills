# Create New Integration

- **Method:** POST
- **Path:** `/payments/custom-provider/provider`
- **Scopes:** `payments/custom-provider.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| name | string | Yes | Integration display name |
| description | string | No | Integration description |
| paymentsUrl | string | Yes | URL for payment processing |
| queryUrl | string | Yes | URL for querying payment status |
| imageUrl | string | No | Integration logo URL |

## Request Example

```bash
curl -X POST "https://services.leadconnectorhq.com/payments/custom-provider/provider" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28" \
  -d '{
    "name": "My Custom Gateway",
    "description": "Custom payment gateway integration",
    "paymentsUrl": "https://api.mygateway.com/payments",
    "queryUrl": "https://api.mygateway.com/query",
    "imageUrl": "https://mygateway.com/logo.png"
  }'
```

## Response Example

```json
{
  "provider": {
    "id": "provider_abc123",
    "name": "My Custom Gateway",
    "description": "Custom payment gateway integration",
    "paymentsUrl": "https://api.mygateway.com/payments",
    "queryUrl": "https://api.mygateway.com/query",
    "imageUrl": "https://mygateway.com/logo.png",
    "createdAt": "2024-01-10T08:00:00Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing required fields or invalid URLs |
| 401 | Unauthorized — invalid or expired token |
| 409 | Integration name already exists |
| 422 | Unprocessable Entity |

## Common Use Cases

Register a new custom payment gateway integration that locations can then connect to via the `/connect` endpoint.

## Gotchas

- This creates the integration definition, not the connection. Locations still need to call `/connect` to use it.
- `paymentsUrl` and `queryUrl` must be publicly accessible HTTPS endpoints.
- This is a company-level operation — the integration is available to all locations under the company.
