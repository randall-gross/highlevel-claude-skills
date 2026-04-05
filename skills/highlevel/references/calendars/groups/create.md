# Create Calendar Group

- **Method:** POST
- **Path:** `/calendars/groups`
- **Scopes:** `calendars/groups.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |
| name | string | Yes | Group name |
| description | string | No | Group description |
| slug | string | No | URL slug for booking page |
| calendarIds | array | No | Array of calendar IDs to include |
| isActive | boolean | No | Whether group is active (default: true) |

## Request Example

```json
{
  "locationId": "ve9EPM428h8vShlRW1KT",
  "name": "Service Calendars",
  "description": "All service booking calendars",
  "slug": "service-calendars",
  "calendarIds": ["cal_abc123", "cal_def456"],
  "isActive": true
}
```

## Response Example

```json
{
  "group": {
    "id": "grp_new789",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "name": "Service Calendars",
    "description": "All service booking calendars",
    "slug": "service-calendars",
    "calendarIds": ["cal_abc123", "cal_def456"],
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
| 422 | Unprocessable Entity — slug already taken or invalid calendar IDs |

## Common Use Cases

Create a group to bundle related calendars (e.g., all sales calendars) into a single booking page for clients.

## Gotchas

- `slug` must be unique within the location. Use `validate-slug` endpoint to check before creating.
- Calendar IDs in `calendarIds` must exist in the same location.
