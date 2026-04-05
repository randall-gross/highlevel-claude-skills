# Update Association

- **Method:** PUT
- **Path:** `/associations/{associationId}`
- **Scopes:** `associations.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `associationId` | string | Yes | The association definition ID |

### Request Body
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `firstObjectLabel` | string | No | Updated label for the first object |
| `secondObjectLabel` | string | No | Updated label for the second object |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/associations/assoc_abc123' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "firstObjectLabel": "Client Contact",
    "secondObjectLabel": "Active Project"
  }'
```

## Response Example

```json
{
  "id": "assoc_abc123",
  "locationId": "ve9EPM428h8vShlRW1KT",
  "key": "contact_to_project",
  "firstObjectLabel": "Client Contact",
  "firstObjectKey": "contacts",
  "secondObjectLabel": "Active Project",
  "secondObjectKey": "custom_objects.project"
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — association ID does not exist |

## Common Use Cases
Rename the display labels for an association without changing the underlying schema.

## Gotchas
You can only update labels, not the key or object keys. Changing labels does NOT affect existing relations — it's purely cosmetic.
