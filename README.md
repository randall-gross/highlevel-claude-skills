<p align="center">
  <img src="https://img.shields.io/badge/HighLevel_API-V2-0066FF?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0id2hpdGUiIGQ9Ik0xMiAyTDIgMTJoM3Y4aDZ2LTZoMnY2aDZWMTJoM0wxMiAyeiIvPjwvc3ZnPg==" alt="HighLevel API V2" />
  <img src="https://img.shields.io/badge/Endpoints-413-00C853?style=for-the-badge" alt="413 Endpoints" />
  <img src="https://img.shields.io/badge/Domains-36-FF6D00?style=for-the-badge" alt="36 Domains" />
  <img src="https://img.shields.io/badge/Claude_Code-Skills-7C3AED?style=for-the-badge" alt="Claude Code Skills" />
</p>

<h1 align="center">HighLevel Claude Skills</h1>

<p align="center">
  <strong>The complete HighLevel API V2 reference system for Claude Code.</strong><br/>
  413 endpoints. 36 domains. One setup command.
</p>

<p align="center">
  <a href="#quick-start">Quick Start</a> &bull;
  <a href="#how-it-works">How It Works</a> &bull;
  <a href="#whats-included">What's Included</a> &bull;
  <a href="#tier-comparison">Tiers</a> &bull;
  <a href="#marketplace-app-setup">Marketplace Setup</a> &bull;
  <a href="#for-developers">For Developers</a>
</p>

---

## The Problem

You're building on the HighLevel API. You're using Claude Code. Every time you need to hit an endpoint, Claude either hallucinates the request format, uses outdated V1 patterns, or makes you look it up yourself.

**This repo fixes that.** Claude gets a structured reference for every HL endpoint — method, path, parameters, request/response examples, gotchas — loaded on demand through a 4-level cascading skill system.

---

## Quick Start

```bash
# 1. Clone
git clone https://github.com/randall-gross/highlevel-claude-skills.git
cd highlevel-claude-skills

# 2. Install
chmod +x setup.sh
./setup.sh

# 3. Merge settings (optional — adds safe defaults)
jq -s '.[0] * .[1]' ~/.claude/settings.json environment/settings-template.json > tmp.json \
  && mv tmp.json ~/.claude/settings.json
```

Claude Code now has the full HL API reference system. **But you still need HighLevel credentials before Claude can make actual API calls.** You have two options:

- **Private Integration Token** — simplest setup, works in 5 minutes. See [the setup guide](https://www.hlarchitect.ai/docs/setup).
- **OAuth 2.0 Marketplace App** — for multi-account access. Requires creating a private app in the HL Marketplace. See [the full walkthrough](https://www.hlarchitect.ai/docs/setup).

---

## How It Works

The skill system uses a **4-level cascade** so Claude loads only what it needs — never dumping 400+ endpoints into context.

```
Level 1   SKILL.md                              Reads the task, picks the domain
  |
Level 2   references/{domain}/README.md         Domain overview — scopes, patterns, routing
  |
Level 3   references/{domain}/{sub}/README.md   Subdomain index — lists every endpoint
  |
Level 4   references/{domain}/{sub}/{ep}.md     Single endpoint — method, params, examples
```

**Example runtime flow:**

```
You: "Upsert a contact with this email and add the 'website-lead' tag"

Claude reads SKILL.md        -> routes to contacts/
Claude reads contacts/README -> routes to contacts/core/
Claude reads core/README     -> finds upsert.md
Claude reads upsert.md       -> has the method, path, params, JSON example
                              -> knows tags are ADDITIVE on upsert (gotcha documented)
                              -> executes correctly on the first try
```

**4 file reads** to reach any of 413 endpoints. No hallucination. No guessing.

---

## What's Included

### Tier Comparison

> **Tiers are additive.** Each tier is a separate purchase that plugs into the same skill folder. Pro does not include Free content. Enterprise does not include Free or Pro content. You need all three for complete 413-endpoint coverage.

<table>
<tr>
<th width="33%">

### Free
**$0**

</th>
<th width="33%">

### Pro
**$49** one-time

</th>
<th width="33%">

### Enterprise
**$97** one-time

</th>
</tr>
<tr>
<td>

**Core CRM — 22 endpoints**
- Contacts core (9)
- Opportunities core (6)
- Workflows (1)
- Auth + OAuth (5)
- OAuth flow guide
- Private token guide

**Plus:**
- Master SKILL.md router
- Upgrade prompts for paid domains

</td>
<td>

**Requires Free tier**

**Full CRM — 149 endpoints**
- Contacts (tags, notes, tasks, followers, campaigns, workflows, bulk, DND)
- Opportunities (pipelines, followers, upsert)
- Calendars (34)
- Conversations (19)
- Custom Objects (9)
- Users (7)
- Associations (10)
- Custom Fields V2 (8)
- Businesses (5)
- Forms (3)
- Surveys (2)
- Links (6)
- Webhooks (2)

</td>
<td>

**Requires Free + Pro tiers**

**Agency Operations — 242 endpoints**
- Locations (29)
- Invoices & Estimates (41)
- Payments (24)
- Products (27)
- Social Planner (40)
- Store & Shipping (18)
- SaaS API (22)
- Voice AI (11)
- Blogs (7)
- Funnels (7)
- Email Builder (5)
- Media Library (7)
- Snapshots (4)
- Marketplace (7)
- Proposals (4)
- Custom Menus (5)
- Phone System (2)
- Courses, Campaigns, Companies, Email ISV (4)

**Plus:**
- Marketplace App setup guide

</td>
</tr>
<tr>
<td>

[**Get Started**](https://github.com/randall-gross/highlevel-claude-skills)

</td>
<td>

[**Buy Pro — $49**](https://www.hlarchitect.ai/#pricing)

</td>
<td>

[**Buy Enterprise — $97**](https://www.hlarchitect.ai/#pricing)

</td>
</tr>
</table>

---

### Domain Map

#### Free Tier — Core CRM

| Domain | Endpoints | What It Does |
|--------|:---------:|-------------|
| **Contacts** (core) | 9 | Get, list, create, update, upsert, delete, search |
| **Opportunities** (core) | 6 | Get, create, update, delete, search, update status |
| **Workflows** | 1 | List workflows |
| **Auth** | 5 | OAuth token exchange, location tokens, + setup guides |

#### Pro Tier ($49) — Full CRM + Infrastructure

| Domain | Endpoints | What It Does |
|--------|:---------:|-------------|
| **Contacts** (full) | +23 | Tags, notes, tasks, followers, campaigns, workflows, bulk ops, DND |
| **Opportunities** (full) | +3 | Pipelines, followers, upsert |
| **Calendars** | 34 | Appointments, free slots, groups, resources, notifications |
| **Conversations** | 19 | SMS, email, live chat, recordings, transcriptions |
| **Custom Objects** | 9 | Schema CRUD, record CRUD, search |
| **Users** | 7 | User CRUD, search, email filtering |
| **Associations** | 10 | Object-to-object linking and relation management |
| **Custom Fields V2** | 8 | Cross-object custom fields and folders |
| **Businesses** | 5 | Business entity CRUD |
| **Forms** | 3 | Form list, submissions, file upload |
| **Surveys** | 2 | Survey list and submissions |
| **Links** | 6 | Trigger link CRUD and search |
| **Webhooks** | 2 | Signature verification guide + event types reference |

#### Enterprise Tier ($97) — Agency Operations + Specialized

| Domain | Endpoints | What It Does |
|--------|:---------:|-------------|
| **Locations** | 29 | Sub-account management, custom fields/values, tags, templates |
| **Invoices & Estimates** | 41 | CRUD, templates, recurring schedules, Text2Pay |
| **Payments** | 24 | Orders, subscriptions, transactions, coupons, custom providers |
| **Products** | 27 | Catalog, prices, collections, reviews, inventory |
| **Social Planner** | 40 | Posts, accounts, CSV import, platform OAuth, statistics |
| **Store / Shipping** | 18 | Carriers, zones, rates, store settings |
| **SaaS API** | 22 | White-label SaaS plans, subscriptions, rebilling |
| **Voice AI** | 11 | AI agents, actions, call logs |
| **Blogs** | 7 | Sites, posts, authors, categories |
| **Funnels** | 7 | Pages, redirects |
| **Email Builder** | 5 | Templates, campaigns |
| **Media** | 7 | Files, folders, uploads |
| **Snapshots** | 4 | Management, sharing, push status |
| **Marketplace** | 7 | Installations, wallet charges |
| **Proposals** | 4 | Documents, contracts, templates |
| **Custom Menus** | 5 | Custom UI links |
| **Phone System** | 2 | Number pools, active numbers |
| **+ 4 more** | 4 | Courses, Campaigns, Companies, Email ISV |

---

### Protective Hooks (Professional+)

Six guardrails designed for team environments — preventing destructive mistakes without blocking productive work.

| Hook | Trigger | What It Does |
|------|---------|-------------|
| `block-destructive-actions.sh` | Bash | Blocks `rm -rf`, `git reset --hard`, `DROP TABLE`, `kill -9`, etc. |
| `confirm-before-push.sh` | Bash | Blocks force pushes and pushes to main/master |
| `block-secret-leak.sh` | Edit/Write | Scans for API keys, tokens, passwords in file content |
| `read-before-edit.sh` | Edit | Reminds to read files before editing them |
| `hl-api-version-check.sh` | Bash | Warns if HL API calls are missing the required Version header |
| `no-env-overwrite.sh` | Edit/Write | Blocks writes to `.env`, `.env.local`, `.env.production` |

---

## Marketplace App Setup

Want to build your own HighLevel Marketplace app? Here's the complete walkthrough.

### Prerequisites

- A HighLevel agency account
- A domain with HTTPS (no `localhost` — HL rejects it)
- A server to host your OAuth callback (Next.js, Express, etc.)

### Step 1: Create Your App

1. Go to **marketplace.gohighlevel.com** → **My Apps** → **Create App**
2. Fill in:
   - **App Name:** Your integration name
   - **Description:** What your app does
   - **App Type:** Choose "Sub-Account" for location-level or "Agency" for company-level
   - **Webhook URL:** `https://your-domain.com/webhooks/highlevel` (optional)
3. Under **OAuth Settings:**
   - **Redirect URI:** `https://your-domain.com/oauth/callback`
   - **Never** include "highlevel" or "gohighlevel" in this URL (white-label policy)
4. Save. You'll receive:
   - **App ID** — identifies your app
   - **Client ID** — used in OAuth flow
   - **Client Secret** — store this securely, never commit to code

### Step 2: Configure Scopes

Select only the scopes your app needs. The full list is in `skills/highlevel/SKILL.md`.

Common scope sets:

**CRM Integration (read/write contacts + opportunities):**
```
contacts.readonly contacts.write
opportunities.readonly opportunities.write
calendars.readonly calendars/events.readonly
```

**Marketing Automation (forms, conversations, workflows):**
```
contacts.readonly contacts.write
conversations.readonly conversations.write
conversations/message.readonly conversations/message.write
forms.readonly
workflows.readonly
```

**Full Platform Access (everything):**
See the 149-scope list in the auth guides at `skills/highlevel/references/auth/`.

### Step 3: Implement OAuth

The complete OAuth flow with code examples is documented in:

```
skills/highlevel/references/auth/guides/oauth2-flow.md
```

**Quick summary:**
1. Redirect user to HL authorization page
2. User selects location(s) and authorizes
3. HL redirects to your callback with auth code
4. Exchange code for access + refresh tokens
5. Store tokens per location
6. Refresh proactively before 24h expiry

### Step 4: Make API Calls

Once you have a valid token, every endpoint in this repo tells you exactly what to send:

```typescript
const response = await fetch('https://services.leadconnectorhq.com/contacts/upsert', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${accessToken}`,
    'Content-Type': 'application/json',
    'Version': '2021-07-28',  // REQUIRED — fails silently without it
  },
  body: JSON.stringify({
    locationId: 'location-id-here',
    firstName: 'John',
    lastName: 'Doe',
    email: 'john@example.com',
    tags: ['website-lead'],
    source: 'API',
  }),
});
```

### Step 5: Submit for Review

Before your app goes live on the Marketplace:

1. **Test thoroughly** with at least 2 sub-account locations
2. Complete your app profile (logo, screenshots, description)
3. Add a **privacy policy URL** and **terms of service URL**
4. Submit for review — HL team typically responds within 5-7 business days

### Common Pitfalls

| Pitfall | Solution |
|---------|----------|
| "Invalid redirect URI" | Must match exactly, including trailing slashes. No localhost. |
| Requests return empty/error | Missing `Version: 2021-07-28` header |
| "Invalid token" after 24h | Implement proactive refresh (see auth guides) |
| Lost refresh token | User must uninstall and reinstall your app |
| Rate limited | 100 req/10s per location. Implement backoff. |
| Scopes changed | Users must uninstall/reinstall. Plan scopes carefully upfront. |

---

## Need Help Building Your App?

We build HighLevel integrations and marketplace apps for agencies.

**What we offer:**
- Custom HL Marketplace app development
- OAuth setup and token management
- Webhook handler implementation
- Next.js + HL integration patterns
- Ongoing API maintenance as HL releases updates

**Get in touch:** [rocketdigitalmarketing.io](https://rocketdigitalmarketing.io)

---

## Repo Structure

```
highlevel-claude-skills/
|
+-- skills/highlevel/
|   +-- SKILL.md                    <- Master router (Level 1)
|   +-- references/
|       +-- contacts/               <- 32 endpoints, 10 subdomains
|       +-- opportunities/          <- 10 endpoints, 3 subdomains
|       +-- calendars/              <- 34 endpoints, 8 subdomains
|       +-- conversations/          <- 19 endpoints, 5 subdomains
|       +-- workflows/              <- 1 endpoint
|       +-- custom-objects/         <- 9 endpoints, 2 subdomains
|       +-- locations/              <- 29 endpoints, 7 subdomains
|       +-- invoices/               <- 41 endpoints, 7 subdomains
|       +-- payments/               <- 24 endpoints, 6 subdomains
|       +-- products/               <- 27 endpoints, 6 subdomains
|       +-- users/                  <- 7 endpoints
|       +-- auth/                   <- 3 endpoints + 2 guides
|       +-- associations/           <- 10 endpoints, 2 subdomains
|       +-- custom-fields-v2/       <- 8 endpoints, 2 subdomains
|       +-- businesses/             <- 5 endpoints
|       +-- forms/                  <- 3 endpoints
|       +-- surveys/                <- 2 endpoints
|       +-- links/                  <- 6 endpoints
|       +-- webhooks/               <- 2 reference files
|       +-- [17 specialized domains]
|
+-- environment/
|   +-- hooks/                      <- 6 protective shell scripts
|   +-- settings-template.json      <- Permission defaults
|   +-- plugins-guide.md            <- Plugin installation guide
|
+-- setup.sh                        <- One-command installation
+-- README.md
```

---

## How Endpoint Files Are Structured

Every fully-documented endpoint follows this consistent format:

```markdown
# Endpoint Name

- **Method:** POST
- **Path:** `/contacts/upsert`
- **Scopes:** `contacts.write`
- **Rate Limit:** Standard (100/10s)

## Parameters
[Path, query, and body parameter tables with types and required flags]

## Request Example
[Curl command or JSON body with realistic data]

## Response Example
[JSON response with realistic data]

## Error Responses
[Status codes with specific meanings]

## Common Use Cases
[When and why you'd use this endpoint]

## Gotchas
[Non-obvious behavior, common mistakes, HL quirks]
```

---

## Updating

```bash
cd highlevel-claude-skills
git pull
./setup.sh
```

The setup script is idempotent — safe to run as many times as you want.

---

## For Developers

### Adding a New Domain

1. Create `skills/highlevel/references/{domain}/README.md`
2. Create subdomain directories with `README.md` index files
3. Create individual endpoint `.md` files using the template above
4. Add the domain to the routing table in `skills/highlevel/SKILL.md`

### Adding a New Hook

1. Create the script in `environment/hooks/`
2. Follow the existing pattern: `#!/bin/bash`, comment header, `$TOOL_INPUT`, exit 0/2
3. Document the matcher and trigger in the hooks table above

### Contributing

Found an endpoint that's wrong, missing, or outdated? PRs welcome. Please follow the existing file format and include realistic request/response examples.

---

## Credits

Built by **Randall Gross** at [Rocket Digital Marketing](https://rocketdigitalmarketing.io) with Claude Code.

API reference data sourced from the [official HighLevel API docs](https://highlevel.stoplight.io/docs/integrations/) and the [GoHighLevel OpenAPI specs](https://github.com/GoHighLevel/highlevel-api-docs).

---

<p align="center">
  <sub>Made for the HighLevel community. Built with Claude Code.</sub>
</p>
