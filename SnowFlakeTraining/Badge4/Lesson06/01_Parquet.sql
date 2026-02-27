use schema mels_smoothie_challenge_db.trails;

Select * from @trails_parquet
(file_format => FF_PARQUET);

Select
$1:sequence_1 as sequence_1  ,
$1:trail_name::varchar as trail_name  ,
$1:latitude as latitude  ,
$1:longitude as longitude  ,
$1:sequence_2 as sequence_2  ,
$1:elevation as elevation  ,
from @trails_parquet
(file_format => FF_PARQUET)
order by sequence_1;


Select
$1:sequence_1 as point_id  ,
$1:trail_name::varchar as trail_name  ,
$1:latitude::number(11,8) as lng  ,
$1:longitude::number(11,8) as lat  
from @trails_parquet
(file_format => FF_PARQUET)
order by point_id;
