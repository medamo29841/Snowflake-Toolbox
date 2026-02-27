--Set your worksheet drop list role to ACCOUNTADMIN
--Set your worksheet drop list database and schema to the location of your GRADER function
use database UTIL_DB;
use schema PUBLIC;
use role ACCOUNTADMIN;

-- DO NOT EDIT ANYTHING BELOW THIS LINE. THE CODE MUST BE RUN EXACTLY AS IT IS WRITTEN
select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
 SELECT 'DWW10' as step
  ,( 
    select count(*) 
    from UTIL_DB.INFORMATION_SCHEMA.stages
    where stage_name='MY_INTERNAL_STAGE'
    AND stage_type IS NULL
    ) as actual
  , 1 as expected
  , 'Internal stage created' as description
 ); 