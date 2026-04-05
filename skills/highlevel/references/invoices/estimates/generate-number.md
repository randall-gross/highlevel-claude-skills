# Generate Estimate Number

- **Method:** GET
- **Path:** `/invoices/estimate/number/generate`
- **Scopes:** `invoices/estimate.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |

## Request Example
```bash
curl -X GET "https://services.leadconnectorhq.com/invoices/estimate/number/generate?altId=ve9EPM428h8vShlRW1KT&altType=location" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example
```json
{
  "estimateNumber": "003"
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing altId or altType |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Pre-fetch the next estimate number for display in a creation form.

## Gotchas
- The number is not reserved. Concurrent estimate creation may cause conflicts.
- Uses `altId`/`altType` instead of `locationId`.
