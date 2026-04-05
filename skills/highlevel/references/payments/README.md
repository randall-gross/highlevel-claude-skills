# Payments Domain

Payment processing, orders, subscriptions, coupons, and custom payment providers.

## Required Scopes

| Scope | Access |
|-------|--------|
| `payments/orders.readonly` | Read orders |
| `payments/orders.write` | Create/update orders |
| `payments/orders.collectPayment` | Record payments |
| `payments/subscriptions.readonly` | Read subscriptions |
| `payments/transactions.readonly` | Read transactions |
| `payments/coupons.readonly` | Read coupons |
| `payments/coupons.write` | Create/update/delete coupons |
| `payments/custom-provider.readonly` | Read custom provider config |
| `payments/custom-provider.write` | Create/update/delete custom providers |
| `payments/integration.readonly` | Read integrations |
| `payments/integration.write` | Create integrations |

## Subdomains

| Subdomain | Endpoints | Description |
|-----------|-----------|-------------|
| [coupons/](coupons/) | 5 | Coupon management — create, read, update, delete |
| [orders/](orders/) | 7 | Order management — list, get, fulfillments, notes, payments |
| [subscriptions/](subscriptions/) | 2 | Subscription queries — list and get |
| [transactions/](transactions/) | 2 | Transaction queries — list and get |
| [custom-provider/](custom-provider/) | 6 | Custom payment provider configuration |
| [integrations/](integrations/) | 2 | White-label payment provider integrations |

## Base URL

```
https://services.leadconnectorhq.com
```

## Common Headers

```
Authorization: Bearer {token}
Content-Type: application/json
Version: 2021-07-28
```
