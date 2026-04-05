# List Calendar Groups

- **Method:** GET
- **Path:** `/calendars/groups`
- **Scopes:** `calendars/groups.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| locationId | string | Yes | Location ID |

## Request Example

```bash
curl --request GET \
  --url 'https://services.leadconnectorhq.com/calendars/groups?locationId=ve9EPM428h8vShlRW1KT' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "groups": [
    {
      "id": "grp_abc123",
      "locationId": "ve9EPM428h8vShlRW1KT",
      "name": "Sales Calendars",
      "description": "All sales team booking calendars",
      "slug": "sales-calendars",
      "isActive": true,
      "calendarIds": ["cal_abc123", "cal_def456"],
      "dateCreated": "2024-01-01T10:00:00.000Z",
      "dateUpdated": "2024-01-15T10:00:00.000Z"
    }
  ]
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing or invalid locationId |
| 401 | Unauthorized — invalid or expired token |

## Common Use Cases

List all calendar groups for a location to display grouped booking options in a widget.

## Gotchas

- Groups are used to bundle multiple calendars into a single booking page.
- The `calendarIds` array shows which calendars belong to this group.
