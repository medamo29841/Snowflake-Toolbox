use schema ags_game_audience.raw;

create or replace view logs as 
select 
raw_log:user_event::text as user_event,
raw_log:datetime_iso8601::timestamp_ntz as datetime_iso8601,
raw_log:user_login::text as user_login,
raw_log:ip_address::text as ip_address
,*
from game_logs
where raw_log:agent is null;

Select * from logs;

Select * from logs where user_login ilike '%praj%';