Create Schema CLASSIFICATION;

create or replace table camillas_db.classification.train_player_position (
	player_id number(38,0),
	position_code varchar(1),
	game number(38,0),
	minutes_played number(38,0),
	goals number(38,0),
	assists number(38,0),
	shots number(38,0),
	passes number(38,0),
	sprint_distance number(38,0),
	saves number(38,0),
	dribbles number(38,0),
	blocks number(38,0),
	claims number(38,0)
);

create or replace file format stats_1
   type = CSV,
   skip_header = 1,   
   field_delimiter = ',',
   trim_space = TRUE;

INSERT into train_player_position  
SELECT
$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13
FROM @stats
(file_format => STATS_1);

Select * from train_player_position;




