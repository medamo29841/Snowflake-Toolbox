create table ags_game_audience.raw.time_of_day_lu
(  hour number
   ,tod_name varchar(25)
);

--insert statement to add all 24 rows to the table
insert into time_of_day_lu
values
(6,'Early morning'),
(7,'Early morning'),
(8,'Early morning'),
(9,'Mid-morning'),
(10,'Mid-morning'),
(11,'Late morning'),
(12,'Late morning'),
(13,'Early afternoon'),
(14,'Early afternoon'),
(15,'Mid-afternoon'),
(16,'Mid-afternoon'),
(17,'Late afternoon'),
(18,'Late afternoon'),
(19,'Early evening'),
(20,'Early evening'),
(21,'Late evening'),
(22,'Late evening'),
(23,'Late evening'),
(0,'Late at night'),
(1,'Late at night'),
(2,'Late at night'),
(3,'Toward morning'),
(4,'Toward morning'),
(5,'Toward morning');

select 
tod_name, listagg(hour,',') --listagg creates an array of values separated by commas in this instance.
from time_of_day_lu
group by tod_name;


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
;