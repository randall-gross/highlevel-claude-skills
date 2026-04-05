# Download Transcription File

- **Method:** GET
- **Path:** `/conversations/locations/{locationId}/messages/{messageId}/transcription/download`
- **Scopes:** `conversations/message.readonly`
- **Rate Limit:** Standard (100/10s)

## Parameters

### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `locationId` | string | Yes | The location ID |
| `messageId` | string | Yes | The call message ID |

## Request Example

```bash
curl --request GET \
  --url https://services.leadconnectorhq.com/conversations/locations/ve9EPM428h8vShlRW1KT/messages/msg_xyz789/transcription/download \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Version: 2021-07-28' \
  --output transcription.txt
```

## Response Example

The response is a file download (typically `text/plain` or `application/json`), not a JSON API response. The file contains the full transcription text.

```
Content-Type: text/plain
Content-Disposition: attachment; filename="transcription_msg_xyz789.txt"

[0:00] Agent: Hi, this is John from ABC Plumbing.
[0:03] Agent: I'm calling about your appointment tomorrow at 2 PM.
[0:07] Agent: Please call us back if you need to reschedule.
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad request -- message is not a call type |
| 401 | Unauthorized -- invalid or expired token |
| 404 | Transcription not found or not yet available |

## Common Use Cases

Export transcription as a file for archiving or compliance. Download transcripts for offline review or integration with external document management systems.

## Gotchas

- This returns a file download, not a JSON response. Handle the response as a binary/text stream.
- Same path pattern as the get transcription endpoint, with `/download` appended.
- Same availability constraints apply -- transcription must be enabled and processing must be complete.
