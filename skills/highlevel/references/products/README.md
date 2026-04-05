# Products API

Product catalog management for HighLevel stores. Create products with pricing, organize into collections, manage inventory, handle reviews, and control store-level visibility.

## Required Scopes

- `products.readonly` — read products
- `products.write` — create, update, delete products
- `products/collection.readonly` — read collections
- `products/collection.write` — create, update, delete collections
- `products/prices.readonly` — read prices
- `products/prices.write` — create, update, delete prices

## Common Patterns

- **locationId is required** on most list/create endpoints as a query parameter or in the request body.
- **Products have prices as children.** A product can have multiple prices (one-time or recurring).
- **Collections group products** for storefront display and filtering.
- **Reviews require moderation.** Reviews default to pending and must be approved/rejected.
- **Inventory tracking** is opt-in per product variant.

## Subdomain Routing

| Subdomain | README | Description |
|-----------|--------|-------------|
| `core/` | `core/README.md` | List, get, create, update, delete, bulk update/edit products |
| `prices/` | `prices/README.md` | CRUD operations on product prices |
| `collections/` | `collections/README.md` | CRUD operations on product collections |
| `reviews/` | `reviews/README.md` | List, count, update, delete, bulk update product reviews |
| `inventory/` | `inventory/README.md` | List and update product inventory levels |
| `store/` | `store/README.md` | Store-level product inclusion, priorities, and stats |

## Related Domains

- **Payments** — prices link to payment processing for orders
- **Invoices** — products/prices can be referenced on invoice line items
