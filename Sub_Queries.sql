-- SUB QUERY : A sub query or inner query or a nested query allows us to create complex
-- query on the output of another query . these queries are not dependent each other.


create table de_partment(
deptID int ,
deptName varchar(20)
)
insert into de_partment values(1,'IT')
insert into de_partment values(2,'HR')
insert into de_partment values(3,'finance')
insert into de_partment values(4,'marketing')

create table em_ployees(
empID int ,
name varchar(20),
salary int,
deptID int)

insert into em_ployees values (101,'amir',50000,1)
insert into em_ployees values (102,'faiz',35000,2)
insert into em_ployees values (103,'rohit',60000,1)
insert into em_ployees values (104,'imran',30000,3)
insert into em_ployees values (105,'murtaza',70000,1)
insert into em_ployees values (106,'sara',0,null)

select * from de_partment
select * from em_ployees

select name from em_ployees where deptID IN
(select  deptID from de_partment where deptName IN ('finance','IT'))

select deptID from de_partment where deptID=
(select  deptID from em_ployees where name = 'faiz'
)

-- Q: find the employee names & deptID's, whose salary is more than the average total
-- salary?

select name,deptID from em_ployees where salary >
(select avg(salary) from em_ployees)

-- Q: find deptName whose salary is more than 50000?

select deptName from de_partment where deptID in
(select deptID from em_ployees where salary > 50000)

-- -- -- -- -- -- -- --

create table gate (
eID int,
eName varchar(10),
Dept varchar(10),
salary int
)
insert into gate values (1,'Ram','HR',10000)
insert into gate values (2,'Amrit','MRKT',20000)
insert into gate values (3,'Ravi','HR',30000)
insert into gate values (4,'Nitin','MRKT',40000)
insert into gate values (5,'Varun','IT',50000)
select * from gate

-- Q: write a sql query  to display emp name who is taking maximum salary 

select * from gate where salary =              -- outer query
	(select MAX(salary) from gate)             -- inner query

-- in this case first inner query will run once and then the outer each row will run and compare it with inner query
-- as per the operator . And this is called Nested query or Sub_Query

-- Q: write a query to display 2nd highest salary 

 select MAX(salary) from gate where salary < 
	(select MAX(salary) from gate)

-- Q: write a query to display empName who is taking 2nd highest salary 

select * from gate where salary =
 (select MAX(salary) from gate where salary < 
	(select MAX(salary) from gate))
	
-- Q: Write a query to display all the dept name along with no. of employees working in that dept

select dept , COUNT(*) No_Of_Emp from gate group by dept order by COUNT(eName) desc

-- Q: write a query to display all the dept names where no. of employees are less than less

select eName from gate where dept in  
	(select dept from gate group by dept having COUNT(*) < 2)

select * from gate

-- --

create table t1(
eID int,
ename varchar(10),
address varchar(20)
)
insert into t1 values  (1,'ravi','chd')
insert into t1 values  (2,'varun','del')
insert into t1 values  (3,'nitin','pune')
insert into t1 values  (4,'rotin','bang')
insert into t1 values  (5,'ammy','chd')

create table t2(eID int,
Pid int,
Pname varchar(10),
loc varchar(20),
)
insert into t2 values(1,101,'IOT','ban')
insert into t2 values(5,102,'BIGdata','del')
insert into t2 values(3,103,'retail','mumbai')
insert into t2 values(4,104,'andriod','hyd')

select * from t1
select * from t2

-- IN & NOT IN  Key words

-- Q: details of employees whose address is either delhi or chd or pune

select * from t1 where address in( 'del','chd','pune')

select * from gate

-- Q: write a query to display highest salary department wise and name of employee who is taking thar salary

select eName from gate where salary in(
select MAX(salary) highest_salary from gate group by dept)

select * from t1 
select * from t2

-- Q: find the name of employee who are working on a project

select * from t1 where eID in (
select eID from t2)

-- Exists / not Exists

-- correlated query or synchronized query: we use exists / not exists in correlated query. In correlated queries outer query's 
-- first row executes first and compares it with whole inner query and so on.. 

-- Q : find the details of employees who is working on atleast one project .

select * from t1 where exists (
select eID from t2 where t1.eID = t2.eID)

-- -- -- -- 

create table t3 (
eID int,
name varchar(10),
address varchar(10)
)
insert into t3 values (1,'A','del')
insert into t3 values (2,'B','pune')
insert into t3 values (3,'A',' chd')
insert into t3 values (4,'B','del')
insert into t3 values (5,'C','pune')
insert into t3 values (6,'D','mumbai')
insert into t3 values (7,'E','hyd')


create table t4(
dID int,
Dname varchar(10),
eID int
)
insert into t4 values (101,'HR',1)
insert into t4 values (102,'IT',2)
insert into t4 values (103,'MRKT',3)
insert into t4 values (104,'TESTING',4)

select * from t3
select * from t4

-- Q: find all employee detail who work in a dept

select * from t3 where exists (
select * from t4 where t3.eID = t4.eID)

-- -- -- -- sub-query , correlated query and joins 

-- Q: find the details of all the employees who work in any the department .

select * from t3 where eID in (
select eID from t4)
-- -- 
select * from t3 where exists (
select eID from t4 where t3.eID = t4.eID)
-- -- 
select e.eID,e.name , e.address , d.Dname from t3 e
right join t4 d
on e.eID = d.eID
-- OR
select e.eID,e.name , e.address , d.Dname from t3 e
cross join t4 d
where e.eID = d.eID

-- -- -- -- -- -- -- 
create table sal
(ID int,
salary int
)
insert into sal values (1,10000)
insert into sal values (2,20000)
insert into sal values (3,20000)
insert into sal values (4,30000)
insert into sal values (5,40000)
insert into sal values (6,50000)
select * from sal

-- Q: find the nth highest salary using subQuery
-- n=3

select * from sal s1 where 3-1 = (
select count(distinct salary) from sal where s1.salary > salary)
