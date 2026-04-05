# Store Shipping API

Manage shipping carriers, zones, rates, and store settings for HighLevel e-commerce stores.

## Required Scopes
- `store/setting.readonly`
- `store/setting.write`
- `store/shipping.readonly`
- `store/shipping.write`

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| `carriers/list.md` | GET | `/store/shipping-carrier` | List shipping carriers |
| `carriers/get.md` | GET | `/store/shipping-carrier/{shippingCarrierId}` | Get a shipping carrier |
| `carriers/create.md` | POST | `/store/shipping-carrier` | Create a shipping carrier |
| `carriers/update.md` | PUT | `/store/shipping-carrier/{shippingCarrierId}` | Update a shipping carrier |
| `carriers/delete.md` | DELETE | `/store/shipping-carrier/{shippingCarrierId}` | Delete a shipping carrier |
| `zones/list.md` | GET | `/store/shipping-zone` | List shipping zones |
| `zones/get.md` | GET | `/store/shipping-zone/{shippingZoneId}` | Get a shipping zone |
| `zones/create.md` | POST | `/store/shipping-zone` | Create a shipping zone |
| `zones/update.md` | PUT | `/store/shipping-zone/{shippingZoneId}` | Update a shipping zone |
| `zones/delete.md` | DELETE | `/store/shipping-zone/{shippingZoneId}` | Delete a shipping zone |
| `zones/available-rates.md` | POST | `/store/shipping-zone/shipping-rates` | Get available shipping rates |
| `rates/list.md` | GET | `/store/shipping-zone/{shippingZoneId}/shipping-rate` | List rates for a zone |
| `rates/get.md` | GET | `/store/shipping-zone/{shippingZoneId}/shipping-rate/{shippingRateId}` | Get a shipping rate |
| `rates/create.md` | POST | `/store/shipping-zone/{shippingZoneId}/shipping-rate` | Create a shipping rate |
| `rates/update.md` | PUT | `/store/shipping-zone/{shippingZoneId}/shipping-rate/{shippingRateId}` | Update a shipping rate |
| `rates/delete.md` | DELETE | `/store/shipping-zone/{shippingZoneId}/shipping-rate/{shippingRateId}` | Delete a shipping rate |
| `settings/get.md` | GET | `/store/store-setting` | Get store settings |
| `settings/update.md` | POST | `/store/store-setting` | Update store settings |

> This domain has placeholder endpoint files. Full documentation with request/response examples is planned for a future update.
