# List Custom Object Schemas

- **Method:** GET
- **Path:** `/objects/`
- **Scopes:** `objects/schema.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |

### Request Body
N/A

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/objects/?locationId=ve9EPM428h8vShlRW1KT' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "objects": [
    {
      "key": "custom_objects.task",
      "labels": {
        "singular": "Task",
        "plural": "Tasks"
      },
      "description": "Project management tasks",
      "locationId": "ve9EPM428h8vShlRW1KT"
    },
    {
      "key": "custom_objects.project",
      "labels": {
        "singular": "Project",
        "plural": "Projects"
      },
      "description": "Top-level project records",
      "locationId": "ve9EPM428h8vShlRW1KT"
    }
  ]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId parameter |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Discover all custom object types defined in a location, or verify a schema exists before querying its records.

## Gotchas
- This returns schema metadata only, not field definitions. Use `GET /objects/{key}` to get the full schema with fields.
- The `key` value is what you use as `{schemaKey}` in all record endpoints.
