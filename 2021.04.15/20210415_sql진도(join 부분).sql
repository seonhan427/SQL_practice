-- 2021-04-15 part 2. 
-- JOIN 구문 

SELECT
FROM table1         JOIN    table2
ON  table1.col1 = table2.col2
WHERE table1.col1 >0000 and table2.col3 in not null

select *
from production.product  JOIN production.ProductSubcategory
on production.product.ProductSubcategoryID 
   = production.ProductSubcategory.ProductSubcategoryID

-- 좀더 보기 편하도록 별칭을 붙인다.
select *
from production.product P JOIN production.ProductSubcategory PS
on P.ProductSubcategoryID 
   = PS.ProductSubcategoryID

--특정테이블의 컬럼만 모두 보고 싶다면 별칭.* 사용
select ps.*
from production.product P JOIN production.ProductSubcategory PS
on P.ProductSubcategoryID 
   = PS.ProductSubcategoryID

-- 두 테이블에 동일한 이름의 컬럼이 있다면 컬럼 이름앞에 
-- 어느 테이블인지 지정해줘야한다.
select productid, p.name, p.ProductSubcategoryID, ps.Name
from production.product P JOIN production.ProductSubcategory PS
on P.ProductSubcategoryID 
   = PS.ProductSubcategoryID

-- ProductCategory 하부에 어떤 ProductSubCategory가 있는지 
-- 조회하는 sql을 만들어 보세요. 
--대분류코드, 대분류이름, 소분류코드, 소분류이름

select pc.ProductCategoryID, pc.Name, ProductSubcategoryID, ps.name
from production.ProductSubcategory PS JOIN 
	Production.ProductCategory PC
ON ps.ProductCategoryID = pc.ProductCategoryID
where pc.ProductCategoryID = 2 

-- inner join에서는 두 테이블의 순서가 상관 없이 교집합만 나온다. 
-- outer join에서는 두 테이블의 순서에 따라 조회결과가 다름

-- 
select p.productid, p.name, SOD.productid, SOD.OrderQty
from production.product p  JOIN sales.SalesOrderDetail SOD
ON p.productid = SOD.productid 
-- 121,317 행

select p.productid, p.name, SOD.productid, SOD.OrderQty
from production.product p  left outer JOIN sales.SalesOrderDetail SOD
ON p.productid = SOD.productid 
-- 121,555 행

select p.productid, p.name, SOD.productid, SOD.OrderQty
from production.product p  right outer JOIN sales.SalesOrderDetail SOD
ON p.productid = SOD.productid 
-- 121,317 행

select p.productid, p.name, SOD.productid, SOD.OrderQty
from production.product p  left outer JOIN sales.SalesOrderDetail SOD
ON p.productid = SOD.productid 
where SOD.productid is null 
-- 238 행

-- 상품의 대분류별 소분류의 종류가 각각 몇개인지를 조회하는 sql문작성
--ProductCategoryID	Name		개수
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

--ProductCategoryID	Name	(열 이름 없음)
--1					Bikes		3
--2					Components	14



