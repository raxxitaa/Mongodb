# Delete, Drop, Truncate

CREATE TABLE vit_ap (
    full_name VARCHAR(100),
    reg_no VARCHAR(20),
    school VARCHAR(100),
    graduation_year INT
);
INSERT INTO vit_ap (full_name, reg_no, school, graduation_year) VALUES
('Ananya Reddy', '21BCE1001', 'School of Computer Science and Engineering', 2025),
('Ravi Teja', '21ECE1002', 'School of Electronics Engineering', 2025),
('Sneha Kumari', '21MEC1003', 'School of Mechanical Engineering', 2025),
('Karthik Rao', '21CIV1004', 'School of Civil Engineering', 2025),
('Meena Iyer', '21EEE1005', 'School of Electrical Engineering', 2025),
('Siddharth Jain', '21BCE1006', 'School of Computer Science and Engineering', 2025),
('Pooja Sharma', '21ECE1007', 'School of Electronics Engineering', 2025),
('Arjun Das', '21MEC1008', 'School of Mechanical Engineering', 2025),
('Divya Patel', '21CIV1009', 'School of Civil Engineering', 2025),
('Rahul Verma', '21EEE1010', 'School of Electrical Engineering', 2025);
CREATE TABLE vit_bhopal (
    full_name VARCHAR(100),
    reg_no VARCHAR(20),
    school VARCHAR(100),
    graduation_year INT
);
INSERT INTO vit_bhopal (full_name, reg_no, school, graduation_year) VALUES
('Aarti Mehra', '21BCE1101', 'School of Computer Science and Engineering', 2025),
('Manish Kumar', '21ECE1102', 'School of Electronics Engineering', 2025),
('Neha Gupta', '21MEC1103', 'School of Mechanical Engineering', 2025),
('Vikram Singh', '21CIV1104', 'School of Civil Engineering', 2025),
('Tanvi Nair', '21EEE1105', 'School of Electrical Engineering', 2025),
('Abhinav Joshi', '21BCE1106', 'School of Computer Science and Engineering', 2025),
('Ritika Roy', '21ECE1107', 'School of Electronics Engineering', 2025),
('Karan Thakur', '21MEC1108', 'School of Mechanical Engineering', 2025),
('Priya Yadav', '21CIV1109', 'School of Civil Engineering', 2025),
('Aman Kapoor', '21EEE1110', 'School of Electrical Engineering', 2025);

select * from vit_ap;
select * from vit_bhopal;

/* Drop -- DDL(Data Definition Language) 
-- completely drop the database/table/column 
-- can't retrive the data which is dropped it is permanent 
-- cant't delete the particular row from the table 
-- can't rollback the transaction once done */

create database demo;

show databases;

drop database demo; 
#it completely drops the demp database along with all the tables and content in it.

use vit;
show tables from vit;
drop table ece;
desc cse;
alter table cse drop column s_country;

/*Delete -- not permanent can retrieve again if needed.
-- Delete only deletes the data in the database, the sturcture remains intact.
-- Can able to delete the particular row from the table. */

CREATE TABLE Worker1 (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT,
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker1(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
        (008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

select * from Worker1;

delete from worker1 where department='Account';

drop table worker;

delete from vit_bhopal where full_name='Aarti Mehra';

desc worker1;

/* Truncate -- Removoes all the rows in the table
-- can not go to the previous state i.e can't rollback the transaction */

truncate table worker1;

# Transaction, savepoint, rollback, commit
create database vitvellore;
use vitvellore;
create table cse(id int, name varchar(40));
start transaction;
insert into cse values(101, 'Rakesh');
savepoint a11;
insert into cse values(102, 'Sathvik');
savepoint a12;
delete from cse where id=101;
select * from cse;
rollback to a12;
select * from cse;
delete from cse;
insert into cse values(103, 'Bhaskar');
savepoint a13;
insert into cse values(104, 'Poorna');
savepoint a14;
delete from cse where id=103;
select * from cse;
rollback to a14;
commit;

select full_name, graduation_year from vit_bhopal;
select full_name as Name, graduation_year as Pass_out_year from vit_bhopal;

# Operators 
# Logical , Compare
use vit;
select*from worker1;
# <, >, <=, >=, =
select first_name as Name, Salary from worker1 where department = 'HR';
select first_name as Name, Salary from worker1 where salary < 300000;
select first_name as Name, Salary from worker1 where worker_id > 4;

# and, or
select first_name as Name from worker1 where salary >= 200000 and department = 'HR';
select first_name as Name from worker1 where salary < 200000 and department in ('HR','Admin');
select first_name as Name from worker1 where salary < 200000 and (department = 'HR' or department = 'Admin');
select first_name as Name from worker1 where (salary >= 100000 and salary <= 300000) and (department = 'Account' or department = 'Admin');
select first_name as Name, salary, department from worker1 where salary > 200000 or department = 'Admin';

# in, not in
select * from worker1 where salary in (80000, 500000);
select * from worker1 where worker_id in (1,4,6);
select * from worker1 where salary not in (80000, 500000);

select * from worker1 where worker_id in (0,2,4,6,8) and department in ('HR','Admin') and salary = max(salary) ;