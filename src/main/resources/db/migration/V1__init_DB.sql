DROP sequence IF EXISTS bucket_seq;
create sequence bucket_seq start 1 increment 1;

DROP sequence IF EXISTS category_seq;
create sequence category_seq start 1 increment 1;

DROP sequence IF EXISTS order_details_seq;
create sequence order_details_seq start 1 increment 1;

DROP sequence IF EXISTS order_seq;
create sequence order_seq start 1 increment 1;

DROP sequence IF EXISTS product_seq;
create sequence product_seq start 1 increment 1;

DROP sequence IF EXISTS user_seq;
create sequence user_seq start 1 increment 1;

DROP TABLE IF EXISTS buckets;
create table buckets (id int8 not null, user_id int8, primary key (id));

DROP TABLE IF EXISTS buckets_products;
create table buckets_products (bucket_id int8 not null, product_id int8 not null);

DROP TABLE IF EXISTS categories;
create table categories (id int8 not null, title varchar(255), primary key (id));

DROP TABLE IF EXISTS orders;
create table orders (id int8 not null, address varchar(255), created timestamp, status varchar(255), sum numeric(19, 2), updated timestamp, user_id int8, primary key (id));

DROP TABLE IF EXISTS orders_details;
create table orders_details (id int8 not null, amount numeric(19, 2), price numeric(19, 2), order_id int8, product_id int8, primary key (id));

DROP TABLE IF EXISTS orders_details_list;
create table orders_details_list (order_id int8 not null, details_list_id int8 not null);

DROP TABLE IF EXISTS products;
create table products (id int8 not null, price numeric(19, 2), title varchar(255), primary key (id));

DROP TABLE IF EXISTS products_categories;
create table products_categories (product_id int8 not null, category_id int8 not null);

DROP TABLE IF EXISTS users;
create table users (id int8 not null, archive boolean not null, email varchar(255), name varchar(255), password varchar(255), role varchar(255), bucket_id int8, primary key (id));

ALTER TABLE if exists orders_details_list add constraint orders_details_list_uniq_details_list unique (details_list_id);

alter table if exists buckets add constraint buckets_fk_user foreign key (user_id) references users;

alter table if exists buckets_products add constraint buckets_products_fk_product foreign key (product_id) references products;

alter table if exists buckets_products add constraint buckets_products_fk_bucket foreign key (bucket_id) references buckets;

alter table if exists orders add constraint orders_fk_user foreign key (user_id) references users;

alter table if exists orders_details add constraint orders_details_fk_order foreign key (order_id) references orders;

alter table if exists orders_details add constraint orders_details_fk_product foreign key (product_id) references products;

alter table if exists orders_details_list add constraint orders_details_list_fk_details_list foreign key (details_list_id) references orders_details;

alter table if exists orders_details_list add constraint orders_details_list_fk_order foreign key (order_id) references orders;

alter table if exists products_categories add constraint products_categories_category foreign key (category_id) references categories;

alter table if exists products_categories add constraint products_categories_product foreign key (product_id) references products;

alter table if exists users add constraint users_fk_bucket foreign key (bucket_id) references buckets;