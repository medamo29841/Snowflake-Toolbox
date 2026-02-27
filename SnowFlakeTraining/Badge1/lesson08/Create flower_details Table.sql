create or replace table flower_details
(
plant_name varchar(25)
, root_depth_code varchar(1)    
);


/*
select * from flower_details;

select * from flower_details where plant_name = (
select 
plant_name
from flower_details
group by plant_name
having count(*) > 1);

select * from flower_details
where plant_name = 'Spinach'
and root_depth_code = 'D';

delete from flower_details
where plant_name = 'Spinach'
and root_depth_code = 'D';
*/



