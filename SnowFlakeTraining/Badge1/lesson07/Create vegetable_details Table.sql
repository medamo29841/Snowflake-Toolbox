--create table garden_plants.veggies.vegetable_details
--(
--plant_name varchar(25)
--, root_depth_code varchar(1)    
--);

select * from vegetable_details;

select * from vegetable_details where plant_name = (
select 
plant_name
from vegetable_details
group by plant_name
having count(*) > 1);

select * from vegetable_details
where plant_name = 'Spinach'
and root_depth_code = 'D';

delete from vegetable_details
where plant_name = 'Spinach'
and root_depth_code = 'D';




