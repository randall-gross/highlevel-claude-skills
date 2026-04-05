# Create Coupon

- **Method:** POST
- **Path:** `/payments/coupon`
- **Scopes:** `payments/coupons.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| name | string | Yes | Display name for the coupon |
| code | string | Yes | Coupon code customers enter |
| type | string | Yes | `percentage` or `fixed` |
| value | number | Yes | Discount value (percentage 0-100 or fixed amount in cents) |
| duration | string | No | Duration type (e.g., `once`, `repeating`, `forever`) |
| productIds | string[] | No | Array of product IDs this coupon applies to |

## Request Example

```bash
curl -X POST "https://services.leadconnectorhq.com/payments/coupon" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28" \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "Summer Sale",
    "code": "SUMMER20",
    "type": "percentage",
    "value": 20,
    "duration": "once",
    "productIds": ["prod_123", "prod_456"]
  }'
```

## Response Example

```json
{
  "coupon": {
    "id": "coupon_abc123",
    "name": "Summer Sale",
    "code": "SUMMER20",
    "type": "percentage",
    "value": 20,
    "duration": "once",
    "productIds": ["prod_123", "prod_456"],
    "locationId": "ve9EPM428h8vShlRW1KT",
    "createdAt": "2024-01-15T10:00:00Z",
    "updatedAt": "2024-01-15T10:00:00Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing required fields or invalid values |
| 401 | Unauthorized — invalid or expired token |
| 409 | Coupon code already exists |
| 422 | Unprocessable Entity |

## Common Use Cases

Create discount coupons for marketing campaigns, loyalty programs, or promotional events.

## Gotchas

- Coupon codes must be unique within a location. Duplicate codes return 409.
- For `percentage` type, value should be 0-100. For `fixed` type, value is in cents.
- If `productIds` is omitted, the coupon may apply to all products.
