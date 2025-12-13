-- JOINS : join is used to combine rows from two or more tables , based on related column between
-- them .
-- Types of join :
-- 1: inner join : returns records that have matching values in both tables.
-- 2: outer join: 
--   a: left join: returns all records from left table & matched records from right table
--   b: right join: returns all records from right table & matched records from left table
--   c: full join: returns all records matched + unmatched .

create table employee(
employee_id int unique not null,
employee_name varchar(max),
salary int,
department varchar(max)
)
insert into employee values(101,'mursaleen',55000,'IT')
insert into employee values(102,'sadiya',45000,'finance')
insert into employee values(103,'aqib',35000,'hr')
insert into employee values(104,'raheel',55000,'IT')
insert into employee values(105,'rameez',65000,'chemistry')
insert into employee values(109,'abid',25000,'chemistry')

select * from employee

create table projects(
project_id int not null,
project_name varchar(max),
employee_id int
)

insert into projects values(201,'project A',101)
insert into projects values(202,'project C',103)
insert into projects values(203,'project D',105)
insert into projects values(204,'project A',104)
insert into projects values(205,'project B',103)
insert into projects values(206,'project E',101)
insert into projects values(207,'project C',106)
insert into projects values(208,'project F',105)
insert into projects values(999,'project Z',null)
insert into projects values(998,'project M',null)

select * from employee
select * from projects

-- Inner joins

select * from employee
inner join projects 
ON employee.employee_id=projects.employee_id

select e.employee_id,e.employee_name,p.employee_id
from employee e
join
projects p on e.employee_id=p.employee_id

-- right join

select e.employee_id,e.employee_name,e.department,
p.project_name, p.employee_id
from employee e
right join
projects p
on e.employee_id=p.employee_id

-- left join

select e.employee_id,e.employee_name,e.department,
p.project_name, p.employee_id
from employee e
left join
projects p
on e.employee_id=p.employee_id

--full/outer join

select e.employee_id,e.employee_name,e.department,
p.project_name, p.employee_id
from employee e
full join
projects p
on e.employee_id=p.employee_id


create table EmployeeDetail(
empID int primary key,
firstName varchar (20),
lastName varchar (20),
salary int,
department varchar(10),
gender varchar(6)
)
insert into EmployeeDetail values(1,'vikas','ahlawat',600000,'IT','M')
insert into EmployeeDetail values(2,'nikita','manwar',530000,'HR','f')
insert into EmployeeDetail values(3,'ashish','kullu',1000000,'IT','M')
insert into EmployeeDetail values(4,'nikhil','mungu',480000,'HR','M')
insert into EmployeeDetail values(5,'anish','kamal',500000,'payroll','M')

select * from EmployeeDetail

create table project_detail(
projectID int primary key,
empID int not null,
projectName varchar(max)
)
insert into project_detail values (1,1,'task track')
insert into project_detail values (2,1,'clp')
insert into project_detail values (3,1,'survey')
insert into project_detail values (4,2,'hr')
insert into project_detail values (5,3,'task track')
insert into project_detail values (6,3,'grs')
insert into project_detail values (7,3,'dds')
insert into project_detail values (8,4,'hr')
insert into project_detail values (9,6,'gl')
insert into project_detail values (10,null,'google')
insert into project_detail values (11,8,NULL)
alter table project_detail alter column empID bigint

select * from EmployeeDetail
select * from project_detail

SELECT empID, isnull(projectName,'no project') from project_detail

-- Q: Get employee name, project name order by firstname from "EmployeeDetail" and 
-- "ProjectDetail" for those employee which have assigned project already. 

select e.firstName , p.projectName 
from EmployeeDetail e
join project_detail p
on e.empID = p.empID
order by firstName

-- Q: Get employee name, project name order by firstname from "EmployeeDetail" and 
-- "ProjectDetail" for all employee even they have not assigned project. 

select e.firstName , p.projectName 
from EmployeeDetail e
left join project_detail p
on e.empID = p.empID
order by firstName

-- Q: Get all project name even they have not matching any employeeid, in left table, 
-- order by firstname from "EmployeeDetail" and "ProjectDetail"

select e.firstName , p.projectName 
from EmployeeDetail e
right join project_detail p
on e.empID = p.empID
order by firstName 

-- Q: Write down the query to fetch EmployeeName & Project who has assign more 
-- than one project. 

select e.firstName,count(p.projectName) as number_of_projects  
from EmployeeDetail e
join project_detail p 
on e.empID = p.empID
group by e.firstName
having count(p.projectName) > 1


