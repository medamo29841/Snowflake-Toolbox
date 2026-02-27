insert into smoothies.public.orders(ingredients,name_on_order) values ('Apples Cantaloupe Elderberries Guava Jackfruit Lime Honeydew Dragon Fruit Nectarine Quince Papaya Orange Kiwi ','Duane');

Select * from 
smoothies.public.orders
where name_on_order is not null;

Delete from orders where name_on_order = 'Duane';

insert into smoothies.public.orders(ingredients,name_on_order) values ('Apples Cantaloupe Elderberries Guava Jackfruit Lime Honeydew Dragon Fruit Nectarine Quince Papaya Orange Kiwi ','Duane');