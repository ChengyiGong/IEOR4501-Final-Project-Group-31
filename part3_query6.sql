
with recursive dates(x) as (
    select "2012-10-29 00:00:00"
    union all
    select datetime(x, '+1 HOURS') as datetime from dates where x < "2012-11-04 23:00:00"
)
select b.datetime, b.precipitation, b.wind_speed, count(*) as count from (
    select dates.x as datetime, a.precipitation, a.wind_speed from dates
    left outer join (
        select * from hourly_weather 
        where datetime between "2012-10-29 00:00:00" and "2012-11-04 23:59:59"
    ) a on strftime('%Y-%m-%d', dates.x) = strftime('%Y-%m-%d', a.datetime) and strftime('%H', dates.x) = strftime('%H', a.datetime)
) b left outer join (
    select pickup_datetime from taxi_trips 
    where pickup_datetime between "2012-10-29 00:00:00" and "2012-11-04 23:59:59"
    union all
    select pickup_datetime from uber_trips 
    where pickup_datetime between "2012-10-29 00:00:00" and "2012-11-04 23:59:59"
) c on strftime('%Y-%m-%d', b.datetime) = strftime('%Y-%m-%d', c.pickup_datetime) and strftime('%H', b.datetime) = strftime('%H', c.pickup_datetime)
group by b.datetime
