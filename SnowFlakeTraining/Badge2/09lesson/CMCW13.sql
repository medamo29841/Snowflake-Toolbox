use database UTIL_DB;
use schema PUBLIC;
use role SYSADMIN;

--DO NOT MAKE ANY CHANGES BELOW THIS LINE

--RUN THIS DORA CHECK IN YOUR ORIGINAL TRIAL ACCOUNT (WDE)

select grader(step, (actual = expected), actual, expected, description) as graded_results from (
SELECT 
  'CMCW13' as step
 ,( select count(*) 
   from SNOWFLAKE.ORGANIZATION_USAGE.ACCOUNTS 
   where account_name = 'AUTO_DATA_UNLIMITED' 
   and region like 'AZURE_%'
   and deleted_on is null) as actual
 , 1 as expected
 ,'ADU Account Added on AZURE' as description
); 