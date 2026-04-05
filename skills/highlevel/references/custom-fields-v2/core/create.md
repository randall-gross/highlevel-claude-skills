# Create Custom Field

- **Method:** POST
- **Path:** `/custom-fields/`
- **Scopes:** Varies by object type (write scope)
- **Rate Limit:** Standard (100/10s)

## Parameters

### Request Body
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `objectKey` | string | Yes | Target object type (e.g., `contacts`, `custom_objects.project`) |
| `name` | string | Yes | Display name for the field |
| `dataType` | string | Yes | Field type: `TEXT`, `LARGE_TEXT`, `NUMERICAL`, `PHONE`, `EMAIL`, `MONETORY`, `CHECKBOX`, `SINGLE_OPTIONS`, `MULTIPLE_OPTIONS`, `DATE`, `FILE_UPLOAD`, `SIGNATURE` |
| `placeholder` | string | No | Placeholder text shown in the field input |
| `options` | string[] | Conditional | Required for `SINGLE_OPTIONS` and `MULTIPLE_OPTIONS` data types |
| `folderId` | string | No | Folder ID to organize the field under |
| `position` | integer | No | Sort order within the folder or root level |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/custom-fields/' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "objectKey": "contacts",
    "name": "Preferred Service",
    "dataType": "SINGLE_OPTIONS",
    "placeholder": "Select service type",
    "options": ["Web Design", "SEO", "PPC", "Social Media"]
  }'
```

## Response Example

```json
{
  "id": "cf_ghi789",
  "objectKey": "contacts",
  "name": "Preferred Service",
  "fieldKey": "contact.preferred_service",
  "dataType": "SINGLE_OPTIONS",
  "placeholder": "Select service type",
  "options": ["Web Design", "SEO", "PPC", "Social Media"],
  "folderId": null,
  "position": 2
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing required fields or invalid dataType |
| 401 | Unauthorized — invalid or expired token |
| 409 | Conflict — field with this name already exists on the object |
| 422 | Unprocessable Entity — options required for dropdown types but not provided |

## Common Use Cases
Add custom fields to contacts programmatically as part of a client onboarding flow. Create fields on custom objects to extend the data model.

## Gotchas
The `fieldKey` is auto-generated from the name and cannot be changed later. The `MONETORY` data type is intentionally misspelled in the API (not `MONETARY`). For `SINGLE_OPTIONS` and `MULTIPLE_OPTIONS`, you must provide the `options` array or you'll get a 422.
