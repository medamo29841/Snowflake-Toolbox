select * 
from garden_plants.information_schema.schemata;

SELECT * 
FROM GARDEN_PLANTS.INFORMATION_SCHEMA.SCHEMATA
where schema_name in ('FLOWERS','FRUITS','VEGGIES'); 

select count(*) as schemas_found, '3' as schemas_expected 
from GARDEN_PLANTS.INFORMATION_SCHEMA.SCHEMATA
where schema_name in ('FLOWERS','FRUITS','VEGGIES'); 