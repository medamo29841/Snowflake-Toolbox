use schema util_db.public;

create function sum_mystery_bag_vars (var1 number, var2 number, var3 number)
returns number as 'select var1+var2+var3';

select sum_mystery_bag_vars (1,2,4);

set this = -10.5;
set that = 2;
set the_other = 1000;

select sum_mystery_bag_vars ($this,$that,$the_other);
