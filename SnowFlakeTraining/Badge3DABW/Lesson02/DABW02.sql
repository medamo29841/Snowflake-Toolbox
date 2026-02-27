use schema UTIL_DB.PUBLIC;
use role accountadmin;

-- DO NOT EDIT ANYTHING BELOW THIS LINE

select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
SELECT 'DABW002' as step
 ,(select IFF(count(*)>=5,5,0)
    from (select ingredients from smoothies.public.orders
    group by ingredients)
 ) as actual
 ,  5 as expected
 ,'At least 5 different orders entered' as description
);