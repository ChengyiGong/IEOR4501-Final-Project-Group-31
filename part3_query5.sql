
select day, sum(count) as count, wind_speed from (
    select a.day, a.count, b.wind_speed from (
        select strftime('%Y-%m-%d', pickup_datetime) as day, count(*) as count from taxi_trips 
        where pickup_datetime between "2014-01-01" and "2014-12-31" group by day
        union all
        select strftime('%Y-%m-%d', pickup_datetime) as day, count(*) as count from uber_trips 
        where pickup_datetime between "2014-01-01" and "2014-12-31" group by day
    ) a inner join daily_weather b
    on a.day = strftime('%Y-%m-%d', b.datetime)
) 
group by day 
order by wind_speed desc 
limit 10
