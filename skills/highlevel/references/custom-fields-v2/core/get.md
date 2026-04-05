# Get Custom Field or Folder

- **Method:** GET
- **Path:** `/custom-fields/{id}`
- **Scopes:** Varies by object type
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `id` | string | Yes | The custom field ID or folder ID |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/custom-fields/cf_abc123' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "id": "cf_abc123",
  "objectKey": "contacts",
  "name": "Lead Source",
  "fieldKey": "contact.lead_source",
  "dataType": "SINGLE_OPTIONS",
  "placeholder": "Select lead source",
  "options": ["Website", "Referral", "Google Ads", "Facebook"],
  "folderId": "folder_abc123",
  "position": 0,
  "isRequired": false,
  "isSearchable": true
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — field or folder ID does not exist |

## Common Use Cases
Fetch a specific field's configuration to verify its data type and options before setting values.

## Gotchas
This endpoint works for both fields and folders — the response shape differs slightly. A folder response won't have `dataType` or `options`.
