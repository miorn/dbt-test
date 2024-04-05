{{ config(materialized='table') }}

select taxi_id, company, EXTRACT(WEEK FROM trip_start_timestamp) as week_num, count(taxi_id) as number_trips
from {{ ref('last_week_trips')}}
where payment_type = 'Cash'
group by  taxi_id, company, week_num
order by taxi_id