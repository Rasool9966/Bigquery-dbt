{{ config(materialized='table') }}

SELECT
  f.user_pseudo_id,
  f.first_source,
  f.first_medium,
  l.last_source,
  l.last_medium
FROM {{ ref('first_click') }} f
JOIN {{ ref('last_click') }} l USING (user_pseudo_id)
