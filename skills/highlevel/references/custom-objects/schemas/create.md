# Create Custom Object Schema

- **Method:** POST
- **Path:** `/objects/`
- **Scopes:** `objects/schema.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |
| `labels` | object | Yes | `{ "singular": "Task", "plural": "Tasks" }` — display names |
| `description` | string | No | Human-readable description of the object |
| `fields` | array | Yes | Array of field definition objects |

### Field Definition Object
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `label` | string | Yes | Display name for the field |
| `type` | string | Yes | Field type: `TEXT`, `NUMBER`, `SINGLE_SELECT`, `MULTI_SELECT`, `DATE`, `BOOLEAN`, `TEXTAREA` |
| `required` | boolean | No | Whether the field is required (default false) |
| `options` | array | Conditional | Required for `SINGLE_SELECT` and `MULTI_SELECT` types — array of option strings |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/objects/' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "labels": {
      "singular": "Task",
      "plural": "Tasks"
    },
    "description": "Project management tasks",
    "fields": [
      {
        "label": "Title",
        "type": "TEXT",
        "required": true
      },
      {
        "label": "Status",
        "type": "SINGLE_SELECT",
        "options": ["Ready", "In Progress", "Claimed", "Done"]
      },
      {
        "label": "Assignee",
        "type": "TEXT"
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
| 400 | Bad Request — missing required fields or invalid field type |
| 401 | Unauthorized — invalid or expired token |
| 409 | Conflict — a schema with the same label already exists at this location |

## Common Use Cases
Define a new custom data model for a location, such as creating a Task or Project object for a project management system.

## Gotchas
- The `key` is auto-generated from the singular label (lowercased, spaces replaced). You do not provide it — HL generates it.
- Field keys are also auto-generated using the pattern `custom_objects.{object_name}.{field_label_lowercased}`.
- You cannot rename a schema key after creation. Plan your naming carefully.
- The `options` array is required for `SINGLE_SELECT` and `MULTI_SELECT` field types and ignored for others.
