# Changelog

## 0.44.0 (2026-02-24)

Initial release of the DataBridge Claude Code plugin.

### Added
- Plugin manifest (`.claude-plugin/plugin.json`)
- MCP server configuration (`.mcp.json`) — full mode with 226+ tools
- 6 skills: onboard, reconcile, triage, profile, hierarchy, model
- 2 commands: `/databridge:setup`, `/databridge:status`
- 3 agents: data-quality, reconciliation, financial-modeler
- PostToolUse hook for CSV import nudge
- Dependency checker script (`scripts/check-deps.sh`)
- README with installation and usage docs
