<p align="center">
  <img src="https://img.shields.io/badge/HighLevel_API-V2-blue?style=for-the-badge" alt="HighLevel API V2" />
  <img src="https://img.shields.io/badge/Endpoints-413-green?style=for-the-badge" alt="413 Endpoints" />
  <img src="https://img.shields.io/badge/Domains-36-orange?style=for-the-badge" alt="36 Domains" />
  <img src="https://img.shields.io/badge/Claude_Code-Skills-purple?style=for-the-badge" alt="Claude Code Skills" />
</p>

# Rocket Claude Kit

The complete HighLevel API reference system for Claude Code, built for the **Rocket Digital Marketing** team. Skills, hooks, and environment configuration — one repo, one setup command, fully operational.

---

## Quick Start

```bash
# 1. Clone
git clone https://github.com/randall-gross/rocket-claude-kit.git
cd rocket-claude-kit

# 2. Install
chmod +x setup.sh
./setup.sh

# 3. Merge settings
jq -s '.[0] * .[1]' ~/.claude/settings.json environment/settings-template.json > tmp.json \
  && mv tmp.json ~/.claude/settings.json

# 4. Install plugins (see environment/plugins-guide.md)
```

That's it. Claude Code now has access to every HighLevel API endpoint.

---

## What's Inside

### The HighLevel Skill System

A **4-level cascading reference** covering the entire HL API V2. Claude reads only what it needs — never loading 400+ endpoints into context.

```
Level 1   SKILL.md                          Master router — reads task, picks domain
  |
Level 2   references/{domain}/README.md     Domain overview — scopes, patterns, subdomain routing
  |
Level 3   references/{domain}/{sub}/README  Subdomain index — lists every endpoint file
  |
Level 4   references/{domain}/{sub}/{ep}.md Single endpoint — method, path, params, examples
```

**How it works at runtime:**

```
User: "Upsert a contact with this email"

Claude reads SKILL.md        -> routes to contacts/
Claude reads contacts/README -> routes to contacts/core/
Claude reads core/README     -> finds upsert.md
Claude reads upsert.md       -> has method, path, params, example -> executes
```

4 file reads to reach any of 413 endpoints.

---

### Domain Map

#### Tier 1 — Core CRM (Full Documentation)

| Domain | Endpoints | What It Does |
|--------|:---------:|-------------|
| **Contacts** | 32 | CRUD, tags, notes, tasks, followers, campaigns, workflows, DND, bulk ops |
| **Opportunities** | 10 | Pipeline deals, stages, status tracking, followers |
| **Calendars** | 34 | Scheduling, appointments, free slots, groups, resources, notifications |
| **Conversations** | 19 | SMS, email, live chat, recordings, transcriptions |
| **Workflows** | 1 | List workflows (add/remove contacts is under Contacts) |
| **Custom Objects** | 9 | Schema CRUD, record CRUD, search — powers the PM system |

#### Tier 2 — Extended Platform (Full Documentation)

| Domain | Endpoints | What It Does |
|--------|:---------:|-------------|
| **Locations** | 29 | Sub-account management, custom fields/values, tags, templates |
| **Invoices** | 41 | Invoice/estimate CRUD, templates, recurring schedules, Text2Pay |
| **Payments** | 24 | Orders, subscriptions, transactions, coupons, custom providers |
| **Products** | 27 | Catalog management, prices, collections, reviews, inventory |
| **Users** | 7 | User CRUD, search, email filtering |
| **Auth** | 5 | OAuth token exchange + private token and OAuth flow guides |
| **Associations** | 10 | Object-to-object linking and relation management |
| **Custom Fields V2** | 8 | Cross-object custom fields and folders |
| **Businesses** | 5 | Business entity CRUD |
| **Forms** | 3 | Form list, submissions, file upload |
| **Surveys** | 2 | Survey list and submissions |
| **Links** | 6 | Trigger link CRUD and search |
| **Webhooks** | 2 | Signature verification guide + event types reference |

#### Tier 3 — Specialized (Stub Documentation)

| Domain | Endpoints | Domain | Endpoints |
|--------|:---------:|--------|:---------:|
| Social Planner | 40 | Snapshots | 4 |
| Store / Shipping | 18 | Marketplace | 7 |
| SaaS | 22 | Proposals | 4 |
| Voice AI | 11 | Custom Menus | 5 |
| Blogs | 7 | Phone System | 2 |
| Funnels | 7 | Courses | 1 |
| Email Builder | 5 | Campaigns | 1 |
| Media | 7 | Companies | 1 |
| | | Email ISV | 1 |

> Tier 3 domains have endpoint stubs with method/path/scopes. Full request/response documentation is planned.

---

### Protective Hooks

Six guardrails designed for **non-developer team members** — preventing destructive mistakes without blocking productive work.

| Hook | Trigger | What It Does |
|------|---------|-------------|
| `block-destructive-actions.sh` | Bash | Blocks `rm -rf`, `git reset --hard`, `DROP TABLE`, `kill -9`, etc. |
| `confirm-before-push.sh` | Bash | Blocks force pushes and pushes to main/master |
| `block-secret-leak.sh` | Edit/Write | Scans for API keys, tokens, passwords in file content |
| `read-before-edit.sh` | Edit | Reminds to read files before editing them |
| `hl-api-version-check.sh` | Bash | Warns if HL API calls are missing the required Version header |
| `no-env-overwrite.sh` | Edit/Write | Blocks writes to `.env`, `.env.local`, `.env.production` |

---

### Environment Config

| File | Purpose |
|------|---------|
| `settings-template.json` | Safe permission defaults — allows reads/git/npm, blocks destructive ops and secret files |
| `plugins-guide.md` | Step-by-step install for Composure, Design Forge, Context7, Firecrawl, Playwright |

---

## Repo Structure

```
rocket-claude-kit/
|
+-- skills/highlevel/
|   +-- SKILL.md                    <- Master router
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
|       +-- [17 Tier 3 domains]     <- Stub documentation
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

## Updating

```bash
cd rocket-claude-kit
git pull
./setup.sh
```

The setup script is idempotent — safe to run as many times as you want.

---

## How Endpoint Files Are Structured

Every fully-documented endpoint follows this format:

```markdown
# Endpoint Name

- **Method:** POST
- **Path:** `/contacts/upsert`
- **Scopes:** `contacts.write`
- **Rate Limit:** Standard (100/10s)

## Parameters
[Path, query, and body parameter tables]

## Request Example
[Curl command or JSON body with realistic data]

## Response Example
[JSON response with realistic data]

## Error Responses
[Status codes and what they mean]

## Common Use Cases
[When you'd use this endpoint]

## Gotchas
[Non-obvious behavior or common mistakes]
```

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
3. Document the hook in this README

---

## Credits

Built by **Randall Gross** at [Rocket Digital Marketing](https://rocketdigitalmarketing.io) with Claude Code.

API reference data sourced from the [official HighLevel API docs](https://highlevel.stoplight.io/docs/integrations/) and [GoHighLevel/highlevel-api-docs](https://github.com/GoHighLevel/highlevel-api-docs).
