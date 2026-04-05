# Delete Estimate Template

- **Method:** DELETE
- **Path:** `/invoices/estimate/template/{templateId}`
- **Scopes:** `invoices/template.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| templateId | string | Yes | Template ID |

### Query Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |

## Request Example
```bash
curl -X DELETE "https://services.leadconnectorhq.com/invoices/estimate/template/etmpl_abc123?altId=ve9EPM428h8vShlRW1KT&altType=location" \
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
| 404 | Template not found |

## Common Use Cases
Remove an outdated or unused estimate template.

## Gotchas
- Deletion is permanent and does not affect estimates already created from this template.
