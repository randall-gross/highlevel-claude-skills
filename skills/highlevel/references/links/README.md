# Links API (Trigger Links)

Manage trigger links in HighLevel. Trigger links are trackable URLs that, when clicked by a contact, can trigger automations, update contact fields, add tags, or start workflows.

## Required Scopes

- `links.readonly` — read operations
- `links.write` — create, update, delete operations

## Common Patterns

- **locationId is required** on list, create, and search endpoints.
- **Trigger links have two purposes:** tracking clicks and triggering automations.
- **redirectTo** is the destination URL the contact lands on after clicking.
- **fieldKey/fieldValue** can automatically update a contact field on click.

## Subdomain Routing

| Subdomain | Description |
|-----------|-------------|
| `core/` | List, get, create, update, delete, and search trigger links |

## Related Domains

- **Contacts** — trigger links track contact clicks
- **Workflows** — trigger links can start workflows
