# Cancel Scheduled Email

- **Method:** DELETE
- **Path:** `/conversations/messages/email/{emailMessageId}/schedule`
- **Scopes:** `conversations/message.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `emailMessageId` | string | Yes | The scheduled email message ID |

## Request Example

```bash
curl --request DELETE \
  --url https://services.leadconnectorhq.com/conversations/messages/email/msg_xyz789/schedule \
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
| 400 | Bad request -- email is not scheduled or has already been sent |
| 401 | Unauthorized -- invalid or expired token |
| 404 | Email message not found |

## Common Use Cases

Cancel a scheduled follow-up email before it sends. Remove queued campaign emails for a specific contact.

## Gotchas

- This is the email-specific version of cancel schedule. The path includes `/email/` -- using the non-email cancel endpoint with an email message ID will fail.
- Only works on emails that have a `scheduledTimestamp` and have not yet been sent.
