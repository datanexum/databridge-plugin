---
name: databridge:upgrade
description: Show available PRO and Enterprise features and how to upgrade your DataBridge license.
---

Show the user the DataBridge tier comparison and upgrade instructions.

Present this information clearly:

## Your Current Tier: Community Edition (Free)

What you have now:
- Load and preview CSV, JSON, Excel, Parquet files
- Run SQL against any file via DuckDB (no database needed)
- Profile data quality with completeness, consistency, uniqueness scores
- Reconcile two data sources (hash compare, orphans, conflicts)
- Fuzzy entity resolution and deduplication
- Extract text and tables from PDFs with OCR
- Batch file classification and triage
- One-shot data onboarding (load + profile + match)

## DataBridge PRO — $49/month

Everything in Free, plus:
- **KB-Grounded Anomaly Detection** — Scan data for fraud, duplicates, ghost vendors, Benford's Law violations, threshold gaming. Findings are traced to documented rules, not just statistics. Includes feedback loop that learns from your confirmations.
- **25 SDK Workflows** — Pre-built multi-step pipelines for fraud detection, DQ exceptions, data cleaning, reconciliation, document processing, hierarchy building, forensics, M&A synergy analysis, and more.
- **Snowflake DDL Compilation** — Compile any workflow into deployable Dynamic Tables, Tasks, Stored Procedures, and Masking Policies.
- **dbt Project Generation** — Discover data models and generate complete dbt projects with staging, intermediate, and mart layers.
- **BLCE Engine (84 tools)** — Extract business logic from SQL queries, Excel formulas, Python scripts, and DAX expressions into normalized Kimball models.
- **Multi-Level Hierarchy Builder** — Create financial hierarchies up to 15 levels with source mappings, calculation formulas, and deployment to Snowflake.
- **Knowledge Graph** — Search institutional knowledge with semantic queries, trust scoring, and evidence citations.
- **3 Autonomous Agents** — Data quality auditor, full reconciliation lifecycle, and financial modeler that work end-to-end with minimal supervision.
- **Full Gateway Access** — 394 tools across 68 domains including lineage, governance, pattern abstraction, schema matching, and more.

## DataBridge Enterprise — $199/month

Everything in PRO, plus:
- Admin console with user management and tenant configuration
- Snowflake Cortex AI integration
- Dedicated hosted MCP server
- On-premise Docker and Snowflake SPCS deployment
- LangGraph multi-agent orchestration (15 tools)
- Priority support with SLA
- Custom domain knowledge ingestion

## How to Upgrade

1. Visit **https://databridge.dataamplifier.io/subscribe**
2. Choose your plan and complete checkout
3. Copy your API key from the dashboard
4. Set it in your environment:
   ```
   export DATABRIDGE_LICENSE_KEY=db_pro_xxxxxxxxxxxxxxxx
   ```
5. Restart Claude Code — PRO tools unlock instantly, no reinstall needed

## Questions?

- Documentation: https://databridge.dataamplifier.io/docs
- Support: support@datanexum.com
- GitHub: https://github.com/datanexum
