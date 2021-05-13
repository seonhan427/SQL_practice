CREATE VIEW VWProductCategoryList
as
select P.ProductID as ��ǰ�ڵ�, P.Name as ��ǰ�̸�, PSC.Name as ��з��̸�, PC.Name �Һз��̸�
from Production.Product P join Production.ProductSubcategory PSC
on p.ProductSubcategoryID = PSC.ProductSubcategoryID
join Production.ProductCategory PC
on PSC.ProductCategoryID = PC.ProductCategoryID
go

select * from VWProductCategoryList

alter VIEW VWProductCategoryList
as
select P.ProductID as ��ǰ�ڵ�, P.Name as ��ǰ�̸�, PSC.Name as �Һз��̸�, PC.Name ��з��̸�
from Production.Product P join Production.ProductSubcategory PSC
on p.ProductSubcategoryID = PSC.ProductSubcategoryID
join Production.ProductCategory PC
on PSC.ProductCategoryID = PC.ProductCategoryID
where PC.name like 'Bikes'
go 

---stored procedure �����

Create procedure uspProductCategory
@category varchar(20)
as
--declare @category varchar(20)
select P.ProductID as ��ǰ�ڵ�, P.Name as ��ǰ�̸�, PSC.Name as �Һз��̸�, PC.Name ��з��̸�
from Production.Product P join Production.ProductSubcategory PSC
on p.ProductSubcategoryID = PSC.ProductSubcategoryID
join Production.ProductCategory PC
on PSC.ProductCategoryID = PC.ProductCategoryID
where PC.name like @category

execute uspProductCategory 'Bikes'
exec uspProductCategory 'components'


-- set nocount on / set nocount off

set nocount on 
select P.ProductID as ��ǰ�ڵ�, P.Name as ��ǰ�̸�, PSC.Name as �Һз��̸�, PC.Name ��з��̸�
from Production.Product P join Production.ProductSubcategory PSC
on p.ProductSubcategoryID = PSC.ProductSubcategoryID
join Production.ProductCategory PC
on PSC.ProductCategoryID = PC.ProductCategoryID
where PC.name like 'Bikes'