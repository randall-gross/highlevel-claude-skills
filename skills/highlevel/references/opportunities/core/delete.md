# Delete Opportunity

- **Method:** DELETE
- **Path:** `/opportunities/{id}`
- **Scopes:** `opportunities.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `id` | string | Yes | The ID of the opportunity to delete |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/opportunities/opp_xyz789' \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Version: 2021-07-28'
```

## Response Example

```json
{
  "succeded": true
}
```

## Error Responses
| Status | Meaning |
|--------|---------|
| 400 | Bad Request — invalid opportunity ID format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — opportunity does not exist |

## Common Use Cases
Remove test or duplicate opportunities from a pipeline. Also used when cleaning up abandoned deals during pipeline maintenance.

## Gotchas
- **This is a hard delete.** The opportunity is permanently removed and cannot be recovered.
- The response field is `succeded` (note the typo — this is how the HL API actually spells it). Do not correct it in your code or it will break.
- Deleting an opportunity does not delete the linked contact. The contact remains untouched.
- Any workflows triggered by opportunity deletion will still fire.
