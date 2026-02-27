create or replace table intl_db.public.INT_STDS_ORG_3166 
(iso_country_name varchar(100), 
 country_name_official varchar(200), 
 sovreignty varchar(40), 
 alpha_code_2digit varchar(2), 
 alpha_code_3digit varchar(3), 
 numeric_country_code integer,
 iso_subdivision varchar(15), 
 internet_domain_code varchar(10)
);

--create format file
create or replace file format util_db.public.PIPE_DBLQUOTE_HEADER_CR 
  type = 'CSV' --use CSV for any flat file
  compression = 'AUTO' 
  field_delimiter = '|' --pipe or vertical bar
  record_delimiter = '\r' --carriage return
  skip_header = 1  --1 header row
  field_optionally_enclosed_by = '\042'  --double quotes
  trim_space = FALSE;

  show stages in account;

  list @util_db.public.aws_s3_bucket;

  --s3://uni-cmcw/ISO_Countries_UTF8_pipe.csv

  copy into INT_STDS_ORG_3166
  from @util_db.public.aws_s3_bucket
  files = ('ISO_Countries_UTF8_pipe.csv')
  file_format = ( format_name='util_db.public.PIPE_DBLQUOTE_HEADER_CR' );

select count(*) as found, '249' as expected 
from INTL_DB.PUBLIC.INT_STDS_ORG_3166; 

select count(*) as objects_found
from intl_db.information_schema.tables
where table_schema = 'PUBLIC'
and table_name = 'INT_STDS_ORG_3166';

select row_count
from INTL_DB.INFORMATION_SCHEMA.TABLES 
where table_schema='PUBLIC'
and table_name= 'INT_STDS_ORG_3166';