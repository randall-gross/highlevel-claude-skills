# Delete Event

- **Method:** DELETE
- **Path:** `/calendars/events/{eventId}`
- **Scopes:** `calendars/events.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| eventId | string | Yes | Event ID |

## Request Example

```bash
curl --request DELETE \
  --url 'https://services.leadconnectorhq.com/calendars/events/evt_abc123' \
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
| 400 | Invalid eventId |
| 401 | Unauthorized — invalid or expired token |
| 404 | Event not found |

## Common Use Cases

Remove an appointment or block slot from the calendar. Used when a booking is completely cancelled and should be erased.

## Gotchas

- This endpoint works for BOTH appointments and block slots — the path is `/calendars/events/{eventId}`, not under `/appointments/`.
- Deletion is permanent. Consider updating `appointmentStatus` to `cancelled` instead to preserve the record.
- Deleting an appointment does NOT automatically notify the contact. Handle notifications separately.
