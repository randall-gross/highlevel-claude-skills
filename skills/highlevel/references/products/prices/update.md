# Update Price

- **Method:** PUT
- **Path:** `/products/{productId}/price/{priceId}`
- **Scopes:** `products/prices.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `productId` | string | Yes | The product ID |
| `priceId` | string | Yes | The price ID |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `name` | string | No | Updated price name |
| `amount` | integer | No | Updated amount in smallest currency unit |
| `recurring` | object | No | Updated recurring settings |
| `recurring.interval` | string | No | Billing interval: `day`, `week`, `month`, `year` |
| `recurring.intervalCount` | integer | No | Number of intervals between billings |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/products/prod_abc123/price/price_xyz789' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "name": "Monthly (Updated)",
    "amount": 34900
  }'
```

## Response Example

```json
{
  "price": {
    "id": "price_xyz789",
    "productId": "prod_abc123",
    "name": "Monthly (Updated)",
    "type": "recurring",
    "amount": 34900,
    "currency": "USD",
    "recurring": {
      "interval": "month",
      "intervalCount": 1
    },
    "updatedAt": "2024-03-20T14:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid field format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — product or price does not exist |

## Common Use Cases
Adjust pricing amounts or rename pricing tiers.

## Gotchas
- Changing the `amount` on a recurring price may not affect existing active subscriptions — only new subscriptions will use the updated amount. Check HL documentation for subscription behavior.
- You cannot change the `type` (one_time/recurring) after creation. Create a new price instead.
