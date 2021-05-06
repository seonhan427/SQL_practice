-- 2021.05.06 

create database SchoolDB
use SchoolDB


CREATE TABLE CUSTOMER
(
CustomerId int IDENTITY(1,1) PRIMARY KEY,
CustomerNumber int NOT NULL UNIQUE,
LastName varchar(50) NOT NULL,
FirstName varchar(50) NOT NULL,
AreaCode int NULL,
Address varchar(50) NULL,
Phone varchar(50) NULL,
)
GO

select *
from CUSTOMER

insert into CUSTOMER(CustomerNumber,LastName,FirstName,AreaCode,Address,Phone)
values ( 1, 'kim','seonhan',031,'Anyang','010-4613-4487')

CREATE TABLE SCHOOL
(
SchoolId int IDENTITY(1,1) PRIMARY KEY,
SchoolName varchar(50) NOT NULL UNIQUE,
Description varchar(1000) NULL,
Address varchar(50) NULL,
Phone varchar(50) NULL,
PostCode varchar(50) NULL,
PostAddress varchar(50) NULL,
)
GO

insert into SCHOOL(SchoolName, Description, Address,Phone,PostCode,PostAddress)
values('Unicentre', 'IT','Seoul Gangnam','02-1234-5678','12345','Seoul Gangnam') 

insert into SCHOOL(SchoolName, Description, Address,Phone,PostCode,PostAddress)
values('morak', 'high','Uiwang','031-2345-6789','34567','Uiwang') 



select * from SCHOOL

CREATE TABLE CLASS
(
ClassId int IDENTITY(1,1) PRIMARY KEY,
SchoolId int NOT NULL FOREIGN KEY REFERENCES SCHOOL (SchoolId),
ClassName varchar(50) NOT NULL UNIQUE,
Description varchar(1000) NULL,
)
GO

insert into class(SchoolId,ClassName,Description)
values(1, 'DBMS', 'database') 

insert into class(SchoolId,ClassName,Description)
values(2, 'Krean', 'class') 


select * from CLASS

drop table CUSTOMER

CREATE TABLE [CUSTOMER]
(
CustomerId int IDENTITY(1,1) PRIMARY KEY,
CustomerNumber int NOT NULL UNIQUE CHECK(CustomerNumber>0),
LastName varchar(50) NOT NULL,
FirstName varchar(50) NOT NULL,
Country varchar(20) DEFAULT 'Norway',
AreaCode int NULL,
Address varchar(50) NULL,
Phone varchar(50) NULL,
)
GO

insert into CUSTOMER(CustomerNumber,LastName,FirstName,Country,AreaCode,Address,Phone)
values ( 1, 'kim','seonhan','Korea',031,'Anyang','010-4613-4487')


select * from CUSTOMER

truncate table customer --저장되어있던 값모두 삭제 (사실상 리셋)
delete CUSTOMER --기존 identity 의 마지막값은 남음

---------------------------------------------------------------------------------


drop table CUSTOMER

CREATE TABLE [CUSTOMER]
(
CustomerId int IDENTITY(1,10) PRIMARY KEY,
CustomerNumber int NOT NULL UNIQUE CHECK(CustomerNumber>0),
LastName varchar(50) NOT NULL,
FirstName varchar(50) NOT NULL,
Country varchar(20) DEFAULT 'Norway',
AreaCode int NULL,
Address varchar(50) NULL,
Phone varchar(50) NULL,
)
GO

insert into CUSTOMER(CustomerNumber,LastName,FirstName,Country,AreaCode,Address,Phone)
values ( 1, 'kim','seonhan','Korea',031,'Anyang','010-4613-4487')

insert into CUSTOMER(CustomerNumber,LastName,FirstName,AreaCode,Address,Phone)
values ( 2, 'hwang','bang',031,'hwasung','010-5555-6666')

select * from CUSTOMER


-- 기존 customer 테이블에 고객 등급 컬럼을 넣고싶다!

alter table customer
add customer_Level varchar(10)

select * from CUSTOMER

-- 테이블의 컬럼을 삭제하고 싶을때
alter table customer
drop column customer_Level


-- update
update CUSTOMER
set LastName = 'han'
where CustomerId = 1

-- where customerid IN (160,100,170) 여러개의 컬럼을 지정하고 싶을때

-- delete from CUSTOMER_

delete from CUSTOMER
where CustomerId = 2

delete from CUSTOMER

select * from CUSTOMER where Phone = '010-4613-4487'

select * from CUSTOMER
where LastName like 'h%'

select * from CUSTOMER
where CustomerId in (4,5)

select * from CUSTOMER
where LastName = 'Kim' and FirstName = 'Seonhan'

select top 1 * from CUSTOMER

select top 10 percent * from CUSTOMER

select school.SchoolName, class.ClassName
from SCHOOL
join class on school.SchoolId = CLASS.SchoolId

/*
여러줄을 주석처리할때 사용
*/

declare @myvariable int
set @myvariable=4
print @myvariable

declare @myvariable int
set @myvariable=4
select @myvariable as 정답


declare @customerNumber int

select @customerNumber=customernumber from CUSTOMER
where CustomerId=2

if @customerNumber > 1000
	begin
		print 'The Customer Number id larger than 1000'
		update CUSTOMER set AreaCode=46 where CustomerId=2
	end
else
	print 'The Customer Number is not larger than 1000'