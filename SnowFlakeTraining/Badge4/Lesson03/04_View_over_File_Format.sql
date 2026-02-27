Use schema zenas_athleisure_db.products;

--create view for @product_metadata/sweatsuit_sizes.txt
    create view sweatsuit_sizes as (    
    select REPLACE($1,chr(13)||chr(10)) as sizes_available  --Use replace to handle stray CRLF
    from @product_metadata/sweatsuit_sizes.txt
    (file_format => zmd_file_format_1)
    where sizes_available <> '');
    
    Select * from sweatsuit_sizes;

--create view for  @product_metadata/swt_product_line.txt
    create or replace view sweatband_product_line as (
    select REPLACE($1,chr(13)||chr(10)) as product_code, $2 as headband_description, $3 as wristband_description
    from @product_metadata/swt_product_line.txt
    (file_format => zmd_file_format_2));
    
    Select * from sweatband_product_line;

--create view for  @product_metadata/product_coordination_suggestions.txt
    create or replace view sweatband_coordination as (
    select REPLACE($1,chr(13)||chr(10)) as product_code, $2 as has_matching_sweatsuit
    from @product_metadata/product_coordination_suggestions.txt
    (file_format => zmd_file_format_3));
    
    Select * from sweatband_coordination;    