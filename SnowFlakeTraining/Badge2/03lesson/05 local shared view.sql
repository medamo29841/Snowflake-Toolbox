--create view
create or replace view intl_db.public.simple_currency 
( CTY_CODE
  ,CUR_CODE) AS
  select  
  COUNTRY_CHAR_CODE,
  CURRENCY_CHAR_CODE
  FROM INTL_DB.PUBLIC.COUNTRY_CODE_TO_CURRENCY_CODE;

  Select * from simple_currency;
  