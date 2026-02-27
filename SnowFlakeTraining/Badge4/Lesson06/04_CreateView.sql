use schema mels_smoothie_challenge_db.trails;
create or replace view DENVER_AREA_TRAILS
as
(select
$1:features[0]:properties:Name::string as feature_name 
,$1:features[0]:geometry:coordinates::string as feature_coordinates  
,$1:features[0]:geometry::string as geometry  
,$1:features[0]:properties::string as feature_properties  
,$1:crs:properties:name::string as specs  
,$1 as whole_object
from @trails_geojson (file_format => ff_json));