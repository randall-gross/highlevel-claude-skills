# Conversations Core

CRUD operations and search for conversation objects. A conversation represents a communication thread between a location and a contact on a specific channel (SMS, email, live chat).

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| [get.md](./get.md) | GET | `/conversations/{conversationId}` | Get a single conversation |
| [create.md](./create.md) | POST | `/conversations/` | Create a new conversation |
| [update.md](./update.md) | PUT | `/conversations/{conversationId}` | Update conversation (star, read/unread) |
| [delete.md](./delete.md) | DELETE | `/conversations/{conversationId}` | Delete a conversation |
| [search.md](./search.md) | GET | `/conversations/search` | Search conversations with filters |

## Key Concepts

- A contact can have multiple conversations (one per channel type)
- Conversations track `unreadCount`, `starred`, and `lastMessageDate`
- The `assignedTo` field links to a HighLevel user ID for routing
- Deleting a conversation does NOT delete the contact
