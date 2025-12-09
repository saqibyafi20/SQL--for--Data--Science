--- WHERE CLAUSE : The WHERE clause helps you select only those rows from a table that match the given condition(s).
-- It is mainly used with SELECT, UPDATE, DELETE, and sometimes with INSERT.

create table detailss(
emloyee_id int identity(101,1),
employee_name varchar(max) not null,
department_id int,
department_name varchar(max),
salary int,
age int,
residence varchar(max)
)

insert into detailss values('Mursaleen shah',222,'IT',55000,25,'Bemina')
insert into detailss values('Saqib',225,'HR',45000,24,'Saderbal')
insert into detailss values('Aqib',227,'finance',35000,22,'peerbagh')
insert into detailss values('rameez',222,'IT',54000,27,'kupwara')
insert into detailss values('abid',227,'finance',37000,25,'shopian')
insert into detailss values('showkat',225,'HR',47000,28,'sopore')
insert into detailss values('Sadiya',225,'HR',48000,21,'pampore')
insert into detailss values('slaiman',227,'finance',35000,22,'uri')
insert into detailss values('sahban',222,'IT',56000,24,'nowgam')
insert into detailss values('raheel',227,null,39000,30,'sonwar')

select * from detailss where department_name = 'IT'


-- using operators in Where

-- Arithmetic operators : +,-,*,/,%(modulus)
-- Comparison operators : =,!=,>,>=,<,<=
-- Logical operators : AND,OR,NOT,IN,BETWEEN,ALL,LIKE,ANY
-- Set operators : union,union all,intersect,except(returns result in the first table which are unique with the second table)
-- Bitwise operators : &(bitwise AND),|(bitwise OR)

select * from detailss where residence='bemina'
select * from detailss where salary > 45000
select * from detailss where salary < 45000
select * from detailss where age >=25 
select * from detailss where age <=25
select * from detailss where age >=25 and salary >40000
select * from detailss where department_name in ('HR','finance')
select * from detailss where department_name not in ('HR','finance')
select * from detailss where salary between 30000 and 40000
select * from detailss where employee_name like '%diya'
select * from detailss where employee_name like '%sale%'

-- limit clause or top clause : sets an upper limit on number of (tuples)rows to be returned.

select top 2 * from detailss
select top 2 * from detailss where salary >= 30000
select top 3 * from detailss where emloyee_id between 101 and 105

-- Order By Clause : to sort in ascending and descending order

select * from detailss order by salary   -- ascending

select * from detailss order by salary desc   -- descending

select top 5 * from detailss order by salary desc

-- Distinct : unique  values or items in a row 

select distinct salary from detailss
select distinct department_name from detailss

update detailss  set department_name = 'IT' where department_name is null

select * from detailss

delete detailss where department_name = 'IT' and salary = 54000

-- Group By Clause : Groups rows that have the same values into summary rows. It collects data
-- from multiple records and groups the result by one or more column. Generally we use this
-- clause with aggregate functions.

select * from detailss

select department_name from detailss group by department_name

-- HAVING CLAUSE : similar to where i.e; applies some condition on rows. Used when we want to
-- apply any condition after grouping

-- differnce between having and where clause is Where clause filters individual rows & 
-- Having clause filters groups

select * from detailss

select department_name,avg(salary) from detailss group by department_name having avg(salary) >45000


 








