# Auth API

Authentication and authorization for the HighLevel API. Covers OAuth 2.0 token exchange for marketplace apps and private integration tokens for direct API access.

## Required Scopes

- `oauth.readonly` — read installed locations
- `oauth.write` — token exchange and refresh

## Common Patterns

- **Two auth modes:** Private Integration Tokens (simple, single-location) and OAuth 2.0 (marketplace apps, multi-location).
- **Agency vs Location tokens:** Agency tokens have broad access; use `locationToken` to scope down to a specific location.
- **Token refresh:** Access tokens expire after 24 hours. Always implement refresh logic.
- **Private tokens** rotate every 90 days — build rotation reminders into your workflow.

## Subdomain Routing

| Subdomain | Description |
|-----------|-------------|
| `oauth/` | Token exchange, location tokens, installed locations |
| `guides/` | Private token setup guide, OAuth 2.0 flow walkthrough |

## Related Domains

- **Users** — authenticated user context
- **Locations** — location-scoped tokens
- All other domains — every API call requires a valid token from this domain
