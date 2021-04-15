-- 2021.04.08 DBMS 수업


--주석처리기능

-- * 는 모두(all)를 지정
--product 테이블에서 모든 컬럼조회하기

select * 
from production.product
------------------------------

select *
from production. productCategory

-- product 테이블에서 4개의 컬럼 + 모든컬럼 조회하기-------
select productid, name, productnumber, ListPrice,*
from production.product

-------------------------------------
-- where 사용시 특정값포함된 셀만 불러올수있음
-- 부등호사용으로 구분가능
-- != <> 특정 숫자값만 제외할때
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
-- 문자형 자료를 찾을때는 '' 사용, 숫자형은 ''를 사용해도 숫자형취급
select *
from production.billofmaterials
where UnitMeasureCode = 'EA'
------------------------------------


-- 1,3의 값만 가져오기 ---------------
select ProductSubcategoryID, ProductCategoryID, name
from Production.ProductSubcategory
where ProductCategoryID = 1 or ProductCategoryID = 3

select ProductSubcategoryID, ProductCategoryID, name
from Production.ProductSubcategory
where ProductCategoryID in (1,3)

-- -----------------------------------

-- 1,3 제외하고 가져오기----------
select ProductSubcategoryID, ProductCategoryID, name
from Production.ProductSubcategory
where ProductCategoryID not in (1,3)
------------------------------

-- productsubcategory 의 name 컬럼에서 bikes 가 들어있는 row만 가져오기
select ProductSubcategoryID, ProductCategoryID, name
from Production.ProductSubcategory
where name like 'bikes%' -- bikes로 시작하는 것 #성능이 제일 좋음

--where name like '%bikes' -- bkies로 끝나는것

--where name like '%bikes%'-- bikes 가 포함된것
--공백도 포함가능 , like 연산자 사용!

---------------------------------------

-- productsubcategoryID 가 5부터 12까지 데이터를 조회
select ProductSubcategoryID, ProductCategoryID, name
from Production.ProductSubcategory
--where ProductSubcategoryID >= 5 and ProductSubcategoryID <= 12
where ProductSubcategoryID between 5 and 12 -- between 은 경계값을 모두포함


-- productsubcategoryID 가 5부터 12까지 데이터를 조회
-- name 에서 C로 시작하는 데이터를 조회

select ProductSubcategoryID, ProductCategoryID, name
from Production.ProductSubcategory
where ProductSubcategoryID between 5 and 12
and name like 'C%'

--and 절을 이용하여 여러가지의 조건을 붙일수 있음 --

-- 상위 10개 행만 보여주기----

select top (10) *
from Sales.SalesOrderDetail

-- 행 전체 10%를 보고싶을땐---
select top (10)percent *
from Sales.SalesOrderDetail

-- TotalDue 순서대로 보고 싶다.
select top 10 *
from sales.SalesOrderHeader
order by TotalDue 

-- 역순으로 보고싶다.
select top 10 *
from sales.SalesOrderHeader
order by TotalDue desc

--territoryID 가 4와 6에서 매출(TotalDue) 순위 10개만 보고싶다
select top 10 *
from sales.SalesOrderHeader
where TerritoryID in (4,6)
order by TotalDue desc

--order by territoryID, totaldue desc (order by 에서 여러조건 가능)
--order by 1 desc, 2 desc (1,2는 컬럼지정)

--2021.04.08--ㄻ