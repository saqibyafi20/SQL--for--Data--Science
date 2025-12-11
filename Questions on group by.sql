create table EmployeeDetail(
empID int primary key,
firstName varchar (20),
lastName varchar (20),
salary int,
department varchar(10),
gender varchar(6)
)
insert into EmployeeDetail values(1,'vikas','ahlawat',600000,'IT','M')
insert into EmployeeDetail values(2,'nishan','manwar',530000,'HR','f')
insert into EmployeeDetail values(3,'shana','kullu',1000000,'IT','M')
insert into EmployeeDetail values(4,'rawat','mungu',480000,'HR','M')
insert into EmployeeDetail values(5,'shubh','kamal',500000,'payroll','M')

select * from EmployeeDetail

-- Q: Write the query to get the department and department wise total(sum) salary 
-- from "EmployeeDetail" table. 

select department , sum(salary) as total_salary from EmployeeDetail group by department

-- Q:  Write the query to get the department and department wise total(sum) salary, 
-- display it in ascending order according to salary. 

select department , sum(salary) as total_salary from EmployeeDetail group by department 
order by sum(salary)

-- Q: Write the query to get the department and department wise total(sum) salary, 
-- display it in descending order according to salary. 

select department , sum(salary) as total_salary from EmployeeDetail group by department 
order by sum(salary) desc

-- Q: Write the query to get the department, total no. of departments, total(sum) salary 
-- with respect to department from "EmployeeDetail" table. 

select department , count(department) as total_depts, sum(salary) as total_salary from
EmployeeDetail group by department

-- Q: Get department wise average salary from "EmployeeDetail" table order by salary ascending.

select department , avg(salary) as average_salary from EmployeeDetail group by department 
order by avg(salary) 

-- Q: Get department wise maximum salary from "EmployeeDetail" table order by salary ascending.

select department , max(salary) as maximum_salary from EmployeeDetail group by department 
order by max(salary)

-- Q: Get department wise minimum salary from "EmployeeDetail" table order by salary ascending.

select department , min(salary) as minimum_salary from EmployeeDetail group by department 
order by min(salary)

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

select * from project_detail


-- Q: Write down the query to fetch Project name assign to more than one Employee.

select projectName , count(empID) as number_Of_employee from project_detail group by projectName
having count(empID) >1


 
 