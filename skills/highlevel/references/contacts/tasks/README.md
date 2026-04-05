# Contacts — Tasks

CRUD operations for tasks assigned to a contact, plus a dedicated endpoint to mark tasks as completed.

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| `list.md` | GET | `/contacts/{contactId}/tasks` | List all tasks for a contact |
| `get.md` | GET | `/contacts/{contactId}/tasks/{taskId}` | Get a single task |
| `create.md` | POST | `/contacts/{contactId}/tasks` | Create a new task |
| `update.md` | PUT | `/contacts/{contactId}/tasks/{taskId}` | Update an existing task |
| `delete.md` | DELETE | `/contacts/{contactId}/tasks/{taskId}` | Delete a task |
| `complete.md` | PUT | `/contacts/{contactId}/tasks/{taskId}/completed` | Mark a task as completed |
