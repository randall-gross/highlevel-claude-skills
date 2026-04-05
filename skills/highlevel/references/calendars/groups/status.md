# Update Calendar Group Status

- **Method:** PUT
- **Path:** `/calendars/groups/{groupId}/status`
- **Scopes:** `calendars/groups.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| groupId | string | Yes | Group ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| isActive | boolean | Yes | Enable or disable the group |

## Request Example

```bash
curl --request PUT \
  --url 'https://services.leadconnectorhq.com/calendars/groups/grp_abc123/status' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28' \
  --data '{
    "isActive": false
  }'
```

## Response Example

```json
{
  "group": {
    "id": "grp_abc123",
    "isActive": false,
    "dateUpdated": "2024-02-01T12:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Missing isActive field |
| 401 | Unauthorized — invalid or expired token |
| 404 | Group not found |

## Common Use Cases

Temporarily disable a calendar group without deleting it — useful for seasonal services or maintenance periods.

## Gotchas

- Disabling a group hides it from booking widgets but preserves all configuration.
- Existing appointments booked through this group are NOT affected.
- This is a dedicated status endpoint — you can also set `isActive` via the general update endpoint.
