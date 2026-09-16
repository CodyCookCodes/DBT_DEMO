with BIKE as (
    select 
    distinct
    start_station_id as station_id,
    start_station_name station_name,
    start_lat station_lat,
    start_lng station_lng
    from {{ source('demo', 'bike') }}
    where RIDE_ID != 'ride_id'
)

select *
from BIKE