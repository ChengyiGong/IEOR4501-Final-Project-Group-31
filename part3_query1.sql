
select strftime('%H', pickup_datetime) as hour, count(*) as count
from taxi_trips 
where pickup_datetime between "2009-01-01" and "2015-06-30"
group by hour 
order by count desc
