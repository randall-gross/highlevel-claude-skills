# Void Invoice

- **Method:** POST
- **Path:** `/invoices/{invoiceId}/void`
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

## Request Example
```json
{
  "altId": "ve9EPM428h8vShlRW1KT",
  "altType": "location"
}
```

## Response Example
```json
{
  "invoice": {
    "_id": "inv_abc123",
    "status": "void",
    "voidedAt": "2026-04-04T12:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing altId/altType or invoice already void |
| 401 | Unauthorized — invalid or expired token |
| 404 | Invoice not found |
| 422 | Cannot void a fully paid invoice |

## Common Use Cases
Void a sent invoice that should no longer be collected, such as when a project is cancelled or the invoice was created in error.

## Gotchas
- Voiding is irreversible. A voided invoice cannot be un-voided or re-sent.
- Partially paid invoices can be voided, but fully paid invoices cannot.
- Voiding does not issue a refund for any payments already collected.
