
select day, count(*) as count, avg(distance) from (
    select strftime('%Y-%m-%d', pickup_datetime) as day, distance from taxi_trips 
    where pickup_datetime between "2009-01-01" and "2009-12-31"
    union all
    select strftime('%Y-%m-%d', pickup_datetime) as day, distance from uber_trips 
    where pickup_datetime between "2009-01-01" and "2009-12-31"
) group by day 
order by count desc 
limit 10
