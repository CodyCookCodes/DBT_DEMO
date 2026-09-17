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
            {{ fn_Season("STARTED_AT") }} as "Season",
            {{ function1("STARTED_AT") }} as "PastOrFuture"
        from {{ ref('stg_bike') }}
        where started_at != 'started_at'
        order by date(to_timestamp(started_at))
    )

select *
from cte
