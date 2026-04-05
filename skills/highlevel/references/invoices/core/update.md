# Update Invoice

- **Method:** PUT
- **Path:** `/invoices/{invoiceId}`
- **Scopes:** `invoices.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| invoiceId | string | Yes | Invoice ID |

### Body Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |
| name | string | No | Invoice name/title |
| items | array | No | Array of line items |
| dueDate | string | No | Due date (ISO 8601) |
| currency | string | No | Currency code |
| discount | object | No | Discount configuration |
| termsNotes | string | No | Terms and notes |

## Request Example
```json
{
  "altId": "ve9EPM428h8vShlRW1KT",
  "altType": "location",
  "name": "Updated Web Design Invoice",
  "items": [
    {
      "name": "Homepage Redesign",
      "quantity": 1,
      "unitPrice": 300000
    }
  ],
  "dueDate": "2026-05-15T00:00:00.000Z"
}
```

## Response Example
```json
{
  "invoice": {
    "_id": "inv_abc123",
    "name": "Updated Web Design Invoice",
    "status": "draft",
    "total": 300000,
    "amountDue": 300000,
    "dueDate": "2026-05-15T00:00:00.000Z",
    "updatedAt": "2026-04-04T14:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing altId/altType or invalid data |
| 401 | Unauthorized — invalid or expired token |
| 404 | Invoice not found |
| 422 | Validation error |

## Common Use Cases
Modify an existing draft invoice before sending, such as adjusting line items or due date.

## Gotchas
- Only `draft` invoices can be updated. Sent or paid invoices cannot be modified.
- The `items` array replaces all existing items — it is not a partial merge.
- Requires `altId` and `altType` in the body.
