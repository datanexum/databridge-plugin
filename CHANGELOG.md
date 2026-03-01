# Changelog

## 0.48.0 (2026-03-01)

### Added
- Server-side: Build 5 Closed-Loop Intelligence — active learning, feedback loop, Platt-scaled calibration, health dashboard
- 2 new MCP tools: `evaluation_feedback_loop`, `evaluation_health_dashboard`
- 4 new planner_manage actions: `active_learning_rank`, `calibration_status`, `calibration_recalibrate`, `health_dashboard`
- Tool count: 302 → 306 CE (367 → 371 Enterprise)

## 0.47.0 (2026-02-28)

### Changed
- Server-side: 5 new evaluation tools — falsification search, property checks, failure clustering, failure rate estimation, release dashboard (Build 3 validation harness)
- Server-side: planner_manage tool gains 3 new actions (decision_trace, bandit_stats, record_outcome) for online decision-making — VOI clarifications, Thompson Sampling strategy selection, Monte Carlo rollout planning
- Tool count: 297 → 302 CE (362 → 367 Enterprise)

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
