# Update Custom Field

- **Method:** PUT
- **Path:** `/custom-fields/{id}`
- **Scopes:** Varies by object type (write scope)
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `id` | string | Yes | The custom field ID |

### Request Body
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `name` | string | No | Updated display name |
| `placeholder` | string | No | Updated placeholder text |
| `options` | string[] | No | Updated options (for dropdown types) |
| `position` | integer | No | Updated sort order |
| `folderId` | string | No | Move field to a different folder |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/custom-fields/cf_ghi789' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "name": "Preferred Service Type",
    "options": ["Web Design", "SEO", "PPC", "Social Media", "Email Marketing"]
  }'
```

## Response Example

```json
{
  "id": "cf_ghi789",
  "objectKey": "contacts",
  "name": "Preferred Service Type",
  "fieldKey": "contact.preferred_service",
  "dataType": "SINGLE_OPTIONS",
  "placeholder": "Select service type",
  "options": ["Web Design", "SEO", "PPC", "Social Media", "Email Marketing"],
  "folderId": null,
  "position": 2
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — field ID does not exist |
| 422 | Unprocessable Entity — invalid update data |

## Common Use Cases
Add new options to a dropdown field. Rename a field for clarity. Move a field into a folder for organization.

## Gotchas
You cannot change the `dataType` after creation. Removing an option from a dropdown does NOT clear that value from existing records that have it set. The `fieldKey` does not change when you rename the field.
