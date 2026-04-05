# Update Custom Object Schema

- **Method:** PUT
- **Path:** `/objects/{key}`
- **Scopes:** `objects/schema.write`
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
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `labels` | object | No | `{ "singular": "Task", "plural": "Tasks" }` — updated display names |
| `description` | string | No | Updated description |
| `fields` | array | No | Updated array of field definitions (replaces existing fields) |

## Request Example

```bash
curl -X PUT \
  'https://services.leadconnectorhq.com/objects/custom_objects.task' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "description": "Updated project management tasks",
    "fields": [
      {
        "label": "Title",
        "type": "TEXT",
        "required": true
      },
      {
        "label": "Status",
        "type": "SINGLE_SELECT",
        "options": ["Ready", "In Progress", "Claimed", "In Review", "Done"]
      },
      {
        "label": "Assignee",
        "type": "TEXT"
      },
      {
        "label": "Priority",
        "type": "SINGLE_SELECT",
        "options": ["Low", "Medium", "High", "Critical"]
      }
    ]
  }'
```

## Response Example

```json
{
  "key": "custom_objects.task",
  "labels": {
    "singular": "Task",
    "plural": "Tasks"
  },
  "description": "Updated project management tasks",
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
      "options": ["Ready", "In Progress", "Claimed", "In Review", "Done"]
    },
    {
      "key": "custom_objects.task.assignee",
      "label": "Assignee",
      "type": "TEXT",
      "required": false
    },
    {
      "key": "custom_objects.task.priority",
      "label": "Priority",
      "type": "SINGLE_SELECT",
      "required": false,
      "options": ["Low", "Medium", "High", "Critical"]
    }
  ]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid field definition |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — schema key does not exist |

## Common Use Cases
Add new fields to an existing custom object, update select options, or change field requirements as the data model evolves.

## Gotchas
- The `fields` array is a **full replacement**, not a merge. If you only send one field, all other existing fields will be removed. Always include the complete field list.
- You cannot change the schema `key` — it is immutable after creation.
- Removing a field from the schema does NOT delete existing data in records — it just becomes inaccessible via the API until the field is re-added.
