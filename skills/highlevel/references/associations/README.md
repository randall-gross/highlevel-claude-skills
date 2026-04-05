# Associations API

Define and manage relationships between custom objects in HighLevel. Associations create the schema (what can relate to what), and relations create the actual links between specific records.

## Required Scopes

- `associations.readonly` — read association definitions
- `associations.write` — create, update, delete association definitions
- `associations/relation.readonly` — read relations between records
- `associations/relation.write` — create, delete relations between records

## Common Patterns

- **Associations vs Relations:** An association defines the relationship type (e.g., "Contact has Projects"). A relation is a specific instance (e.g., "John Doe is linked to Project Alpha").
- **Key naming:** Association keys should be descriptive and snake_case (e.g., `contact_to_project`).
- **Object keys** reference custom object keys from the Custom Objects API.
- **locationId is required** for listing and creating associations.

## Subdomain Routing

| Subdomain | Description |
|-----------|-------------|
| `core/` | CRUD operations on association definitions |
| `relations/` | Create, list, and delete relations between specific records |

## Related Domains

- **Custom Objects** — associations link custom object types together
- **Contacts** — contacts can be one side of an association
