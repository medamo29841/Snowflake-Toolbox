use schema mels_smoothie_challenge_db.trails;

create or replace view CHERRY_CREEK_TRAIL
as
(
Select
$1:sequence_1 as point_id  ,
$1:trail_name::varchar as trail_name  ,
$1:latitude::number(11,8) as lng  ,
$1:longitude::number(11,8) as lat ,
lng||' '||lat as coord_pair
from @trails_parquet
(file_format => FF_PARQUET)
order by point_id);

select * from CHERRY_CREEK_TRAIL;

select top 100 
 lng||' '||lat as coord_pair
,'POINT('||coord_pair||')' as trail_point
from cherry_creek_trail;

select 
'LINESTRING('||
listagg(coord_pair, ',') 
within group (order by point_id)
||')' as my_linestring
from cherry_creek_trail
where point_id <= 2450
group by trail_name;