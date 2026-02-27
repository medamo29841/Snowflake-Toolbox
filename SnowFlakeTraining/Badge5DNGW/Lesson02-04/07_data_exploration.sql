use schema ags_game_audience.raw;

select * from logs;

Select * from logs where user_login ilike '%praj%';

--ipAddress Lookup function in SnowFlake

select parse_ip(l.ip_address, 'inet'):host from logs l where l.user_login ilike '%praj%';
select parse_ip(l.ip_address, 'inet'):family from logs l where l.user_login ilike '%praj%';

select distinct parse_ip(l.ip_address, 'inet'):ipv4 from ags_game_audience.raw.logs l where l.user_login ilike '%praj%';--1680412832

Create Schema ENHANCED;
