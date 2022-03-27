WITH locality AS (
   SELECT *
   FROM {{ ref('dim_locality') }}
),
observations AS (
   SELECT *
   FROM {{ ref('stg_observations') }}
),
final AS (
  SELECT 
    l.locality,
    EXTRACT(YEAR FROM o.obs_date) AS obs_year,
    EXTRACT(MONTH FROM o.obs_date) AS obs_month,
    EXTRACT(DAY FROM o.obs_date) AS obs_day,	
    EXTRACT(DAYOFYEAR FROM o.obs_date) AS obs_dayofyear,	
    o.obs_date,	
    o.obs_time,
    o.air_temp
  FROM observations AS o
  LEFT JOIN locality AS l
  ON o.obs_latitude = l.latitude
  AND o.obs_longitude = l.longitude 
)

SELECT * FROM final
