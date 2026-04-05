# Blogs API

Manage blog sites, posts, authors, and categories for HighLevel blog publishing.

## Required Scopes
- `blogs/posts.readonly`
- `blogs/post.write`
- `blogs/post-update.write`
- `blogs/author.readonly`
- `blogs/category.readonly`
- `blogs/check-slug.readonly`
- `blogs/list.readonly`

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| `core/list-sites.md` | GET | `/blogs/site/all` | List all blog sites |
| `core/list-posts.md` | GET | `/blogs/posts/all` | List all blog posts |
| `core/create-post.md` | POST | `/blogs/posts` | Create a blog post |
| `core/update-post.md` | PUT | `/blogs/posts/{postId}` | Update a blog post |
| `core/check-slug.md` | GET | `/blogs/posts/url-slug-exists` | Check if URL slug exists |
| `core/list-authors.md` | GET | `/blogs/authors` | List blog authors |
| `core/list-categories.md` | GET | `/blogs/categories` | List blog categories |

> This domain has placeholder endpoint files. Full documentation with request/response examples is planned for a future update.
