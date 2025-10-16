from google.cloud import bigquery
from datetime import datetime, timezone
import random, time, uuid

# Initialize BigQuery client
client = bigquery.Client(project="arcane-text-472313-v2")
table_id = "arcane-text-472313-v2.ga4_attribution_demo.streaming_events"

# Sample data pool
sources = ["google", "facebook", "instagram", "direct", "email"]
media = ["organic", "paid", "referral", "cpc", "email"]
events = ["page_view", "add_to_cart", "view_item", "purchase"]

print("Starting to stream sample events to BigQuery...")

for i in range(10):  # Stream 10 events (change as needed)
    row = {
        "event_id": str(uuid.uuid4()),
        "event_timestamp": datetime.now(timezone.utc).isoformat(),
        "user_pseudo_id": str(random.randint(10000, 99999)),
        "event_name": random.choice(events),
        "source": random.choice(sources),
        "medium": random.choice(media),
        "campaign": random.choice(["summer_sale", "black_friday", ""]),
        "payload": "{}",
    }

    # Insert row into BigQuery
    errors = client.insert_rows_json(table_id, [row])
    if errors:
        print("Error:", errors)
    else:
        print(f"Event {i+1} inserted at {row['event_timestamp']} ({row['event_name']})")

    time.sleep(1)  # Wait a second between inserts for realism

print("\n Done streaming 10 events.")
