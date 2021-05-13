create database AdvWorks

use AdvWorks

create table SalesOrderHeader
(
rowid int not null identity(1,1) Primary key,
SalesOrderID int not null UNIQUE,
OrderDate datetime not null,
CustomerID int not null,
SalesPersonID int null,
TerritoryID int null,
SubTotal float not null,
ModifiedDate datetime not null
)
--drop table SalesOrderHeader

select * from SalesOrderHeader


create table SalesOrderHeaderSalesReason
(
rowid int not null identity(1,1) Primary key,
SalesOrderID int not null FOREIGN KEY REFERENCES SalesOrderHeader(salesOrderID),
SalesReasonID int not null FOREIGN KEY REFERENCES SalesReason(SalesReasonID) ,
ModifiedDate datetime not null
)

select * from SalesOrderHeaderSalesReason
----------
--drop table SalesReason 

create table SalesReason 
(
SalesReasonID int not null Primary key,
Name varchar(50) not null,
ReasonType varchar(30) not null,
ModifiedDate datetime not null
)

--
select * from SalesOrderHeader
insert into SalesOrderHeader(SalesOrderID, OrderDate,CustomerID,TerritoryID,SubTotal,ModifiedDate)
values (43697, '2011-05-31 00:00:00', 21768,6,3578.27,'2011-06-07 00:00:00')
insert into SalesOrderHeader(SalesOrderID, OrderDate,CustomerID,TerritoryID,SubTotal,ModifiedDate)
values (43702, '2011-06-01 00:00:00', 27645,4,3578.27,'2011-06-08 00:00:00')

insert into SalesReason
values(1, 'Price', 'Other','2008-04-30 00:00:00')
insert into SalesReason
values(2, 'On Promotion', 'Promotion','2008-04-30 00:00:00')
insert into SalesReason
values(3, 'Magazine Advertisement', 'Marketing','2008-04-30 00:00:00')
insert into SalesReason
values(4, 'Television  Advertisement', 'Marketing','2008-04-30 00:00:00')
insert into SalesReason
values(5, 'Manufacturer', 'Other','2008-04-30 00:00:00')
insert into SalesReason
values(6, 'Review', 'Other','2008-04-30 00:00:00')
insert into SalesReason
values(7, 'Demo Event', 'Marketing','2008-04-30 00:00:00')
insert into SalesReason
values(8, 'Sponsorship', 'Marketing','2008-04-30 00:00:00')
insert into SalesReason
values(9, 'Quality', 'Other','2008-04-30 00:00:00')
insert into SalesReason
values(10, 'Other', 'Other','2008-04-30 00:00:00')

select * from SalesReason

select * from SalesOrderHeaderSalesReason

insert into SalesOrderHeaderSalesReason(SalesOrderID,SalesReasonID,ModifiedDate)
values(43697, 5, '2011-05-31 00:00:00')
insert into SalesOrderHeaderSalesReason(SalesOrderID,SalesReasonID,ModifiedDate)
values(43697, 9, '2011-05-31 00:00:00')
insert into SalesOrderHeaderSalesReason(SalesOrderID,SalesReasonID,ModifiedDate)
values(43702, 5, '2011-06-01 00:00:00')
insert into SalesOrderHeaderSalesReason(SalesOrderID,SalesReasonID,ModifiedDate)
values(43702, 9, '2011-06-01 00:00:00')



create VIEW VWOrderDetailList
as
select SOH.SalesOrderID, SR.SalesReasonID, SR.ReasonType,SR.Name
from SalesOrderHeader SOH join SalesOrderHeaderSalesReason SOHS
on SOH.SalesOrderID = SOHS.SalesOrderID
join SalesReason SR
on SOHS.SalesReasonID = SR.SalesReasonID
go

select * from VWOrderDetailList

create procedure uspOrderDetailsearch
@ID int
as
select SOH.SalesOrderID, SR.SalesReasonID, SR.ReasonType,SR.Name
from SalesOrderHeader SOH join SalesOrderHeaderSalesReason SOHS
on SOH.SalesOrderID = SOHS.SalesOrderID
join SalesReason SR
on SOHS.SalesReasonID = SR.SalesReasonID
where SOH.SalesOrderID like @ID

exec uspOrderDetailsearch 43697