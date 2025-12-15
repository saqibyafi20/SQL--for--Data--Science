-- SUB QUERY : A sub query or inner query or a nested query allows us to create complex
-- query on the output of another query .

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