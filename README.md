# DataBridge Plugin for Claude Code

Data reconciliation, hierarchy management, and financial modeling — packaged as a Claude Code plugin.

Upload a Chart of Accounts. Get a production-ready financial hierarchy and dbt models. Zero config.

## Installation

### From local directory (development)

```bash
claude --plugin-dir ./databridge-plugin
```

### From GitHub (once published)

```bash
claude plugin install datanexum/databridge-plugin
```

## Prerequisites

- Python 3.10+
- Core dependencies: `pip install pandas pydantic fastmcp`
- Optional: `pip install 'databridge-core[all]'` for full feature set

Run `/databridge:setup` after installation to verify everything is configured.

## What's Included

### Skills (auto-invoked by Claude based on context)

| Skill | Triggers on | What it does |
|-------|-------------|--------------|
| `onboard` | New CSV/Excel upload | Load → profile → recommend → optional fuzzy match |
| `reconcile` | "compare", "reconcile", "diff" | Hash compare → orphans → conflicts → fuzzy match → summary |
| `triage` | Directory of files, "scan" | Classify archetypes, detect errors, recommend processing order |
| `profile` | "profile", "quality", "validate" | Statistical profiling → expectations → validation |
| `hierarchy` | "hierarchy", "COA", "chart of accounts" | Multi-level hierarchy creation with formulas |
| `model` | "model", "dbt", "data mart" | Model discovery → dbt generation → mart pipeline |

### Commands (user-invoked)

| Command | Description |
|---------|-------------|
| `/databridge:setup` | Check dependencies, test connections, list tools |
| `/databridge:status` | Server health, tool count, license tier, audit log |

### Agents (specialized sub-agents for complex workflows)

| Agent | Description |
|-------|-------------|
| `data-quality` | Profiles sources, detects drift, validates expectations, produces quality scorecards |
| `reconciliation` | Full reconciliation lifecycle: load → compare → analyze → fuzzy match → merge → report |
| `financial-modeler` | Hierarchy creation → source mapping → formulas → mart generation → dbt → deployment |

### Hooks

- **PostToolUse**: After CSV import, suggests running `/databridge:profile` for quality checks

## MCP Server

The plugin configures a DataBridge MCP server with **317 CE tools** (up to 382 with Pro/Enterprise) in full mode. The server starts automatically when Claude Code loads the plugin.

Tools are organized across 46 categories including:
- Data profiling and quality
- Reconciliation (hash, fuzzy, diff)
- Hierarchy management
- Data modeling and dbt
- Snowflake and database connectors
- BLCE engine (84 tools)
- Mart factory
- Catalog and lineage

### Alternative: Docker-based MCP Server

If you prefer running the MCP server in Docker instead of locally:

```bash
# Start the MCP server container
docker compose --profile mcp up databridge-mcp -d

# Or build and run directly
docker build -f Dockerfile.mcp -t databridge-mcp .
docker run -p 786:786 databridge-mcp
```

Then configure your LLM client to connect via SSE:
```json
{
  "mcpServers": {
    "DataBridge AI": {
      "url": "http://localhost:786/sse"
    }
  }
}
```

## Configuration

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `DATABRIDGE_TOOL_MODE` | `full` | Tool loading mode: `slim`, `dynamic`, `full` |
| `DATABRIDGE_DEMO_MODE` | `false` | Enable demo mode with sample data |
| `DATABRIDGE_TELEMETRY` | `true` | Local telemetry collection |

### Custom MCP Server Path

If your DataBridge installation is not in the parent directory of the plugin, update `.mcp.json`:

```json
{
  "mcpServers": {
    "databridge": {
      "command": "python",
      "args": ["run_server.py", "--full"],
      "cwd": "/path/to/your/DATABRIDGE_AI"
    }
  }
}
```

## Quick Start

1. Install the plugin
2. Run `/databridge:setup` to verify dependencies
3. Drop a CSV file and say "profile this data"
4. Say "build a hierarchy from this chart of accounts"
5. Say "generate a dbt project for this model"

## License

MIT

## Links

- [DataBridge Core (PyPI)](https://pypi.org/project/databridge-core/)
- [GitHub](https://github.com/datanexum)
