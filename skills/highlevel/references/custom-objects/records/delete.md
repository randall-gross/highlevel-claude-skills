# Delete Custom Object Record

- **Method:** DELETE
- **Path:** `/objects/{schemaKey}/records/{id}`
- **Scopes:** `objects/record.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| `schemaKey` | string | Yes | The schema key (e.g., `custom_objects.task`) |
| `id` | string | Yes | The record ID |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|

### Request Body
N/A

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/objects/custom_objects.task/records/rec_abc123def456' \
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
| 404 | Not Found — record ID or schema key does not exist |

## Common Use Cases
Remove completed or cancelled tasks, clean up test data, or delete obsolete records from a custom object.

## Gotchas
- This is a **hard delete** — there is no trash or soft-delete. The record is permanently removed.
- Deleting a record does not trigger any HL workflows. If you need post-delete automation, handle it in your application code.
- If the record has associations with other objects, those references will become orphaned (dangling IDs).
