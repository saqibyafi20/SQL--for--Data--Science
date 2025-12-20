-- Viwes : A View in SQL is a virtual table created from a SQL query.
-- It does not store data physically; instead, it displays data stored in underlying tables.

-- Q : why we need views:

--To simplify complex queries.
--To enhance security (restrict column/table access).
--To present customized data to different users.
--To reuse frequently needed queries.

-- Views can be :
-- Read only views : A read-only view is a SQL view through which you cannot INSERT, UPDATE, or DELETE data.
-- Updatable views : An updatable view is a view that allows you to perform INSERT, UPDATE, or DELETE data.

-- Materialized view : A Materialized View (MV) is a view that stores the result set physically like a table.
-- Unlike normal views (which are virtual), materialized views save data on disk and need to be refreshed to
-- stay updated.


create table account_details(
acntID int,
acntNO int,
acntName varchar(20),
acntType varchar(20),
debit int,
credit int,
totaBal int
)

insert into account_details values(101,17735,'yafu','saving',2500,3500,10000)
insert into account_details values(102,17745,'aqib','current',1500,2500,15000)
insert into account_details values(103,17755,'moin','salary',500,6500,9000)
insert into account_details values(104,17757,'abid','saving',2500,3500,50000)
insert into account_details values(105,17765,'sadiya','loan',8500,8500,100000)
insert into account_details values(106,17760,'moiz','saving',2500,3500,95000)
insert into account_details values(107,17740,'zaib','current',9000,7500,20000)
insert into account_details values(108,17750,'momin','fixed',8500,6500,95000)
insert into account_details values(109,17780,'abida','saving',4500,3100,50000)
insert into account_details values(110,17785,'nadiya','loan',8200,8300,700000)

select * from account_details
drop table account_details
EXEC sp_rename 'account_details.totaBal', 'totalBal', 'column'

alter table account_details add acntPass int
update account_details set acntPass = 123 where acntName='yafu'
update account_details set acntPass = 456 where acntName='aqib'
update account_details set acntPass = 789 where acntName='moin'
update account_details set acntPass = 321 where acntName='abid'
update account_details set acntPass = 654 where acntName='sadiya'
update account_details set acntPass = 987 where acntName='moiz'
update account_details set acntPass = 741 where acntName='zaib'
update account_details set acntPass = 942 where acntName='momin'
update account_details set acntPass = 273 where acntName='abida'
update account_details set acntPass = 974 where acntName='nadiya'

---view

select * from accounts
alter table account_details drop column acntName
update accounts set totaBal=9999 where acntNO=17735


create view accounts
as
select acntNO,totaBal from account_details

alter view accounts
as
select acntNO,totaBal from account_details

drop view accounts

select * from accounts

insert into accounts values(1999,'abid')





select * from EmployeesB
select * from DepartmentA

alter table EmployeesB drop column name

create view emp2 with schemabinding as
select e.name,d.dept_id,d.dept_name from dbo.EmployeesB e
join 
dbo.DepartmentA d on e.dept_id=d.dept_id

select * from emp2
insert into emp values('azhar',11,'IT')


update emp2 set dept_name='IT' where name='Aamir'


--- create view  alter delete, schema binding
--- views on one table , multiple table using joins 
--- crud in views

alter table account_details add adhaar_id int
update account_details set adhaar_id = 201 where acntID=101
update account_details set adhaar_id = 202 where acntID=102
update account_details set adhaar_id = 203 where acntID=103
update account_details set adhaar_id = 204 where acntID=104
update account_details set adhaar_id = 205 where acntID=105
update account_details set adhaar_id = 206 where acntID=106
update account_details set adhaar_id = 207 where acntID=107
update account_details set adhaar_id = 208 where acntID=108
update account_details set adhaar_id = 209 where acntID=109
update account_details set adhaar_id = 210 where acntID=110











create table adhaar_detail(
adhaar_id int,
adhaarName varchar(20),
adhaarNo bigint
)
insert into adhaar_detail values(201,'yafu',7006652951)
insert into adhaar_detail values(202,'aqib',9906252951)
insert into adhaar_detail values(203,'abid',7051244599)
insert into adhaar_detail values(204,'abida',456789432)
insert into adhaar_detail values(205,'mursaleen',8765423890)
insert into adhaar_detail values(206,'rameez',0282544758)
insert into adhaar_detail values(207,'raheel',7006746951)
insert into adhaar_detail values(208,'sana',7006654801)
insert into adhaar_detail values(209,'cookies',7074992951)
insert into adhaar_detail values(210,'suri',998762951)

select * from account_details
select * from adhaar_detail

alter view cashier with schemabinding
as
select acntNO,acntName from dbo.account_details

select * from cashier

drop view cashier

insert into cashier values(19990,'Ahmad',99)
update cashier set acntName ='sakib'where acntNo=17735
delete cashier where acntNO=17735


alter view Admins with schemabinding as
select a.acntName,a.acntNO,b.adhaarNo from dbo.account_details a
join dbo.adhaar_detail b
on a.adhaar_id=b.adhaar_id


select * from Admins

alter table account_details drop column acntName

alter procedure richest
as
begin
select top 1 * from account_details order by totaBal desc
select top 2 * from account_details order by totaBal 
end


richest

create table customers(
cust_id int,
cust_name varchar(10),
city varchar(10)
)
insert into customers values(1,'arman','delhi')
insert into customers values(2,'riya','mumbai')
insert into customers values(3,'kabir','delhi')
insert into customers values(4,'mehak','pune')

create table orders(
order_id int,
cust_id int,
amount int
)
insert into orders values(101,1,1200)
insert into orders values(102,2,3500)
insert into orders values(103,1,900)
insert into orders values(104,3,2000)
insert into orders values(105,4,4500)

insert into customers values(5,'mursaleen','J&k')

select * from customers
select * from orders

-- Q: display customer name and other amount for all orders.

create view view1
as
select c.cust_name , o.amount from customers c
join orders o
on c.cust_id=o.cust_id

select * from view1

-- Q: find the total amount spent by each customer.

create view view2
as
select cust_id , sum(amount) as total_amt from orders group by cust_id
select * from view2

select * from customers
select * from orders

--Q: list customers who have never placed any order.

select c.cust_id,c.cust_name,c.city from customers c
left join orders o
on
c.cust_id=o.cust_id
where o.order_id is null


-- Q: list customers from delhi who have ordered more than 1000.

create view view3
as
select c.cust_name,sum(amount) as total_amt from customers c 
join orders o
on c.cust_id=o.cust_id 
where city= 'delhi'
group by c.cust_name
having sum(amount)>1000

select * from view3

-- Q: show the highest order amount made by each city.

create view view4
as
select c.city,max(amount) as maximum_amt from customers c 
join orders o
on c.cust_id=o.cust_id 
group by c.city

select * from view4


-- Q: list the customer who had placed more than one product . 

create view view5
as
select c.cust_name,count(o.cust_id) as total_orders from customers c
join orders o
on c.cust_id=o.cust_id
group by c.cust_name,o.cust_id
having count(o.cust_id) >1

select * from view5

-- store procedure : hides the implementation .

create procedure addStudent 
@id int,@name varchar,

select * from de_tails


create procedure totalSalary
as
begin
select department_name,sum (salary) from de_tails group by department_name
end


alter procedure avgAge
as
begin
select department_name,max (age) from de_tails group by department_name
end



totalSalary

avgAge


alter procedure dept
@d_name varchar(20)
as
begin
select employee_name,residence,department_name from de_tails where department_name=@d_name
end

dept 'IT'


select * from EmployeesB
select * from DepartmentA


create procedure empdept
as
begin
select e.name,d.dept_name from EmployeesB e 
join DepartmentA d on
e.dept_id=d.dept_id
end

create procedure salary
@salary int
as
begin
select d.dept_name,sum(e.salary) from DepartmentA d
join EmployeesB e on d.dept_id=e.dept_id  group by dept_name having sum (e.salary)> @salary
end

salary  10000


empdept