# Get Custom Object Schema

- **Method:** GET
- **Path:** `/objects/{key}`
- **Scopes:** `objects/schema.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `key` | string | Yes | The schema key (e.g., `custom_objects.task`) |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/objects/custom_objects.task' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "key": "custom_objects.task",
  "labels": {
    "singular": "Task",
    "plural": "Tasks"
  },
  "description": "Project management tasks",
  "locationId": "ve9EPM428h8vShlRW1KT",
  "fields": [
    {
      "key": "custom_objects.task.title",
      "label": "Title",
      "type": "TEXT",
      "required": true
    },
    {
      "key": "custom_objects.task.status",
      "label": "Status",
      "type": "SINGLE_SELECT",
      "required": false,
      "options": ["Ready", "In Progress", "Claimed", "Done"]
    },
    {
      "key": "custom_objects.task.assignee",
      "label": "Assignee",
      "type": "TEXT",
      "required": false
    }
  ]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — schema key does not exist |

## Common Use Cases
Retrieve field definitions for a custom object to understand the data structure before creating or searching records.

## Gotchas
- The `key` must be the full schema key including the `custom_objects.` prefix.
- Field keys in the response use the full dot-notation format (e.g., `custom_objects.task.title`), which is the same format used in search filters.
