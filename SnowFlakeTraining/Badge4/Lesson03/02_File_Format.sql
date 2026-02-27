create file format zmd_file_format_1
RECORD_DELIMITER = '^';

select $1
from @product_metadata/product_coordination_suggestions.txt
(file_format => zmd_file_format_1);

create file format zmd_file_format_2
FIELD_DELIMITER = '^';  

select $1,$2,$3
from @product_metadata/product_coordination_suggestions.txt
(file_format => zmd_file_format_2);


create or replace file format zmd_file_format_3
FIELD_DELIMITER = '='
RECORD_DELIMITER = '^'; 

select $1, $2
from @product_metadata/product_coordination_suggestions.txt
(file_format => zmd_file_format_3);

