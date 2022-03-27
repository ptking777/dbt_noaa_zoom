WITH locality AS (
  SELECT locality, latitude, longitude 
FROM {{ ref('stg_locality_lookup') }}
),
final AS (
  SELECT * FROM locality
)

SELECT * FROM final
