WITH obs_data as (
  SELECT 
    locality,
    latitude,
    longitude
FROM {{ source('staging','locality_lookup') }}   
),                                                                             
final as (                                                                     
  SELECT *                                                                     
  FROM obs_data                                                                
)

SELECT * FROM final 
