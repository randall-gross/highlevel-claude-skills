# Update Calendar Group

- **Method:** PUT
- **Path:** `/calendars/groups/{groupId}`
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
| name | string | No | Group name |
| description | string | No | Group description |
| slug | string | No | URL slug |
| calendarIds | array | No | Calendar IDs to include |

## Request Example

```bash
curl --request PUT \
  --url 'https://services.leadconnectorhq.com/calendars/groups/grp_abc123' \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28' \
  --data '{
    "name": "Updated Group Name",
    "calendarIds": ["cal_abc123", "cal_def456", "cal_ghi789"]
  }'
```

## Response Example

```json
{
  "group": {
    "id": "grp_abc123",
    "name": "Updated Group Name",
    "calendarIds": ["cal_abc123", "cal_def456", "cal_ghi789"],
    "dateUpdated": "2024-02-01T12:00:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Invalid request body |
| 401 | Unauthorized — invalid or expired token |
| 404 | Group not found |
| 422 | Unprocessable Entity |

## Common Use Cases

Add or remove calendars from a group, or rename the group.

## Gotchas

- Updating `calendarIds` replaces the entire list. Include all desired calendar IDs, not just additions.
- Partial updates are supported for other fields.
