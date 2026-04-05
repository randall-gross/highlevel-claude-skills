# Products — Prices

CRUD operations for product prices. Each product can have multiple prices (one-time or recurring).

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| `list.md` | GET | `/products/{productId}/price` | List all prices for a product |
| `get.md` | GET | `/products/{productId}/price/{priceId}` | Get a single price by ID |
| `create.md` | POST | `/products/{productId}/price` | Create a new price for a product |
| `update.md` | PUT | `/products/{productId}/price/{priceId}` | Update an existing price |
| `delete.md` | DELETE | `/products/{productId}/price/{priceId}` | Delete a price |
