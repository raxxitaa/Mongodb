# Primary key does not accept null values and duplicate values
# Foreign key does not accept null values but it accepts duplicate values

create database store;
use store;

create table category( 
c_id int primary key, 
c_name varchar(40), 
c_details varchar(25));

insert into category values(101, 'electronics','abcdefgh');
insert into category values(102, 'furnitures','abcdefggsdfgdsbdsh');

select * from category;

drop table products;
create table products(
p_id int primary key,
p_name varchar(25),
p_details varchar(35),
c_id int,
foreign key products(c_id) references category(c_id)
);

delete from category where c_id=101;
drop table category;
INSERT INTO products VALUES
(1, 'TV', 'Smart LED 42 inch', 101),
(2, 'TV', 'Smart LED 42 inch', 101),         
(3, 'Sofa', 'Leather 3-seater recliner', 102);
select * from products;

delete from category where c_id=101;
#This does not work because the values are inserted and there is a foreign key reference same with update also. 

update products set c_id=103 where c_id=101;
update category set c_id=104 where c_id=101;

# We can use cascade to do the delete and update when foreign key are present as below. 
drop table products;
create table products(
p_id int primary key,
p_name varchar(25),
p_details varchar(35),
c_id int,
foreign key products(c_id) references category(c_id) on update cascade
);

# now delete will work
delete from category where c_id=101;
select * from products;
select * from category;


############
create table cust_details(
first_name varchar(40) not null,
middle_name varchar(40) not null,
last_name varchar(40) not null,
c_id int unique,
c_country varchar(35) default 'India');
insert into cust_details(first_name, middle_name, last_name, c_id) values('Shalu',' ','Kumari',101);
select * from cust_details;

alter table cust_details add primary key(c_id);
show create table cust_details;

alter table cust_details drop primary key;

#to drop the unique constrains
alter table cust_details drop index c_id;

SHOW INDEX FROM cust_details;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    c_id INT,
    FOREIGN KEY (c_id)
        REFERENCES cust_details(c_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
drop table orders;

# In between if we update a column to be unique then before updating that many rows may contain duplicates also, 
# the unique is applied only after it is applied.

