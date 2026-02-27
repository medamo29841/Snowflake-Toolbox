create or replace table ags_game_audience.enhanced.logs_enhanced as 
(
select
  logs.ip_address
, logs.user_login as GAMER_NAME
, logs.user_event as GAME_EVENT_NAME
, logs.datetime_iso8601 as GAME_EVENT_UTC
, loc.city
, loc.region
, loc.country
, loc.timezone as GAMER_LTZ_NAME
, convert_timezone('UTC', loc.timezone, logs.datetime_iso8601) as game_event_ltz
, dayname(game_event_ltz) as DOW_NAME
, lu.tod_name
from ags_game_audience.raw.logs logs
join ipinfo_geoloc.demo.location loc
on ipinfo_geoloc.public.to_join_key(logs.ip_address) = loc.join_key
and ipinfo_geoloc.public.to_int(logs.ip_address)
BETWEEN start_ip_int AND end_ip_int
JOIN ags_game_audience.raw.time_of_day_lu lu
ON date_part(hour, game_event_ltz) = lu.hour
)
;

Select * from ags_game_audience.enhanced.logs_enhanced;  --96