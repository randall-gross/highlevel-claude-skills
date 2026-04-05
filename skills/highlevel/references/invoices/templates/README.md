# Invoices — Templates

Invoice template management including late fees and payment method configuration.

## Endpoints

| Method | Path | File | Description |
|--------|------|------|-------------|
| GET | `/invoices/template` | [list.md](list.md) | List invoice templates |
| GET | `/invoices/template/{templateId}` | [get.md](get.md) | Get template |
| POST | `/invoices/template` | [create.md](create.md) | Create template |
| PUT | `/invoices/template/{templateId}` | [update.md](update.md) | Update template |
| DELETE | `/invoices/template/{templateId}` | [delete.md](delete.md) | Delete template |
| PATCH | `/invoices/template/{templateId}/late-fees-configuration` | [late-fees-config.md](late-fees-config.md) | Update late fees |
| PATCH | `/invoices/template/{templateId}/payment-methods-configuration` | [payment-methods-config.md](payment-methods-config.md) | Update payment methods |

## Required Scopes
- `invoices/template.readonly` — GET endpoints
- `invoices/template.write` — POST/PUT/DELETE/PATCH endpoints
