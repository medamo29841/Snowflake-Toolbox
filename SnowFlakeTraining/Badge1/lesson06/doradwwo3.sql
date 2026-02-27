--Remember that every time you run a DORA check, the context needs to be set to the below settings. 
use database UTIL_DB;
use schema PUBLIC;
use role ACCOUNTADMIN;

-- Do NOT EDIT ANYTHING BELOW THIS LINE 
-- Remember to set your WORKSHEET context (do not add context to the grader call)
select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
 SELECT 'DWW03' as step 
 ,( select count(*) 
   from GARDEN_PLANTS.INFORMATION_SCHEMA.TABLES 
   where table_name = 'ROOT_DEPTH') as actual 
 , 1 as expected 
 ,'ROOT_DEPTH Table Exists' as description
); 