# Create Relation

- **Method:** POST
- **Path:** `/associations/relations`
- **Scopes:** `associations/relation.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Request Body
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `associationId` | string | Yes | The association definition ID |
| `firstRecordId` | string | Yes | Record ID for the first object side |
| `secondRecordId` | string | Yes | Record ID for the second object side |

## Request Example

```bash
curl -X POST \
  'https://services.leadconnectorhq.com/associations/relations' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'Version: 2021-07-28' \
  -d '{
    "associationId": "assoc_abc123",
    "firstRecordId": "nmFmQEsNgz6AVpgLVUJ0",
    "secondRecordId": "rec_project_001"
  }'
```

## Response Example

```json
{
  "id": "rel_ghi789",
  "associationId": "assoc_abc123",
  "firstRecordId": "nmFmQEsNgz6AVpgLVUJ0",
  "secondRecordId": "rec_project_001",
  "createdAt": "2024-03-20T15:00:00.000Z"
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — missing required fields |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — association ID or record IDs do not exist |
| 409 | Conflict — this relation already exists |
| 422 | Unprocessable Entity — record types don't match the association's object keys |

## Common Use Cases
Link a contact to a project record. Connect a task to its parent project in a PM system.

## Gotchas
The order matters: `firstRecordId` must be a record of the association's first object type, and `secondRecordId` must be of the second. Swapping them returns a 422. Duplicate relations return a 409 — check before creating if you want to be idempotent.
