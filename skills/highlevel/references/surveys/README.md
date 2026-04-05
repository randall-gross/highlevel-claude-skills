# Surveys API

Access surveys and survey submissions in HighLevel. Surveys are multi-step question flows used for lead qualification, customer feedback, and data collection.

## Required Scopes

- `surveys.readonly` — read surveys and submissions

## Common Patterns

- **Read-only API** — surveys are created in the HL UI, not via API.
- **locationId is required** on all endpoints.
- **Submissions** are linked to contacts — when a survey is completed, HL creates or updates a contact.
- **Pagination** uses `limit`/`skip` for surveys and `limit`/`page` for submissions.

## Subdomain Routing

| Subdomain | Description |
|-----------|-------------|
| `core/` | List surveys, get submissions |

## Related Domains

- **Contacts** — survey submissions create or update contacts
- **Workflows** — survey completions can trigger workflows
- **Forms** — similar API pattern; surveys are multi-step, forms are single-page
