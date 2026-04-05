# Delete Association

- **Method:** DELETE
- **Path:** `/associations/{associationId}`
- **Scopes:** `associations.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `associationId` | string | Yes | The association definition ID |

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/associations/assoc_abc123' \
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
| 404 | Not Found — association ID does not exist |

## Common Use Cases
Remove a relationship type that is no longer needed in your data model.

## Gotchas
Deleting an association also deletes ALL relations created under it. This is destructive and irreversible. Verify no active relations exist before deleting, or accept that they will be removed.
