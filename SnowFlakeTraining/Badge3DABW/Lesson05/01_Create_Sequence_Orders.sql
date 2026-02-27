create sequence order_seq
     start = 1
     increment = 2
     ORDER
     comment = 'Provides a unique id for each smoothie order';

--Cannot add sequence to existing table with data
truncate table orders;

alter table orders
add column order_uid integer
default order_seq.nextval
constraint order_uid unique enforced;