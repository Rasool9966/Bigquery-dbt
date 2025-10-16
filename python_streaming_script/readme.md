### Streaming Demo
The streaming demo uses BigQuery’s streaming insert API to simulate near-real-time GA4 events.

- Script: `stream_events.py`
- Table: `arcane-text-472313-v2.ga4_attribution_demo.streaming_events`
- Streams 5–20 events (page_view, add_to_cart, purchase) every second.

**To run:**
```bash
python stream_events.py
