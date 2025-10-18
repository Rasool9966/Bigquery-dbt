# Bigquery-dbt

# GA4 Near-Real-Time Attribution Demo

**Goal:** Build a near-real-time attribution pipeline and dashboard computing First-Click and Last-Click using the GA4 public dataset, BigQuery, dbt.

## What’s included
- dbt project (models/staging → marts) that builds:
  - `stg_ga4_events` (view)
  - `first_click` (table)
  - `last_click` (table)
  - `attribution_summary` (table)
- Streaming demo:
  - `streaming_events` table + sample Python script (`stream_events.py`) to insert events
- Dashboard prototypes:
  - Looker Studio report (live BigQuery connection)
- CI/CD: GitHub Actions workflow `.github/workflows/dbt-ci.yml`
- Tests & docs: `models/*/schema.yml` + `dbt docs` l

## How to run (local)
1. Clone repo
2. Install dependencies:
   ```bash
   pip install dbt-bigquery google-cloud-bigquery streamlit pandas plotly
