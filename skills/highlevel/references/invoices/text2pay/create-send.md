# Create and Send Text2Pay Link

- **Method:** POST
- **Path:** `/invoices/text2pay`
- **Scopes:** `invoices.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |
| contactId | string | Yes | Contact ID |
| name | string | Yes | Invoice/payment name |
| items | array | Yes | Line items |
| items[].name | string | Yes | Item name |
| items[].description | string | No | Item description |
| items[].quantity | integer | Yes | Quantity |
| items[].unitPrice | integer | Yes | Unit price in cents |
| dueDate | string | No | Due date (ISO 8601) |
| currency | string | No | Currency code (default: USD) |
| sendViaSms | boolean | No | Send payment link via SMS (default: true) |
| sendViaEmail | boolean | No | Send payment link via email (default: false) |

## Request Example
```json
{
  "altId": "ve9EPM428h8vShlRW1KT",
  "altType": "location",
  "contactId": "nmFmQEsNgz6AVpgLVUJ0",
  "name": "Service Payment",
  "items": [
    {
      "name": "Emergency Repair",
      "description": "After-hours plumbing repair",
      "quantity": 1,
      "unitPrice": 35000
    }
  ],
  "dueDate": "2026-04-11T00:00:00.000Z",
  "sendViaSms": true,
  "sendViaEmail": true
}
```

## Response Example
```json
{
  "invoice": {
    "_id": "inv_t2p_abc123",
    "name": "Service Payment",
    "status": "sent",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "total": 35000,
    "paymentLink": "https://pay.leadconnectorhq.com/inv_t2p_abc123",
    "sentVia": ["sms", "email"],
    "createdAt": "2026-04-04T12:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing required fields |
| 401 | Unauthorized — invalid or expired token |
| 422 | Contact missing phone number (for SMS) or email (for email delivery) |

## Common Use Cases
Create an invoice and immediately send a payment link via SMS for quick mobile payments. Ideal for field service businesses collecting payment on-site or after a service call.

## Gotchas
- This is a combined create-and-send operation. The invoice is created and sent in a single call — no draft stage.
- `sendViaSms` requires the contact to have a phone number. `sendViaEmail` requires an email.
- `unitPrice` in cents (35000 = $350.00).
- The `paymentLink` URL is a hosted payment page — do not construct payment URLs manually.
- Text2Pay requires SMS capabilities to be enabled and configured on the location (e.g., Twilio/LC Phone).
