# Delete Relation

- **Method:** DELETE
- **Path:** `/associations/relations/{relationId}`
- **Scopes:** `associations/relation.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `relationId` | string | Yes | The relation ID to delete |

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/associations/relations/rel_abc123' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "success": true
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — relation ID does not exist |

## Common Use Cases
Unlink a contact from a project when the association is no longer valid. Clean up test data.

## Gotchas
Deleting a relation does not delete the records on either side — only the link between them. This is not reversible; you must create a new relation to re-link them.
