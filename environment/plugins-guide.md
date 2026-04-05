# Claude Code Plugins Guide

Step-by-step installation guide for recommended Claude Code plugins.

---

## Required Plugins

### 1. Composure

Code quality enforcement, dependency graph visualization, and automated code reviews.

**Install:**

```bash
npx @anthropic-ai/claude-code mcp add composure -- npx -y @composure-dev/composure-mcp-server
```

**After install**, run `/composure:initialize` in each project to detect the stack and generate config.

### 2. Design Forge

Premium web design patterns and components for distinctive, production-grade frontends.

**Install:**

```bash
npx @anthropic-ai/claude-code mcp add design-forge -- npx -y @design-forge/mcp-server
```

### 3. Context7

Always-current library and framework documentation lookup. Replaces guessing from stale training data.

**Install:**

```bash
npx @anthropic-ai/claude-code mcp add context7 -- npx -y @context7/mcp-server
```

---

## Recommended Plugins

### 4. Firecrawl

Web scraping, research, and content extraction. Superior to built-in web tools for LLM-optimized output.

**Install:**

```bash
npx @anthropic-ai/claude-code mcp add firecrawl -- npx -y @anthropic-ai/firecrawl-mcp-server
```

**Requires** the `FIRECRAWL_API_KEY` environment variable. Set it before use:

```bash
# Windows (PowerShell)
[System.Environment]::SetEnvironmentVariable("FIRECRAWL_API_KEY", "your-key-here", "User")

# macOS / Linux
export FIRECRAWL_API_KEY="your-key-here"
```

### 5. Playwright

Browser automation and end-to-end testing directly from Claude Code.

**Install:**

```bash
npx @anthropic-ai/claude-code mcp add playwright -- npx -y @anthropic-ai/playwright-mcp-server
```

---

## After Installing

1. **Restart Claude Code** so it picks up the new MCP server configurations.
2. **Verify plugins are loaded:**
   ```bash
   claude mcp list
   ```
   You should see each plugin name in the output.
3. **Initialize Composure** on your first project use:
   ```
   /composure:initialize
   ```
   This detects your project stack and generates the `.composure/` config directory.

---

## Troubleshooting

| Issue | Fix |
|-------|-----|
| Plugin tools not appearing | Ensure **Node.js 18+** is installed (`node -v` to check). MCP servers require it. |
| MCP tools are slow to respond | Run `/cc-optimizer:optimize mcp` to audit and trim MCP context overhead. |
| Plugin not connecting | Check `~/.claude/settings.json` under the `mcpServers` key. Each plugin should have an entry with its command and args. |
| Permission errors on install | Run the install command from an elevated terminal (Admin on Windows, sudo on macOS/Linux). |
| Plugin works locally but not in worktrees | Plugins are configured globally in `~/.claude/settings.json`, so they apply to all worktrees automatically. If a plugin needs project-local config, re-run its initialize command in the worktree. |
