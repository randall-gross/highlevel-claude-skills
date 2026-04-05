# Get Association

- **Method:** GET
- **Path:** `/associations/{associationId}`
- **Scopes:** `associations.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `associationId` | string | Yes | The association definition ID |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/associations/assoc_abc123' \
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
| 404 | Not Found — association ID does not exist |

## Common Use Cases
Fetch a specific association's details to verify its configuration before creating relations.

## Gotchas
The association ID is different from the association key. Use `get-by-key` if you only have the key name.
