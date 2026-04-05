# Orders Subdomain

Manage orders, fulfillments, notes, and payment recording.

## Scopes

- `payments/orders.readonly` — List and get orders, fulfillments, notes
- `payments/orders.write` — Create fulfillments, migrate orders
- `payments/orders.collectPayment` — Record payments

## Endpoints

| Method | Path | File | Description |
|--------|------|------|-------------|
| GET | `/payments/orders` | [list.md](list.md) | List orders |
| GET | `/payments/orders/{orderId}` | [get.md](get.md) | Get order by ID |
| GET | `/payments/orders/{orderId}/fulfillments` | [fulfillments-list.md](fulfillments-list.md) | List fulfillments |
| POST | `/payments/orders/{orderId}/fulfillments` | [fulfillments-create.md](fulfillments-create.md) | Create fulfillment |
| GET | `/payments/orders/{orderId}/notes` | [notes-list.md](notes-list.md) | List order notes |
| POST | `/payments/orders/{orderId}/record-payment` | [record-payment.md](record-payment.md) | Record payment |
| POST | `/payments/orders/migrate-order-ps` | [migrate-order.md](migrate-order.md) | Migrate order payment status |
