with
    cte as (
        select
            to_timestamp(started_at) as started_at,
            date(to_timestamp(started_at)) as date_started_at,
            hour(to_timestamp(started_at)) as hour_started_at,
            case
                when dayname(to_timestamp(started_at)) in ('Sat', 'Sun')
                then 'Weekend'
                else 'Weekday'
            end as "DAY_TYPE",
            CASE WHEN MONTH(to_timestamp(started_at)) in (12,1,2) THEN 'Winter'
                 WHEN MONTH(to_timestamp(started_at)) in (3,4,5) THEN 'Spring'
                 WHEN MONTH(to_timestamp(started_at)) in (6,7,8) THEN 'Summer'
                 ELSE 'Autumn'
            end as Season
        from {{ source("demo", "bike") }}
        where started_at != 'started_at'
        order by date(to_timestamp(started_at))
    )

select *
from cte
