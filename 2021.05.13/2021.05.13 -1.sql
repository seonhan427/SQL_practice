CREATE VIEW VWProductCategoryList
as
select P.ProductID as 상품코드, P.Name as 상품이름, PSC.Name as 대분류이름, PC.Name 소분류이름
from Production.Product P join Production.ProductSubcategory PSC
on p.ProductSubcategoryID = PSC.ProductSubcategoryID
join Production.ProductCategory PC
on PSC.ProductCategoryID = PC.ProductCategoryID
go

select * from VWProductCategoryList

alter VIEW VWProductCategoryList
as
select P.ProductID as 상품코드, P.Name as 상품이름, PSC.Name as 소분류이름, PC.Name 대분류이름
from Production.Product P join Production.ProductSubcategory PSC
on p.ProductSubcategoryID = PSC.ProductSubcategoryID
join Production.ProductCategory PC
on PSC.ProductCategoryID = PC.ProductCategoryID
where PC.name like 'Bikes'
go 

---stored procedure 만들기

Create procedure uspProductCategory
@category varchar(20)
as
--declare @category varchar(20)
select P.ProductID as 상품코드, P.Name as 상품이름, PSC.Name as 소분류이름, PC.Name 대분류이름
from Production.Product P join Production.ProductSubcategory PSC
on p.ProductSubcategoryID = PSC.ProductSubcategoryID
join Production.ProductCategory PC
on PSC.ProductCategoryID = PC.ProductCategoryID
where PC.name like @category

execute uspProductCategory 'Bikes'
exec uspProductCategory 'components'


-- set nocount on / set nocount off

set nocount on 
select P.ProductID as 상품코드, P.Name as 상품이름, PSC.Name as 소분류이름, PC.Name 대분류이름
from Production.Product P join Production.ProductSubcategory PSC
on p.ProductSubcategoryID = PSC.ProductSubcategoryID
join Production.ProductCategory PC
on PSC.ProductCategoryID = PC.ProductCategoryID
where PC.name like 'Bikes'