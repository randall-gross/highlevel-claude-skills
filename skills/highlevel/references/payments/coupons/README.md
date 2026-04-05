# Coupons Subdomain

Manage discount coupons for payment products.

## Scopes

- `payments/coupons.readonly` — List and get coupons
- `payments/coupons.write` — Create, update, delete coupons

## Endpoints

| Method | Path | File | Description |
|--------|------|------|-------------|
| GET | `/payments/coupon/list` | [list.md](list.md) | List coupons |
| GET | `/payments/coupon` | [get.md](get.md) | Get coupon by ID |
| POST | `/payments/coupon` | [create.md](create.md) | Create coupon |
| PUT | `/payments/coupon` | [update.md](update.md) | Update coupon |
| DELETE | `/payments/coupon` | [delete.md](delete.md) | Delete coupon |
