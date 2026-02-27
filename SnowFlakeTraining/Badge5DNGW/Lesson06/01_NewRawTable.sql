use schema ags_game_audience.raw;

create or replace TABLE AGS_GAME_AUDIENCE.RAW.PL_GAME_LOGS (
	RAW_LOG VARIANT
);

--load from stage
--subsequent runs ignore previously loaded files.  Idempotent
copy into pl_game_logs
from @uni_kishore_pipeline/  --will load one ore more files from this location.
file_format = (format_name=ff_json_logs)
--FORCE = TRUE -- ignores Idempotent
--Truncate; FORCE=FALSE --reload
;

Select * from pl_game_logs; --48 files, each file has 10 rows  --480 correct

Select
$1
from @uni_kishore_pipeline;