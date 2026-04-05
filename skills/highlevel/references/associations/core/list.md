# List Associations

- **Method:** GET
- **Path:** `/associations/`
- **Scopes:** `associations.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `locationId` | string | Yes | The sub-account ID |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/associations/?locationId=ve9EPM428h8vShlRW1KT' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "associations": [
    {
      "id": "assoc_abc123",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "key": "contact_to_project",
      "firstObjectLabel": "Contact",
      "firstObjectKey": "contacts",
      "secondObjectLabel": "Project",
      "secondObjectKey": "custom_objects.project",
      "createdAt": "2024-03-15T10:00:00.000Z"
    },
    {
      "id": "assoc_def456",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "key": "project_to_task",
      "firstObjectLabel": "Project",
      "firstObjectKey": "custom_objects.project",
      "secondObjectLabel": "Task",
      "secondObjectKey": "custom_objects.task",
      "createdAt": "2024-03-15T10:05:00.000Z"
    }
  ]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing locationId |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases
Discover all relationship types defined in a location before creating relations. Build a schema explorer UI.

## Gotchas
Returns all associations for the location — there is no pagination. For locations with many custom objects, this can be a large response.
