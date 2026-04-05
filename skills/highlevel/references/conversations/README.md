# Conversations Domain

Manage two-way conversations (SMS, email, live chat, WhatsApp, phone calls) between locations and contacts. Conversations are the central messaging hub in HighLevel, tying together all communication channels into a unified thread per contact.

## Required Scopes

| Scope | Purpose |
|-------|---------|
| `conversations.readonly` | Read conversations |
| `conversations.write` | Create/update/delete conversations |
| `conversations/message.readonly` | Read messages |
| `conversations/message.write` | Send messages, upload attachments |
| `conversations/livechat.write` | Live chat typing indicators |
| `conversations/reports.readonly` | Reporting on conversations |

## Common Patterns

- Every conversation is tied to a `contactId` and `locationId`
- Conversation `type` is one of: `TYPE_SMS`, `TYPE_EMAIL`, `TYPE_LIVE_CHAT`, `TYPE_PHONE`, `TYPE_WHATSAPP`
- Messages within a conversation have a `direction` (inbound/outbound) and `status` (pending, delivered, read, failed)
- File attachments must be uploaded first via the upload endpoint, then referenced by URL in the send message call
- Scheduled messages can be cancelled before they are sent
- Call recordings and transcriptions are accessed via separate sub-endpoints

## Subdomain Routing

| Subdomain | Path | Endpoints | Description |
|-----------|------|-----------|-------------|
| [core/](./core/) | `/conversations/` | 5 | CRUD + search on conversation objects |
| [messages/](./messages/) | `/conversations/messages/` | 10 | Send, receive, list, and manage messages |
| [recording/](./recording/) | `/conversations/messages/{id}/.../recording` | 1 | Retrieve call recordings |
| [transcription/](./transcription/) | `/conversations/locations/{id}/messages/{id}/transcription` | 2 | Get or download call transcriptions |
| [livechat/](./livechat/) | `/conversations/providers/live-chat/` | 1 | Live chat typing indicators |

## Related Domains

- **Contacts** -- every conversation belongs to a contact
- **Locations** -- conversations are scoped to a location
- **Calendars** -- appointment reminders often trigger conversation messages
- **Workflows** -- automated messages are sent through conversations
