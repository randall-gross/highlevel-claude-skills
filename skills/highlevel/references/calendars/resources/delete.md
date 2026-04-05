# Delete Calendar Resource

- **Method:** DELETE
- **Path:** `/calendars/resources/{resourceType}/{id}`
- **Scopes:** `calendars/resources.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| resourceType | string | Yes | Resource type: `equipments` or `rooms` |
| id | string | Yes | Resource ID |

## Request Example

```bash
curl --request DELETE \
  --url 'https://services.leadconnectorhq.com/calendars/resources/equipments/res_abc123' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28'
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
| 400 | Invalid resourceType or ID |
| 401 | Unauthorized — invalid or expired token |
| 404 | Resource not found |

## Common Use Cases

Remove a resource that has been decommissioned or is no longer available for booking.

## Gotchas

- Deletion is permanent. Consider setting `isActive: false` instead for soft-delete.
- Existing appointments that reference this resource are NOT modified — they retain the resource reference but it becomes a dangling reference.
