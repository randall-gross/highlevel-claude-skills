# Get Email Message

- **Method:** GET
- **Path:** `/conversations/messages/email/{id}`
- **Scopes:** `conversations/message.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | string | Yes | The email message ID |

## Request Example

```bash
curl --request GET \
  --url https://services.leadconnectorhq.com/conversations/messages/email/msg_xyz789 \
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
    "type": "TYPE_EMAIL",
    "direction": "inbound",
    "status": "delivered",
    "subject": "Question about your services",
    "body": "Hi, I was wondering about...",
    "html": "<html><body><p>Hi, I was wondering about...</p></body></html>",
    "from": "customer@example.com",
    "to": ["business@example.com"],
    "cc": [],
    "bcc": [],
    "dateAdded": "2026-04-01T10:00:00.000Z",
    "attachments": [
      {
        "url": "https://storage.leadconnectorhq.com/...",
        "name": "document.pdf",
        "contentType": "application/pdf"
      }
    ]
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad request -- invalid message ID or message is not an email |
| 401 | Unauthorized -- invalid or expired token |
| 404 | Email message not found |

## Common Use Cases

Display the full HTML email body in a custom inbox. Retrieve email attachments for processing. Show email thread with proper formatting.

## Gotchas

- This is specifically for email messages. Using a non-email message ID returns a 400 error.
- The `html` field contains the full rendered HTML. The `body` field is a plain-text fallback.
- Inline images in the HTML may reference HighLevel storage URLs that require authentication to access.
