# Delete Recurring Task

- **Method:** DELETE
- **Path:** `/locations/{locationId}/recurring-tasks/{id}`
- **Scopes:** `locations/tasks.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |
| `id` | string | Yes | The recurring task ID |

## Request Example

```bash
curl -X DELETE \
  'https://services.leadconnectorhq.com/locations/ve9EPM428h8vShlRW1KT/recurring-tasks/rt_new456' \
  -H 'Authorization: Bearer TOKEN' \
  -H 'Content-Type: application/json' \
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
| 400 | Bad Request — invalid ID format |
| 401 | Unauthorized — invalid or expired token |
| 404 | Not Found — recurring task does not exist |

## Common Use Cases

Remove a recurring task definition to stop future task instances from being generated.

## Gotchas

- Deleting a recurring task stops future instances from being created but does **not** delete existing task instances that were already generated.
- This is irreversible.
