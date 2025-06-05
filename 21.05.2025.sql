use store;

drop table products;
create table products(
p_id int primary key,
p_name varchar(25),
p_details varchar(35)
);

INSERT INTO products VALUES
(1, 'TV', 'Smart LED 42 inch'),
(2, 'TV', 'Smart LED 42 inch'),         
(3, 'Sofa', 'Leather 3-seater recliner');

select * from products;

# Betweeen and not between
select * from products where p_id between 2 and 4;

select * from products where p_id not between 2 and 3;

CREATE TABLE Worker(
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT,
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
        (008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

select * from Worker;

select * from worker where salary between 60000 and 400000;
select * from worker where salary between 60000 and 400000 and department not in ('HR');

# For date field we need to use #before date or as a string in ' ';
# # not working.
select * from worker where joining_date between 2002/01/01 and 2014/05/01;
select * from worker where joining_date between '2002/01/01' and '2014/05/01';

select * from worker1 where salary=(select min(salary) from worker1);

SELECT department, SUM(salary) AS total_salary
FROM worker1
GROUP BY department
HAVING SUM(salary) > 100000;

# Aggregation Functions
# Drawback of using aggregation functions -- we can't use aggregation function in where class
# where class accepts only the condition based and have the output as true, false.
select*from worker;

select min(salary) from worker;
select max(salary) from worker;
select count(worker_id) from worker;
select sum(salary) from worker;
select avg(salary) from worker;

# Union Operator -- combine two separate columns into a single coloum from two different tables
# Each select statemnet show have same number of columns and the columns should have same data type.
CREATE TABLE Worker1(
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

select distinct(department) from worker;

select department from worker 
union 
select department from worker1;

select department from worker 
union all 
select department from worker1;

select * from worker1 where worker_id in (1,2,3)
UNION 
select * from worker where worker_id in (101,102,103);

select * from worker1 where salary<=200000 order by salary;
select * from worker1 where salary<=200000 order by salary desc;

#Case statement
select first_name, salary, 
CASE
	when salary > 300000 then 'rich'
    when salary between 100000 and 300000 then 'middle'
    when salary < 100000 then 'poor'
    else 'Data Not Found'
END
as status_check
from worker;

select * from worker where salary <= 200000; # insertion order
select * from worker where salary <= 200000 order by salary; #increasing order

select * from worker where salary <= 200000 order by salary ASC; #ascending order
select * from worker where salary <= 200000 order by salary desc; #descending order 

/* Like operator
_ underscore means exaclty one char that may be anything
% percentage meand any length string may be present */

select * from worker1 where first_name like '_i%l';
select * from worker1 where first_name like '__i%';
select * from worker1 where first_name like '%a_a';
select * from worker1 where first_name like '_aa%'; 

# VIEW
select * from worker1 where department='Admin' and salary > 600000;
create view admin_team as select * from worker1 where department='Admin' and salary > 100000;
select * from admin_team;

create or replace view admin_team as select * from worker1 where department='Admin' and salary > 600000;
select * from admin_team;

drop view admin_team;


