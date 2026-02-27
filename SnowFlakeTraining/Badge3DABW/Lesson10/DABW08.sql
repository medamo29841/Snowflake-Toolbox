use schema UTIL_DB.PUBLIC;
use role accountadmin;

-- DO NOT EDIT ANYTHING BELOW THIS LINE
select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
   SELECT 'DABW008' as step 
   ,( select sum(hash_ing) from
      (select hash(ingredients) as hash_ing
       from smoothies.public.orders
       where order_ts is not null 
       and name_on_order is not null 
       and (name_on_order = 'Kevin' and order_filled = FALSE and hash_ing = 7976616299844859825) 
       or (name_on_order ='Divya' and order_filled = TRUE and hash_ing = -6112358379204300652)
       or (name_on_order ='Xi' and order_filled = TRUE and hash_ing = 1016924841131818535))
     ) as actual 
   , 2881182761772377708 as expected 
   ,'Followed challenge lab directions' as description
); 