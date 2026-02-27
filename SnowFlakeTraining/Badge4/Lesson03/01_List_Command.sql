list @product_metadata;

select $1 from @product_metadata/;


select $1 from @product_metadata/product_coordination_suggestions.txt;
select $1 from @product_metadata/sweatsuit_sizes.txt;
select $1 from @product_metadata/swt_product_line.txt;

--directories are created (enabled/not enabled) when creating stages
Select * from directory(@product_metadata);