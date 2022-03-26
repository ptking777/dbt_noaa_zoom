with obs_data as 
(
  SELECT 
	cat_id,
	wban,
	SAFE_CAST(obs_date AS DATE FORMAT 'YYYYMMDD') AS obs_date,
	obs_time,
	obs_data_source,
	ROUND((SAFE_CAST(obs_latitude AS FLOAT64)/1000.00),2) AS obs_latitude,
	ROUND((SAFE_CAST(obs_longitude AS FLOAT64)/1000.00),2) AS obs_longitude,
	report_code,
	obs_elevation,
	station_call,
	quality_control,
	SAFE_CAST(wind_dir_angle AS FLOAT64) AS wind_dir_angle,
	wind_dir_quality,
	wind_type,
	wind_speed_rate,
	wind_speed_quality,
	sky_ceiling,
	sky_ceiling_quality,
	sky_ceiling_determination,
	sky_cavok,
	vis_distance,
	vis_distance_quality,
	vis_variability,
	vis_variability_quality,
	(SAFE_CAST(air_temp AS FLOAT64)/10.0) AS air_temp,
	air_temp_quality,
	SAFE_CAST(air_dewpoint_temp AS FLOAT64) AS air_dewpoint_temp,
	air_dewpoint_temp_quality,
	SAFE_CAST(air_pres_msl AS FLOAT64) AS air_pres_msl,
	air_pres_msl_quality
  FROM {{ source('staging','noaa_external') }}
), 
final as (
  SELECT *
  FROM obs_data
)

SELECT * FROM final
