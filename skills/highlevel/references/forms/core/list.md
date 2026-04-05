# List Forms

- **Method:** GET
- **Path:** `/forms/`
- **Scopes:** `forms.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `limit` | integer | No | Number of results per page (default 20) |
| `skip` | integer | No | Number of results to skip for pagination |
| `type` | string | No | Filter by form type |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/forms/?locationId=ve9EPM428h8vShlRW1KT&limit=20' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "forms": [
    {
      "id": "form_abc123",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "name": "Contact Us Form",
      "type": "form",
      "createdAt": "2024-02-10T10:00:00.000Z"
    },
    {
      "id": "form_def456",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "name": "Free Quote Request",
      "type": "form",
      "createdAt": "2024-03-15T14:00:00.000Z"
    }
  ],
  "total": 2
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Display a list of all forms in a location for an admin dashboard. Find a form ID to query its submissions.

## Gotchas
The `skip` parameter is offset-based, not cursor-based. The response does not include form field definitions — only metadata. Form submissions are fetched separately via the submissions endpoint.
