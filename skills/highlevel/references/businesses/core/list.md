# List Businesses

- **Method:** GET
- **Path:** `/businesses/`
- **Scopes:** `businesses.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/businesses/?locationId=ve9EPM428h8vShlRW1KT' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "businesses": [
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
      "createdAt": "2024-01-10T09:00:00.000Z"
    }
  ]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Build a company directory for a B2B CRM. Populate a business selector dropdown when creating opportunities.

## Gotchas
No pagination parameters documented — returns all businesses for the location. For locations with many businesses, the response can be large.
