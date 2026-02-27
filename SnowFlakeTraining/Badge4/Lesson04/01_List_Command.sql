list @sweatsuits;

select $1 from @sweatsuits/; --error

select $1 from @sweatsuits/purple_sweatsuit.png; --error

select metadata$filename, metadata$file_row_number from @sweatsuits/purple_sweatsuit.png;

--using metadata 
select 
metadata$filename, 
COUNT(metadata$file_row_number) as number_of_rows
from @sweatsuits/
group by metadata$filename;

--directories are created (enabled/not enabled) when creating stages
Select * from directory(@sweatsuits);
