# Upload File Attachment

- **Method:** POST
- **Path:** `/conversations/messages/upload`
- **Scopes:** `conversations/message.write`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Headers

| Header | Value | Required |
|--------|-------|----------|
| `Content-Type` | `multipart/form-data` | Yes |
| `Authorization` | `Bearer TOKEN` | Yes |
| `Version` | `2021-07-28` | Yes |

### Form Data Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `fileAttachment` | file | Yes | The file to upload |
| `conversationId` | string | Yes | The conversation ID |

## Request Example

```bash
curl --request POST \
  --url https://services.leadconnectorhq.com/conversations/messages/upload \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Version: 2021-07-28' \
  --form 'fileAttachment=@/path/to/document.pdf' \
  --form 'conversationId=conv_abc123'
```

## Response Example

```json
{
  "uploadedFiles": [
    {
      "url": "https://storage.leadconnectorhq.com/location/ve9EPM428h8vShlRW1KT/conversations/conv_abc123/document.pdf",
      "name": "document.pdf",
      "contentType": "application/pdf"
    }
  ]
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad request -- missing file or conversation ID |
| 401 | Unauthorized -- invalid or expired token |
| 413 | File too large -- exceeds size limit |
| 415 | Unsupported file type |

## Common Use Cases

Upload images, PDFs, or documents before sending them as message attachments. The returned URL is then passed to the send message endpoint's `attachments` array.

## Gotchas

- This is a two-step process: (1) upload the file here, (2) send a message with the returned URL in the `attachments` array. You cannot attach raw files directly in the send endpoint.
- Content-Type must be `multipart/form-data`, not `application/json`.
- File size limits apply (typically 25MB for most file types).
- The returned URL is a HighLevel storage URL. It may require authentication to access directly.
