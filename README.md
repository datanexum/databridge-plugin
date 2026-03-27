# DataBridge AI Plugin for Claude Code

Data operations for analysts — load files, run SQL instantly, profile quality, reconcile sources, extract PDF tables, and classify datasets. No database required.

## Installation

### Claude Code (local)

```bash
claude --plugin-dir ./databridge-plugin
```

### Claude Code (from GitHub)

```bash
claude plugin install datanexum/databridge-plugin
```

## Prerequisites

- Python 3.10+
- `pip install databridge-core`

Run `/databridge:setup` after installation to verify dependencies.

## What's Included

### 6 Skills

| Skill | What It Does |
|-------|-------------|
| `/databridge:onboard` | Load + profile + assess quality + optional fuzzy match |
| `/databridge:sql` | Interactive SQL via DuckDB — register any file as a table, full SQL |
| `/databridge:profile` | Statistical profiling + quality scoring + drift detection |
| `/databridge:reconcile` | Hash compare + orphans + conflicts + fuzzy match + SQL drill-down |
| `/databridge:extract-pdf` | PDF/image text + table extraction with OCR |
| `/databridge:triage` | Batch file classification + prioritization + processing order |

### 3 Commands

| Command | What It Does |
|---------|-------------|
| `/databridge:setup` | Verify dependencies and test MCP server connection |
| `/databridge:status` | Server health, license tier, audit log |
| `/databridge:upgrade` | Compare tiers and see how to unlock PRO features |

### 4 Hooks

| Trigger | Action |
|---------|--------|
| After CSV/JSON load | Suggest profiling |
| After reconciliation | Suggest fuzzy matching or SQL drill-down |
| After profiling | Suggest next steps based on findings |
| After PDF extraction | Suggest SQL query or reconciliation |

## MCP Tools (Free Tier)

These tools are available through the DataBridge MCP server:

| Category | Tools |
|----------|-------|
| **Data Loading** | `find_files` `load_csv` `load_json` `onboard_data` `get_working_directory` |
| **Profiling & Quality** | `profile_data` `assess_quality` |
| **SQL Analytics** | `generate_sql` (DuckDB — queries CSV, Parquet, JSON directly) |
| **Reconciliation** | `reconcile` `resolve_entities` |
| **Document Extraction** | `extract_documents` |
| **Detection** | `detect_grounded_file` |
| **Knowledge Base** | `search_knowledge` `review_knowledge` `record_detection_feedback` `memorize_detection_weights` |
| **SDK Workflows** | `sdk_capabilities` `sdk_list_workflows` `sdk_search_workflows` `sdk_run_workflow` `sdk_compile_workflow` `sdk_design_workflow` `sdk_pipeline` |
| **Discovery** | `discover_model` `discover_tools` `search_tools` `list_domains` `get_application_documentation` |
| **System** | `get_license_status` `run_tool` `run_workflow` `agent_communicate` |

## Quick Start

1. Install the plugin
2. Run `/databridge:setup` to verify dependencies
3. Say **"What files do I have?"** — finds your data files
4. Say **"Load and profile sales.csv"** — loads + quality check
5. Say **"Show me revenue by region"** — SQL via DuckDB, no database needed
6. Say **"Reconcile sales.csv against gl_extract.csv on account_id"** — full reconciliation
7. Say **"Extract tables from invoice.pdf"** — PDF table extraction

## DataBridge PRO

The free plugin covers core data operations. DataBridge PRO unlocks:

- KB-grounded anomaly detection (fraud, duplicates, Benford's Law)
- 27 SDK workflows (fraud detection, data cleaning, M&A synergy, and more)
- Snowflake DDL compilation and dbt project generation
- BLCE engine (84 tools) for business logic extraction
- Multi-level hierarchy builder with Snowflake deployment
- Knowledge graph with semantic search
- 3 autonomous agents + full gateway access (336+ tools across 68 domains)

Run `/databridge:upgrade` for details, or visit https://databridge.dataamplifier.io

## Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `DATABRIDGE_TOOL_MODE` | `slim` | `slim` (free tier tools) |
| `DATABRIDGE_LICENSE_KEY` | — | Set to unlock PRO/Enterprise features |
| `DATABRIDGE_DATA_DIR` | `data` | Working data directory |

## Plugin Structure

```
databridge-plugin/
├── .claude-plugin/
│   └── plugin.json           # Plugin manifest (v1.0.0)
├── .mcp.json                 # MCP server configuration
├── hooks/
│   └── hooks.json            # 4 PostToolUse hooks
├── skills/
│   ├── onboard/SKILL.md      # Data onboarding
│   ├── reconcile/SKILL.md    # Reconciliation
│   ├── profile/SKILL.md      # Profiling & quality
│   ├── sql/SKILL.md          # SQL analytics
│   ├── extract-pdf/SKILL.md  # PDF extraction
│   └── triage/SKILL.md       # File classification
├── commands/
│   ├── setup.md              # /databridge:setup
│   ├── status.md             # /databridge:status
│   └── upgrade.md            # /databridge:upgrade
├── scripts/
│   └── check-deps.sh         # Dependency checker
├── LICENSE                   # MIT
└── README.md
```

## License

MIT -- See [LICENSE](LICENSE).

## Links

- [DataBridge Documentation](https://databridge.dataamplifier.io)
- [DataNexum GitHub](https://github.com/datanexum)
