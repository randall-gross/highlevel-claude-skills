# Contacts API

Manage contacts within a HighLevel sub-account. Contacts are the central entity in HL — most other domains (opportunities, conversations, calendars) reference contacts.

## Required Scopes

- `contacts.readonly` — read operations
- `contacts.write` — create, update, delete, upsert operations

## Common Patterns

- **Always use upsert for lead forms.** It deduplicates by email/phone and avoids creating duplicates.
- **locationId is required** on most endpoints as a query parameter or in the request body.
- **Custom fields** use the format `[{ "id": "field_id", "value": "value" }]` — the `id` is the custom field ID, NOT the field name.
- **Tags** are strings, not IDs. Pass the tag name directly.

## Subdomain Routing

| Subdomain | README | Description |
|-----------|--------|-------------|
| `core/` | `core/README.md` | Get, list, create, update, upsert, delete, search contacts |
| `tags/` | `tags/README.md` | Add, remove, and bulk update contact tags |
| `notes/` | `notes/README.md` | CRUD operations on contact notes |
| `tasks/` | `tasks/README.md` | CRUD operations on contact tasks |
| `followers/` | — | Add/remove followers on a contact |
| `campaigns/` | — | Add/remove contacts from campaigns |
| `workflows/` | — | Add/remove contacts from workflows |
| `bulk/` | — | Bulk operations (business assignment, tag updates) |
| `dnd/` | — | Update Do Not Disturb status |

## Related Domains

- **Opportunities** — contacts are linked to opportunities via `contactId`
- **Conversations** — conversations are created for a specific `contactId`
- **Calendars** — appointments reference `contactId`
