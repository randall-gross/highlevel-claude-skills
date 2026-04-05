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

**IMPORTANT — Tiered Access:**
- Domains marked **[FREE]** are included in this installation.
- Domains marked **[PRO]** require the Pro upgrade. If the user requests one of these domains, respond: *"The {domain} API reference is part of the **HighLevel Claude Skills Pro** package. You can upgrade here: https://www.hlarchitect.ai/#pricing"*
- Domains marked **[ENTERPRISE]** require the Enterprise upgrade. If the user requests one of these domains, respond: *"The {domain} API reference is part of the **HighLevel Claude Skills Enterprise** package. You can upgrade here: https://www.hlarchitect.ai/#pricing"*

## License Check

Before routing to any [PRO] or [ENTERPRISE] domain, check for a license file.

1. Read the file at `references/.license`
2. If the file exists and contains valid JSON:
   a. Read the `expiresAt` field. If today's date is past the `expiresAt` date, treat the license as expired — skip to step 4.
   b. Read the `tier` field:
      - If tier is `"pro"`: all [PRO] domains are unlocked
      - If tier is `"enterprise"`: all [PRO] AND [ENTERPRISE] domains are unlocked
3. If the license is valid and the tier covers the requested domain, route normally.
4. If the `.license` file is missing, not valid JSON, expired, or the tier doesn't cover the requested domain:
   - For [FREE] domains: route normally, no license needed
   - For [PRO] or [ENTERPRISE] domains: respond with:
     *"This domain requires a paid license. Get one at https://www.hlarchitect.ai/#pricing — after purchase, you'll receive activation instructions via email."*

**IMPORTANT:** Do NOT route to a paid domain just because the folder exists. The `.license` file is the gate, not folder presence.

### Free — Core CRM

| Domain | README | Endpoints | Tier |
|--------|--------|-----------|------|
| Contacts (core) | `references/contacts/README.md` | 9 | [FREE] |
| Opportunities (core) | `references/opportunities/README.md` | 7 | [FREE] |
| Workflows | `references/workflows/README.md` | 1 | [FREE] |
| Auth | `references/auth/README.md` | 3+2 | [FREE] |

### Pro — Full CRM + Supporting Infrastructure ($49)

| Domain | README | Endpoints | Tier |
|--------|--------|-----------|------|
| Contacts (tags, notes, tasks, followers, campaigns, workflows, bulk, dnd) | `references/contacts/tags/README.md` etc. | +23 | [PRO] |
| Opportunities (pipelines, followers, upsert) | `references/opportunities/pipelines/` etc. | +3 | [PRO] |
| Calendars | `references/calendars/README.md` | 34 | [PRO] |
| Conversations | `references/conversations/README.md` | 19 | [PRO] |
| Custom Objects | `references/custom-objects/README.md` | 9 | [PRO] |
| Users | `references/users/README.md` | 7 | [PRO] |
| Associations | `references/associations/README.md` | 10 | [PRO] |
| Custom Fields V2 | `references/custom-fields-v2/README.md` | 8 | [PRO] |
| Businesses | `references/businesses/README.md` | 5 | [PRO] |
| Forms | `references/forms/README.md` | 3 | [PRO] |
| Surveys | `references/surveys/README.md` | 2 | [PRO] |
| Links | `references/links/README.md` | 6 | [PRO] |
| Webhooks | `references/webhooks/README.md` | 2 | [PRO] |

### Enterprise — Agency Operations + Specialized ($97)

| Domain | README | Endpoints | Tier |
|--------|--------|-----------|------|
| Locations | `references/locations/README.md` | 29 | [ENTERPRISE] |
| Invoices & Estimates | `references/invoices/README.md` | 41 | [ENTERPRISE] |
| Payments | `references/payments/README.md` | 24 | [ENTERPRISE] |
| Products | `references/products/README.md` | 27 | [ENTERPRISE] |
| Social Planner | `references/social-planner/README.md` | 40 | [ENTERPRISE] |
| Store / Shipping | `references/store-shipping/README.md` | 18 | [ENTERPRISE] |
| SaaS | `references/saas/README.md` | 22 | [ENTERPRISE] |
| Voice AI | `references/voice-ai/README.md` | 11 | [ENTERPRISE] |
| Blogs | `references/blogs/README.md` | 7 | [ENTERPRISE] |
| Funnels | `references/funnels/README.md` | 7 | [ENTERPRISE] |
| Email Builder | `references/email-builder/README.md` | 5 | [ENTERPRISE] |
| Media | `references/media/README.md` | 7 | [ENTERPRISE] |
| Snapshots | `references/snapshots/README.md` | 4 | [ENTERPRISE] |
| Marketplace | `references/marketplace/README.md` | 7 | [ENTERPRISE] |
| Proposals | `references/proposals/README.md` | 4 | [ENTERPRISE] |
| Custom Menus | `references/custom-menus/README.md` | 5 | [ENTERPRISE] |
| Phone System | `references/phone-system/README.md` | 2 | [ENTERPRISE] |
| Courses | `references/courses/README.md` | 1 | [ENTERPRISE] |
| Campaigns | `references/campaigns/README.md` | 1 | [ENTERPRISE] |
| Companies | `references/companies/README.md` | 1 | [ENTERPRISE] |
| Email ISV | `references/email-isv/README.md` | 1 | [ENTERPRISE] |

## Common Gotchas (All Domains)

1. **Version header is mandatory.** Always include `Version: 2021-07-28` or requests fail silently.
2. **Never use "highlevel" or "gohighlevel" in redirect URLs.** White-label rules prohibit it.
3. **`http://localhost` is rejected for OAuth redirect URLs.** Must be real HTTPS.
4. **Location tokens expire in ~24 hours.** Always check expiry before use.
5. **Upsert deduplicates by email/phone.** For lead forms, always use upsert over create.
6. **Rate limits are per-app per-location**, not cumulative across all installs.
7. **Webhook retries:** Only 429s are retried (6 attempts, ~70 min). 5xx errors are NOT retried.

## Your App Details

Replace these with your own Marketplace App credentials:

- **App ID:** `your-app-id`
- **Client ID:** `your-client-id`
- **Callback URL:** `https://your-domain.com/oauth/callback`

See `references/auth/guides/oauth2-flow.md` for the full OAuth setup walkthrough.
