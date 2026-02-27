use role accountadmin;
use database util_db;
use schema public;


--This DORA Check Requires that you RUN two Statements, one right after the other
list @camillas_db.cortex_analyst.cortex_analyst_model_stage;

--the above command puts information into memory that can be accessed using result_scan(last_query_id())
-- If you have to run this check more than once, always run the LIST command immediately prior
select grader(step, (actual = expected), actual, expected, description) as graded_results from (
 SELECT 'DSCW02' as step
 ,( select IFF(count(*)>0,1,0) 
    from table(result_scan(last_query_id())) 
    where "name" = 'cortex_analyst_model_stage/CAMILLAS_JUNE_TOURNAMENT.yaml') as actual
 , 1 as expected
 ,'Semantic Model Complete' as description
); 