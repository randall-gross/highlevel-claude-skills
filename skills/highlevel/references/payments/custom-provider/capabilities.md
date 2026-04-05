# Update Provider Capabilities

- **Method:** PUT
- **Path:** `/payments/custom-provider/capabilities`
- **Scopes:** `payments/custom-provider.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| capabilities | object | Yes | Provider capability flags |
| capabilities.subscriptions | boolean | No | Supports recurring subscriptions |
| capabilities.refunds | boolean | No | Supports refunds |
| capabilities.partialRefunds | boolean | No | Supports partial refunds |
| capabilities.cardOnFile | boolean | No | Supports saving cards |

## Request Example

```bash
curl -X PUT "https://services.leadconnectorhq.com/payments/custom-provider/capabilities" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28" \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "capabilities": {
      "subscriptions": true,
      "refunds": true,
      "partialRefunds": true,
      "cardOnFile": false
    }
  }'
```

## Response Example

```json
{
  "success": true,
  "capabilities": {
    "subscriptions": true,
    "refunds": true,
    "partialRefunds": true,
    "cardOnFile": false
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing required fields or invalid values |
| 401 | Unauthorized — invalid or expired token |
| 404 | No provider connected for this location |
| 422 | Unprocessable Entity |

## Common Use Cases

Define what features your custom payment provider supports so HighLevel enables/disables corresponding UI and workflow options.

## Gotchas

- A provider must be connected before capabilities can be updated.
- Setting a capability to `false` hides the corresponding feature in the HighLevel UI for that location.
- Capabilities determine what actions HighLevel will attempt — if you declare `refunds: true` but your provider doesn't actually support it, refund attempts will fail.
