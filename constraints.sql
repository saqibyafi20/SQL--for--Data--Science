--- constraints -->  unique,not null,identity,check,default

create table cons(
id int unique not null identity(101,1),
name varchar(20)not null,
dept varchar(20) default 'IT',
age int check (age >25 and age<45)
)
insert into cons values('fardeen','finance',35)
insert into cons values('momin',default,35)

select * from cons
drop table cons

-- PRIMARY KEY AND FOREIGN KEY :

-- KEYS: 1) Primary key           2) Foreign key

-- Primary key: (unique and not null) it is a representative column to establish foreign relations with
---  another table. There will be only 1 pk in a table.

-- Foreign key: A foreign key is a column (or a set of columns) in a table that refers to the primary key
-- of another table . Creates a relationship between two tables. There can be multiple FKs in a table.
-- FKs can have duplicate and null values also.

-- example of PK : 

create table cons(
id int primary key,
name varchar(20)not null,
dept varchar(20) default 'IT',
age int check (age >25 and age<45)
)
insert into cons values(101,'fardeen','finance',35)
insert into cons values(103,'momin',default,35)

select * from cons

-- example of foreign key:

create table departmentss(
id int primary key,
name varchar(max),
age int,
phone bigint,
email varchar(max)
)

insert into departmentss values(104,'raju bhaii',24,9907645342,'kumarabidmaha@123')
select * from departmentss

create table HRR(
id int primary key,
name varchar(20),
salary int
foreign key (id) references departmentss(id)
)

insert into HRR values(104,'mr.abida',100000)
insert into HRR values(105,'mr.abida',100000)

select * from HRR

-- example 2:
 create table productt(
 productID int primary key,
 productName varchar(50),
 price int
 )
 insert into productt values(101,'loreal',1699),(102,'dove',1299),(103,'tresemme',1099),(104,'sunsilk',650),
 (105,'clinicPlus',449),(106,'himalaya',400),(107,'nivea',1800)

 select * from productt

 create table CartListt(
 productID int primary key,
 prodName varchar(20),
 price int
 foreign key (productID) references productt(productID)
 )
 insert into CartListt values(105,'clinicPlus',449),(106,'himalaya',400),(107,'nivea',1800)

 select * from CartListt

 create table orderss(
 productID int primary key,
 name varchar(15),
 price int,
 foreign key (productID) references CartListt(productID)
 )
 insert into orderss values(106,'himalaya',400),(107,'nivea',1800)
select * from orderss

-- Cascading for FK :
-- ON DELETE CASCADE : when we create a foreign key using this option , it deletes the 
-- reference rows in the child table when the referenced row is deleted in the parent table
-- which has a primary key .

-- ON UPDATE CASCADE : when we create a foreign key using this option , the referencing rows are
-- updated in the child table when the referenced row is updated in the parent table
-- which has a primary key .

create table department(
id int primary key,
name varchar(max),
age int,
phone bigint,
email varchar(max)
)

insert into department values(103,'noty bhaii',26,9907645342,'kumarabidmaha@123')
select * from department

create table IT(
id int primary key,
name varchar(20),
salary int,
age int,
foreign key (id) references department(id)
on delete cascade
on update cascade
)
drop table IT

insert into IT values(102,'mr.abida',100000,24)
insert into IT values(103,'mr.abida',100000,26)

select * from IT

update department set id =110 where id=102
delete department where id=110
