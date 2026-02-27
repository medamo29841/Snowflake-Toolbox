Use schema zenas_athleisure_db.products;

--Checking SF Functions on Directory Tables

select REPLACE(relative_path, '_', ' ') as no_underscores_filename  --> cascading select no_underscores_filename
, REPLACE(no_underscores_filename, '.png') as just_words_filename  --> cascading select no_underscores_filename
, INITCAP(just_words_filename) as product_name --> cascading select just_words_filename
from directory(@sweatsuits);

--Nesting the cascading Selects
select
INITCAP(REPLACE(REPLACE(relative_path, '_', ' '),'.png')) as product_name--level 3
from directory(@sweatsuits);  