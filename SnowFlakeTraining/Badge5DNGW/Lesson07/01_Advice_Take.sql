/*
some advice to make this better...
He could add some file metadata columns to the load so that he will have a record of what files he loaded and when. 
He could move the logic from the PL_LOGs view into the same SELECT. (fewer pieces to maintain).
If he does change the select logic, he will then need a new target table to accommodate the output of the new select. 
When he has a new select that matches the new target table, he can put it into a new COPY INTO statement. 
After he has a new COPY INTO, he could put it into an Event-Driven Pipeline (instead of a task-based Time-Driven Pipeline)
*/

use schema ags_game_audience.raw;
--adding metadata
--create table as CTAS -  tweaked later
CREATE TABLE ED_PIPELINE_LOGS
as
  SELECT 
    METADATA$FILENAME as log_file_name --new metadata column
  , METADATA$FILE_ROW_NUMBER as log_file_row_id --new metadata column
  , current_timestamp(0) as load_ltz --new local time of load
  , get($1,'datetime_iso8601')::timestamp_ntz as DATETIME_ISO8601
  , get($1,'user_event')::text as USER_EVENT
  , get($1,'user_login')::text as USER_LOGIN
  , get($1,'ip_address')::text as IP_ADDRESS    
  FROM @AGS_GAME_AUDIENCE.RAW.UNI_KISHORE_PIPELINE
  (file_format => 'ff_json_logs');

--grab the definitions from SnowSite and tweak the VARCHAR size
create or replace TABLE AGS_GAME_AUDIENCE.RAW.ED_PIPELINE_LOGS (
	LOG_FILE_NAME VARCHAR(100),
	LOG_FILE_ROW_ID NUMBER(18,0),
	LOAD_LTZ TIMESTAMP_LTZ(0),
	DATETIME_ISO8601 TIMESTAMP_NTZ(9),
	USER_EVENT VARCHAR(25),
	USER_LOGIN VARCHAR(100),
	IP_ADDRESS VARCHAR(100)
);

-- Set up the new Copy Into

truncate table ed_pipeline_logs;

COPY INTO ed_pipeline_logs
FROM (
SELECT 
    METADATA$FILENAME as log_file_name --new metadata column
  , METADATA$FILE_ROW_NUMBER as log_file_row_id --new metadata column
  , current_timestamp(0) as load_ltz --new local time of load
  , get($1,'datetime_iso8601')::timestamp_ntz as DATETIME_ISO8601
  , get($1,'user_event')::text as USER_EVENT
  , get($1,'user_login')::text as USER_LOGIN
  , get($1,'ip_address')::text as IP_ADDRESS    
  FROM @AGS_GAME_AUDIENCE.RAW.UNI_KISHORE_PIPELINE
    )
  file_format = (format_name = ff_json_logs);  --a little different than before for COPY INTO

  