use database camillas_db;

create Schema FORECASTING;

create or replace table camillas_db.forecasting.practice_stats (
	practice_date timestamp_ntz,
	goals_scored number,
	goals_attempted number
);

create or replace file format stats_1
   type = CSV,
   skip_header = 1,   
   field_delimiter = ',',
   trim_space = TRUE;

INSERT INTO practice_stats
Select $1,$2,$3
FROM @stats
(file_format => STATS_1);

select max(practice_date) from practice_stats;