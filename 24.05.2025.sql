show databases;
drop database vit;
create database vit;
use vit;
create table student(
id int,
name varchar(25),
marks int);

insert into student values (101, 'Jayanth', 99), (102, 'Tamilarasam', 100);
select * from student;
