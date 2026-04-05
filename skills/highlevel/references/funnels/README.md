# Funnels API

List funnels and pages, count pages, and manage URL redirects for HighLevel funnels.

## Required Scopes
- `funnels/funnel.readonly`
- `funnels/page.readonly`
- `funnels/pagecount.readonly`
- `funnels/redirect.readonly`
- `funnels/redirect.write`

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| `core/list.md` | GET | `/funnels/funnel/list` | List funnels |
| `core/list-pages.md` | GET | `/funnels/page` | List funnel pages |
| `core/count-pages.md` | GET | `/funnels/page/count` | Count funnel pages |
| `redirects/list.md` | GET | `/funnels/lookup/redirect/list` | List redirects |
| `redirects/create.md` | POST | `/funnels/lookup/redirect` | Create a redirect |
| `redirects/update.md` | PATCH | `/funnels/lookup/redirect/{id}` | Update a redirect |
| `redirects/delete.md` | DELETE | `/funnels/lookup/redirect/{id}` | Delete a redirect |

> This domain has placeholder endpoint files. Full documentation with request/response examples is planned for a future update.
