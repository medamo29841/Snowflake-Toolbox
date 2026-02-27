alter table ORDERS add column order_filled BOOLEAN DEFAULT FALSE;

Update ORDERS
Set order_filled = 1
WHERE name_on_order is null;

Select * from ORDERS;