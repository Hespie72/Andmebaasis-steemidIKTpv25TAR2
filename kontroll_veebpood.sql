CREATE DATABASE veebipoodAbdulov;
USE veebipoodAbdulov;
--tabel categories
CREATE TABLE categories(
category_id int PRIMARY KEY IDENTITY(1,1),
category_name varchar(30) UNIQUE);

iNSERT into categories(category_name)
VALUES ('T-särk'),('mantel'),('pusa'),('pintsak'),('kingad');
SELECT * FROM categories;

--tabel brands
ALTER TABLE products ADD CONSTRAINT fk_brand
FOREIGN KEY(brand_id) references brands(brand_id)

CREATE TABLE brands(
brand_id int PRIMARY KEY identity(1,1),
brand_name varchar(30));
INSERT into brands(brand_name)
VALUES ('Nike'),('Adidas'),('Asics'),('New Balance'),('Puma');

--tabel products
CREATE TABLE products(
products_id int PRIMARY KEY identity(1,1),
product_name varchar(50) NOT NULL,
brand_id int,
FOREIGN KEY (brand_id) references brands(brand_id),
category_id int,
FOREIGN KEY (category_id) references categories(category_id),
model_year int,
list_price decimal(7,2));
INSERT into products(product_name,model_year,list_price, brand_id, category_id)
VALUES ('valge t-särk', 2010, 250, 1, 1), ('sinine kingad', 2018, 50, 5, 5), ('must pusa', 2015, 350, 3, 3), ('must pintsak', 2016, 600, 4, 4), ('valge mantel', 2024, 2000, 2, 2);

--tabel stocks -- kaks primary key
CREATE TABLE stocks(
store_id int,
product_id int,
PRIMARY KEY(store_id, product_id),
FOREIGN KEY (product_id) references products(products_id),
quantity int);
--INSERT into stocks(store_id, product_id, quantity)


--tabel customers
CREATE TABLE customers(
customers_id int PRIMARY KEY identity(1,1),
first_name varchar(30) not null,
last_name varchar(45) not null,
phone varchar(13) not null,
email varchar(90) UNIQUE not null,
street varchar(70) not null,
city varchar(40)not null,
statee varchar(40)not null,
zip_code char(5));
INSERT into customers(first_name, last_name, phone, email, street, city, statee, zip_code,)
VALUES ('Daniil', 'Toronenko', '+37254376845', 'dantor@gmail.com', 'Vikerlase', 'Tallinn', 'Harjumaa', '13614'), ('Timofey', 'Levkov', '+37254371235', 'levkovtim42@gmail.com', 'Prisle', 'Tallinn', 'Harjumaa', '13414')


--tabel staffs
ALTER TABLE staffs ADD CONSTRAINT fk_stores
FOREIGN KEY(store_id) references stores(store_id)
CREATE TABLE staffs(
staff_id int PRIMARY KEY identity(1,1),
first_name varchar(30) not null,
last_name varchar(45) not null,
phone varchar(13) not null,
email varchar(90) UNIQUE not null,
active bit,
store_id int,
FOREIGN KEY (store_id) references stores(store_id),
manager_id int);
INSERT into staffs(first_name, last_name, email, phone, active, store_id, manager_id)
VALUES ('Denis', 'Kalas', 'deniskalas26@gmail.com', '+37253435764', 1, 2, 1), ('Sergei', 'Vlassov', 'sergeivlassov6@gmail.com', '+37253464364', 1, 1, 1), ('Natalia', 'Zurenko', 'nataliazur56@gmail.com', '+37256437432', 1, 3, 1);

--tabel stores
CREATE TABLE stores(
store_id int PRIMARY KEY identity(1,1),
store_name varchar(30) not null,
phone varchar(13) not null,
email varchar(90) not null,
street varchar(70) not null,
city varchar(40)not null,
statee varchar(40)not null,
zip_code varchar(10));
INSERT into stores(store_name, phone, email, street, city, statee, zip_code)
VALUES ('riidepood Rots', '+37212345674', 'Rotssupport@rots.ee', 'Kotka', 'Tallinn', 'Harjumaa', '13615'), ('riidepood Rots', '+37212345678', 'Rotssupport@rots.ee', 'Mustakivi', 'Tallinn', 'Harjumaa', '14602'),('riidepood Rots', '+37212345678', 'Rotssupport@rots.ee', 'Estonia', 'Tallinn', 'Harjumaa', '13549')

--tabel orders
create table orders(
order_id int PRIMARY KEY identity(1,1),
customer_id int,
FOREIGN KEY (customer_id) references customers(customers_id),
order_status varchar(30) check(order_status='töötlemisel' or order_status='valmis' or order_status='makstud'),
order_date date,
required_date date,
shipped_date date,
store_id int,
FOREIGN KEY (store_id) references stores(store_id),
staff_id int,
FOREIGN KEY (staff_id) references staffs(staff_id));

ALTER TABLE stocks ADD CONSTRAINT fk_store
FOREIGN KEY(store_id) references stores(store_id);

CREATE TABLE order_items(
order_id int,
item_id int,
PRIMARY KEY(order_id, item_id),
product_id int,
FOREIGN KEY (product_id) references products(products_id),
quantity int,
list_price decimal(7,2)
FOREIGN KEY (order_id) references orders(order_id),
discount int);
drop table stores;


select * from stores;
select * from staffs;
select * from stocks;
select * from customers;
