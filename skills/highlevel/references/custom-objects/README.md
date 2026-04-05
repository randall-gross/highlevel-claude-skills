# Custom Objects API

Custom Objects allow creating custom data models within a HighLevel sub-account. Each custom object has a schema (field definitions) and records (data rows). Think of schemas as database tables and records as rows.

## Required Scopes

- `objects/schema.readonly` — read schema operations
- `objects/schema.write` — create, update schema operations
- `objects/record.readonly` — read record operations
- `objects/record.write` — create, update, delete record operations

## Key Concepts

- **Schema Key format:** `custom_objects.{object_name}` (e.g., `custom_objects.task`)
- **Field references** in filters use dot notation: `custom_objects.task.status`, `custom_objects.task.assignee`
- **Records** store data as key-value `properties` matching the schema's field definitions

## Rocket Digital PM System

The project management system at location `YEVDcWEDf2UqQ7ZSVPey` uses custom objects for:
- **Project** → **Epoch** → **Task** → **Subtask** hierarchy
- Tasks have fields like `title`, `status`, `assignee`, `files_affected`, `acceptance_criteria`
- Queried by Claude agents at session start to load assigned work

## Subdomain Routing

| Subdomain | README | Description |
|-----------|--------|-------------|
| `schemas/` | `schemas/README.md` | List, get, create, update custom object schemas |
| `records/` | `records/README.md` | Get, create, update, delete, search custom object records |

## Related Domains

- **Contacts** — custom object records can be associated with contacts
