# Marketplace API

Manage marketplace app installations and billing charges for HighLevel marketplace apps.

## Required Scopes
- `marketplace-external-auth-migration.write`
- `marketplace-installer-details.readonly`

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| [uninstall.md](core/uninstall.md) | DELETE | `/marketplace/app/{appId}/installations` | Uninstall app |
| [get-installer.md](core/get-installer.md) | GET | `/marketplace/app/{appId}/installations` | Get installer details |
| [list-charges.md](core/list-charges.md) | GET | `/marketplace/billing/charges` | List billing charges |
| [create-charge.md](core/create-charge.md) | POST | `/marketplace/billing/charges` | Create a billing charge |
| [has-funds.md](core/has-funds.md) | GET | `/marketplace/billing/charges/has-funds` | Check if location has funds |
| [get-charge.md](core/get-charge.md) | GET | `/marketplace/billing/charges/{chargeId}` | Get a specific charge |
| [delete-charge.md](core/delete-charge.md) | DELETE | `/marketplace/billing/charges/{chargeId}` | Delete a charge |

> This domain has placeholder endpoint files. Full documentation with request/response examples is planned for a future update.
