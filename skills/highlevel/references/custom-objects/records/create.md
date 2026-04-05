# Create Custom Object Record

- **Method:** POST
- **Path:** `/objects/{schemaKey}/records`
- **Scopes:** `objects/record.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `schemaKey` | string | Yes | The schema key (e.g., `custom_objects.task`) |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `properties` | object | Yes | Key-value pairs matching schema field keys |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/objects/custom_objects.task/records' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "properties": {
      "custom_objects.task.title": "Implement dashboard layout",
      "custom_objects.task.status": "Ready",
      "custom_objects.task.assignee": "Claude-Frontend"
    }
  }'
```

## Response Example

```json
{
  "id": "rec_xyz789mno345",
  "schemaKey": "custom_objects.task",
  "locationId": "ve9EPM428h8vShlRW1KT",
  "properties": {
    "custom_objects.task.title": "Implement dashboard layout",
    "custom_objects.task.status": "Ready",
    "custom_objects.task.assignee": "Claude-Frontend"
  },
  "createdAt": "2024-03-17T09:00:00.000Z",
  "updatedAt": "2024-03-17T09:00:00.000Z"
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing required properties or invalid field values |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — schema key does not exist |

## Common Use Cases
Create a new task, project, or any custom object record programmatically, such as auto-creating tasks from a planning session.

## Gotchas
- Property keys must use the full dot-notation format (e.g., `custom_objects.task.title`), not just `title`.
- If a field is marked `required` in the schema and is missing from `properties`, the request will fail with 400.
- There is no upsert for custom objects. To avoid duplicates, search first then create.
