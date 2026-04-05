# Get Business

- **Method:** GET
- **Path:** `/businesses/{businessId}`
- **Scopes:** `businesses.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `businessId` | string | Yes | The business ID |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/businesses/biz_abc123' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "id": "biz_abc123",
  "locationId": "ve9EPM428h8vShlRW1KT",
  "name": "AllStar Shower Doors",
  "phone": "+17705551234",
  "email": "info@allstarshowerdoors.com",
  "website": "https://allstarshowerdoors.com",
  "address": {
    "street": "123 Main St",
    "city": "Marietta",
    "state": "GA",
    "postalCode": "30060",
    "country": "US"
  },
  "createdAt": "2024-01-10T09:00:00.000Z",
  "updatedAt": "2024-06-15T14:30:00.000Z"
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — business ID does not exist |

## Common Use Cases
Display a business profile page. Fetch business details to pre-fill a form.

## Gotchas
The `address` object may have empty string values for fields that weren't set — check for empty strings, not just null.
