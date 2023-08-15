create database ecommerce; 
use ecommerce; 
/* Command to create category table */
create table category(
cat_id int auto_increment not null,
cat_name varchar(20) not null,
primary key (cat_id)
);

/* command to create Product table */
create table product(
pro_id int auto_increment, 
pro_name varchar(20) not null default "dummy", 
pro_desc varchar(60) default null,
cat_id int, 
primary key(pro_id), 
foreign key(cat_id) references category(cat_id)
);

/* Command to creare Supplier table */
create table supplier(
supp_id int not null,
supp_name varchar(50) not null,
supp_city varchar(50) not null, 
supp_phone varchar(50) not null, 
primary key(supp_id)
);
/* Command to create supplier pricing table */
create table supplier_pricing (
pricing_id int auto_increment, 
pro_id int not null, 
supp_id int not null, 
supp_price int default 0,
primary key(pricing_id),
foreign key(pro_id) references product(pro_id),
foreign key(supp_id) references supplier(supp_id)
);

/* Create customer table */
create table customer (
cus_id int auto_increment, 
cus_name varchar(20) not null,
cus_phone varchar(10) not null, 
cus_city varchar(30) not null, 
cus_gender char(1) not null, 
primary key (cus_id)
);

/*Create Orders table */
create table orders(
ord_id int auto_increment, 
ord_date date, 
cus_id int,
pricing_id int, 
primary key(ord_id), 
foreign key(cus_id) references customer(cus_id),
foreign key(pricing_id) references supplier_pricing(pricing_id)
); 

/* create Rating table */
create table rating(
rat_id int auto_increment,
ord_id int,
rat_ratstars int not null default 5,
primary key(rat_id),
foreign key(ord_id) references orders(ord_id)
);

/* Insert into category table */ 
insert into category (cat_id, cat_name) values 
row(1, "books"), 
row(2, "games"),
row(3, "groceries"),
row(4, "electronics"),
row(5, "clothes");	

/* Insert into Products */ 
insert into product(pro_id, pro_name, pro_desc, cat_id) values 
row(1, 'gta v', 'Windows 7 and above with i5 processor and 8gb ram',2), 
row(2, 'tshirt', 'size-l with black, blue and white variations', 5),
row(3, 'rog laptop', 'windows 10 with 15 inch screen, I7 processor, 1TB SSD',4),
row(4, 'OATS', 'Highly Nutritious from Nestle', 3),
row(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
row(6, 'MILK', '1L Toned MIlk', 3),
row(7, 'Boat EarPhones', '1.5Meter long Dolby Atmos', 4),
row(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and col', 5),
row(9, 'Project IGI', 'compatible with windows 7 and above', 2),
row(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
row(11, 'Rich Dad Poor D', 'Written by RObert Kiyosaki', 1),
row(12, 'Train Your Brai', 'By Shireen Stephen', 1); 

/* Insert into supplier */
INSERT INTO `supplier` (`supp_id`, `supp_name`, `supp_city`, `supp_phone`) VALUES
(1, 'Rajesh Retails', 'Delhi', '1234567890'),
(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
(3, 'Knome products', 'Banglore', '9785462315'),
(4, 'Bansal Retails', 'Kochi', '8975463285'),
(5, 'Mittal Ltd.', 'Lucknow', '7898456532');

/* Insert into supplier pricing */ 
INSERT INTO `supplier_pricing` (`pricing_id`, `pro_id`, `supp_id`, `supp_price`) VALUES
(1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1, 3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000),
(6, 12, 2, 780),
(7, 12, 4, 789),
(8, 3, 1, 31000),
(9, 1, 5, 1450),
(10, 4, 2, 999),
(11, 7, 3, 549),
(12, 7, 4, 529),
(13, 6, 2, 105),
(14, 6, 1, 99),
(15, 2, 5, 2999),
(16, 5, 2, 2999);

-- Insert into customer 
INSERT INTO `customer` (`cus_id`, `cus_name`, `cus_phone`, `cus_city`, `cus_gender`) VALUES
(1, 'AAKASH', '9999999999', 'DELHI', 'M'),
(2, 'AMAN', '9785463215', 'NOIDA', 'M'),
(3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
(4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M'),
(6, 'VIRAT', '9890989065', 'DELHI', 'M');

-- insert into orders 
INSERT INTO `orders` (`ord_id`, `ord_date`, `cus_id`, `pricing_id`) VALUES
(101, '2021-10-06', 2, 1),
(102, '2021-10-12', 3, 5),
(103, '2021-09-16', 5, 2),
(104, '2021-10-05', 1, 1),
(105, '2021-08-16', 4, 3),
(106, '2021-08-18', 1, 9),
(107, '2021-09-01', 3, 7),
(108, '2021-09-07', 5, 6),
(109, '2021-09-10', 5, 3),
(110, '2021-09-10', 2, 4),
(111, '2021-09-15', 4, 5),
(112, '2021-09-16', 4, 7),
(113, '2021-09-16', 1, 8),
(114, '2021-09-16', 3, 5),
(115, '2021-09-16', 5, 3),
(116, '2021-09-17', 2, 14),
(117, '2023-05-02', 4, 3);

-- insert into ratings 
insert into rating(rat_id, ord_id, rat_ratstars) values (1, 101, 4), (2, 102, 3), (3, 103, 1), (4, 104, 2);

-- Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000
SELECT count(cus_id) as total_customers, cus_gender from customer 
join orders using (cus_id) 
join supplier_pricing using (pricing_id)
where supplier_pricing.supp_price >= 3000
group by cus_gender ; 

-- Display all the orders along with product name ordered by a customer having Customer_Id=2 
select orders.ord_id,  product.pro_name from orders
join supplier_pricing using (pricing_id) 
join product using (pro_id) 
where orders.cus_id = 2;

-- Display the Supplier details who can supply more than one product
select supp_name, count(pro_id) from supplier 
join supplier_pricing using (supp_id)
group by supp_name 
having count(pro_id) > 1; 

-- Find the least expensive product from each category and print the table with category id, name, product name and price of the product
select product.cat_id, category.cat_name, min(supplier_pricing.supp_price) as price
  from product 
  join category using (cat_id)
  join supplier_pricing using (pro_id)
  group by category.cat_id; 
 

  
--  Display the Id and Name of the Product ordered after “2021-10-05”.

select orders.pricing_id, supplier_pricing.pro_id, product.pro_name, orders.ord_date from orders join supplier_pricing using (pricing_id) join product using (pro_id)
where orders.ord_date > "2021-10-05"; 

-- Display customer name and gender whose names start or end with character 'A'.

select cus_name,  cus_gender from customer where cus_name like 'A%' or cus_name like '%A'; 

-- call to stored proc to display supplier id, name, Rating(Average rating of all the products sold by every customer) and Type_of_Service.
CALL `ecommerce`.`ecom_proc`();





