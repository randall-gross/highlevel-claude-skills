# Get Form Submissions

- **Method:** GET
- **Path:** `/forms/submissions`
- **Scopes:** `forms.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `formId` | string | No | Filter by specific form ID |
| `limit` | integer | No | Number of results per page (default 20) |
| `page` | integer | No | Page number (1-based) |
| `startAt` | string | No | Filter submissions after this ISO date |
| `endAt` | string | No | Filter submissions before this ISO date |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/forms/submissions?locationId=ve9EPM428h8vShlRW1KT&formId=form_abc123&limit=10&page=1' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "submissions": [
    {
      "id": "sub_abc123",
      "formId": "form_abc123",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "contactId": "nmFmQEsNgz6AVpgLVUJ0",
      "name": "John Doe",
      "email": "john.doe@example.com",
      "phone": "+14155551234",
      "others": {
        "message": "I'm interested in a custom shower door for my bathroom renovation.",
        "preferred_service": "Frameless Shower Doors"
      },
      "createdAt": "2024-06-15T14:30:00.000Z"
    }
  ],
  "meta": {
    "total": 45,
    "currentPage": 1,
    "nextPage": 2
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Build a submissions dashboard for client reporting. Export form leads for analysis. Monitor lead flow in real-time.

## Gotchas
The `others` object contains custom field values as key-value pairs — the keys are field names, not field IDs. Pagination is 1-based (first page is `page=1`). Without `formId`, returns submissions from ALL forms in the location. Date filters use ISO 8601 format.
