# Update Product

- **Method:** PUT
- **Path:** `/products/{productId}`
- **Scopes:** `products.write`
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
| `name` | string | No | Product name |
| `description` | string | No | Product description |
| `productType` | string | No | Product type (e.g., `DIGITAL`, `PHYSICAL`, `SERVICE`) |
| `imageUrls` | string[] | No | Array of image URLs (replaces existing) |
| `statementDescriptor` | string | No | Statement descriptor for payment processing |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/products/prod_abc123' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "name": "Elite Coaching Package",
    "description": "Updated 16-week coaching program"
  }'
```

## Response Example

```json
{
  "product": {
    "id": "prod_abc123",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "Elite Coaching Package",
    "description": "Updated 16-week coaching program",
    "productType": "DIGITAL",
    "imageUrls": ["https://example.com/coaching.jpg"],
    "statementDescriptor": "PREMIUM COACHING",
    "createdAt": "2024-03-01T12:00:00.000Z",
    "updatedAt": "2024-03-20T14:00:00.000Z"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid field format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — product does not exist |

## Common Use Cases
Update product details like name, description, or images.

## Gotchas
- Only pass the fields you want to change. Omitted fields are not modified.
- `imageUrls` is a full replacement — pass the complete array including existing images you want to keep.
- To update prices, use the prices endpoints separately. This endpoint only updates product-level fields.
