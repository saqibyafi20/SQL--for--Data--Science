-- AGGREGATE FUNCTIONS : performs a calculation on a set of values, and return a single value.
-- count() , max() , min() , sum() , avg ()

-- example

create table de_tails(
emloyee_id int identity(101,1),
employee_name varchar(max) not null,
department_id int,
department_name varchar(max),
salary int,
age int,
residence varchar(max)
)

insert into de_tails values('Mursaleen shah',222,'IT',55000,25,'Bemina')
insert into de_tails values('Saqib',225,'HR',45000,24,'Saderbal')
insert into de_tails values('Aqib',227,'finance',35000,22,'peerbagh')
insert into de_tails values('rameez',222,'IT',54000,27,'kupwara')
insert into de_tails values('abid',227,'finance',37000,25,'shopian')
insert into de_tails values('showkat',225,'HR',47000,28,'sopore')
insert into de_tails values('Sadiya',225,'HR',48000,21,'pampore')
insert into de_tails values('slaiman',227,'finance',35000,22,'uri')
insert into de_tails values('sahban',222,'IT',56000,24,'nowgam')
insert into de_tails values('raheel',227,null,39000,30,'sonwar')

select * from de_tails
select max(salary) from de_tails
select min(age) from de_tails
select sum(salary) from de_tails
select avg(age) from de_tails
select count(employee_name) from de_tails
select count(*) from de_tails where department_name = 'IT'

select count(salary) as 'emp',
sum(salary) as 'total expense',
max(salary) as 'highest',
min(salary) as 'lowest',
avg(salary) as 'avg' from
de_tails

--

select department_name , count (emloyee_id) as 'total employees',max(salary) as 'highest salary',
min(age) as'younger emp',avg(salary) as 'avg salary' from de_tails group by department_name

--

select department_name , count (emloyee_id) as 'total employees',max(salary) as 'highest salary',
min(age) as'younger emp',avg(salary) as 'avg salary' from de_tails group by department_name having
avg(salary) > 45000

--

select department_name,department_id , count (emloyee_id) as 'total employees',
max(salary) as 'highest salary',min(age) as'younger emp',
avg(salary) as 'avg salary' from de_tails group by department_name,department_id 
 
-- write a query to find avg salary in each department in ascending order ?

select department_name , avg(salary) as 'avg salary' from de_tails group by department_name 
order by 'avg salary'
