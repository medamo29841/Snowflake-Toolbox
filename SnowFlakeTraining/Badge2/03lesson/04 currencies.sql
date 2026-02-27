create table intl_db.public.CURRENCIES 
(
  currency_ID integer, 
  currency_char_code varchar(3), 
  currency_symbol varchar(4), 
  currency_digital_code varchar(3), 
  currency_digital_name varchar(30)
)
comment = 'Information about currencies including character codes, symbols, digital codes, etc.';

create table intl_db.public.COUNTRY_CODE_TO_CURRENCY_CODE 
  (
    country_char_code varchar(3), 
    country_numeric_code integer, 
    country_name varchar(100), 
    currency_name varchar(100), 
    currency_char_code varchar(3), 
    currency_numeric_code integer
  ) 
comment = 'Mapping table currencies to countries';

create file format util_db.public.CSV_COMMA_LF_HEADER
  type = 'CSV' 
  field_delimiter = ',' 
  record_delimiter = '\n' -- the n represents a Line Feed character
  skip_header = 1 
;

  copy into CURRENCIES
  from @util_db.public.aws_s3_bucket
  files = ('currencies.csv')
  file_format = ( format_name='util_db.public.CSV_COMMA_LF_HEADER' );

  copy into COUNTRY_CODE_TO_CURRENCY_CODE
  from @util_db.public.aws_s3_bucket
  files = ('country_code_to_currency_code.csv')
  file_format = ( format_name='util_db.public.CSV_COMMA_LF_HEADER' );