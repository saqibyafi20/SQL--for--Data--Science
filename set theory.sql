create table customer_online(
cusrID int,
Name varchar(10),
city varchar (10))

insert into customer_online values (1,'ahmed','srinagar')
insert into customer_online values (2,'riya','delhi')
insert into customer_online values (3,'adil','mumbai')
insert into customer_online values (4,'sameer','srinagar')

create table customers_store (
custID int,
Name varchar (10),
city varchar (10))

insert into customers_store values (3,'adil','mumbai')
insert into customers_store values (4,'sameer','srinagar')
insert into customers_store values (5,'nitin','jammu')
insert into customers_store values (6,'shifa','delhi')

select * from customer_online
select * from customers_store


select city from customers_store
except
select city from customer_online

create table employees_2023(
empID int,
name varchar(10),
deptID int,
city varchar(10),
joinYear int
)
insert into employees_2023 values(101,'adil',10,'sri',2020)
insert into employees_2023 values(102,'riya',20,'delhi',2021)
insert into employees_2023 values(103,'sameer',10,'mumbai',2019)
insert into employees_2023 values(104,'shifa',30,'jammu',2022)
insert into employees_2023 values(105,'hamid',40,'sri',2018)

create table employees_2024(
empID int,
name varchar(10),
deptID int,
city varchar(10),
joinYear int)

insert into employees_2024 values(102,'riya',20,'delhi',2021)
insert into employees_2024 values(103,'sameer',10,'mumbai',2019)
insert into employees_2024 values(105,'hamid',40,'sri',2018)
insert into employees_2024 values(106,'rohit',20,'delhi',2024)
insert into employees_2024 values(107,'imran',50,'bangalore',2024)

create table employees_remote(
empID int,
name varchar(10),
deptID int,
city varchar(10),
remote varchar(10))

insert into employees_remote values(103,'sameer',10,'mumbai','home')
insert into employees_remote values(104,'shifa',30,'jammu','ladakh')
insert into employees_remote values(107,'imran',50,'bangalore','kerela')
insert into employees_remote values(108,'arjun',20,'pune','goa')
insert into employees_remote values(109,'mehak',10,'chandigarh','delhi')

--Q: all unique employees 

select empID,name from employees_2023
union
select  empID,name from employees_2024
union
select  empID,name from employees_remote

--Q: all unique employees including duplicates

select empID,name from employees_2023
union all
select  empID,name from employees_2024
union all
select  empID,name from employees_remote

--Q: employees present in both 2023 and 2024

select * from employees_2023
intersect
select * from employees_2024

-- Q: employee present in all 3 tables 

select empID,name from employees_2023
intersect
select  empID,name from employees_2024
intersect
select  empID,name from employees_remote

-- Q: employees who left the company (2023 not in 2024)

select * from employees_2023
except
select  * from employees_2024

select * from employees_2023
select  * from employees_2024
select  * from employees_remote

-- Q:New joiners in 2024 (not in 2023)

	select * from employees_2024
	except
	select  * from employees_2023

	-- Q : employees who are remote and present in 2024

select empID , name from employees_2024
intersect
select empID , name from employees_remote

--Q: all employee who work in deptID = 20

select empID , name from employees_2023 where deptID = 20
union
select empID , name from employees_2024 where deptID = 20
union
select empID , name from employees_remote where deptID = 20

--Q :remote employees who are not working in 2024 

select empID , name from employees_remote
except
select empID , name from employees_2024

-- Q : find employees whose deptID is same across 2023 & 2024 

select name,empID , deptID from employees_2023 
intersect
select name,empID , deptID from employees_2024 

-- 

create  table Employees_Z (
empID int,
Name varchar (10)
)
insert into Employees_Z values (101,'ALI')
insert into Employees_Z values (102,'MURTAZA')
insert into Employees_Z values (103,'ADIL')
insert into Employees_Z values (104,'FAIZAN')
insert into Employees_Z values (105,'SAMEER')
insert into Employees_Z values (106,'AHMAD')

create table Department_A (
empID int,
dept varchar (10)
)
insert into Department_A values (101,'IT')
insert into Department_A values (102,'IT')
insert into Department_A values (103,'IT')
insert into Department_A values (105,'IT')

create table Department_B (
empID int,
dept varchar (10)
)
insert into Department_B values (102,'HR')
insert into Department_B values (103,'HR')
insert into Department_B values (104,'HR')


create table Department_C (
empID int,
dept varchar (10)
)
insert into Department_C values (101,'SALES')
insert into Department_C values (104,'SALES')
insert into Department_C values (106,'SALES')

select * from Employees_Z
select * from Department_A
select * from Department_B
select * from Department_C

-- Q: employees who works in more than one department ?

-- Using joins

select d1.empID , d1.dept , d2.dept from Department_A d1
join Department_B d2
on d1.empID = d2.empID
union all
select d1.empID , d1.dept , d3.dept from Department_A d1
join Department_C d3
on d1.empID = d3.empID
union all
select d2.empID , d2.dept , d3.dept from Department_B d2
join Department_C d3
on d2.empID = d3.empID

-- OR Using group by and having

select empID  from(
select empID , dept from Department_A
union all
select empID , dept from Department_B
union all
select empID , dept from Department_C)
as all_depts
group by empID
having COUNT (*)>1

-- OR Using set theories 

select empID from Department_A
intersect
select empID from Department_B
union all
select empID from Department_A
intersect
select empID from Department_C
union all
select empID from Department_B
intersect
select empID from Department_C
order by empID 

select * from Department_A
select * from Department_B
select * from Department_C

-- Q2: employees working in exactly one department 

select empID  from (
select empID , dept from Department_A
union all
select empID , dept from Department_B
union all
select empID , dept from Department_C)
as all_Depts
group by empID 
having COUNT (*)=1

-- OR

(select empID from Department_A
except
select empID from Department_B
except
select empID from Department_C)

union all 

(select empID from Department_B
except
select empID from Department_A
except
select empID from Department_C)

union all

(select empID from Department_C
except
select empID from Department_A
except
select empID from Department_B)

-- Q: employees working in all 3 departments .

select empID from(
select empID from Department_A
union all
select empID from Department_B
union all
select empID from Department_C)
as all_depts
group by empID 
having count(*) > 2 

-- OR 

select empID from Department_A
intersect
select empID from Department_B
intersect 
select empID from Department_C

-- Q: employee in exactly two departments 

(select empID from Department_A
intersect 
select empID from Department_B)
union all
(select empID from Department_A
intersect
select empID from Department_C)
union all
(select empID from Department_B
intersect
select empID from Department_C)

except

(select empID from Department_A
intersect
select empID from Department_B
intersect 
select empID from Department_C
)
order by empID

-- Q: employees who work in sales or hr but not in IT

(select empID from Department_B
except
select empID from Department_A)

union 

(select empID from Department_C
except
select empID from Department_A)

-- OR 

(select empID from Department_B
union
select empID from Department_C)

except

select empID from Department_A

-- Q: Total departments each employee works . 

select  dept , count(dept) as total_depts from(
select empID,dept from Department_A
union all
select empID,dept from Department_B
union all
select empID,dept from Department_C 
)
as all_depts
group by dept
order by  count(dept) desc



















