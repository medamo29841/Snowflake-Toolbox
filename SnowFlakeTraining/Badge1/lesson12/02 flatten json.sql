select raw_nested_book from nested_ingest_json;
select raw_nested_book:year_published from nested_ingest_json;
select raw_nested_book:authors from nested_ingest_json;

-- use these example flatten commands to explore flattening the nested book and author data
select value:first_name
from nested_ingest_json
,lateral flatten(input => raw_nested_book:authors);

select value:first_name
from nested_ingest_json
,table(flatten(raw_nested_book:authors));

-- add a CAST command to the fields returned
SELECT value:first_name::varchar, value:last_name::varchar
from nested_ingest_json
,lateral flatten(input => raw_nested_book:authors);

-- assign new column  names to the columns using "AS"
select value:first_name::varchar as first_nm
, value:last_name::varchar as last_nm
from nested_ingest_json
,lateral flatten(input => raw_nested_book:authors);