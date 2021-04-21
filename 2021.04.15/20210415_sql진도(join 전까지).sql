-- 2021/04/15 begin
-- 데이터베이스를 변경할때는 use를 사용한다.
use adventureworks2019

-- distinct - 속성의 도메인을 찾아주는 절
select * 
from [Production].[Product]  

select distinct Color
from [Production].[Product] 

select distinct color, size -- 두개 컬럼의 고유조합 조회
from [Production].[Product]  

-- 집계함수
select top 10 *
from sales.SalesOrderHeader


select sum(subtotal) as 합계 -- as 별칭 alias 
, avg(taxamt) as 세금
, max(freight) as 최대_배송비
, min(totaldue) as '최저 발주액'
, count(*)
from sales.salesOrderHeader

-- group by 
select customerid , max(totaldue) -- as 최대발주액
from sales.salesOrderHeader
group by customerid

select salesPersonID, customerid , count(*), sum(totaldue) -- as 최대발주액
from sales.salesOrderHeader
where salesPersonid is not null
group by salesPersonID, customerid

-- where 절에 null?
-- where 컬럼 <> ''   
-- where 컬럼 <> null  (x)
-- where 컬럼 is null  
-- where 컬럼 is not null  

-- 아래 테이블에서 상품id별로 판매 총 수량, 최대 수량, 평균 수량을 구해보세요
select productid, sum(orderqty) as qty
, max(orderqty) as maxqty , avg(orderqty) as avgqty
from [Sales].[SalesOrderDetail]
where orderqty >=10
group by productid
having sum(orderqty) >=1000
-- having qty >=1000 
order by qty desc

-- q1. sales.salesorderDetail 테이블에서 Productid별 주문수와 제품별 주문 수량을 각각의 
-- 별칭을 이용해서 조회하세요. 

-- q2. sales.salesOrderDetail 테이블에서 제품단가 제일 싼 제품과 
-- 제일 높은 금액을 구하세요. 
--select productid, min(unitprice) as 최저단가 , max(unitprice) as 최고단가
--from sales.salesOrderDetail
--group by productid 
--order by productid

select * from sales.salesOrderDetail
order by productid 
-- q3. sales.salesOrderDetail 테이블에서 
-- 주문번호(SalesOrderID) 당 5개 이상의 건수( count(*) )가 있는 주문번호를 조회하세요


