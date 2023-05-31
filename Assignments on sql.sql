#Assignments

#create a database called 'assignment' --created

#Create the tables from ConsolidatedTables.sql and enter the records as specified in it.
-- above task is completed

#Create a table called countries with the following columns
# i have already created table and replaced the table name as big_countries to show u i will agian change table name as countries
select * from big_countries;
rename table big_countries to countries;
select * from countries;
#replace the taiwan as new taiwan
update countries set new_capital='new Taiwan' where countries_name = 'china';
update countries set new_capital=null;
update countries set case when new_capital='Beijing','Delhi','Washington D.C.','Jakarta','Brasilia','Islamabad','Abuja','Dhaka','Moscow','Mexico City','Tokyo','Manila','AddisAbaba','Hanoi','Cairo','Berlin','Tehran','Ankara','Kinshasa','Paris','London','Rome','Pretoria','Naypyidaw','dakka','sydney') where new_capital is null;
#lets rename new capital as only capit
drop table countries;
create table countries (name varchar(20),population int,capital varchar(20));
insert into countries values('China', 			1382	 	,'Beijing'),('India',			1326	 	,'Delhi'),
('United States',		324	 	,'Washington D.C.'),
('Indonesia',		260	 	,'Jakarta'),
('Brazil',			209	 	,'Brasilia'),
('Pakistan',		193	 	,'Islamabad'),
('Nigeria',			187	 	,'Abuja'),
('Bangladesh',		163	 	,'Dhaka'),
('Russia',			143	 	,'Moscow'),
('Mexico',			128	 	,'Mexico City'),
('Japan',			126	 	,'Tokyo'),
('Philippines',		102	 	,'Manila'),
('Ethiopia',		101	 	,'Addis Ababa'),
('Vietnam', 		94	 	,'Hanoi'),
('Egypt',			93	 	,'Cairo'),
('Germany',		81	 	,'Berlin'),
('Iran',			80	 	,'Tehran'),
('Turkey',			79	 	,'Ankara'),
('Congo',			79	 	,'Kinshasa'),
('France',			64	 	,'Paris'),
('United Kingdom',65,'London'),
('Italy',			60	 	,'Rome'),
('South Africa',		55	 	,'Pretoria'),
('Myanmar',		54	 	,'Naypyidaw');

select * from countries;
#replacing the table name as bbig_countries
rename table countries to big_countries;
select * from big_countries;
#) Change ‘Delhi' to ‘New Delhi'
update big_countries set capital='new delhi' where name = 'india';
#now i need to change the column name
alter table big_countries  rename column capital to new_capital;
#replacing the column name as country name
alter table big_countries rename column name to countries;

select * from suppliers;
#i have changed data types of the supplier_ name column as not null and unique
alter table suppliers modify column supplier_name varchar(20) not null unique;

select * from emp;
alter table emp drop column deptno;
#a.	Add a column called deptno
alter table emp add column deptno tinyint;
update emp set deptno = case
 when emp_no % 2=0 then 20
 when emp_no % 3=0 then 30
 when emp_no % 4=0 then 40
 when emp_no % 5=0 then 50 
 else  10 end;  
 update emp set deptno = 10;
 update emp set deptno = 20 where emp_no%2=0;
 update emp set deptno = 30 where emp_no%3=0;
 update emp set deptno = 40 where emp_no%4=0;
 update emp set deptno = 50 where emp_no%5=0;
 select * from emp;
 
 #Create a unique index on the emp_id 
 create unique index new_index_for on emp(emp_no);
 drop index emp_no on emp;
 drop index emp_no_unique on emp;

#	Create a view called emp_sal on the emp table by selecting the following fields
#in the order of highest salary to the lowest salary
select * from emp;
drop view emp_sal;
create view emp_sal
as select emp_no,first_name,last_name,salary from emp order by salary desc;

select * from emp_sal;

#select all employees in department 10 whose salary is greater than 3000. [table: employee]
select * from employee;
select * from employee where deptno=10 having salary>3000;
select * from employee where deptno=10 having salary>=3000;

#The grading of students based on the marks they have obtained is done as follows:

-- 40 to 50 -> Second Class 50 to 60 -> First Class 60 to 80 -> First Class 80 to 100 -> Distinctions
#How many students have graduated with first class
select * from students;
select count(*) from students where marks>50 and marks<80;
select * from students where marks>50 and marks<80;
#How many students have obtained distinction? [table: students]
select count(*) from students where marks>80;
select * from students where marks>80;

#Get a list of city names from station with even ID numbers only. Exclude duplicates from your answer.[table: station]
select * from station;
select distinct city from station where id%2=0;
select distinct city,id from station where id%2=0;
select count(distinct city) from station where id%2=0;
select count(distinct city) from station;

#Find the difference between the total number of city entries in the table and the number of distinct city entries in the table.
# In other words, if N is the number of city entries in station, and N1 is the number of distinct city names in station, 
#write a query to find the value of N-N1 from station.
#[table: station]
select((select count(city) from station) - (select count(distinct city) from station)) as totalnumberofcities;

#. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
#Your result cannot contain duplicates. [Hint: Use RIGHT() / LEFT() methods ]
select * from station;
select distinct city from station where left(city,1) in ('a','e','i','o','u');
select count(distinct city) from station where left(city,1) in ('a','e','i','o','u');

#. Query the list of CITY names from STATION 
#which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates
select distinct city from station where left(city,1) in ('a','e','i','o','u') and right(city,1) in ('a','i','o','e','u');
select count(distinct city) from station where left(city,1) in ('a','e','i','o','u') and right(city,1) in ('a','i','o','e','u');

#Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
select distinct city from station where left(city,1) not in ('a','i','o','u','e');
select count(distinct city) from station where left(city,1) not in ('a','i','o','u','e');

#Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
#Your result cannot contain duplicates. [table: station]
select distinct city from station where left(city,1) not in ('a','i','o','u','e')and right (city,1) not in ('a','i','o','u','e');
select count(distinct city) from station where left(city,1) not in ('a','i','o','u','e')and right (city,1) not in ('a','i','o','u','e');

#6. Write a query that prints a list of employee names having a salary greater than $2000 per month who have been employed for less than 36 months. 
#Sort your result by descending order of salary. [table: emp]
select * from emp;
select emp_no,first_name,salary from emp where timestampdiff(month,hire_date,now())<=36 and salary > 2000 order by salary desc;

#How much money does the company spend every month on salaries for each department? [table: employee]
select deptno,sum(salary) as Total_salary from employee group by deptno;

#8. How many cities in the CITY table have a Population larger than 100000. [table: city]

select * from city;
select name as cities, population from city where population>100000;

#What is the total population of California? [table: city]
select district,sum(population) as total_population from city where district='california';

# What is the average population of the districts in each country? [table: city]
select countrycode,avg(population) as average_population from city group by countrycode order by avg(population) desc ;

#11. Find the ordernumber, status, customernumber, 
#customername and comments for all orders that are ‘Disputed=  [table: orders, customers]
select * from orders;
select * from customers;

create view joining_two_tables as
select o.ordernumber,o.status,c.customernumber,c.customername from orders as o join customers as c on c.customerNumber=o.customerNumber;

#Write a stored procedure that accepts the month and year as inputs and 
#prints the ordernumber, orderdate and status of the orders placed in that month. 

#Write function that takes the customernumber as input and returns the purchase_status based on the following criteria . 
#[table:Payments]
#if the total purchase amount for the customer is < 25000 status = Silver, amount between 25000 and 50000, status = Gold
#if amount > 50000 Platinum

select * from payments;
set global log_bin_trust_function_creators=1;

#Write a query that displays customerNumber, customername and purchase_status from customers table.
select * from customers;
select c.customernumber,c.customername,new_function(p.customernumber) as purchase_status from customers as c join payments as p on c.customernumber=p.customerNumber group by customerNumber;

#Select the first name of the employee who gets the third highest salary. [table: employee]
select * from employee;
select fname from employee order by salary desc limit 2,1;
select fname,salary from employee order by salary desc limit 2,1; 

# Assign a rank to each employee  based on their salary. The person having the highest salary has rank 1. [table: employee]
select *,dense_rank() over(order by salary desc) from employee; 

#Replicate the functionality of 'on delete cascade' and 'on update cascade' using triggers on movies and rentals tables. 
#Note: Both tables - movies and rentals - don't have primary or foreign keys. Use only triggers to implement the above.
select * from movies;
select * from rentals;

delimiter \\
create trigger update_cascad 
after update on movies
for each row
begin
update rentals
set movieid = new.id where movieid = old.id;
end \\
delimiter ;

#deleting the cascating

insert into movies values(12,'kgf','action');
select * from rentals;
select * from movies;
update rentals set movieid = 12 where memid=8;
update movies set id = 11 where id = 12;

delimiter $$

create trigger deleting_cascade
after delete on movies 
for each row

begin
update rentals set movieid=null
where movieid not in (select distinct id from movies);
end $$

delimiter ;
select * from movies;
select * from rentals;
insert into movies values (12,'kantara','suspense');
insert into rentals values (9,'rishab','shetty',12);
delete from movies where id = 12;