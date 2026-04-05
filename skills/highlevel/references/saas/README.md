# SaaS API

Manage SaaS mode for agency sub-accounts including plans, subscriptions, rebilling, and bulk enable/disable operations.

## Required Scopes
- `saas/company.read`
- `saas/company.write`
- `saas/location.read`
- `saas/location.write`

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| `core/get-plans.md` | GET | `/saas/agency-plans/{companyId}` | Get agency plans |
| `core/bulk-disable.md` | POST | `/saas/bulk-disable-saas/{companyId}` | Bulk disable SaaS for locations |
| `core/bulk-enable.md` | POST | `/saas/bulk-enable-saas/{companyId}` | Bulk enable SaaS for locations |
| `core/enable.md` | POST | `/saas/enable-saas/{locationId}` | Enable SaaS for a location |
| `core/get-subscription.md` | GET | `/saas/get-saas-subscription/{locationId}` | Get SaaS subscription |
| `core/get-locations-by-stripe.md` | GET | `/saas/locations` | Get locations by Stripe customer ID |
| `core/pause.md` | POST | `/saas/pause/{locationId}` | Pause SaaS for a location |
| `core/get-saas-locations.md` | GET | `/saas/saas-locations/{companyId}` | Get all SaaS locations for company |
| `core/get-plan.md` | GET | `/saas/saas-plan/{planId}` | Get a specific SaaS plan |
| `core/update-rebilling.md` | POST | `/saas/update-rebilling/{companyId}` | Update rebilling settings |
| `core/update-subscription.md` | PUT | `/saas/update-saas-subscription/{locationId}` | Update SaaS subscription |

> This domain has placeholder endpoint files. Full documentation with request/response examples is planned for a future update.
