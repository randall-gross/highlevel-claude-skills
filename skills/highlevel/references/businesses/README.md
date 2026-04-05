# Businesses API

Manage business entities within a HighLevel sub-account. Businesses represent companies or organizations that can be associated with contacts — useful for B2B scenarios where multiple contacts belong to the same company.

## Required Scopes

- `businesses.readonly` — read operations
- `businesses.write` — create, update, delete operations

## Common Patterns

- **locationId is required** on list and create endpoints.
- **Businesses are location-scoped** — each sub-account has its own set of businesses.
- **Contacts link to businesses** via the contact's `companyName` or business association.
- **Address** is a nested object with street, city, state, postalCode, country fields.

## Subdomain Routing

| Subdomain | Description |
|-----------|-------------|
| `core/` | List, get, create, update, delete businesses |

## Related Domains

- **Contacts** — contacts can be associated with businesses
- **Opportunities** — opportunities can reference a business entity
