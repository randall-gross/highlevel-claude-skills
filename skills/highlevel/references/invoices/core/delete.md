# Delete Invoice

- **Method:** DELETE
- **Path:** `/invoices/{invoiceId}`
- **Scopes:** `invoices.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| invoiceId | string | Yes | Invoice ID |

### Query Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |

## Request Example
```bash
curl -X DELETE "https://services.leadconnectorhq.com/invoices/inv_abc123?altId=ve9EPM428h8vShlRW1KT&altType=location" \
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
| 404 | Invoice not found |
| 422 | Cannot delete invoice in current status |

## Common Use Cases
Remove a draft invoice that is no longer needed.

## Gotchas
- Only `draft` invoices can be deleted. Sent/paid invoices must be voided instead.
- Deletion is permanent and cannot be undone.
