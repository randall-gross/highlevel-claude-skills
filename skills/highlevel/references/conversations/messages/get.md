# Get Message

- **Method:** GET
- **Path:** `/conversations/messages/{id}`
- **Scopes:** `conversations/message.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | string | Yes | The message ID |

## Request Example

```bash
curl --request GET \
  --url https://services.leadconnectorhq.com/conversations/messages/msg_xyz789 \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "message": {
    "id": "msg_xyz789",
    "conversationId": "conv_abc123",
    "contactId": "nmFmQEsNgz6AVpgLVUJ0",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "type": "TYPE_SMS",
    "direction": "inbound",
    "status": "delivered",
    "body": "Hi, I'd like to schedule an appointment",
    "dateAdded": "2026-04-01T10:00:00.000Z",
    "attachments": [],
    "meta": {}
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad request -- invalid message ID format |
| 401 | Unauthorized -- invalid or expired token |
| 404 | Message not found |

## Common Use Cases

Retrieve a specific message by ID, typically after receiving a webhook notification about a new message.

## Gotchas

- For email messages, this endpoint returns a plain-text preview of the body. Use `GET /conversations/messages/email/{id}` for the full HTML content.
- The `meta` object contains channel-specific metadata (e.g., SMS delivery receipts, email open tracking).
