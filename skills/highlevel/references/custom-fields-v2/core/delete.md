# Delete Custom Field

- **Method:** DELETE
- **Path:** `/custom-fields/{id}`
- **Scopes:** Varies by object type (write scope)
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `id` | string | Yes | The custom field ID |

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/custom-fields/cf_ghi789' \
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
| 404 | Not Found — field ID does not exist |

## Common Use Cases
Remove deprecated fields during a data model cleanup. Delete test fields after development.

## Gotchas
Deleting a custom field removes the field definition but does NOT clear existing values from records that had data in it. Those values become orphaned and inaccessible. This is irreversible — there is no soft delete.
