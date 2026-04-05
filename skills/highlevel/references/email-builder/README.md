# Email Builder API

Create, update, and manage email templates and scheduled email campaigns.

## Required Scopes
- `emails/builder.readonly`
- `emails/builder.write`
- `emails/schedule.readonly`

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| `core/list.md` | GET | `/emails/builder` | List email templates |
| `core/create.md` | POST | `/emails/builder` | Create an email template |
| `core/update.md` | POST | `/emails/builder/data` | Update an email template |
| `core/delete.md` | DELETE | `/emails/builder/{locationId}/{templateId}` | Delete an email template |
| `core/list-campaigns.md` | GET | `/emails/schedule` | List scheduled email campaigns |

> This domain has placeholder endpoint files. Full documentation with request/response examples is planned for a future update.
