# Create Product

- **Method:** POST
- **Path:** `/products/`
- **Scopes:** `products.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `name` | string | Yes | Product name |
| `description` | string | No | Product description |
| `productType` | string | No | Product type (e.g., `DIGITAL`, `PHYSICAL`, `SERVICE`) |
| `imageUrls` | string[] | No | Array of image URLs for the product |
| `statementDescriptor` | string | No | Statement descriptor for payment processing (max 22 chars) |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/products/' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "Premium Coaching Package",
    "description": "12-week coaching program with weekly 1-on-1 sessions",
    "productType": "DIGITAL",
    "imageUrls": ["https://example.com/coaching.jpg"],
    "statementDescriptor": "PREMIUM COACHING"
  }'
```

## Response Example

```json
{
  "product": {
    "id": "prod_abc123",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "Premium Coaching Package",
    "description": "12-week coaching program with weekly 1-on-1 sessions",
    "productType": "DIGITAL",
    "imageUrls": ["https://example.com/coaching.jpg"],
    "statementDescriptor": "PREMIUM COACHING",
    "createdAt": "2024-03-01T12:00:00.000Z",
    "updatedAt": "2024-03-01T12:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing required fields (locationId, name) |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity — invalid productType or statementDescriptor too long |

## Common Use Cases
Create a new product in the catalog. After creation, add prices via the prices endpoint.

## Gotchas
- Creating a product does NOT create any prices. You must create prices separately via `POST /products/{productId}/price`.
- The `statementDescriptor` appears on customer bank/card statements. Keep it under 22 characters and make it recognizable.
- `imageUrls` must be publicly accessible URLs. HL does not host product images.
