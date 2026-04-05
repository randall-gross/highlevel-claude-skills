# Opportunities API

Manage opportunities (deals) within a HighLevel sales pipeline. Opportunities represent potential revenue and are always linked to a contact, a pipeline, and a pipeline stage. They track deal progression from open through won/lost/abandoned.

## Required Scopes

- `opportunities.readonly` — read and search operations
- `opportunities.write` — create, update, upsert, delete operations

## Common Patterns

- **Always requires pipelineId + pipelineStageId + contactId.** Every opportunity must be placed in a specific pipeline stage and linked to a contact.
- **Status is an enum:** `"open"` | `"won"` | `"lost"` | `"abandoned"`. There is no "closed" status — use "won" or "lost".
- **monetaryValue is a number, not a string.** Pass `5000`, not `"5000"`.
- **Upsert matches on locationId + contactId + pipelineId.** If an opportunity exists for that combination, it updates; otherwise it creates.
- **Search uses query params, not a request body.** Unlike contacts search, opportunity search uses GET with query parameters.

## Subdomain Routing

| Subdomain | README | Description |
|-----------|--------|-------------|
| `core/` | `core/README.md` | Get, create, update, upsert, delete, search, update status |
| `pipelines/` | `pipelines/list.md` | List pipelines and stages for a location |
| `followers/` | — | Add/remove followers on an opportunity |

## Related Domains

- **Contacts** — every opportunity references a `contactId`
- **Calendars** — sales appointments often result in opportunity creation or stage changes
- **Conversations** — conversation context helps close deals tracked as opportunities
