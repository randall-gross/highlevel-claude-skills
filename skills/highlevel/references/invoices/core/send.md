# Send Invoice

- **Method:** POST
- **Path:** `/invoices/{invoiceId}/send`
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
    "status": "sent",
    "sentAt": "2026-04-04T12:00:00.000Z",
    "sentTo": {
      "email": "client@example.com"
    }
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing altId/altType or invoice not in sendable state |
| 401 | Unauthorized — invalid or expired token |
| 404 | Invoice not found |
| 422 | Contact has no email address |

## Common Use Cases
Send a draft invoice to the associated contact via email, transitioning its status from draft to sent.

## Gotchas
- Invoice must be in `draft` status to send. Already sent invoices return an error.
- The contact must have an email address on file or the send will fail with 422.
- Sending triggers HighLevel workflows subscribed to the invoice-sent event.
