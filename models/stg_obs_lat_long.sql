WITH obs_data as (
  SELECT 
    cat_id,
    wban,
    obs_latitude,
    obs_longitude
FROM {{ ref('stg_observations') }}   
),                                                                             
final as (                                                                     
  SELECT *                                                                     
  FROM obs_data                                                                
)

SELECT * FROM final 

