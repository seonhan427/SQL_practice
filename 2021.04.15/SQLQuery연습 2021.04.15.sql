--2021.04.15

select  top (20)*
from HumanResources.EmployeePayHistory
order by Rate desc

-- 데이터베이스를 변경할때는 use를 사용한다.
use AdventureWorks2019

-- distinct -> 속성의 도메인을 찾아주는 절
select distinct Color 
from Production.Product

select * 
from Production.Product

select distinct color, Size --두개 컬럼의 고유조합 조회 
from Production.Product

-- 집계함수
select top 10 *
from Sales.SalesOrderHeader

select sum(subtotal), avg(taxamt), max(freight), min(TotalDue)
from Sales.SalesOrderHeader

-- as 별칭 alias, 한칸 띄고 써도 가능

select sum(subtotal) as 합계
, avg(taxamt) as 세금
, max(freight) 최대배송비
, min(TotalDue) 최저발주액
from Sales.SalesOrderHeader

-- group by 특정 컬럼
select CustomerID, max(totaldue) as 최대발주액
from Sales.SalesOrderHeader
group by CustomerID

select SalesPersonID, CustomerID, count(*), sum(totaldue) as 최대발주액 -- count(*) 카운트
from Sales.SalesOrderHeader
where SalesPersonID is not null -- null 값을 제외
group by SalesPersonID, CustomerID

-- null 값을조회할때는 where 컬럼 is null 반대의 상황은 where 컬럼 is not
--where SalesPersonID is null
--where SalesPersonID is not null -- null 값을 제외



--아래 테이블에서 상품 id 별로 판매 총수량, 최대수량, 평균수량을 구해보세요
select *
from sales.SalesOrderDetail


select ProductID
, sum(OrderQty) as 총_수량
, max(orderQty) as 최대수량
, avg(OrderQty) as 평균수량
from sales.SalesOrderDetail
group by ProductID
order by 총_수량 desc

-- having 절
select ProductID
, sum(OrderQty) as 총_수량
, max(orderQty) as 최대수량
, avg(OrderQty) as 평균수량
from sales.SalesOrderDetail
where orderQty >= 10 
group by ProductID
having sum(OrderQty) >= 1000
-- having 총_수량 >=1000 alias 는 마지막에 붙기때문에 having 절에서는 사용 ㄴㄴ
order by 총_수량 desc


-- q1. sales.salesorderDetail 테이블에서 Productid별 주문수와 제품별 주문 수량을 각각의 별칭을 이용해서 조회하세요.
select * 
from Sales.SalesOrderDetail


select ProductID, count(*) as 주문수, sum(OrderQty) as 주문수량  
from Sales.SalesOrderDetail
group by ProductID

-- q2. sales.salesorderDetail 테이블에서 제품단가 제일 싼 제품과 제일 높은 금액을 구하세요.

select max(UnitPrice) as maxprice, min(UnitPrice) as minprice
from Sales.SalesOrderDetail


select SalesOrderID, max(UnitPrice) as maxprice, min(UnitPrice) as minprice
from Sales.SalesOrderDetail
group by SalesOrderID
order by SalesOrderID

-- q3. sales.salesorderDetail 테이블에서 주문번호(salesorderid) 당 5개 이상의 건수( count(*) )가 있는 주문 번호를 조회하세요>

select SalesOrderID, count(*) as ordercount 
from Sales.SalesOrderDetail 
group by SalesOrderID
having count(*) >= 5

