# Invoices — Estimate Templates

Estimate template management and preview.

## Endpoints

| Method | Path | File | Description |
|--------|------|------|-------------|
| GET | `/invoices/estimate/template` | [list.md](list.md) | List estimate templates |
| POST | `/invoices/estimate/template` | [create.md](create.md) | Create estimate template |
| PUT | `/invoices/estimate/template/{templateId}` | [update.md](update.md) | Update estimate template |
| DELETE | `/invoices/estimate/template/{templateId}` | [delete.md](delete.md) | Delete estimate template |
| GET | `/invoices/estimate/template/preview` | [preview.md](preview.md) | Preview template |

## Required Scopes
- `invoices/template.readonly` — GET endpoints
- `invoices/template.write` — POST/PUT/DELETE endpoints
