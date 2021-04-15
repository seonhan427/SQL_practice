-- 2021.04.15 .2

-- join  ����

--�⺻ ����
--elect 
--from table1		join	table2
--on table1.col1 = table2.col2
--where table1.col1 > 0000 and table2.col3
----------------------------------------


select *
from Production.product	join Production.productsubcategory
on production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID

-- ���� ���ϵ��� ��Ī�� ���δ�
select *
from Production.product as P	join Production.productsubcategory as PS
on P.ProductSubcategoryID = PS.ProductSubcategoryID
-- Ư�����̺��� �÷��� ��� ���� �ʹٸ� ��Ī.* ���
select PS. *
from Production.product as P	join Production.productsubcategory as PS
on P.ProductSubcategoryID = PS.ProductSubcategoryID


--�� ���̺� ������ �̸��� �÷��� �ִٸ� �÷� �̸��տ� ��� ���̺����� ����������Ѵ�.
select ProductID, P.name, P.ProductSubcategoryID, PS.name
from Production.product as P	join Production.productsubcategory as PS
on P.ProductSubcategoryID = PS.ProductSubcategoryID

-- productcategory �Ϻο� � productsubcategory�� �ִ��� ��ȸ�ϴ� sql�� ����� ������.

select PC.ProductCategoryID, PC.name,ProductSubcategoryID, PS.name 
from production.ProductSubcategory as PS join Production.ProductCategory as PC
on PS.ProductcategoryID = PC.ProductCategoryID
where pc.ProductCategoryID = 2 -- where �� ������� Ư�� ���� ��ȸ

-- inner Join(�⺻join)������ �� ���̺��� ������ ������� �����ո� ���´�.
-- outer join������ �� ���̺��� ������ ���� ��ȸ����� �ٸ� (right,left)

select p.ProductID, p.name, SOD.ProductID, SOD.OrderQty
from Production.Product as P	join Sales.SalesOrderDetail as SOD
on P.ProductID = SOD.ProductID
-- 121,317 ��

select p.ProductID, p.name, SOD.ProductID, SOD.OrderQty
from Production.Product as P	left outer join Sales.SalesOrderDetail as SOD
on P.ProductID = SOD.ProductID
-- 121,555 ��

select p.ProductID, p.name, SOD.ProductID, SOD.OrderQty
from Production.Product as P	right outer join Sales.SalesOrderDetail as SOD
on P.ProductID = SOD.ProductID
--121,317 ��

select p.ProductID, p.name, SOD.ProductID, SOD.OrderQty
from Production.Product as P	left outer join Sales.SalesOrderDetail as SOD
on P.ProductID = SOD.ProductID
where SOD.ProductID is null
-- 121,555 ��

-- ��ǰ�� ��з��� �Һз��� ������ ���� ������� ��ȸ�ϴ� sql�� �ۼ�

select PC.ProductCategoryID, PC.name, count(ProductSubcategoryID) as ���� 
from production.ProductSubcategory as PS join Production.ProductCategory as PC
on PS.ProductcategoryID = PC.ProductCategoryID
group by PC.ProductCategoryID, PC.name
order by PC.ProductCategoryID