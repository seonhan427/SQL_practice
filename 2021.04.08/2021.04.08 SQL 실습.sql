-- 2021.04.08 DBMS ����


--�ּ�ó�����

-- * �� ���(all)�� ����
--product ���̺��� ��� �÷���ȸ�ϱ�

select * 
from production.product
------------------------------

select *
from production. productCategory

-- product ���̺��� 4���� �÷� + ����÷� ��ȸ�ϱ�-------
select productid, name, productnumber, ListPrice,*
from production.product

-------------------------------------
-- where ���� Ư�������Ե� ���� �ҷ��ü�����
-- �ε�ȣ������� ���а���
-- != <> Ư�� ���ڰ��� �����Ҷ�
select ProductSubcategoryID, ProductCategoryID, name
from Production.ProductSubcategory
where ProductCategoryID != 4

------------------------------
select *
from dbo.ErrorLog

-----------------------------
-- where
select *
from production.billofmaterials
where ProductAssemblyID = 680


-------------------------------------
-- ������ �ڷḦ ã������ '' ���, �������� ''�� ����ص� ���������
select *
from production.billofmaterials
where UnitMeasureCode = 'EA'
------------------------------------


-- 1,3�� ���� �������� ---------------
select ProductSubcategoryID, ProductCategoryID, name
from Production.ProductSubcategory
where ProductCategoryID = 1 or ProductCategoryID = 3

select ProductSubcategoryID, ProductCategoryID, name
from Production.ProductSubcategory
where ProductCategoryID in (1,3)

-- -----------------------------------

-- 1,3 �����ϰ� ��������----------
select ProductSubcategoryID, ProductCategoryID, name
from Production.ProductSubcategory
where ProductCategoryID not in (1,3)
------------------------------

-- productsubcategory �� name �÷����� bikes �� ����ִ� row�� ��������
select ProductSubcategoryID, ProductCategoryID, name
from Production.ProductSubcategory
where name like 'bikes%' -- bikes�� �����ϴ� �� #������ ���� ����

--where name like '%bikes' -- bkies�� �����°�

--where name like '%bikes%'-- bikes �� ���ԵȰ�
--���鵵 ���԰��� , like ������ ���!

---------------------------------------

-- productsubcategoryID �� 5���� 12���� �����͸� ��ȸ
select ProductSubcategoryID, ProductCategoryID, name
from Production.ProductSubcategory
--where ProductSubcategoryID >= 5 and ProductSubcategoryID <= 12
where ProductSubcategoryID between 5 and 12 -- between �� ��谪�� �������


-- productsubcategoryID �� 5���� 12���� �����͸� ��ȸ
-- name ���� C�� �����ϴ� �����͸� ��ȸ

select ProductSubcategoryID, ProductCategoryID, name
from Production.ProductSubcategory
where ProductSubcategoryID between 5 and 12
and name like 'C%'

--and ���� �̿��Ͽ� ���������� ������ ���ϼ� ���� --

-- ���� 10�� �ุ �����ֱ�----

select top (10) *
from Sales.SalesOrderDetail

-- �� ��ü 10%�� ���������---
select top (10)percent *
from Sales.SalesOrderDetail

-- TotalDue ������� ���� �ʹ�.
select top 10 *
from sales.SalesOrderHeader
order by TotalDue 

-- �������� ����ʹ�.
select top 10 *
from sales.SalesOrderHeader
order by TotalDue desc

--territoryID �� 4�� 6���� ����(TotalDue) ���� 10���� ����ʹ�
select top 10 *
from sales.SalesOrderHeader
where TerritoryID in (4,6)
order by TotalDue desc

--order by territoryID, totaldue desc (order by ���� �������� ����)
--order by 1 desc, 2 desc (1,2�� �÷�����)

--2021.04.08--��