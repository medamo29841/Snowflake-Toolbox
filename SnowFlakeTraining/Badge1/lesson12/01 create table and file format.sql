-- create an Ingestion Table for the NESTED JSON Data
create or replace table library_card_catalog.public.nested_ingest_json 
(
  raw_nested_book VARIANT
);

--Test File Format
select $1
from @util_db.public.my_internal_stage/json_book_author_nested.txt
(file_format => library_card_catalog.public.json_file_format);

copy into nested_ingest_json
from @util_db.public.my_internal_stage
files = ( 'json_book_author_nested.txt')
file_format = ( format_name=library_card_catalog.public.json_file_format);   


