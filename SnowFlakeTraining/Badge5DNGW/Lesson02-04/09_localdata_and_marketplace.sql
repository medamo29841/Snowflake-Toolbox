
select start_ip, end_ip, start_ip_int, end_ip_int, city, region, country, timezone
from IPINFO_GEOLOC.demo.location
where parse_ip('100.41.16.160', 'inet'):ipv4 --Kishore's Headset's IP Address
BETWEEN start_ip_int AND end_ip_int;

select
logs.*
, loc.city
, loc.region
, loc.country
, loc.timezone
from ags_game_audience.raw.logs logs
join ipinfo_geoloc.demo.location loc
where parse_ip(logs.ip_address, 'inet'):ipv4
BETWEEN start_ip_int AND end_ip_int;


