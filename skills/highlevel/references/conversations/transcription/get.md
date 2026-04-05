# Get Transcription

- **Method:** GET
- **Path:** `/conversations/locations/{locationId}/messages/{messageId}/transcription`
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
  --url https://services.leadconnectorhq.com/conversations/locations/ve9EPM428h8vShlRW1KT/messages/msg_xyz789/transcription \
  --header 'Authorization: Bearer TOKEN' \
  --header 'Version: 2021-07-28'
```

## Response Example

```json
{
  "transcription": {
    "id": "trans_abc123",
    "messageId": "msg_xyz789",
    "locationId": "ve9EPM428h8vShlRW1KT",
    "status": "completed",
    "text": "Hi, this is John from ABC Plumbing. I'm calling about your appointment tomorrow at 2 PM. Please call us back if you need to reschedule.",
    "segments": [
      {
        "speaker": "agent",
        "text": "Hi, this is John from ABC Plumbing.",
        "startTime": 0.5,
        "endTime": 3.2
      },
      {
        "speaker": "agent",
        "text": "I'm calling about your appointment tomorrow at 2 PM.",
        "startTime": 3.5,
        "endTime": 7.1
      }
    ],
    "duration": 15,
    "dateAdded": "2026-04-01T10:35:00.000Z"
  }
}
```

## Error Responses

| Status | Meaning |
|--------|---------|
| 400 | Bad request -- message is not a call type |
| 401 | Unauthorized -- invalid or expired token |
| 404 | Transcription not found or not yet available |

## Common Use Cases

Display call transcripts in a custom CRM view. Search call content for keywords. Feed transcriptions into AI for sentiment analysis or summary generation.

## Gotchas

- Transcription is only available if call recording AND transcription are enabled for the location.
- Transcription is processed asynchronously after the call ends. A 404 immediately after a call may mean it is still processing -- retry after a delay.
- Note the path order: `/locations/{locationId}/messages/{messageId}` -- this differs from the recording endpoint which uses `/messages/{messageId}/locations/{locationId}`.
- The `segments` array provides speaker-labeled, timestamped chunks. Not all transcriptions include segments.
