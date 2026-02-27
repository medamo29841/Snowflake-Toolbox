use role sysadmin;

create or replace table orders (
       order_uid integer default order_seq.nextval,
       order_filled boolean default false,
       name_on_order varchar(100),
       ingredients varchar(200),
       constraint order_uid unique (order_uid),
       order_ts timestamp_ltz default current_timestamp()
);

select * from orders;