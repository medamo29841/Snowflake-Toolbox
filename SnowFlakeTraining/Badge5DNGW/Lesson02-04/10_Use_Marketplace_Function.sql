select
  logs.ip_address
, logs.user_login
, logs.user_event
, logs.datetime_iso8601
, loc.city
, loc.region
, loc.country
, loc.timezone
from ags_game_audience.raw.logs logs
join ipinfo_geoloc.demo.location loc
on ipinfo_geoloc.public.to_join_key(logs.ip_address) = loc.join_key
and ipinfo_geoloc.public.to_int(logs.ip_address)
BETWEEN start_ip_int AND end_ip_int;

--Explore timezones in the marketplace data

select
  logs.ip_address
, logs.user_login
, logs.user_event
, logs.datetime_iso8601
, loc.city
, loc.region
, loc.country
, loc.timezone
, convert_timezone('UTC', loc.timezone, logs.datetime_iso8601) as game_event_ltz
, dayname(game_event_ltz) as DOW_NAME
from ags_game_audience.raw.logs logs
join ipinfo_geoloc.demo.location loc
on ipinfo_geoloc.public.to_join_key(logs.ip_address) = loc.join_key
and ipinfo_geoloc.public.to_int(logs.ip_address)
BETWEEN start_ip_int AND end_ip_int;