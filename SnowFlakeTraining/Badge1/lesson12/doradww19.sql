--Set your worksheet drop list role to ACCOUNTADMIN
--Set your worksheet drop list database and schema to the location of your GRADER function
use database UTIL_DB;
use schema PUBLIC;
use role ACCOUNTADMIN;

-- Set your worksheet drop lists. DO NOT EDIT THE DORA CODE.

select GRADER(step, (actual = expected), actual, expected, description) as graded_results from
(
  SELECT 'DWW19' as step
  ,( select count(*) 
    from SOCIAL_MEDIA_FLOODGATES.INFORMATION_SCHEMA.VIEWS 
    where table_name = 'HASHTAGS_NORMALIZED') as actual
  , 1 as expected
  ,'Check number of rows' as description
 ); 