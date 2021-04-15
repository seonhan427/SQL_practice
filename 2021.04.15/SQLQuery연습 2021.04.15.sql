--2021.04.15

select  top (20)*
from HumanResources.EmployeePayHistory
order by Rate desc

-- �����ͺ��̽��� �����Ҷ��� use�� ����Ѵ�.
use AdventureWorks2019

-- distinct -> �Ӽ��� �������� ã���ִ� ��
select distinct Color 
from Production.Product

select * 
from Production.Product

select distinct color, Size --�ΰ� �÷��� �������� ��ȸ 
from Production.Product

-- �����Լ�
select top 10 *
from Sales.SalesOrderHeader

select sum(subtotal), avg(taxamt), max(freight), min(TotalDue)
from Sales.SalesOrderHeader

-- as ��Ī alias, ��ĭ ��� �ᵵ ����

select sum(subtotal) as �հ�
, avg(taxamt) as ����
, max(freight) �ִ��ۺ�
, min(TotalDue) �������־�
from Sales.SalesOrderHeader

-- group by Ư�� �÷�
select CustomerID, max(totaldue) as �ִ���־�
from Sales.SalesOrderHeader
group by CustomerID

select SalesPersonID, CustomerID, count(*), sum(totaldue) as �ִ���־� -- count(*) ī��Ʈ
from Sales.SalesOrderHeader
where SalesPersonID is not null -- null ���� ����
group by SalesPersonID, CustomerID

-- null ������ȸ�Ҷ��� where �÷� is null �ݴ��� ��Ȳ�� where �÷� is not
--where SalesPersonID is null
--where SalesPersonID is not null -- null ���� ����



--�Ʒ� ���̺��� ��ǰ id ���� �Ǹ� �Ѽ���, �ִ����, ��ռ����� ���غ�����
select *
from sales.SalesOrderDetail


select ProductID
, sum(OrderQty) as ��_����
, max(orderQty) as �ִ����
, avg(OrderQty) as ��ռ���
from sales.SalesOrderDetail
group by ProductID
order by ��_���� desc

-- having ��
select ProductID
, sum(OrderQty) as ��_����
, max(orderQty) as �ִ����
, avg(OrderQty) as ��ռ���
from sales.SalesOrderDetail
where orderQty >= 10 
group by ProductID
having sum(OrderQty) >= 1000
-- having ��_���� >=1000 alias �� �������� �ٱ⶧���� having �������� ��� ����
order by ��_���� desc


-- q1. sales.salesorderDetail ���̺��� Productid�� �ֹ����� ��ǰ�� �ֹ� ������ ������ ��Ī�� �̿��ؼ� ��ȸ�ϼ���.
select * 
from Sales.SalesOrderDetail


select ProductID, count(*) as �ֹ���, sum(OrderQty) as �ֹ�����  
from Sales.SalesOrderDetail
group by ProductID

-- q2. sales.salesorderDetail ���̺��� ��ǰ�ܰ� ���� �� ��ǰ�� ���� ���� �ݾ��� ���ϼ���.

select max(UnitPrice) as maxprice, min(UnitPrice) as minprice
from Sales.SalesOrderDetail


select SalesOrderID, max(UnitPrice) as maxprice, min(UnitPrice) as minprice
from Sales.SalesOrderDetail
group by SalesOrderID
order by SalesOrderID

-- q3. sales.salesorderDetail ���̺��� �ֹ���ȣ(salesorderid) �� 5�� �̻��� �Ǽ�( count(*) )�� �ִ� �ֹ� ��ȣ�� ��ȸ�ϼ���>

select SalesOrderID, count(*) as ordercount 
from Sales.SalesOrderDetail 
group by SalesOrderID
having count(*) >= 5

