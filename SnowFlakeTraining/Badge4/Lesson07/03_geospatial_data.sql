use schema mels_smoothie_challenge_db.trails;

create or replace view DENVER_AREA_TRAILS_2 as
select 
trail_name as feature_name
,'{"coordinates":['||listagg('['||lng||','||lat||']',',') within group (order by point_id)||'],"type":"LineString"}' as geometry
,st_length(to_geography(geometry))  as trail_length
from cherry_creek_trail
group by trail_name;

select feature_name, geometry, trail_length
from DENVER_AREA_TRAILS
union all
select feature_name, geometry, trail_length
from DENVER_AREA_TRAILS_2;

create view trails_and_boundaries as 
select feature_name
, to_geography(geometry) as my_linestring
, st_xmin(my_linestring) as min_eastwest
, st_xmax(my_linestring) as max_eastwest
, st_ymin(my_linestring) as min_northsouth
, st_ymax(my_linestring) as max_northsouth
, trail_length
from DENVER_AREA_TRAILS
union all
select feature_name
, to_geography(geometry) as my_linestring
, st_xmin(my_linestring) as min_eastwest
, st_xmax(my_linestring) as max_eastwest
, st_ymin(my_linestring) as min_northsouth
, st_ymax(my_linestring) as max_northsouth
, trail_length
from DENVER_AREA_TRAILS_2;

Select * from trails_and_boundaries;
