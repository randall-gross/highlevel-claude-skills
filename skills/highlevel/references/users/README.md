# Users API

Manage users (team members) within a HighLevel agency or sub-account. Users are the people who log in and operate the CRM — agents, admins, sales reps.

## Required Scopes

- `users.readonly` — read operations
- `users.write` — create, update, delete operations

## Common Patterns

- **locationId is required** on list and search endpoints.
- **Roles** include `admin`, `user`, and custom roles defined at the agency level.
- **Permissions** are granular and location-scoped — a user can have different permissions per location.
- **type** distinguishes between `account` (agency-level) and `location` (sub-account-level) users.

## Subdomain Routing

| Subdomain | Description |
|-----------|-------------|
| `core/` | List, get, create, update, delete, search, and filter users |

## Related Domains

- **Contacts** — users are assigned as owners/followers on contacts
- **Opportunities** — users are assigned to opportunities
- **Calendars** — users own calendars and are assigned to appointments
