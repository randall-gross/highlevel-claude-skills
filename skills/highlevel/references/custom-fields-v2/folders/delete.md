# Delete Custom Field Folder

- **Method:** DELETE
- **Path:** `/custom-fields/folder/{id}`
- **Scopes:** Varies by object type (write scope)
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `id` | string | Yes | The folder ID |

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/custom-fields/folder/folder_abc123' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "success": true
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — folder ID does not exist |

## Common Use Cases
Remove an empty folder after moving its fields elsewhere. Clean up organizational structure.

## Gotchas
Deleting a folder does NOT delete the fields inside it. Those fields become root-level (unfiled) fields. Their `folderId` is set to `null`.
