# Search Contacts

- **Method:** POST
- **Path:** `/contacts/search`
- **Scopes:** `contacts.readonly`
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
| `filters` | object[] | No | Array of filter objects (see below) |
| `page` | integer | No | Page number (starts at 1) |
| `pageLimit` | integer | No | Results per page (default 20, max 100) |
| `searchAfter` | string[] | No | Cursor for deep pagination (from previous response) |
| `sortBy` | string | No | Field to sort by |
| `sortOrder` | string | No | `asc` or `desc` |

### Filter Object
| Field | Type | Description |
|-------|------|-------------|
| `field` | string | Field name to filter on (e.g., `tags`, `email`, `dateAdded`, custom field ID) |
| `operator` | string | One of: `eq`, `neq`, `in`, `nin`, `gt`, `gte`, `lt`, `lte`, `contains` |
| `value` | string | Single value (for eq, neq, gt, gte, lt, lte, contains) |
| `values` | string[] | Array of values (for in, nin) |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/contacts/search' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "filters": [
      { "field": "tags", "operator": "in", "values": ["vip", "premium"] },
      { "field": "dateAdded", "operator": "gte", "value": "2024-01-01T00:00:00.000Z" }
    ],
    "page": 1,
    "pageLimit": 25
  }'
```

## Response Example

```json
{
  "contacts": [
    {
      "id": "nmFmQEsNgz6AVpgLVUJ0",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "firstName": "John",
      "lastName": "Doe",
      "email": "john.doe@example.com",
      "phone": "+14155551234",
      "tags": ["vip", "referral"],
      "dateAdded": "2024-01-15T10:30:00.000Z"
    }
  ],
  "meta": {
    "total": 87,
    "currentPage": 1,
    "nextPage": 2,
    "searchAfter": ["1705311000000", "nmFmQEsNgz6AVpgLVUJ0"]
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid filter format or missing locationId |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity — unknown field name or invalid operator |

## Common Use Cases
Find contacts matching specific criteria for segmentation, reporting, or bulk operations. Filter by tags, date ranges, custom fields, or any combination.

## Gotchas
- **Use `searchAfter` for deep pagination** (beyond ~10,000 results). The `page` parameter works for small result sets, but for large datasets, use the `searchAfter` array from the previous response's `meta`.
- Multiple filters are ANDed together. There is no OR operator at the top level.
- Custom fields can be filtered by their field ID (e.g., `"field": "cF1pBhLeCkV49ISmpKBl"`).
- The `contains` operator does a substring match and is case-insensitive.
- Tag filtering with `in` matches contacts that have ANY of the specified tags, not ALL of them.
