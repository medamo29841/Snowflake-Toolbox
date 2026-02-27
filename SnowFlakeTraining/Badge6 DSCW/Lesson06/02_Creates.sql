create or replace table camillas_db.classification.unclassified_player_positions (
	player_id number(38,0),
	game_id number(38,0),
	mins_played number(38,0),
	goals_made number(38,0),
	assists number(38,0),
	shots number(38,0),
	passes number(38,0),
	sprint_distance number(38,0),
	saves number(38,0),
	dribbles number(38,0),
	blocks number(38,0),
	claims number(38,0)
);

INSERT INTO unclassified_player_positions
SELECT
$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12
FROM @stats/unclassified_player_data.csv
(file_format => STATS_1);