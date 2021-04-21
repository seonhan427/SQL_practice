-- 2021/04/15 begin
-- �����ͺ��̽��� �����Ҷ��� use�� ����Ѵ�.
use adventureworks2019

-- distinct - �Ӽ��� �������� ã���ִ� ��
select * 
from [Production].[Product]  

select distinct Color
from [Production].[Product] 

select distinct color, size -- �ΰ� �÷��� �������� ��ȸ
from [Production].[Product]  

-- �����Լ�
select top 10 *
from sales.SalesOrderHeader


select sum(subtotal) as �հ� -- as ��Ī alias 
, avg(taxamt) as ����
, max(freight) as �ִ�_��ۺ�
, min(totaldue) as '���� ���־�'
, count(*)
from sales.salesOrderHeader

-- group by 
select customerid , max(totaldue) -- as �ִ���־�
from sales.salesOrderHeader
group by customerid

select salesPersonID, customerid , count(*), sum(totaldue) -- as �ִ���־�
from sales.salesOrderHeader
where salesPersonid is not null
group by salesPersonID, customerid

-- where ���� null?
-- where �÷� <> ''   
-- where �÷� <> null  (x)
-- where �÷� is null  
-- where �÷� is not null  

-- �Ʒ� ���̺��� ��ǰid���� �Ǹ� �� ����, �ִ� ����, ��� ������ ���غ�����
select productid, sum(orderqty) as qty
, max(orderqty) as maxqty , avg(orderqty) as avgqty
from [Sales].[SalesOrderDetail]
where orderqty >=10
group by productid
having sum(orderqty) >=1000
-- having qty >=1000 
order by qty desc

-- q1. sales.salesorderDetail ���̺��� Productid�� �ֹ����� ��ǰ�� �ֹ� ������ ������ 
-- ��Ī�� �̿��ؼ� ��ȸ�ϼ���. 

-- q2. sales.salesOrderDetail ���̺��� ��ǰ�ܰ� ���� �� ��ǰ�� 
-- ���� ���� �ݾ��� ���ϼ���. 
--select productid, min(unitprice) as �����ܰ� , max(unitprice) as �ְ�ܰ�
--from sales.salesOrderDetail
--group by productid 
--order by productid

select * from sales.salesOrderDetail
order by productid 
-- q3. sales.salesOrderDetail ���̺��� 
-- �ֹ���ȣ(SalesOrderID) �� 5�� �̻��� �Ǽ�( count(*) )�� �ִ� �ֹ���ȣ�� ��ȸ�ϼ���


