# Contacts — Tags

Add, remove, and bulk update tags on contacts. Tags are plain strings, not IDs.

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| `add.md` | POST | `/contacts/{contactId}/tags` | Add tags to a contact |
| `remove.md` | DELETE | `/contacts/{contactId}/tags` | Remove tags from a contact |
| `bulk-update.md` | POST | `/contacts/bulk/tags/update/{type}` | Bulk add/remove tags across multiple contacts |
