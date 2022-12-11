
select day from (
    select strftime('%w', pickup_datetime) as day, count(*) as count
    from taxi_trips 
    where pickup_datetime between "2009-01-01" and "2015-06-30"
    group by day 
    order by count desc
)