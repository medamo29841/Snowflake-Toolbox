use schema zenas_athleisure_db.products;

create table upsell_mapping
(
sweatsuit_color_or_style varchar(25)
,upsell_product_code varchar(10)
);

insert into upsell_mapping
(
sweatsuit_color_or_style
,upsell_product_code 
)
VALUES
('Charcoal Grey','SWT_GRY')
,('Forest Green','SWT_FGN')
,('Orange','SWT_ORG')
,('Pink', 'SWT_PNK')
,('Red','SWT_RED')
,('Yellow', 'SWT_YLW');