copy into author_ingest_json
from @util_db.public.my_internal_stage
files = ( 'author_with_header.json')
file_format = ( format_name=library_card_catalog.public.json_file_format);   

select raw_author from author_ingest_json;