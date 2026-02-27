use schema UTIL_DB.PUBLIC;
use role accountadmin;

-- DO NOT EDIT ANYTHING BELOW THIS LINE
select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
  SELECT 'DABW003' as step
 ,(select ascii(fruit_name) from smoothies.public.fruit_options
where fruit_name ilike 'z%') as actual
 , 90 as expected
 ,'A mystery check for the inquisitive' as description
);