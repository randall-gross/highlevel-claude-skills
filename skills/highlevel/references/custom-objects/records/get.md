# Get Custom Object Record

- **Method:** GET
- **Path:** `/objects/{schemaKey}/records/{id}`
- **Scopes:** `objects/record.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `schemaKey` | string | Yes | The schema key (e.g., `custom_objects.task`) |
| `id` | string | Yes | The record ID |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/objects/custom_objects.task/records/rec_abc123def456' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "id": "rec_abc123def456",
  "schemaKey": "custom_objects.task",
  "locationId": "ve9EPM428h8vShlRW1KT",
  "properties": {
    "custom_objects.task.title": "Build login page",
    "custom_objects.task.status": "In Progress",
    "custom_objects.task.assignee": "Claude-Frontend"
  },
  "createdAt": "2024-03-15T10:30:00.000Z",
  "updatedAt": "2024-03-16T14:00:00.000Z"
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — record ID or schema key does not exist |

## Common Use Cases
Retrieve a specific task or project record by ID to read its current field values, such as checking a task's status or acceptance criteria.

## Gotchas
- Property keys in the response use the full dot-notation format (e.g., `custom_objects.task.title`), not just the field name.
- If the schema key is wrong but the record ID is valid, you will still get a 404.
