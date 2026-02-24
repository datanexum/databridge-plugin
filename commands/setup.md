---
name: databridge:setup
description: Check DataBridge dependencies, test MCP server connection, and list available tools by tier.
---

Run the DataBridge dependency check and connection test.

## Steps

1. **Check Python version** — Run `python --version` and verify it's 3.10+. If not, warn the user.

2. **Check required packages** — Run `python -c "import pandas; import pydantic; print('OK')"` to verify core deps. Report any ImportError.

3. **Check optional packages** — Test each independently:
   - `openpyxl` — Excel support
   - `rapidfuzz` — Fuzzy matching
   - `snowflake.connector` — Snowflake connectivity
   - `sqlalchemy` — SQL database support
   - Report which are installed and which are missing.

4. **Test MCP server** — Check if the DataBridge MCP server is reachable by running `get_console_server_status`. If it fails, suggest starting the server with `python run_server.py --full`.

5. **List available tools** — Run `list_available_skills` to show the tool count and categorization by tier (CE/Pro/Enterprise).

6. **Report** — Present a summary:
   ```
   DataBridge Setup Status
   ─────────────────────────
   Python:     {version} ✓/✗
   Core deps:  {status}
   Optional:   {installed}/{total}
   MCP Server: {connected/disconnected}
   Tools:      {count} available ({tier} tier)
   ```

If anything is missing, provide the exact `pip install` command to fix it.
