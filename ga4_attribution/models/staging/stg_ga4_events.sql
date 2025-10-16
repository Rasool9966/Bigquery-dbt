{{ config(materialized='view') }}

SELECT
  event_date,
  event_timestamp,
  event_name,
  COALESCE(user_id, user_pseudo_id) AS user_id,
  user_pseudo_id,
  traffic_source.source AS source,
  traffic_source.medium AS medium,
  traffic_source.name AS campaign
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
