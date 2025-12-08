-- CREATING DATABSE:
create database db_name


-- DELETE DATABASE
drop database db_name

create database college
use college

-- CRUD OPERATIONS includes :

-- C — Create
-- R — Read
-- U — Update
-- D — Delete
-- These operations allow you to add, view, modify, and remove data from a database.

-- CREATING A TABLE

create table student(
id int,
name varchar(50),
age int
)

-- INSERT : add values in table

insert into student values(01,'aman',16)
insert into student values(02,'anuj',18)  
insert into student values(03,'raja',22) 
insert into student values(04,'kuldeep',21)
insert into student values(05,'jani',25)  




-- SELECT : retreive the information from table

select * from student

--DROP : deletes the tables

drop table student


 CREATE TABLE student2(
rollno int,
NAME varchar(50),
age INT
)
INSERT INTO student2        --- another method of insert: generally suitable for large tables.
(rollno,name,age)
VALUES
(1,'aman',14),
(2,'anuj',22),
(3,'kanchii',21),
(4,'ahem',22),
(5,'kunaa',23)


SELECT  * FROM student2

-- UPDATE : to update existing rows

update student2 SET NAME ='kunal' WHERE rollno=1
UPDATE student2 SET age=21 WHERE NAME = 'anuj'

UPDATE New_stds SET age = age+2 

-- DELETE :  deletes particular row in a table

DELETE student2 WHERE rollno = 1

-- ALTER: add a column to table , drop a column , and rename a table , change column , modify
-- (data type/constraints)

-- ADDING A COLUMN . 

 ALTER TABLE student2 ADD phone BIGINT

 -- for filling null we use update

 UPDATE student2 SET phone=990653556865 WHERE age=21
 UPDATE student2 SET phone=9906535568765 WHERE name='kanchii'
 UPDATE student2 SET phone=990653556 WHERE age=22
 UPDATE student2 SET phone=70535568765 WHERE age=23


 SELECT * FROM student2

 SELECT NAME,rollno FROM student2    -- we can also select particular column or columns we want
 
 -- DROP COLUMN

 alter table student drop column age

 -- CHANGE TABLE NAME

 EXEC sp_rename 'student2','New_stds' --- change the name of table

 SELECT * FROM New_stds
 
 -- CAN MODIFY SCHEMA OF A TABLE

 ALTER TABLE New_stds ALTER COLUMN age varchar (10)   --- can change the schema of table
 
 -- CHANGE COLUMN NAME

EXEC sp_rename 'New_stds.phone', 'contact', 'COLUMN';
EXEC sp_rename 'New_stds.rollno', 'ID', 'COLUMN';


 select * from New_stds
 
 -- Truncate : deletes the data inside the table

 TRUNCATE TABLE New_stds






