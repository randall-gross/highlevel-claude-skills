# Create Association

- **Method:** POST
- **Path:** `/associations/`
- **Scopes:** `associations.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Request Body
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `key` | string | Yes | Unique key for this association (snake_case recommended) |
| `firstObjectLabel` | string | Yes | Human-readable label for the first object |
| `firstObjectKey` | string | Yes | Object key for the first object (e.g., `contacts`, `custom_objects.project`) |
| `secondObjectLabel` | string | Yes | Human-readable label for the second object |
| `secondObjectKey` | string | Yes | Object key for the second object |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/associations/' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "key": "contact_to_project",
    "firstObjectLabel": "Contact",
    "firstObjectKey": "contacts",
    "secondObjectLabel": "Project",
    "secondObjectKey": "custom_objects.project"
  }'
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
| 400 | Bad Request — missing required fields |
| 401 | Unauthorized — invalid or expired token |
| 409 | Conflict — association with this key already exists |
| 422 | Unprocessable Entity — invalid object key |

## Common Use Cases
Define a new relationship between custom objects (e.g., linking Projects to Tasks in a PM system). Set up the data model before creating relations between records.

## Gotchas
The `key` must be unique within the location. Object keys for built-in objects use simple names (`contacts`, `opportunities`), while custom objects use the `custom_objects.` prefix. You cannot create an association between the same object type on both sides.
