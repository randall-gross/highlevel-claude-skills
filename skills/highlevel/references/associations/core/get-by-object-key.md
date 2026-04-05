# Get Associations by Object Key

- **Method:** GET
- **Path:** `/associations/objectKey/{objectKey}`
- **Scopes:** `associations.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `objectKey` | string | Yes | The custom object key (e.g., `custom_objects.project`) |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/associations/objectKey/custom_objects.project' \
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
      "secondObjectKey": "custom_objects.project"
    },
    {
      "id": "assoc_def456",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "key": "project_to_task",
      "firstObjectLabel": "Project",
      "firstObjectKey": "custom_objects.project",
      "secondObjectLabel": "Task",
      "secondObjectKey": "custom_objects.task"
    }
  ]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — no associations found for that object key |

## Common Use Cases
Discover all relationships a specific object type participates in. Build a relationship graph for a custom object.

## Gotchas
Returns associations where the object key appears on EITHER side (first or second). The object key must include the `custom_objects.` prefix for custom objects.
