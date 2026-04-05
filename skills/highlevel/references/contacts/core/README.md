# Contacts — Core

Core CRUD operations for contacts including get, list, create, update, upsert, delete, and advanced search.

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| `get.md` | GET | `/contacts/{contactId}` | Get a single contact by ID |
| `list.md` | GET | `/contacts/` | List contacts with cursor pagination |
| `create.md` | POST | `/contacts/` | Create a new contact |
| `update.md` | PUT | `/contacts/{contactId}` | Update an existing contact |
| `upsert.md` | POST | `/contacts/upsert` | Create or update by email/phone match |
| `delete.md` | DELETE | `/contacts/{contactId}` | Hard delete a contact |
| `search.md` | POST | `/contacts/search` | Advanced search with filters |
| `get-by-business.md` | GET | `/contacts/business/{businessId}` | Get contacts linked to a business |
| `get-duplicate.md` | GET | `/contacts/search/duplicate` | Check for duplicate contacts |
