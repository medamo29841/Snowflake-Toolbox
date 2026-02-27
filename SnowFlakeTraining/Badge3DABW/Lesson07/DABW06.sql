use schema UTIL_DB.PUBLIC;
use role accountadmin;

-- Set these local variables according to the instructions
set this = -10.5;
set that = 2;
set the_other = 1000;

-- DO NOT EDIT ANYTHING BELOW THIS LINE
select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
  SELECT 'DABW006' as step
 ,( select util_db.public.sum_mystery_bag_vars($this,$that,$the_other)) as actual
 , 991.5 as expected
 ,'Mystery Bag Function Output' as description
);
