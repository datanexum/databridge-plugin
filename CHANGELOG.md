# Changelog

## 0.48.1 (2026-03-02)

### Fixed
- Server-side: Docker production build fixes — sourceless `.pyc` imports, Celery worker attribute, Dockerfile.mcp dependencies
- Server-side: Release CI pipeline rewritten — V3/V4 → single MCP image build (multi-arch)
- Server-side: Sub-package versions unified to 0.48.1
- Docker image: `ghcr.io/datanexum/databridge-mcp:0.48.1`

## 0.48.0 (2026-03-02)

### Added
- DataShield: deterministic client keys via HKDF-SHA256 — same client_id always produces the same encryption key, no keystore retrieval needed
- DataShield: semantic-preserving scrambling — column-level consistent numeric scaling and date shifting preserves ordering, ratios, gaps, and trends
- Server-side: Build 6 Enterprise Intelligence Layer — cost-aware optimizer, governance dashboard, detection rule optimizer, lineage impact analyzer, semantic auto-discovery, pattern pre-training, decision debate engine
- 11 new MCP tools, 3 new planner_manage actions (14→17 total)
- Server-side: Build 5 Closed-Loop Intelligence — active learning, feedback loop, Platt-scaled calibration, health dashboard
- IP protection expansion: Docker source stripping 36→183 modules, Cython compilation 24→46 targets
- Tool count: 302 → 316 CE (367 → 381 Enterprise)

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
