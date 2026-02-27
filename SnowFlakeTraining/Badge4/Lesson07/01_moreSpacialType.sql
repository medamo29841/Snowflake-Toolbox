use schema mels_smoothie_challenge_db.trails;

select 
'LINESTRING('||
listagg(coord_pair, ',') 
within group (order by point_id)
||')' as my_linestring,
st_length(to_geography(my_linestring)) as lenth_of_trail
from cherry_creek_trail
group by trail_name;

select
$1:features[0]:properties:Name::string as feature_name 
,$1:features[0]:geometry:coordinates::string as feature_coordinates  
,$1:features[0]:geometry::string as geometry  
,$1:features[0]:properties::string as feature_properties  
,$1:crs:properties:name::string as specs  
,$1 as whole_object
from @trails_geojson (file_format => ff_json);

Select * from denver_area_trails;

Select
feature_name
, st_length(to_geography(whole_object)) as wo_length
, st_length(to_geography(geometry)) as geom_length
from denver_area_trails;