# Update Custom Field Folder

- **Method:** PUT
- **Path:** `/custom-fields/folder/{id}`
- **Scopes:** Varies by object type (write scope)
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `id` | string | Yes | The folder ID |

### Request Body
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `name` | string | Yes | Updated folder name |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/custom-fields/folder/folder_abc123' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "name": "Marketing & Lead Fields"
  }'
```

## Response Example

```json
{
  "id": "folder_abc123",
  "objectKey": "contacts",
  "name": "Marketing & Lead Fields",
  "position": 0
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — folder ID does not exist |
| 409 | Conflict — a folder with this name already exists |

## Common Use Cases
Rename a folder to better reflect its contents after adding new fields.

## Gotchas
Renaming a folder does not affect the fields inside it or their `folderId` references.
