# List Contacts

- **Method:** GET
- **Path:** `/contacts/`
- **Scopes:** `contacts.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `query` | string | No | Search by name, email, phone, or company name |
| `limit` | integer | No | Number of results per page (default 20, max 100) |
| `startAfterId` | string | No | Cursor for pagination — pass the last contact's ID from the previous page |
| `startAfter` | integer | No | Timestamp cursor (epoch ms) for pagination |
| `sortBy` | string | No | Sort field: `date_added`, `date_updated` |
| `order` | string | No | Sort direction: `asc` or `desc` |

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/contacts/?locationId=ve9EPM428h8vShlRW1KT&limit=20&query=john' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
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
      "companyName": "Acme Corp",
      "tags": ["vip"],
      "dateAdded": "2024-01-15T10:30:00.000Z"
    },
    {
      "id": "pQr3sTuVwXyZ1234abcd",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "firstName": "Johnny",
      "lastName": "Smith",
      "email": "johnny.smith@example.com",
      "phone": "+14155559876",
      "companyName": "",
      "tags": [],
      "dateAdded": "2024-02-01T08:15:00.000Z"
    }
  ],
  "meta": {
    "total": 245,
    "startAfterId": "pQr3sTuVwXyZ1234abcd",
    "startAfter": 1706774100000
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId parameter |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Build paginated contact lists for a CRM dashboard, or search for contacts by name before performing an action.

## Gotchas
- This is cursor-based pagination, NOT offset-based. You cannot jump to page 5. You must iterate through pages sequentially using `startAfterId`.
- The `query` param does a broad search across name, email, phone, and company. For precise filtering, use the `search` endpoint instead.
- List returns a subset of contact fields. Use the `get` endpoint for the full contact record.
