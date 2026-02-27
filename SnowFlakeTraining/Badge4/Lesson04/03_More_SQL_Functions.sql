Use schema zenas_athleisure_db.products;

--create an internal table for some sweatsuit info
create or replace table zenas_athleisure_db.products.sweatsuits (
	color_or_style varchar(25),
	file_name varchar(50),
	price number(5,2)
);

--fill the new table with some data
insert into  zenas_athleisure_db.products.sweatsuits 
          (color_or_style, file_name, price)
values
 ('Burgundy', 'burgundy_sweatsuit.png',65)
,('Charcoal Grey', 'charcoal_grey_sweatsuit.png',65)
,('Forest Green', 'forest_green_sweatsuit.png',64)
,('Navy Blue', 'navy_blue_sweatsuit.png',65)
,('Orange', 'orange_sweatsuit.png',65)
,('Pink', 'pink_sweatsuit.png',63)
,('Purple', 'purple_sweatsuit.png',64)
,('Red', 'red_sweatsuit.png',68)
,('Royal Blue',	'royal_blue_sweatsuit.png',65)
,('Yellow', 'yellow_sweatsuit.png',67);

--
Select * from sweatsuits;


--Nesting the cascading Selects with FUnctions
select
INITCAP(REPLACE(REPLACE(relative_path, '_', ' '),'.png')) as product_name--level 3
from directory(@sweatsuits);  

--Lets join these two
    select
    INITCAP(REPLACE(REPLACE(d.relative_path, '_', ' '),'.png')) as product_name
    , *
    from directory(@sweatsuits) d
    join sweatsuits s
    on INITCAP(REPLACE(REPLACE(s.file_name, '_', ' '),'.png')) = INITCAP(REPLACE(REPLACE(d.relative_path, '_', ' '),'.png'));

--Narrowing our columns
    select
     INITCAP(REPLACE(REPLACE(d.relative_path, '_', ' '),'.png')) as product_name
    ,s.file_name
    ,s.color_or_style
    ,s.price
    ,d.file_url
    from directory(@sweatsuits) d
    join sweatsuits s
    on INITCAP(REPLACE(REPLACE(s.file_name, '_', ' '),'.png')) = INITCAP(REPLACE(REPLACE(d.relative_path, '_', ' '),'.png'));

--Create a view 
create or replace view product_list as
(    select
     INITCAP(REPLACE(REPLACE(d.relative_path, '_', ' '),'.png')) as product_name
    ,s.file_name
    ,s.color_or_style
    ,s.price
    ,d.file_url
    from directory(@sweatsuits) d
    join sweatsuits s
    on INITCAP(REPLACE(REPLACE(s.file_name, '_', ' '),'.png')) = INITCAP(REPLACE(REPLACE(d.relative_path, '_', ' '),'.png'))
    );

--using a cartesian join to create all sizes for each product
Select 
*
from product_list p
cross join sweatsuit_sizes;

--create a view catalog
create or replace view catalog as
(Select 
*
from product_list p
cross join sweatsuit_sizes);

select count(*) as rwCnt from catalog;



