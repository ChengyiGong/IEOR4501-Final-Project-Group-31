
select distance from (
    select distance from taxi_trips where pickup_datetime between "2013-07-01" and "2013-07-31"
    union all
    select distance from uber_trips where pickup_datetime between "2013-07-01" and "2013-07-31"
)
order by distance asc limit 1 offset (
    select round(count(*) * 0.95 - 1, 0) from (
        select distance from taxi_trips where pickup_datetime between "2013-07-01" and "2013-07-31"
        union all
        select distance from uber_trips where pickup_datetime between "2013-07-01" and "2013-07-31"
    )
)
