# Rocket Claude Kit

Shared Claude Code skills, hooks, and environment configuration for the Rocket Digital Marketing team.

## Quick Start

1. Clone this repo:
   ```bash
   git clone https://github.com/randall-gross/rocket-claude-kit.git
   cd rocket-claude-kit
   ```

2. Run setup:
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

3. Merge settings (manual):
   ```bash
   jq -s '.[0] * .[1]' ~/.claude/settings.json environment/settings-template.json > tmp.json && mv tmp.json ~/.claude/settings.json
   ```

4. Install recommended plugins (see `environment/plugins-guide.md`)

## What's Inside

### Skills (`skills/highlevel/`)
Complete HighLevel API V2 reference system — 413 endpoints across 36 domains. Uses a 4-level cascade so Claude loads only the files it needs:

1. `SKILL.md` — master router
2. `references/{domain}/README.md` — domain overview
3. `references/{domain}/{subdomain}/README.md` — endpoint index
4. `references/{domain}/{subdomain}/{endpoint}.md` — single endpoint

### Hooks (`environment/hooks/`)
Protective guardrails for non-developer team members:
- Block destructive commands (rm -rf, git reset --hard, etc.)
- Block pushes to main/master
- Block secret leaks in code
- Require reading files before editing
- Validate HL API version headers
- Block environment file overwrites

### Environment (`environment/`)
- `settings-template.json` — base permissions and deny rules
- `plugins-guide.md` — how to install Composure, Design Forge, Context7, etc.

## Updating

```bash
cd rocket-claude-kit
git pull
./setup.sh
```

The setup script is idempotent — safe to run multiple times.
