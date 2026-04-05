# Workflows API

List workflows within a HighLevel sub-account. Workflows are the automation engine in HL — they define trigger-action sequences for contacts (e.g., send email, wait, assign tag).

**Note:** This domain only has one endpoint (list workflows). Adding/removing contacts from workflows is handled via the Contacts domain — see `contacts/workflows/add.md` and `contacts/workflows/remove.md`.

## Required Scopes

- `workflows.readonly` — list workflows

## Subdomain Routing

| Subdomain | README | Description |
|-----------|--------|-------------|
| `core/` | `core/README.md` | List workflows |

## Related Domains

- **Contacts** — add/remove contacts from workflows via `contacts/workflows/`
