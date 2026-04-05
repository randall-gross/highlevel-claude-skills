# Invoices Domain

Invoice and estimate management. Create, send, track invoices and estimates. Supports templates, recurring schedules, and Text2Pay.

## Base URL
`https://services.leadconnectorhq.com`

## Required Scopes
| Scope | Access |
|-------|--------|
| `invoices.readonly` | Read invoices |
| `invoices.write` | Create/update/delete invoices |
| `invoices/estimate.readonly` | Read estimates |
| `invoices/estimate.write` | Create/update/delete estimates |
| `invoices/schedule.readonly` | Read schedules |
| `invoices/schedule.write` | Create/update/delete schedules |
| `invoices/template.readonly` | Read templates |
| `invoices/template.write` | Create/update/delete templates |

## Subdomains

| Subdomain | Path | Endpoints | Description |
|-----------|------|-----------|-------------|
| [core/](core/) | `/invoices/` | 11 | Invoice CRUD, send, void, record payments |
| [estimates/](estimates/) | `/invoices/estimate/` | 8 | Estimate CRUD, send, convert to invoice |
| [templates/](templates/) | `/invoices/template/` | 7 | Invoice template management |
| [estimate-templates/](estimate-templates/) | `/invoices/estimate/template/` | 5 | Estimate template management |
| [schedules/](schedules/) | `/invoices/schedule/` | 9 | Recurring invoice schedules |
| [text2pay/](text2pay/) | `/invoices/text2pay/` | 1 | Text2Pay link generation |

## Common Headers
```
Authorization: Bearer {token}
Content-Type: application/json
Version: 2021-07-28
```
