use schema mels_smoothie_challenge_db.trails;

Select * from @trails_geojson
(file_format => ff_json);

--Normalized from Stage
select
$1:features[0]:properties:Name::string as feature_name --"Highline Canal Trail North Section"
,$1:features[0]:geometry:coordinates::string as feature_coordinates  --array of points
,$1:features[0]:geometry::string as geometry  --array as string?
,$1:features[0]:properties::string as feature_properties  --kvps as string?
,$1:crs:properties:name::string as specs  --urn:ogc:def:crs:OGC:1.3:CRS84
,$1 as whole_object
from @trails_geojson (file_format => ff_json);