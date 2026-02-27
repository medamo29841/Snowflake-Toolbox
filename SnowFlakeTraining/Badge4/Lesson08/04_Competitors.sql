create or replace view competition as 
select * 
from openstreetmap_denver.denver.V_OSM_DEN_AMENITY_SUSTENANCE
where 
    ((amenity in ('fast_food','cafe','restaurant','juice_bar'))
    and 
    (name ilike '%jamba%' or name ilike '%juice%'
     or name ilike '%superfruit%'))
 or 
    (cuisine like '%smoothie%' or cuisine like '%juice%');


SELECT
 name
 ,cuisine
 , ST_DISTANCE(
    st_makepoint('-104.97300245114094','39.76471253574085')
    , coordinates
  ) AS distance_to_melanies
 ,*
FROM  competition
ORDER by distance_to_melanies;

CREATE OR REPLACE FUNCTION distance_to_mc(lng_and_lat GEOGRAPHY)
  RETURNS FLOAT
  AS
  $$
    st_distance(
        st_makepoint('-104.97300245114094','39.76471253574085')
        ,lng_and_lat
    )
  $$
  ;

  Select
  name
  ,cuisine
  ,distance_to_mc(coordinates) as distance_to_melanies
  ,*
  from competition
  order by distance_to_melanies;


