# Delete Calendar Group

- **Method:** DELETE
- **Path:** `/calendars/groups/{groupId}`
- **Scopes:** `calendars/groups.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| groupId | string | Yes | Group ID |

## Request Example

```bash
curl --request DELETE \
  --url 'https://services.leadconnectorhq.com/calendars/groups/grp_abc123' \
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
| 400 | Invalid groupId |
| 401 | Unauthorized — invalid or expired token |
| 404 | Group not found |

## Common Use Cases

Remove a calendar group that is no longer needed.

## Gotchas

- Deleting a group does NOT delete the calendars within it. They become ungrouped.
- Any booking pages using this group's slug will stop working.
