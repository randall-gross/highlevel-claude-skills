# Delete Estimate

- **Method:** DELETE
- **Path:** `/invoices/estimate/{estimateId}`
- **Scopes:** `invoices/estimate.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| estimateId | string | Yes | Estimate ID |

### Query Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |

## Request Example
```bash
curl -X DELETE "https://services.leadconnectorhq.com/invoices/estimate/est_abc123?altId=ve9EPM428h8vShlRW1KT&altType=location" \
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
| 400 | Missing altId or altType |
| 401 | Unauthorized — invalid or expired token |
| 404 | Estimate not found |
| 422 | Cannot delete estimate in current status |

## Common Use Cases
Remove an unwanted draft estimate.

## Gotchas
- Only `draft` estimates can be deleted. Sent or accepted estimates cannot be removed.
- Deletion is permanent.
