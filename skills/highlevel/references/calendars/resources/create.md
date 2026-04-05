# Create Calendar Resource

- **Method:** POST
- **Path:** `/calendars/resources/{resourceType}`
- **Scopes:** `calendars/resources.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| resourceType | string | Yes | Resource type: `equipments` or `rooms` |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| name | string | Yes | Resource name |
| description | string | No | Resource description |
| quantity | number | No | Available quantity (default: 1) |
| capacity | number | No | Room capacity (rooms only) |
| calendarIds | array | No | Calendars this resource is linked to |
| isActive | boolean | No | Whether resource is active (default: true) |

## Request Example

```json
{
  "locationId": "ve9EPM428h8vShlRW1KT",
  "name": "Meeting Room B",
  "description": "Second floor, seats 6",
  "capacity": 6,
  "quantity": 1,
  "calendarIds": ["cal_abc123"],
  "isActive": true
}
```

## Response Example

```json
{
  "resource": {
    "id": "res_new789",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "Meeting Room B",
    "description": "Second floor, seats 6",
    "capacity": 6,
    "quantity": 1,
    "calendarIds": ["cal_abc123"],
    "isActive": true,
    "dateCreated": "2024-02-01T10:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing required fields |
| 401 | Unauthorized — invalid or expired token |
| 422 | Unprocessable Entity — invalid calendar IDs or validation error |

## Common Use Cases

Add a new room or piece of equipment to the booking system so it can be reserved alongside calendar appointments.

## Gotchas

- `resourceType` in the path determines the type — there is no `type` field in the body.
- `capacity` is only meaningful for rooms but will be accepted for equipment without error.
- `quantity` controls how many concurrent bookings the resource can support.
