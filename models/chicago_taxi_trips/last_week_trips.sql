select *
from {{ source('chicago_taxi_trips', 'taxi_trips')}}
where trip_start_timestamp >= timestamp_sub(
    (select max(trip_start_timestamp)
    from {{ source('chicago_taxi_trips', 'taxi_trips')}}),
    interval 7 day) 
    and trip_start_timestamp >= trip_end_timestamp