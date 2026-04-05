---
name: highlevel
description: Complete HighLevel (GoHighLevel) API V2 reference system. 413 endpoints across 36 domains. Covers contacts, opportunities, calendars, conversations, workflows, custom objects, payments, invoices, and all other HL API domains. Use when building integrations, querying CRM data, or working with any HighLevel API endpoint.
---

# HighLevel API V2 — Master Reference

## Quick Reference

- **API Base URL:** `https://services.leadconnectorhq.com`
- **Required Headers:**
  - `Authorization: Bearer <token>`
  - `Content-Type: application/json`
  - `Version: 2021-07-28` (REQUIRED — requests fail silently without it)
- **Rate Limits:** 100 requests / 10 seconds, 200,000 requests / day (per app per location)
- **Official Docs:** https://highlevel.stoplight.io/docs/integrations/

## Auth Decision Tree

```
What kind of integration?
├── Single sub-account (one client) → Private Integration Token
│   └── Read: references/auth/guides/private-token.md
└── Multi-account (agency-wide, marketplace app) → OAuth 2.0
    └── Read: references/auth/guides/oauth2-flow.md
```

## Domain Routing Table

When you need to work with a HighLevel API domain, read the domain README first. It will route you to the right subdomain and endpoint file.

### Tier 1 — Core CRM

| Domain | README | Endpoints | Description |
|--------|--------|-----------|-------------|
| Contacts | `references/contacts/README.md` | 32 | Contact CRUD, tags, notes, tasks, followers, campaigns, workflows, bulk ops |
| Opportunities | `references/opportunities/README.md` | 10 | Pipeline deals, stages, status, followers |
| Calendars | `references/calendars/README.md` | 34 | Calendar CRUD, appointments, free slots, groups, resources, notifications |
| Conversations | `references/conversations/README.md` | 19 | Messaging, email, SMS, live chat, recordings, transcriptions |
| Workflows | `references/workflows/README.md` | 1 | List workflows (contact add/remove is under contacts/workflows/) |
| Custom Objects | `references/custom-objects/README.md` | 9 | Schema CRUD, record CRUD, search |

### Tier 2 — Extended Platform

| Domain | README | Endpoints | Description |
|--------|--------|-----------|-------------|
| Locations | `references/locations/README.md` | 29 | Sub-account management, custom fields/values, tags, templates, recurring tasks |
| Invoices | `references/invoices/README.md` | 41 | Invoice/estimate CRUD, templates, schedules, Text2Pay |
| Payments | `references/payments/README.md` | 24 | Orders, subscriptions, transactions, coupons, custom providers |
| Products | `references/products/README.md` | 27 | Product CRUD, prices, collections, reviews, inventory, store |
| Users | `references/users/README.md` | 7 | User CRUD, search, filter |
| Auth | `references/auth/README.md` | 3+2 | OAuth endpoints + private token and OAuth flow guides |
| Associations | `references/associations/README.md` | 10 | Object-to-object associations and relations |
| Custom Fields V2 | `references/custom-fields-v2/README.md` | 8 | Cross-object custom fields and folders |
| Businesses | `references/businesses/README.md` | 5 | Business entity CRUD |
| Forms | `references/forms/README.md` | 3 | Form list, submissions, file upload |
| Surveys | `references/surveys/README.md` | 2 | Survey list and submissions |
| Links | `references/links/README.md` | 6 | Trigger link CRUD and search |
| Webhooks | `references/webhooks/README.md` | 2 | Signature verification + event types reference |

### Tier 3 — Specialized

| Domain | README | Endpoints |
|--------|--------|-----------|
| Social Planner | `references/social-planner/README.md` | 40 |
| Store / Shipping | `references/store-shipping/README.md` | 18 |
| SaaS | `references/saas/README.md` | 22 |
| Voice AI | `references/voice-ai/README.md` | 11 |
| Blogs | `references/blogs/README.md` | 7 |
| Funnels | `references/funnels/README.md` | 7 |
| Email Builder | `references/email-builder/README.md` | 5 |
| Media | `references/media/README.md` | 7 |
| Snapshots | `references/snapshots/README.md` | 4 |
| Marketplace | `references/marketplace/README.md` | 7 |
| Proposals | `references/proposals/README.md` | 4 |
| Custom Menus | `references/custom-menus/README.md` | 5 |
| Phone System | `references/phone-system/README.md` | 2 |
| Courses | `references/courses/README.md` | 1 |
| Campaigns | `references/campaigns/README.md` | 1 |
| Companies | `references/companies/README.md` | 1 |
| Email ISV | `references/email-isv/README.md` | 1 |

## Common Gotchas (All Domains)

1. **Version header is mandatory.** Always include `Version: 2021-07-28` or requests fail silently.
2. **Never use "highlevel" or "gohighlevel" in redirect URLs.** White-label rules prohibit it.
3. **`http://localhost` is rejected for OAuth redirect URLs.** Must be real HTTPS.
4. **Location tokens expire in ~24 hours.** Always check expiry before use.
5. **Upsert deduplicates by email/phone.** For lead forms, always use upsert over create.
6. **Rate limits are per-app per-location**, not cumulative across all installs.
7. **Webhook retries:** Only 429s are retried (6 attempts, ~70 min). 5xx errors are NOT retried.

## Rocket Digital Specifics

- **Client Connector App ID:** `69a4dc27c86f2926349dac9d`
- **Client Connector Client ID:** `69a4dc27c86f2926349dac9d-mm8gqa32`
- **Callback URL:** `https://api.rocketdigitalmarketing.io/oauth/callback`
- **PM System Location:** `YEVDcWEDf2UqQ7ZSVPey` (uses Custom Objects for Project > Epoch > Task > Subtask)
