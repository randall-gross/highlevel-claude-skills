# List Invoice Templates

- **Method:** GET
- **Path:** `/invoices/template`
- **Scopes:** `invoices/template.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| altId | string | Yes | Location ID |
| altType | string | Yes | Must be `location` |
| limit | integer | No | Number of results (default 20, max 100) |
| offset | integer | No | Pagination offset |

## Request Example
```bash
curl -X GET "https://services.leadconnectorhq.com/invoices/template?altId=ve9EPM428h8vShlRW1KT&altType=location" \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -H "Version: 2021-07-28"
```

## Response Example
```json
{
  "templates": [
    {
      "_id": "tmpl_abc123",
      "name": "Standard Service Invoice",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "currency": "USD",
      "items": [
        {
          "name": "Service Fee",
          "quantity": 1,
          "unitPrice": 10000
        }
      ],
      "createdAt": "2026-03-01T12:00:00.000Z"
    }
  ],
  "total": 1
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Missing altId or altType |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Retrieve available invoice templates for a location to populate a template picker when creating new invoices.

## Gotchas
- Templates are location-scoped. Each location has its own set of templates.
