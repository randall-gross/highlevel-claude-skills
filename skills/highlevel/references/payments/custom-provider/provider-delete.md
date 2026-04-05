# Delete Integration

- **Method:** DELETE
- **Path:** `/payments/custom-provider/provider`
- **Scopes:** `payments/custom-provider.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| providerId | string | Yes | Provider integration ID to delete |

## Request Example

```bash
curl -X DELETE "https://services.leadconnectorhq.com/payments/custom-provider/provider?providerId=provider_abc123" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
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
| 400 | Missing or invalid providerId |
| 401 | Unauthorized — invalid or expired token |
| 404 | Integration not found |
| 409 | Integration is still connected to one or more locations |
| 422 | Unprocessable Entity |

## Common Use Cases

Remove a custom payment provider integration that is no longer needed.

## Gotchas

- You must disconnect all locations from this provider before deleting the integration. Attempting to delete while locations are connected returns 409.
- This permanently removes the integration definition — it cannot be recovered.
