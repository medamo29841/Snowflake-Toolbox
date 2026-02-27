use schema ags_game_audience.raw;

create file format FF_JSON_LOGS
    type = JSON,
    strip_outer_array=true;

Select $1
from @uni_kishore/kickoff
(file_format => ff_json_logs);

Select $1
from  @uni_kishore/updated_feed
(file_format => ff_json_logs);
;

