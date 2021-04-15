-- 2021.04.15 .2

-- join  구문

--기본 형태
--elect 
--from table1		join	table2
--on table1.col1 = table2.col2
--where table1.col1 > 0000 and table2.col3
----------------------------------------


select *
from Production.product	join Production.productsubcategory
on production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID

-- 보기 편하도록 별칭을 붙인다
select *
from Production.product as P	join Production.productsubcategory as PS
on P.ProductSubcategoryID = PS.ProductSubcategoryID
-- 특정테이블의 컬럼만 모두 보고 싶다면 별칭.* 사용
select PS. *
from Production.product as P	join Production.productsubcategory as PS
on P.ProductSubcategoryID = PS.ProductSubcategoryID


--두 테이블에 동일한 이름의 컬럼이 있다면 컬럼 이름앞에 어느 테이블인지 지정해줘야한다.
select ProductID, P.name, P.ProductSubcategoryID, PS.name
from Production.product as P	join Production.productsubcategory as PS
on P.ProductSubcategoryID = PS.ProductSubcategoryID

-- productcategory 하부에 어떤 productsubcategory가 있는지 조회하는 sql을 만들어 보세요.

select PC.ProductCategoryID, PC.name,ProductSubcategoryID, PS.name 
from production.ProductSubcategory as PS join Production.ProductCategory as PC
on PS.ProductcategoryID = PC.ProductCategoryID
where pc.ProductCategoryID = 2 -- where 절 사용으로 특정 값만 조회

-- inner Join(기본join)에서는 두 테이블의 순서가 상관없이 교집합만 나온다.
-- outer join에서는 두 테이블의 순서에 따라 조회결과가 다름 (right,left)

select p.ProductID, p.name, SOD.ProductID, SOD.OrderQty
from Production.Product as P	join Sales.SalesOrderDetail as SOD
on P.ProductID = SOD.ProductID
-- 121,317 행

select p.ProductID, p.name, SOD.ProductID, SOD.OrderQty
from Production.Product as P	left outer join Sales.SalesOrderDetail as SOD
on P.ProductID = SOD.ProductID
-- 121,555 행

select p.ProductID, p.name, SOD.ProductID, SOD.OrderQty
from Production.Product as P	right outer join Sales.SalesOrderDetail as SOD
on P.ProductID = SOD.ProductID
--121,317 행

select p.ProductID, p.name, SOD.ProductID, SOD.OrderQty
from Production.Product as P	left outer join Sales.SalesOrderDetail as SOD
on P.ProductID = SOD.ProductID
where SOD.ProductID is null
-- 121,555 행

-- 상품의 대분류별 소분류의 종류가 각각 몇개인지를 조회하는 sql문 작성

select PC.ProductCategoryID, PC.name, count(ProductSubcategoryID) as 개수 
from production.ProductSubcategory as PS join Production.ProductCategory as PC
on PS.ProductcategoryID = PC.ProductCategoryID
group by PC.ProductCategoryID, PC.name
order by PC.ProductCategoryID