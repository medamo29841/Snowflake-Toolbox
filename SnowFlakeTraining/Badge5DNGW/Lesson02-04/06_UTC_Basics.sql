--returns where this snowflake location is : -0800
select current_timestamp();

--here's our UTC timezone , set for this session
alter session set timezone = 'UTC';
select current_timestamp();

-- a few more examples
alter session set timezone = 'Africa/Nairobi';
select current_timestamp();

alter session set timezone = 'Pacific/Funafuti';
select current_timestamp();

alter session set timezone = 'Asia/Shanghai';
select current_timestamp();

--show the account parameter called timezone
show parameters like 'timezone';