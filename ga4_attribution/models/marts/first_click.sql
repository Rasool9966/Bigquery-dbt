{{ config(materialized='table') }}

WITH events AS (
  SELECT * FROM {{ ref('stg_ga4_events') }}
),
purchasers AS (
  SELECT DISTINCT user_pseudo_id
  FROM events
  WHERE event_name = 'purchase'
),
joined AS (
  SELECT e.*
  FROM events e
  JOIN purchasers p USING (user_pseudo_id)
)
SELECT
  user_pseudo_id,
  ARRAY_AGG(source ORDER BY event_timestamp ASC LIMIT 1)[OFFSET(0)] AS first_source,
  ARRAY_AGG(medium ORDER BY event_timestamp ASC LIMIT 1)[OFFSET(0)] AS first_medium
FROM joined
GROUP BY user_pseudo_id
