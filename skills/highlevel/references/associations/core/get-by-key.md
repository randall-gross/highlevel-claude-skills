# Get Association by Key

- **Method:** GET
- **Path:** `/associations/key/{key_name}`
- **Scopes:** `associations.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `key_name` | string | Yes | The association key name (e.g., `contact_to_project`) |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/associations/key/contact_to_project' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "id": "assoc_abc123",
  "locationId": "ve9EPM428h8vShlRW1KT",
  "key": "contact_to_project",
  "firstObjectLabel": "Contact",
  "firstObjectKey": "contacts",
  "secondObjectLabel": "Project",
  "secondObjectKey": "custom_objects.project",
  "createdAt": "2024-03-15T10:00:00.000Z"
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — no association with that key name |

## Common Use Cases
Look up an association by its human-readable key when you don't have the ID. Useful in code that references associations by name rather than storing IDs.

## Gotchas
Keys are case-sensitive and must match exactly. The key is set at creation time and cannot be changed.
