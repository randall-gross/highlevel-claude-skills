# Social Planner API

Manage social media accounts, posts, CSV imports, categories, tags, and statistics across connected platforms (Facebook, Google, Instagram, LinkedIn, TikTok, Twitter).

## Required Scopes
- `socialplanner/account.readonly`
- `socialplanner/account.write`
- `socialplanner/post.readonly`
- `socialplanner/post.write`
- `socialplanner/category.readonly`
- `socialplanner/category.write`
- `socialplanner/csv.readonly`
- `socialplanner/csv.write`
- `socialplanner/oauth.readonly`
- `socialplanner/oauth.write`
- `socialplanner/tag.readonly`
- `socialplanner/tag.write`
- `socialplanner/statistics.readonly`

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| `oauth/facebook-start.md` | GET | `/social-media-posting/oauth/facebook/start` | Start Facebook OAuth flow |
| `oauth/google-start.md` | GET | `/social-media-posting/oauth/google/start` | Start Google OAuth flow |
| `oauth/instagram-start.md` | GET | `/social-media-posting/oauth/instagram/start` | Start Instagram OAuth flow |
| `oauth/linkedin-start.md` | GET | `/social-media-posting/oauth/linkedin/start` | Start LinkedIn OAuth flow |
| `oauth/tiktok-start.md` | GET | `/social-media-posting/oauth/tiktok/start` | Start TikTok OAuth flow |
| `oauth/tiktok-business-start.md` | GET | `/social-media-posting/oauth/tiktok-business/start` | Start TikTok Business OAuth flow |
| `oauth/twitter-start.md` | GET | `/social-media-posting/oauth/twitter/start` | Start Twitter OAuth flow |
| `oauth/facebook-accounts.md` | GET+POST | `/social-media-posting/oauth/{locationId}/facebook/accounts/{accountId}` | Get/set Facebook accounts |
| `oauth/google-locations.md` | GET+POST | `/social-media-posting/oauth/{locationId}/google/locations/{accountId}` | Get/set Google locations |
| `oauth/instagram-accounts.md` | GET+POST | `/social-media-posting/oauth/{locationId}/instagram/accounts/{accountId}` | Get/set Instagram accounts |
| `oauth/linkedin-accounts.md` | GET+POST | `/social-media-posting/oauth/{locationId}/linkedin/accounts/{accountId}` | Get/set LinkedIn accounts |
| `oauth/tiktok-accounts.md` | GET+POST | `/social-media-posting/oauth/{locationId}/tiktok/accounts/{accountId}` | Get/set TikTok accounts |
| `oauth/tiktok-business-accounts.md` | GET | `/social-media-posting/oauth/{locationId}/tiktok-business/accounts/{accountId}` | Get TikTok Business accounts |
| `oauth/twitter-accounts.md` | GET+POST | `/social-media-posting/oauth/{locationId}/twitter/accounts/{accountId}` | Get/set Twitter accounts |
| `accounts/list.md` | GET | `/social-media-posting/{locationId}/accounts` | List connected accounts |
| `accounts/delete.md` | DELETE | `/social-media-posting/{locationId}/accounts/{id}` | Delete an account |
| `accounts/set.md` | POST | `/social-media-posting/{locationId}/set-accounts` | Set accounts for location |
| `posts/list.md` | POST | `/social-media-posting/{locationId}/posts/list` | List posts |
| `posts/get.md` | GET | `/social-media-posting/{locationId}/posts/{id}` | Get a post |
| `posts/create.md` | POST | `/social-media-posting/{locationId}/posts` | Create a post |
| `posts/update.md` | PUT | `/social-media-posting/{locationId}/posts/{id}` | Update a post |
| `posts/delete.md` | DELETE | `/social-media-posting/{locationId}/posts/{id}` | Delete a post |
| `posts/bulk-delete.md` | POST | `/social-media-posting/{locationId}/posts/bulk-delete` | Bulk delete posts |
| `csv/upload.md` | POST | `/social-media-posting/{locationId}/csv` | Upload CSV |
| `csv/status.md` | GET | `/social-media-posting/{locationId}/csv` | Get CSV import status |
| `csv/get.md` | GET | `/social-media-posting/{locationId}/csv/{id}` | Get a CSV import |
| `csv/finalize.md` | PATCH | `/social-media-posting/{locationId}/csv/{id}` | Finalize CSV import |
| `csv/delete.md` | DELETE | `/social-media-posting/{locationId}/csv/{id}` | Delete CSV import |
| `csv/delete-post.md` | DELETE | `/social-media-posting/{locationId}/csv/{csvId}/post/{postId}` | Delete a post from CSV |
| `categories/list.md` | GET | `/social-media-posting/{locationId}/categories` | List categories |
| `categories/get.md` | GET | `/social-media-posting/{locationId}/categories/{id}` | Get a category |
| `tags/list.md` | GET | `/social-media-posting/{locationId}/tags` | List tags |
| `tags/get-by-ids.md` | POST | `/social-media-posting/{locationId}/tags/details` | Get tags by IDs |
| `statistics/get.md` | POST | `/social-media-posting/statistics` | Get posting statistics |

> This domain has placeholder endpoint files. Full documentation with request/response examples is planned for a future update.
