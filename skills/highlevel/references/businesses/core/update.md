# Update Business

- **Method:** PUT
- **Path:** `/businesses/{businessId}`
- **Scopes:** `businesses.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `businessId` | string | Yes | The business ID to update |

### Request Body
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `name` | string | No | Updated business name |
| `phone` | string | No | Updated phone number |
| `email` | string | No | Updated business email |
| `website` | string | No | Updated website URL |
| `address` | object | No | Updated address object |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/businesses/biz_abc123' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "name": "AllStar Shower Doors LLC",
    "website": "https://www.allstarshowerdoors.com"
  }'
```

## Response Example

```json
{
  "id": "biz_abc123",
  "locationId": "ve9EPM428h8vShlRW1KT",
  "name": "AllStar Shower Doors LLC",
  "phone": "+17705551234",
  "email": "info@allstarshowerdoors.com",
  "website": "https://www.allstarshowerdoors.com",
  "address": {
    "street": "123 Main St",
    "city": "Marietta",
    "state": "GA",
    "postalCode": "30060",
    "country": "US"
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — business ID does not exist |
| 422 | Unprocessable Entity — invalid data format |

## Common Use Cases
Update a business name after a rebrand. Correct address information.

## Gotchas
Partial updates are supported — only include the fields you want to change. The `address` object is replaced entirely if provided, not merged — include all address fields even if only changing one.
