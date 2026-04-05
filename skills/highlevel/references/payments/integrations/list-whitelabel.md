# List White-Label Providers

- **Method:** GET
- **Path:** `/payments/integrations/provider/whitelabel`
- **Scopes:** `payments/integration.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |

## Request Example

```bash
curl -X GET "https://services.leadconnectorhq.com/payments/integrations/provider/whitelabel?locationId=ve9EPM428h8vShlRW1KT" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example

```json
{
  "providers": [
    {
      "id": "wl_provider_001",
      "name": "Agency Payments",
      "description": "White-labeled payment processing",
      "imageUrl": "https://agency.com/logo.png",
      "connected": true,
      "createdAt": "2024-01-05T08:00:00Z"
    }
  ]
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing or invalid locationId |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity |

## Common Use Cases

List available white-label payment providers for a location to display provider options in an agency settings UI.

## Gotchas

- White-label providers are agency-branded payment integrations — they appear to end clients as the agency's own payment system.
- The `connected` field indicates whether the location is currently using this provider.
