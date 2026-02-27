use schema ags_game_audience.raw;

copy into game_logs
from @uni_kishore/kickoff  --will load one ore more files from this location.
file_format = (format_name=ff_json_logs);

select * from game_logs;

select 
raw_log:agent::text as agent,
raw_log:user_event::text as user_event,
raw_log:datetime_iso8601::timestamp_ntz as datetime_iso8601,
raw_log:user_login::text as user_login
,*
from game_logs;


Select $1
from  @uni_kishore/updated_feed
(file_format => ff_json_logs);
;

copy into game_logs
from @uni_kishore/updated_feed  --will load one ore more files from this location.
file_format = (format_name=ff_json_logs);

select * from logs
where raw_log:agent is null;