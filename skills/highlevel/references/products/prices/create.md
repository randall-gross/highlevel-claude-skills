# Create Price

- **Method:** POST
- **Path:** `/products/{productId}/price`
- **Scopes:** `products/prices.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `productId` | string | Yes | The product ID |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `name` | string | Yes | Price name (e.g., "Monthly", "Annual") |
| `type` | string | Yes | Price type: `one_time` or `recurring` |
| `amount` | integer | Yes | Amount in smallest currency unit (cents for USD) |
| `currency` | string | Yes | ISO 4217 currency code (e.g., `USD`) |
| `recurring` | object | Conditional | Required when type is `recurring` |
| `recurring.interval` | string | Conditional | Billing interval: `day`, `week`, `month`, `year` |
| `recurring.intervalCount` | integer | Conditional | Number of intervals between billings (e.g., 1 for monthly) |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/products/prod_abc123/price' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "name": "Monthly",
    "type": "recurring",
    "amount": 29900,
    "currency": "USD",
    "recurring": {
      "interval": "month",
      "intervalCount": 1
    }
  }'
```

## Response Example

```json
{
  "price": {
    "id": "price_xyz789",
    "productId": "prod_abc123",
    "name": "Monthly",
    "type": "recurring",
    "amount": 29900,
    "currency": "USD",
    "recurring": {
      "interval": "month",
      "intervalCount": 1
    },
    "createdAt": "2024-03-01T12:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing required fields |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — product does not exist |
| 422 | Unprocessable Entity — invalid type or missing recurring details |

## Common Use Cases
Add pricing tiers to a product (e.g., monthly, annual, one-time purchase options).

## Gotchas
- `amount` is in cents. For $299.00, pass `29900`.
- The `recurring` object is required when `type` is `recurring` and must be omitted (or null) when `type` is `one_time`.
- You can create multiple prices per product to offer different billing options.
