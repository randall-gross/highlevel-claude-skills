# Invoices — Estimates

Estimate CRUD operations, sending, number generation, and conversion to invoices.

## Endpoints

| Method | Path | File | Description |
|--------|------|------|-------------|
| GET | `/invoices/estimate/list` | [list.md](list.md) | List estimates |
| POST | `/invoices/estimate` | [create.md](create.md) | Create estimate |
| PUT | `/invoices/estimate/{estimateId}` | [update.md](update.md) | Update estimate |
| DELETE | `/invoices/estimate/{estimateId}` | [delete.md](delete.md) | Delete estimate |
| POST | `/invoices/estimate/{estimateId}/send` | [send.md](send.md) | Send estimate |
| GET | `/invoices/estimate/number/generate` | [generate-number.md](generate-number.md) | Generate estimate number |
| POST | `/invoices/estimate/{estimateId}/invoice` | [create-invoice-from.md](create-invoice-from.md) | Create invoice from estimate |
| PATCH | `/invoices/estimate/stats/last-visited-at` | [last-visited.md](last-visited.md) | Update last visited |

## Required Scopes
- `invoices/estimate.readonly` — GET endpoints
- `invoices/estimate.write` — POST/PUT/DELETE/PATCH endpoints
