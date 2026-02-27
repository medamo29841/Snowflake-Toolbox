use schema ags_game_audience.raw;

create or replace view pl_logs as 
select 
raw_log:ip_address::text as ip_address,
raw_log:user_event::text as user_event,
raw_log:user_login::text as user_login,
raw_log:datetime_iso8601::timestamp_ntz as datetime_iso8601,
raw_log
from pl_game_logs
where raw_log:agent::text is null; --what's this text thing doing? wasn't in lesson 04.

select * from pl_logs;