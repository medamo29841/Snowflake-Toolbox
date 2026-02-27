use role accountadmin;
use database util_db;
use schema public;

--This DORA Check Requires that you RUN two Statements, one right after the other
call camillas_db.classification.player_position_classification!SHOW_FEATURE_IMPORTANCE();

--the above command puts information into memory that can be accessed using result_scan(last_query_id())
-- If you have to run this check more than once, always run the LIST command immediately prior
select grader(step, (actual = expected), actual, expected, description) as graded_results from (
 SELECT 'DSCW05' as step
 ,( select count(*) from table(result_scan(last_query_id())) where FEATURE in ('PASSES','MINUTES_PLAYED','DRIBBLES','ASSISTS', 'SAVES', 'CLAIMS')
  ) as actual
 , 6 as expected
 ,'Classification Model Complete' as description
); 
