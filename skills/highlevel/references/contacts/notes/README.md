# Contacts — Notes

CRUD operations for notes attached to a contact. Notes are simple text entries with timestamps.

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| `list.md` | GET | `/contacts/{contactId}/notes` | List all notes for a contact |
| `get.md` | GET | `/contacts/{contactId}/notes/{id}` | Get a single note |
| `create.md` | POST | `/contacts/{contactId}/notes` | Create a new note |
| `update.md` | PUT | `/contacts/{contactId}/notes/{id}` | Update an existing note |
| `delete.md` | DELETE | `/contacts/{contactId}/notes/{id}` | Delete a note |
