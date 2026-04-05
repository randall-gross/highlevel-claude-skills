# Generate Invoice Number

- **Method:** GET
- **Path:** `/invoices/generate-invoice-number`
- **Scopes:** `invoices.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |

## Request Example
```bash
curl -X GET "https://services.leadconnectorhq.com/invoices/generate-invoice-number?locationId=ve9EPM428h8vShlRW1KT" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example
```json
{
  "invoiceNumber": "003"
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing locationId |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Pre-fetch the next sequential invoice number before creating an invoice, useful for displaying the number in a creation form.

## Gotchas
- The number is not reserved. If another invoice is created between generating and using the number, it may conflict.
- Numbers are sequential per location and zero-padded.
