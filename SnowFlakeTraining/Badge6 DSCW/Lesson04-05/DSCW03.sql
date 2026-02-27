use role accountadmin;
use database util_db;
use schema public;

-- DO NOT EDIT ANYTHING BELOW THIS LINE
select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
   SELECT 'DSCW03' as step 
   ,( select  round(count(*)/iff(count(*)=0,1,count(*)),0) as tally
      from snowflake.account_usage.query_history
      where query_text like '%CREATE SNOWFLAKE.ML.FORECAST camillas_practice_goal_forecasting%'
      and execution_status = 'SUCCESS'
     ) as actual 
   , 1 as expected 
   ,'Created Forecast Model' as description
); 