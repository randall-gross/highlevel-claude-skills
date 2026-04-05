# Webhooks

HighLevel webhook system reference. Webhooks deliver real-time event notifications to your application when things happen in HL — contacts created, appointments booked, opportunities updated, etc.

> **This domain contains reference guides, NOT API endpoints.** Webhooks are configured in the HL UI (Settings > Webhooks) or via marketplace app configuration, not through REST API calls.

## How Webhooks Work

1. **Configure** a webhook URL in HL (per location or per app)
2. **HL sends POST requests** to your URL when events occur
3. **Your server validates** the signature and processes the payload
4. **Respond with 200** within 30 seconds or HL marks it as failed

## Key Properties

| Property | Value |
|----------|-------|
| Method | POST (always) |
| Content-Type | application/json |
| Signature Header | `x-wh-signature` |
| Signature Algorithm | SHA256 HMAC |
| Retry on 429 | Yes — 6 attempts over ~70 minutes |
| Retry on 5xx | **No** — 5xx errors are NOT retried |
| Timeout | 30 seconds |

## Subdomain Routing

| Subdomain | Description |
|-----------|-------------|
| `verification/` | Signature validation guide with code examples |
| `events/` | Complete event types reference |

## Related Domains

- **Contacts** — Contact events (create, update, delete, DND, tags)
- **Opportunities** — Opportunity lifecycle events
- **Calendars** — Appointment events
- **Conversations** — Inbound message events
- **Forms** — Form submission events
