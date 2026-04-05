# Cancel Scheduled Message

- **Method:** DELETE
- **Path:** `/conversations/messages/{messageId}/schedule`
- **Scopes:** `conversations/message.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `messageId` | string | Yes | The scheduled message ID |

## Request Example

```bash
curl --request DELETE \
  --url https://services.leadconnectorhq.com/conversations/messages/msg_xyz789/schedule \
  --header 'Authorization: Bearer TOKEN' \
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
| 400 | Bad request -- message is not scheduled or has already been sent |
| 401 | Unauthorized -- invalid or expired token |
| 404 | Message not found |

## Common Use Cases

Cancel a follow-up SMS that was scheduled but is no longer needed (e.g., the contact already replied). Cancel automated messages before they send.

## Gotchas

- Only works on messages with a `scheduledTimestamp` that have not yet been sent. Once a message is sent, it cannot be cancelled.
- This endpoint is for non-email messages (SMS, WhatsApp, etc). For scheduled emails, use the cancel email schedule endpoint.
