# Forms API

Manage forms and form submissions in HighLevel. Forms are used for lead capture, surveys, and data collection on websites and funnels.

## Required Scopes

- `forms.readonly` — read forms and submissions
- `forms.write` — upload files to custom fields

## Common Patterns

- **locationId is required** on all endpoints.
- **Form types** include standard forms and survey-style forms.
- **Submissions** are linked to contacts — when a form is submitted, HL creates or updates a contact.
- **Pagination** uses `limit`/`skip` for forms and `limit`/`page` for submissions.

## Subdomain Routing

| Subdomain | Description |
|-----------|-------------|
| `core/` | List forms, get submissions, upload files |

## Related Domains

- **Contacts** — form submissions create or update contacts
- **Workflows** — form submissions can trigger workflows
- **Custom Fields** — form fields map to contact custom fields
