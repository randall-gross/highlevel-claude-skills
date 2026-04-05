# Update Calendar Resource

- **Method:** PUT
- **Path:** `/calendars/resources/{resourceType}/{id}`
- **Scopes:** `calendars/resources.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| resourceType | string | Yes | Resource type: `equipments` or `rooms` |
| id | string | Yes | Resource ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| name | string | No | Resource name |
| description | string | No | Resource description |
| quantity | number | No | Available quantity |
| capacity | number | No | Room capacity |
| calendarIds | array | No | Linked calendar IDs |
| isActive | boolean | No | Active status |

## Request Example

```bash
curl --request PUT \
  --url 'https://services.leadconnectorhq.com/calendars/resources/rooms/res_abc123' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28' \
  --data '{
    "name": "Conference Room A (Renovated)",
    "capacity": 16
  }'
```

## Response Example

```json
{
  "resource": {
    "id": "res_abc123",
    "name": "Conference Room A (Renovated)",
    "capacity": 16,
    "dateUpdated": "2024-02-01T12:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Invalid request body |
| 401 | Unauthorized — invalid or expired token |
| 404 | Resource not found |
| 422 | Unprocessable Entity |

## Common Use Cases

Update resource details like capacity, rename a room, or change which calendars a resource is linked to.

## Gotchas

- Partial updates are supported.
- Updating `calendarIds` replaces the entire array — include all desired IDs.
