//Create File Format for JSON Data 
create or replace file format library_card_catalog.public.json_file_format
type = 'JSON' 
compression = 'AUTO' 
enable_octal = FALSE
allow_duplicate = FALSE 
strip_outer_array = TRUE
strip_null_values = FALSE 
ignore_utf8_errors = FALSE; 

--Test File Format
select $1
from @util_db.public.my_internal_stage/author_with_header.json
(file_format => library_card_catalog.public.json_file_format);

copy into author_ingest_json
from @util_db.public.my_internal_stage
files = ( 'author_with_header.json')
file_format = ( format_name=library_card_catalog.public.json_file_format);   

select raw_author from author_ingest_json;