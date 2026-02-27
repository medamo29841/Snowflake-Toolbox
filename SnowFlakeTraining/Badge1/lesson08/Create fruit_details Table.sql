create table fruit_details
(
plant_name varchar(25)
, root_depth_code varchar(1)    
);


/*
select * from fruit_details;

select * from fruit_details where plant_name = (
select 
plant_name
from fruit_details
group by plant_name
having count(*) > 1);

select * from fruit_details
where plant_name = 'Spinach'
and root_depth_code = 'D';

delete from fruit_details
where plant_name = 'Strawberry'
and root_depth_code = 'S';
*/



