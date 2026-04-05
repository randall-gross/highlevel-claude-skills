# Search Custom Object Records

- **Method:** POST
- **Path:** `/objects/{schemaKey}/records/search`
- **Scopes:** `objects/record.readonly`
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
| `filters` | array | No | Array of filter objects (AND logic between filters) |
| `page` | integer | No | Page number (default 1) |
| `pageLimit` | integer | No | Results per page (default 20) |

### Filter Object
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `field` | string | Yes | Full dot-notation field key (e.g., `custom_objects.task.status`) |
| `operator` | string | Yes | Comparison operator: `eq`, `ne`, `in`, `contains`, `gt`, `lt`, `gte`, `lte` |
| `value` | string | Conditional | Single value — use with `eq`, `ne`, `contains`, `gt`, `lt`, `gte`, `lte` |
| `values` | array | Conditional | Array of values — use with `in` operator |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/objects/custom_objects.task/records/search' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "locationId": "ve9EPM428h8vShlRW1KT",
    "filters": [
      {
        "field": "custom_objects.task.assignee",
        "operator": "eq",
        "value": "Claude-Frontend"
      },
      {
        "field": "custom_objects.task.status",
        "operator": "in",
        "values": ["Ready", "In Progress"]
      }
    ],
    "page": 1,
    "pageLimit": 10
  }'
```

## Response Example

```json
{
  "records": [
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
    },
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
  ],
  "meta": {
    "total": 2,
    "page": 1,
    "pageLimit": 10
  }
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid filter field or operator |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — schema key does not exist |

## Common Use Cases
Query tasks assigned to a specific Claude agent role, find records by status, or build filtered views of custom object data. This is the primary endpoint used by the Claude agent session bootstrap to load assigned tasks.

## Gotchas
- Multiple filters use AND logic — all conditions must match. There is no OR operator; use the `in` operator on a single field for OR-like behavior on that field.
- Filter field names must use full dot-notation (e.g., `custom_objects.task.status`, NOT just `status`).
- Use `value` (string) for single-value operators and `values` (array) for the `in` operator. Mixing them up causes a 400.
- Pagination is page-based (not cursor-based like Contacts). You can jump to any page number.
- An empty `filters` array (or omitting it) returns all records for the schema at that location.
