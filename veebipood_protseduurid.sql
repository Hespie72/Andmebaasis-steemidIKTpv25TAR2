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
select * from categories;
select * from products;
select * from brands;
Update categories SET category_name='kingad'
WHERE category_id=2;
-- procedure mis lisab INSERT andmeid tabelisse brands
CREATE PROCEDURE lisaBrand
@brand_nimi varchar(30)
as
BEGIN
	INSERT into brands(brand_name) VALUES (@brand_nimi);
	Select * from brands;
END;
--procedure kutse
EXEC lisaBrand 'BMW';

--procedure mis kustutab delete tabelist id järgi
CREATE PROCEDURE kustutaBrand
@id int
AS
BEGIN
SELECT * FROM brands;
DELETE FROM brands where brand_id=@id;
SELECT * FROM brands;
END;
--KUTSE
EXEC kustutaBrand 7;
EXEC kustutaBrand @id=7;
--PROCEDURE mis otsib 1 tähte järgi brandnimi
CREATE PROCEDURE otsing1tahte
@taht char(1)
as
begin
SELECT * FROM brands WHERE brand_name LIKE @taht+'%';
end;
--kutse
EXEC otsing1tahte 'A';
--procedure mis uuendab UPDATE brandinimi id järgi
CREATE PROCEDURE uuendaBrand
@id int,
@uus_brandNimi varchar(30)
as
begin
select * from brands;
update brands set brand_name=@uus_brandNimi
WHERE brand_id=@id;
select * from brands;
end;
--kutse
EXEC uuendaBrand 8, 'uusAudi'
