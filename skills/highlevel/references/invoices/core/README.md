# Invoices — Core

Invoice CRUD operations, sending, voiding, recording payments, and configuration.

## Endpoints

| Method | Path | File | Description |
|--------|------|------|-------------|
| GET | `/invoices/` | [list.md](list.md) | List invoices |
| GET | `/invoices/{invoiceId}` | [get.md](get.md) | Get invoice |
| POST | `/invoices/` | [create.md](create.md) | Create invoice |
| PUT | `/invoices/{invoiceId}` | [update.md](update.md) | Update invoice |
| DELETE | `/invoices/{invoiceId}` | [delete.md](delete.md) | Delete invoice |
| POST | `/invoices/{invoiceId}/send` | [send.md](send.md) | Send invoice to contact |
| POST | `/invoices/{invoiceId}/void` | [void.md](void.md) | Void an invoice |
| POST | `/invoices/{invoiceId}/record-payment` | [record-payment.md](record-payment.md) | Record manual payment |
| GET | `/invoices/generate-invoice-number` | [generate-number.md](generate-number.md) | Generate next invoice number |
| PATCH | `/invoices/stats/last-visited-at` | [last-visited.md](last-visited.md) | Update last visited timestamp |
| PATCH | `/invoices/{invoiceId}/late-fees-configuration` | [late-fees-config.md](late-fees-config.md) | Update late fees config |

## Required Scopes
- `invoices.readonly` — GET endpoints
- `invoices.write` — POST/PUT/DELETE/PATCH endpoints
