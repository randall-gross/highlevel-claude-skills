# Create White-Label Provider

- **Method:** POST
- **Path:** `/payments/integrations/provider/whitelabel`
- **Scopes:** `payments/integration.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| name | string | Yes | Provider display name |
| description | string | No | Provider description |
| imageUrl | string | No | Provider logo URL |
| config | object | Yes | Provider configuration |

## Request Example

```bash
curl -X POST "https://services.leadconnectorhq.com/payments/integrations/provider/whitelabel" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28" \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "Agency Payments",
    "description": "Secure payment processing by our agency",
    "imageUrl": "https://agency.com/logo.png",
    "config": {}
  }'
```

## Response Example

```json
{
  "provider": {
    "id": "wl_provider_001",
    "name": "Agency Payments",
    "description": "Secure payment processing by our agency",
    "imageUrl": "https://agency.com/logo.png",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "createdAt": "2024-01-05T08:00:00Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing required fields |
| 401 | Unauthorized — invalid or expired token |
| 409 | White-label provider already exists for this location |
| 422 | Unprocessable Entity |

## Common Use Cases

Set up a branded payment integration so agency clients see the agency's brand rather than a third-party payment processor name.

## Gotchas

- White-label providers are tied to a specific location.
- The `config` object structure depends on the underlying payment processor being white-labeled.
- A location typically supports only one white-label provider at a time.
