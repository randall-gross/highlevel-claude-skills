# Update Estimate

- **Method:** PUT
- **Path:** `/invoices/estimate/{estimateId}`
- **Scopes:** `invoices/estimate.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| estimateId | string | Yes | Estimate ID |

### Body Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |
| name | string | No | Estimate name/title |
| items | array | No | Array of line items |
| expiryDate | string | No | Expiry date (ISO 8601) |
| currency | string | No | Currency code |
| termsNotes | string | No | Terms and notes |

## Request Example
```json
{
  "altId": "ve9EPM428h8vShlRW1KT",
  "altType": "location",
  "name": "Updated Website Estimate",
  "items": [
    {
      "name": "Full Website Redesign",
      "quantity": 1,
      "unitPrice": 450000
    }
  ]
}
```

## Response Example
```json
{
  "estimate": {
    "_id": "est_abc123",
    "name": "Updated Website Estimate",
    "status": "draft",
    "total": 450000,
    "updatedAt": "2026-04-04T14:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing altId/altType or invalid data |
| 401 | Unauthorized — invalid or expired token |
| 404 | Estimate not found |
| 422 | Validation error |

## Common Use Cases
Revise an estimate's line items or terms before sending to the client.

## Gotchas
- Only `draft` estimates can be updated.
- The `items` array is a full replacement, not a partial merge.
