# Products — Reviews

Manage product reviews including listing, counting, moderating (approve/reject), deleting, and bulk operations.

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| `list.md` | GET | `/products/reviews` | List reviews with filters |
| `get.md` | GET | `/products/reviews/count` | Get review count by status |
| `update.md` | PUT | `/products/reviews/{reviewId}` | Update a review (approve/reject) |
| `delete.md` | DELETE | `/products/reviews/{reviewId}` | Delete a review |
| `bulk-update.md` | POST | `/products/reviews/bulk-update` | Bulk update review statuses |
