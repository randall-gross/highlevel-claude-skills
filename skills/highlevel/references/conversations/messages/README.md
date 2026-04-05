# Conversation Messages

Send, receive, list, and manage individual messages within conversations. Supports SMS, email, WhatsApp, Facebook Messenger, Instagram DM, Google Business Messages, and live chat.

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| [list.md](./list.md) | GET | `/conversations/{conversationId}/messages` | List messages in a conversation |
| [get.md](./get.md) | GET | `/conversations/messages/{id}` | Get a single message |
| [get-email.md](./get-email.md) | GET | `/conversations/messages/email/{id}` | Get email with full HTML body |
| [send.md](./send.md) | POST | `/conversations/messages` | Send a new message |
| [inbound.md](./inbound.md) | POST | `/conversations/messages/inbound` | Log an external inbound message |
| [outbound.md](./outbound.md) | POST | `/conversations/messages/outbound` | Log an external outbound call |
| [upload.md](./upload.md) | POST | `/conversations/messages/upload` | Upload a file attachment |
| [update-status.md](./update-status.md) | PUT | `/conversations/messages/{messageId}/status` | Update message status |
| [cancel-schedule.md](./cancel-schedule.md) | DELETE | `/conversations/messages/{messageId}/schedule` | Cancel scheduled message |
| [cancel-email-schedule.md](./cancel-email-schedule.md) | DELETE | `/conversations/messages/email/{emailMessageId}/schedule` | Cancel scheduled email |

## Key Concepts

- The `send` endpoint is the primary way to send messages across all channels
- For SMS: provide `message` (text body) and `contactId`
- For Email: provide `html`, `subject`, `emailFrom`, and `contactId`
- Attachments must be uploaded first via `upload`, then referenced by URL in the send call
- `inbound` and `outbound` endpoints are for logging messages that happened outside HighLevel (e.g., external phone system)
- Scheduled messages have a `scheduledTimestamp` and can be cancelled before send time
