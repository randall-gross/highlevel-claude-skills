# Create Business

- **Method:** POST
- **Path:** `/businesses/`
- **Scopes:** `businesses.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Request Body
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `name` | string | Yes | Business name |
| `phone` | string | No | Phone number |
| `email` | string | No | Business email |
| `website` | string | No | Business website URL |
| `address` | object | No | Address object with street, city, state, postalCode, country |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/businesses/' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "Pool Bros Marketing",
    "phone": "+19405551234",
    "email": "info@poolbrosmarketing.com",
    "website": "https://poolbrosmarketing.com",
    "address": {
      "street": "456 Oak Ave",
      "city": "Denton",
      "state": "TX",
      "postalCode": "76201",
      "country": "US"
    }
  }'
```

## Response Example

```json
{
  "id": "biz_def456",
  "locationId": "ve9EPM428h8vShlRW1KT",
  "name": "Pool Bros Marketing",
  "phone": "+19405551234",
  "email": "info@poolbrosmarketing.com",
  "website": "https://poolbrosmarketing.com",
  "address": {
    "street": "456 Oak Ave",
    "city": "Denton",
    "state": "TX",
    "postalCode": "76201",
    "country": "US"
  },
  "createdAt": "2024-07-01T09:00:00.000Z"
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId or name |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity — invalid data format |

## Common Use Cases
Create a business record when onboarding a new B2B client. Programmatically set up businesses as part of a location provisioning script.

## Gotchas
There is no deduplication — creating two businesses with the same name creates two separate records. Check for existing businesses first if you want to avoid duplicates.
