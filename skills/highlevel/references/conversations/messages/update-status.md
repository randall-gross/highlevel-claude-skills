# Update Message Status

- **Method:** PUT
- **Path:** `/conversations/messages/{messageId}/status`
- **Scopes:** `conversations/message.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `messageId` | string | Yes | The message ID |

### Body Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `status` | string | Yes | New status: `read`, `delivered`, `failed`, `pending` |
| `error` | object | No | Error details (when status is `failed`) |
| `error.code` | string | No | Error code |
| `error.message` | string | No | Error description |

## Request Example

```bash
curl --request PUT \
  --url https://services.leadconnectorhq.com/conversations/messages/msg_xyz789/status \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Content-Type: application/json' \
  --header 'Version: 2021-07-28' \
  --data '{
    "status": "read"
  }'
```

## Response Example

```json
{
  "message": {
    "id": "msg_xyz789",
    "status": "read"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad request -- invalid status value |
| 401 | Unauthorized -- invalid or expired token |
| 404 | Message not found |

## Common Use Cases

Update delivery status from an external messaging provider's webhook callback. Mark messages as read when displayed in a custom UI. Log delivery failures with error details.

## Gotchas

- This updates the status of a single message, not the conversation's `unreadCount`. To mark a conversation as read, use the update conversation endpoint.
- Valid status transitions depend on the current status. You generally cannot move from `read` back to `pending`.
- When setting status to `failed`, include the `error` object with a code and message for debugging.
