create or replace table vegetable_details_soil_type
( plant_name varchar(25)
 ,soil_type number(1,0)
);

create file format garden_plants.veggies.PIPECOLSEP_ONEHEADROW 
    type = 'CSV'--csv is used for any flat file (tsv, pipe-separated, etc)
    field_delimiter = '|' --pipes as column separators
    skip_header = 1 --one header row to skip
    ;

copy into vegetable_details_soil_type
from @util_db.public.my_internal_stage
files = ( 'VEG_NAME_TO_SOIL_TYPE_PIPE.txt')
file_format = ( format_name=GARDEN_PLANTS.VEGGIES.PIPECOLSEP_ONEHEADROW );   


--Soil Type 
create file format garden_plants.veggies.COMMASEP_DBLQUOT_ONEHEADROW 
    TYPE = 'CSV'--csv for comma separated files
    FIELD_DELIMITER = ',' --commas as column separators
    SKIP_HEADER = 1 --one header row  
    FIELD_OPTIONALLY_ENCLOSED_BY = '"' --this means that some values will be wrapped in double-quotes bc they have commas in them
    ;

--query data prior to loading in a table.
select $1
from @util_db.public.my_internal_stage/LU_SOIL_TYPE.tsv;  --empty result set

select $1, $2, $3
from @util_db.public.my_internal_stage/LU_SOIL_TYPE.tsv
(file_format => garden_plants.veggies.COMMASEP_DBLQUOT_ONEHEADROW); --empty result set

select $1, $2, $3
from @util_db.public.my_internal_stage/LU_SOIL_TYPE.tsv
(file_format => garden_plants.veggies.PIPECOLSEP_ONEHEADROW ); --empty result set


--Challenge to no results
-- what about the first example?
select $1
from @util_db.public.my_internal_stage/VEG_NAME_TO_SOIL_TYPE_PIPE.txt;  --returns unformatted results

--second example?
select $1, $2
from @util_db.public.my_internal_stage/VEG_NAME_TO_SOIL_TYPE_PIPE.txt
(file_format => garden_plants.veggies.PIPECOLSEP_ONEHEADROW); -- returns delimted result set


Select 'save'


