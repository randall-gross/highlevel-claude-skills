# Create Custom Field Folder

- **Method:** POST
- **Path:** `/custom-fields/folder`
- **Scopes:** Varies by object type (write scope)
- **Rate Limit:** Standard (100/10s)

## Parameters

### Request Body
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `objectKey` | string | Yes | Target object type (e.g., `contacts`, `custom_objects.project`) |
| `name` | string | Yes | Folder display name |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/custom-fields/folder' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "objectKey": "contacts",
    "name": "Marketing Fields"
  }'
```

## Response Example

```json
{
  "id": "folder_abc123",
  "objectKey": "contacts",
  "name": "Marketing Fields",
  "position": 0
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing objectKey or name |
| 401 | Unauthorized — invalid or expired token |
| 409 | Conflict — folder with this name already exists on the object |

## Common Use Cases
Organize custom fields into logical groups (e.g., "Marketing Fields", "Billing Info", "Project Details") for a cleaner HL UI.

## Gotchas
Folders are purely organizational — they appear in the HL UI and in list responses but don't affect field access via the API. Folder names must be unique per object.
