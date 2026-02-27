use schema UTIL_DB.PUBLIC;
use role accountadmin;

-- DO NOT EDIT ANYTHING BELOW THIS LINE
select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
 SELECT 'DABW007' as step
 ,( select hash(neutralize_whining('bUt mOm i wAsHeD tHe dIsHes yEsTeRdAy'))) as actual
 , -4759027801154767056 as expected
 ,'WHINGE UDF Works' as description
);