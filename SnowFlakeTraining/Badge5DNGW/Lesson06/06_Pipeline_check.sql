use schema ags_game_audience.raw;

Select
$1
from @uni_kishore_pipeline/
group by 1;

Select * from pl_game_logs;

Select * from enhanced.logs_enhanced;

--Step 1 - how many files in the bucket? 21
list @AGS_GAME_AUDIENCE.RAW.UNI_KISHORE_PIPELINE;  --21

--Step 2 - number of rows in raw table (should be file count x 10)
select count(*) from AGS_GAME_AUDIENCE.RAW.PL_GAME_LOGS; --490

--Step 3 - number of rows in raw view (should be file count x 10)
select count(*) from AGS_GAME_AUDIENCE.RAW.PL_LOGS;  --490

--Step 4 - number of rows in enhanced table (should be file count x 10 but fewer rows is okay because not all IP addresses are available from the IPInfo share)
select count(*) from AGS_GAME_AUDIENCE.ENHANCED.LOGS_ENHANCED; --204

