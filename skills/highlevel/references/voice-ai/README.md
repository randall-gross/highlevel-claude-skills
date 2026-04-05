# Voice AI API

Manage Voice AI agents, actions, and view call log dashboards for automated voice interactions.

## Required Scopes
- `voice-ai-agents.readonly`
- `voice-ai-agents.write`
- `voice-ai-agent-goals.readonly`
- `voice-ai-agent-goals.write`
- `voice-ai-dashboard.readonly`

## Endpoints

| File | Method | Path | Description |
|------|--------|------|-------------|
| `agents/list.md` | GET | `/voice-ai/agents` | List voice AI agents |
| `agents/get.md` | GET | `/voice-ai/agents/{agentId}` | Get a voice AI agent |
| `agents/create.md` | POST | `/voice-ai/agents` | Create a voice AI agent |
| `agents/update.md` | PATCH | `/voice-ai/agents/{agentId}` | Update a voice AI agent |
| `agents/delete.md` | DELETE | `/voice-ai/agents/{agentId}` | Delete a voice AI agent |
| `actions/get.md` | GET | `/voice-ai/actions/{actionId}` | Get an action |
| `actions/create.md` | POST | `/voice-ai/actions` | Create an action |
| `actions/update.md` | PUT | `/voice-ai/actions/{actionId}` | Update an action |
| `actions/delete.md` | DELETE | `/voice-ai/actions/{actionId}/agent/{agentId}` | Delete an action |
| `dashboard/call-logs.md` | GET | `/voice-ai/dashboard/call-logs` | Get call logs |
| `dashboard/call-log.md` | GET | `/voice-ai/dashboard/call-logs/{callId}` | Get a specific call log |

> This domain has placeholder endpoint files. Full documentation with request/response examples is planned for a future update.
