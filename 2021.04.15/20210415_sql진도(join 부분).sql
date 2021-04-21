-- 2021-04-15 part 2. 
-- JOIN ���� 

SELECT
FROM table1         JOIN    table2
ON  table1.col1 = table2.col2
WHERE table1.col1 >0000 and table2.col3 in not null

select *
from production.product  JOIN production.ProductSubcategory
on production.product.ProductSubcategoryID 
   = production.ProductSubcategory.ProductSubcategoryID

-- ���� ���� ���ϵ��� ��Ī�� ���δ�.
select *
from production.product P JOIN production.ProductSubcategory PS
on P.ProductSubcategoryID 
   = PS.ProductSubcategoryID

--Ư�����̺��� �÷��� ��� ���� �ʹٸ� ��Ī.* ���
select ps.*
from production.product P JOIN production.ProductSubcategory PS
on P.ProductSubcategoryID 
   = PS.ProductSubcategoryID

-- �� ���̺� ������ �̸��� �÷��� �ִٸ� �÷� �̸��տ� 
-- ��� ���̺����� ����������Ѵ�.
select productid, p.name, p.ProductSubcategoryID, ps.Name
from production.product P JOIN production.ProductSubcategory PS
on P.ProductSubcategoryID 
   = PS.ProductSubcategoryID

-- ProductCategory �Ϻο� � ProductSubCategory�� �ִ��� 
-- ��ȸ�ϴ� sql�� ����� ������. 
--��з��ڵ�, ��з��̸�, �Һз��ڵ�, �Һз��̸�

select pc.ProductCategoryID, pc.Name, ProductSubcategoryID, ps.name
from production.ProductSubcategory PS JOIN 
	Production.ProductCategory PC
ON ps.ProductCategoryID = pc.ProductCategoryID
where pc.ProductCategoryID = 2 

-- inner join������ �� ���̺��� ������ ��� ���� �����ո� ���´�. 
-- outer join������ �� ���̺��� ������ ���� ��ȸ����� �ٸ�

-- 
select p.productid, p.name, SOD.productid, SOD.OrderQty
from production.product p  JOIN sales.SalesOrderDetail SOD
ON p.productid = SOD.productid 
-- 121,317 ��

select p.productid, p.name, SOD.productid, SOD.OrderQty
from production.product p  left outer JOIN sales.SalesOrderDetail SOD
ON p.productid = SOD.productid 
-- 121,555 ��

select p.productid, p.name, SOD.productid, SOD.OrderQty
from production.product p  right outer JOIN sales.SalesOrderDetail SOD
ON p.productid = SOD.productid 
-- 121,317 ��

select p.productid, p.name, SOD.productid, SOD.OrderQty
from production.product p  left outer JOIN sales.SalesOrderDetail SOD
ON p.productid = SOD.productid 
where SOD.productid is null 
-- 238 ��

-- ��ǰ�� ��з��� �Һз��� ������ ���� ������� ��ȸ�ϴ� sql���ۼ�
--ProductCategoryID	Name		����
--1					Bikes		3
--2					Components	14
--3					Clothing	8
--4					Accessories	12

select top 2 pc.ProductCategoryID, pc.Name, count(ProductSubcategoryID)
from production.ProductSubcategory PS JOIN 
	Production.ProductCategory PC
ON ps.ProductCategoryID = pc.ProductCategoryID
group by pc.ProductCategoryID, pc.Name
order by pc.ProductCategoryID

--ProductCategoryID	Name	(�� �̸� ����)
--1					Bikes		3
--2					Components	14



