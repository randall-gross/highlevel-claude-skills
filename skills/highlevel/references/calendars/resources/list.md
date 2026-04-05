# List Calendar Resources

- **Method:** GET
- **Path:** `/calendars/resources/{resourceType}`
- **Scopes:** `calendars/resources.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| resourceType | string | Yes | Resource type: `equipments` or `rooms` |

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |

## Request Example

```bash
curl --request GET \
  --url 'https://services.leadconnectorhq.com/calendars/resources/equipments?locationId=ve9EPM428h8vShlRW1KT' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "resources": [
    {
      "id": "res_abc123",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "name": "Conference Projector",
      "description": "Epson 4K projector for presentations",
      "quantity": 2,
      "isActive": true,
      "calendarIds": ["cal_abc123"],
      "dateCreated": "2024-01-01T10:00:00.000Z",
      "dateUpdated": "2024-01-15T10:00:00.000Z"
    }
  ]
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Invalid resourceType or missing locationId |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases

List all equipment or rooms available for calendar bookings to show resource availability in a scheduling UI.

## Gotchas

- `resourceType` must be exactly `equipments` (plural) or `rooms` — no other values are accepted.
- Resources are linked to calendars via `calendarIds` — a resource can be shared across multiple calendars.
