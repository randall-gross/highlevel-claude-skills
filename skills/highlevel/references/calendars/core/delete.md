# Delete Calendar

- **Method:** DELETE
- **Path:** `/calendars/{calendarId}`
- **Scopes:** `calendars.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| calendarId | string | Yes | Calendar ID |

## Request Example

```bash
curl --request DELETE \
  --url 'https://services.leadconnectorhq.com/calendars/cal_abc123' \
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
| 400 | Invalid calendarId |
| 401 | Unauthorized — invalid or expired token |
| 404 | Calendar not found |

## Common Use Cases

Remove a calendar that is no longer needed, such as during service type cleanup.

## Gotchas

- Deleting a calendar does NOT delete its existing appointments. Those events remain but become orphaned.
- This action is irreversible. Consider setting `isActive: false` via update instead for soft-delete.
