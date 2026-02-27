create or replace external table T_CHERRY_CREEK_TRAIL(
    my_filename varchar(100) as (metadata$filename::varchar(100))
)
location = @external_aws_dlkw
auto_refresh = true
file_format = (type=parquet);

Select * from t_cherry_creek_trail;