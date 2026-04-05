# Get Invoice

- **Method:** GET
- **Path:** `/invoices/{invoiceId}`
- **Scopes:** `invoices.readonly`
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
curl -X GET "https://services.leadconnectorhq.com/invoices/inv_abc123?altId=ve9EPM428h8vShlRW1KT&altType=location" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example
```json
{
  "invoice": {
    "_id": "inv_abc123",
    "name": "Invoice #001",
    "invoiceNumber": "001",
    "status": "sent",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "currency": "USD",
    "items": [
      {
        "name": "Web Design Services",
        "description": "Homepage redesign",
        "quantity": 1,
        "unitPrice": 15000,
        "amount": 15000
      }
    ],
    "total": 15000,
    "amountDue": 15000,
    "amountPaid": 0,
    "dueDate": "2026-05-01T00:00:00.000Z",
    "sentTo": {
      "email": "client@example.com"
    },
    "createdAt": "2026-04-01T12:00:00.000Z",
    "updatedAt": "2026-04-01T12:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing altId or altType |
| 401 | Unauthorized — invalid or expired token |
| 404 | Invoice not found |

## Common Use Cases
Retrieve full details of a single invoice including line items and payment status.

## Gotchas
- Requires both `altId` and `altType` query params even though the invoice ID is in the path.
- Amounts are in cents.
