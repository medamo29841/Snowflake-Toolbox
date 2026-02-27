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




--CHALLENGE
create or replace file format garden_plants.veggies.L9_CHALLENGE_FF 
    TYPE = 'CSV'--csv for comma separated files
    FIELD_DELIMITER = '\t' -- tabs as column separators
    SKIP_HEADER = 1 --one header row  
    FIELD_OPTIONALLY_ENCLOSED_BY = '"' --this means that some values will be wrapped in double-quotes bc they have commas in them
    ;

select $1
from @util_db.public.my_internal_stage/LU_SOIL_TYPE.tsv;  --empty result set. Need to import file to stage

select $1, $2, $3
from @util_db.public.my_internal_stage/LU_SOIL_TYPE.tsv
(file_format => garden_plants.veggies.L9_CHALLENGE_FF); --looks good

--data is in stage and the comma delimiter was replaced by tab, approved

--Create table
create or replace table LU_SOIL_TYPE(
SOIL_TYPE_ID number,	
SOIL_TYPE varchar(15),
SOIL_DESCRIPTION varchar(75)
 );

--copy staged data into table
copy into lu_soil_type
from @util_db.public.my_internal_stage
files = ( 'LU_SOIL_TYPE.tsv')
file_format = ( format_name=GARDEN_PLANTS.VEGGIES.L9_CHALLENGE_FF );   

Select * from lu_soil_type;

--Next Challenge
create or replace table VEGETABLE_DETAILS_PLANT_HEIGHT (
plant_name varchar(25),	
UOM varchar(1),
Low_End_of_Range number(2,0),
High_End_of_Range number(2,0)
 );

select $1, $2, $3 ,$4 ,$5 --select * does not work here.
from @util_db.public.my_internal_stage/veg_plant_height.csv;  --

select $1, $2, $3 ,$4 ,$5
from @util_db.public.my_internal_stage/veg_plant_height.csv
(file_format => garden_plants.veggies.COMMASEP_DBLQUOT_ONEHEADROW); --looks good

--copy staged data into table
copy into VEGETABLE_DETAILS_PLANT_HEIGHT
from @util_db.public.my_internal_stage
files = ( 'veg_plant_height.csv')
file_format = ( format_name=GARDEN_PLANTS.VEGGIES.COMMASEP_DBLQUOT_ONEHEADROW ); 

Select * from VEGETABLE_DETAILS_PLANT_HEIGHT;
