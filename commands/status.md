---
name: databridge:status
description: Show DataBridge server health, connected backends, tool count, license tier, and recent audit log.
---

Show the current DataBridge system status.

## Steps

1. **Server health** — Run `get_console_server_status` to check if the MCP server is running and responsive.

2. **Connected backends** — Run `get_console_connections` to list all configured database connections and their status (connected/disconnected).

3. **Tool count** — Run `list_available_skills` to get the current tool count and breakdown by category.

4. **License tier** — Run `get_license_status` to show the current license tier (CE/Pro/Enterprise) and feature availability.

5. **Working directory** — Run `get_working_directory` to show the current data directory.

6. **Recent audit log** — Run `get_audit_log` to show the last 5 audit entries (tool invocations, data operations).

7. **Report** — Present a status dashboard:
   ```
   DataBridge Status
   ─────────────────────────
   Server:      {running/stopped}
   License:     {tier}
   Tools:       {count} loaded
   Backends:    {count} configured ({connected} connected)
   Working dir: {path}

   Recent Activity:
   {last 5 audit entries}
   ```
