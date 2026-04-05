# List Relations for Record

- **Method:** GET
- **Path:** `/associations/relations/{recordId}`
- **Scopes:** `associations/relation.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `recordId` | string | Yes | The record ID to get relations for |

## Request Example

```bash
curl -X GET \
  'https://services.leadconnectorhq.com/associations/relations/rec_project_001' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "relations": [
    {
      "id": "rel_abc123",
      "associationId": "assoc_abc123",
      "associationKey": "contact_to_project",
      "firstRecordId": "nmFmQEsNgz6AVpgLVUJ0",
      "secondRecordId": "rec_project_001",
      "createdAt": "2024-03-20T14:00:00.000Z"
    },
    {
      "id": "rel_def456",
      "associationId": "assoc_def456",
      "associationKey": "project_to_task",
      "firstRecordId": "rec_project_001",
      "secondRecordId": "rec_task_001",
      "createdAt": "2024-03-20T14:05:00.000Z"
    }
  ]
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — record ID does not exist |

## Common Use Cases
Display all related records on a record detail page. Build a relationship graph for a specific entity.

## Gotchas
Returns relations where the record appears on EITHER side (first or second). The response includes the association key for context, but not the full related record data — you need to fetch those records separately.
