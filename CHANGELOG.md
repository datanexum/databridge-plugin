# Changelog

## 1.0.0 (2026-03-11)

Restructured for official Claude Code plugin marketplace submission. Free-tier only — PRO features available via license key upgrade.

### Changed
- Plugin manifest bumped to v1.0.0 with free-tier description and keywords
- `.mcp.json` now uses `python -m databridge.server --slim` (pip package, no path traversal)
- `onboard` skill: removed `detect_grounded_file` step (PRO)
- `profile` skill: removed anomaly detection workflow and PRO tool references
- `hooks.json` reduced from 5 to 4 hooks (removed detection hook, added soft PRO upsell on profiling)

### Added
- `/databridge:upgrade` command — tier comparison and upgrade instructions

### Removed
- `CLAUDE.md` — not a recognized plugin file type
- 5 PRO-only skills: `detect`, `generate-dbt`, `run-workflow`, `hierarchy`, `model`
- 3 PRO-only agents: `data-quality`, `reconciliation`, `financial-modeler`
- All references to 387 tools, gateway access, and PRO features from free-tier skill files

### Totals
- 6 skills + 3 commands
- 0 agents
- 4 hooks
- ~15 free-tier MCP tools via slim server mode

---

## 0.49.0 (2026-03-11)

Major upgrade — aligned with DataBridge AI v0.49.0, 387 tools, 28 SDK workflows.

### Added
- 5 new skills: `detect`, `sql`, `extract-pdf`, `generate-dbt`, `run-workflow`
- `CLAUDE.md`: Project-level instructions with tool priority order
- 4 new hooks: post-reconciliation, post-detection, post-profiling, post-PDF-extraction
- Claude Desktop installation instructions in README

### Updated
- Plugin manifest bumped to v0.49.0 with expanded keywords and description
- `.mcp.json` now sets PYTHONPATH and DATABRIDGE_DATA_DIR for reliable startup
- All 6 existing skills rewritten to use the 33 MCP-visible tool names
- `hooks.json` expanded from 1 hook to 5 contextual PostToolUse hooks
- README rewritten with full tool reference, gateway documentation, and plugin structure

### Totals
- 13 skills (11 skills + 2 commands)
- 3 agents
- 5 hooks
- 33 core MCP tools + gateway access to 387 total

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
