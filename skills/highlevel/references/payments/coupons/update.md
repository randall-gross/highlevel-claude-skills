# Update Coupon

- **Method:** PUT
- **Path:** `/payments/coupon`
- **Scopes:** `payments/coupons.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| couponId | string | Yes | Coupon ID to update |
| name | string | No | Updated display name |
| code | string | No | Updated coupon code |
| type | string | No | `percentage` or `fixed` |
| value | number | No | Updated discount value |
| duration | string | No | Updated duration type |
| productIds | string[] | No | Updated product IDs |

## Request Example

```bash
curl -X PUT "https://services.leadconnectorhq.com/payments/coupon" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28" \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "couponId": "coupon_abc123",
    "name": "Summer Sale Extended",
    "value": 25
  }'
```

## Response Example

```json
{
  "coupon": {
    "id": "coupon_abc123",
    "name": "Summer Sale Extended",
    "code": "SUMMER20",
    "type": "percentage",
    "value": 25,
    "duration": "once",
    "productIds": ["prod_123", "prod_456"],
    "locationId": "ve9EPM428h8vShlRW1KT",
    "createdAt": "2024-01-15T10:00:00Z",
    "updatedAt": "2024-02-01T14:30:00Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing required fields or invalid values |
| 401 | Unauthorized — invalid or expired token |
| 404 | Coupon not found |
| 409 | Coupon code already exists (if changing code) |
| 422 | Unprocessable Entity |

## Common Use Cases

Modify coupon discount values, extend promotions, or update which products a coupon applies to.

## Gotchas

- The couponId is sent in the request body, not as a path parameter.
- Partial updates are supported — only include the fields you want to change.
- Changing a coupon code will not affect orders that already used the old code.
