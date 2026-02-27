Select * from openstreetmap_denver.denver.V_OSM_DEN_SHOP_OUTDOORS_AND_SPORT_VEHICLES where shop = 'bicycle';
Select * from openstreetmap_denver.denver.V_OSM_DEN_SHOP  where shop = 'bicycle';

--this will run the second version bc the Sonra Coordinates column
-- contains geography objects already
create or replace view DENVER_BIKE_SHOPS
as
select 
  distance_to_mc(coordinates) as distance_to_melanies 
,osm.*
from OPENSTREETMAP_DENVER.DENVER.V_OSM_DEN_SHOP_OUTDOORS_AND_SPORT_VEHICLES osm
where shop='bicycle' 
order by distance_to_melanies;