use schema mels_smoothie_challenge_db.locations;

CREATE FUNCTION distance_to_mc(loc_lng number(38,32), loc_lat number(38,32))
  RETURNS FLOAT
  AS
  $$
    st_distance(
        st_makepoint('-104.97300245114094','39.76471253574085')
        ,st_makepoint(loc_lng,loc_lat)
    )
  $$
  ;

  --Tivoli Center into the variables 
set tc_lng='-105.00532059763648'; --
set tc_lat='39.74548137398218';   

select distance_to_mc($tc_lng,$tc_lat);



