# Get Calendar Resource

- **Method:** GET
- **Path:** `/calendars/resources/{resourceType}/{id}`
- **Scopes:** `calendars/resources.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| resourceType | string | Yes | Resource type: `equipments` or `rooms` |
| id | string | Yes | Resource ID |

## Request Example

```bash
curl --request GET \
  --url 'https://services.leadconnectorhq.com/calendars/resources/rooms/res_abc123' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "resource": {
    "id": "res_abc123",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "Conference Room A",
    "description": "Main floor conference room, seats 12",
    "capacity": 12,
    "quantity": 1,
    "isActive": true,
    "calendarIds": ["cal_abc123", "cal_def456"],
    "dateCreated": "2024-01-01T10:00:00.000Z",
    "dateUpdated": "2024-01-15T10:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Invalid resourceType or ID |
| 401 | Unauthorized — invalid or expired token |
| 404 | Resource not found |

## Common Use Cases

Fetch details about a specific room or piece of equipment for display in a booking confirmation.

## Gotchas

- The `resourceType` in the path must match the actual type of the resource. Requesting an equipment ID under `/rooms/` will return 404.
