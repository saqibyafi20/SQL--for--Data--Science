-- Merge : MERGE is a powerful SQL command used when you want to INSERT, UPDATE, or DELETE rows in a target table based on 
-- matching records in a source table.

-- When to Use MERGE?

-- Use MERGE when you need:
-- Upsert operations (update + insert)
-- Synchronize two tables
-- Data warehousing ETL operations
-- Avoid multiple INSERT, UPDATE, DELETE statements

-- Explanation

-- WHEN MATCHED
--➝ If the record exists in both tables → update the target table.

-- WHEN NOT MATCHED BY TARGET
--➝ If row exists in source but not in target → insert it.

-- WHEN NOT MATCHED BY SOURCE
--➝ If row exists in target but not in source → delete it.

create table RetailStore(
productID int,
productName varchar(10),
price int)

insert into RetailStore values(101,'shampoo',350)
insert into RetailStore values(102,'biscuit',35)
insert into RetailStore values(103,'soap',40)
insert into RetailStore values(104,'lays',20)
insert into RetailStore values(105,'chocolates',180)
insert into RetailStore values(106,'milk',85)
insert into RetailStore values(107,'dyper',17)
insert into RetailStore values(108,'cereals',190)
insert into RetailStore values(121,'covers',190)

create table WholesaleStore(
productID int,
productName varchar(10),
qty int,
price int)

insert into WholesaleStore values(101,'shampoo',10,400)
insert into WholesaleStore values(102,'biscuit',30,35)
insert into WholesaleStore values(103,'soap',40,42)
insert into WholesaleStore values(104,'lays',55,20)
insert into WholesaleStore values(105,'chocolates',25,180)
insert into WholesaleStore values(106,'milk',40,19)
insert into WholesaleStore values(107,'dyper',45,17)
insert into WholesaleStore values(108,'juice',37,60)
insert into WholesaleStore values(109,'detergent',23,70)
insert into WholesaleStore values(110,'polish',12,200)
insert into WholesaleStore values(111,'tea',40,175)
insert into WholesaleStore values(112,'notebooks',40,300)
insert into WholesaleStore values(113,'coffee',34,800)




select * from RetailStore
select * from WholesaleStore
update RetailStore set productID = 120 where productName = 'cereals'


 -- Q : insert product in RetailStore if product exists in WholesaleStore but not in RetailStore . 

 merge into RetailStore pro
 using WholesaleStore stock
 on(
 pro.productID = stock.productID)
 when not matched by target 
 then
 insert (productID,productName,price)
 values(stock.productID,stock.productName,stock.price);

 -- Q: update price in RetailStore using WholesaleStore table .

 merge Retailstore R
 using WholesaleStore W
 on (R.productID = W.productID)
 when matched
 then
 update set R.price = W.price ;

 -- Q : if a product exists in target table but not exist in source table, delete the product .

 merge RetailStore R1
 using WholesaleStore W2
 on(R1.productID = W2.productID)
 when not matched by source
 then
 delete;

 select * from RetailStore
 select * from WholesaleStore
  
  -- OR
create procedure updated_store
as
begin
  merge into RetailStore pro
 using WholesaleStore stock
 on(
 pro.productID = stock.productID)
 when not matched by target 
 then
 insert (productID,productName,price)
 values(stock.productID,stock.productName,stock.price)
 when matched
 then
 update set pro.price = stock.price
 when not matched by source
 then
 delete;
 end

 updated_store

 select * from RetailStore
 select * from WholesaleStore


