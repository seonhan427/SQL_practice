-- 제 9 강. 시계열 기반으로 데이터 집계하기
-- page 138
use AdventureWorks2019;

-- 어떻게 생겼나 살피기
select top 10 * -- orderdate, salesOrderId, customerId, Subtotal
from sales.SalesOrderHeader

-- 페이지 140
-- 날짜별 매출 집계하기
-- 날짜별일자, 주문회수, 전체합계,객단가

Select orderdate, count(*), sum(subtotal) , avg(subtotal)
from Sales.salesOrderheader
group by orderdate
order by orderdate


--이동평균을 사용한 날짜별 추이보기
--날짜별 매출과 7일 이동평균을 집계하는 쿼리
select orderdate
, sum(subtotal) as dailytotal
-- 최근 최대 7일동안의 평균 계산하기
, avg(sum(subtotal)) over(order by orderdate rows between 6 preceding and current row) as 7day_avg
-- 최근 최대 7일동안의 평균 확실하게 계산히기 (즉 7개가 모여야만 출력)
, case
	when 7=count(*)  over(order by orderdate rows between 6 preceding and current row) 
    then 
    avg(sum(subtotal)) over(order by orderdate rows between 6 preceding and current row) 
    end 
    as 7day_avg_strict
From Sales.SalesOrderHeader
group by orderdate
order by orderdate

--날짜별 매출과 당월 누계 매출을 집계하는 쿼리
-- 페이지 144

SELECT 
	orderdate
    --, substring(orderdate,1,7) as y_mon -- 참고로 별명을 year_month로 하면 오류발생
	, convert(char(4), year(orderdate)) +'-'+ convert(char(4), month(orderdate) )  as y_mon
	, sum(subtotal) as total_amount
	, sum(sum(subtotal)) over (partition by substring(orderdate,1,7) order by orderdate rows unbounded preceding)
	as agg_amount
from sales.SalesOrderHeader
group by orderdate
order by orderdate
;
select year(getdate()), month(getdate()), day(getdate())
select year(getdate()), month(getdate())
, convert(char(4),year(getdate())) +'-'+convert(char(4),month(getdate()))


SELECT 
   orderdate
    --, substring(orderdate,1,7) as y_mon -- 참고로 별명을 year_month로 하면 오류발생
   --, convert(char(4), year(orderdate)) +'-'+ convert(char(4), month(orderdate) )  as y_mon
   , format(year(OrderDate),'0000')+'-'+ format(month(OrderDate),'00') as y_mon
   , sum(subtotal) as total_amount
   , sum(sum(subtotal)) over (partition by (convert(char(4), year(orderdate)) +'-'+ convert(char(4), month(orderdate) ))
     order by orderdate rows unbounded preceding)
   as agg_amount
from sales.SalesOrderHeader
group by orderdate
order by orderdate

select format(6,'0000'), format(60,'0000')
select format(year(getdate()),'0000')+'-'+ format(month(getdate()),'00')

--페이지 146
--날짜별 매출을 임시 테이블로 만들기
WITH
daily_purchase AS (
select
	orderdate
    , year(orderdate) as year
    , month(orderdate) as month
    , day(orderdate) as day
    --, substring(orderdate, 1, 4) as year
    --, substring(orderdate, 6, 2) as month
    --, substring(orderdate, 9, 2) as day
    , sum(subtotal) as subtotal
from sales.SalesOrderHeader
group by orderdate
)
SELECT  * 
FROM daily_purchase
ORDER by orderdate



--당월 매출 누계 구하기
--날짜별 매출과 당월 누계 매출을 집계하는 쿼리
-- 페이지 147
WITH
daily_purchase AS (
select
	orderdate
	, year(orderdate) as year
    , month(orderdate) as month
    , day(orderdate) as day
    --, substring(orderdate, 1, 4) as year
    --, substring(orderdate, 6, 2) as month
    --, substring(orderdate, 9, 2) as day
    , sum(subtotal) as subtotal
from sales.SalesOrderHeader
group by orderdate
)
 
SELECT
	orderdate
    --, substring(orderdate,1,7) as YearMonth
	, format(year(OrderDate),'0000')+'-'+format(month(OrderDate),'00') as y_mon
    , sum(Subtotal) as total_amount
    , sum(Sum(subtotal)) 
      OVER( Partition by substring(orderdate, 1,7) Order by orderdate Rows Unbounded Preceding)
    as cum_amount
from daily_purchase -- SalesOrderHeader
group by Orderdate
order by orderdate

--페이지 149 
-- 월별 매출과 작대비를 계산하는 쿼리

--월별 매출과 작년대비를 계산하는 쿼리
WITH
daily_purchase AS (
select
	orderdate
    --, substring(orderdate, 1, 4) as year
    --, substring(orderdate, 6, 2) as month
    --, substring(orderdate, 9, 2) as day
	, year(orderdate) as year
    , month(orderdate) as month
    , day(orderdate) as day
    , sum(subtotal) as subtotal
from sales.SalesOrderHeader
group by orderdate
)
SELECT 
	month
    , SUM(	CASE	year when '2011' then subtotal end ) as amount_2011
    , SUM( CASE year when '2013' then subtotal end ) as amount_2013
    , 100*(SUM( CASE year when '2003' then subtotal end ) / SUM(	CASE	year when '2002' then subtotal end ) )
    as rate
FROM
	daily_purchase
Group by month
Order by month

--#월별 매출과 작년대비를 계산하는 쿼리 2
WITH
daily_purchase AS (
select
   orderdate
    --, substring(orderdate, 1, 4) as year
    --, substring(orderdate, 6, 2) as month
    --, substring(orderdate, 9, 2) as day
   , year(orderdate) as year
    , month(orderdate) as month
    , day(orderdate) as day
    , sum(subtotal) as subtotal
from sales.SalesOrderHeader
group by orderdate
)
SELECT 
   month
    , SUM( CASE year when '2012' then subtotal end ) as amount_2012
    , SUM( CASE year when '2013' then subtotal end ) as amount_2013
    , 100*(SUM( CASE year when '2013' then subtotal end ) / SUM(   CASE   year when '2012' then subtotal end ) )
    as rate
FROM
   daily_purchase
Group by month
Order by month


--Z차트로 업적의 추이 확인하기
WITH
daily_purchase AS (
SELECT
	orderdate
    , substring(orderdate, 1, 4) as year
    , substring(orderdate, 6, 2) as month
    , substring(orderdate, 9, 2) as day
    , sum(subtotal) as subtotal
FROM sales.SalesOrderHeader
GROUP BY orderdate
)
, monthly_purchase AS (
SELECT
	year
    ,month
    ,sum(subtotal) as amount
FROM daily_purchase
GROUP BY year, month
)
, calc_index AS (
SELECT 
	year
    , month
    , amount
    -- 2002년도 누계 매출 집계하기
    , sum( CASE 
				when year='2002' 
                then amount 
		end ) 	OVER( Order by year, month rows unbounded preceding)
        as cum_amount
	, sum(amount)
		OVER( Order by year, month rows between 11 preceding and current row)
        as last_12_month_sum
FROM
    monthly_purchase
    Order by year, month
)
SELECT 
	concat(year,'-',month)  
    , amount
	, cum_amount
	, last_12_month_sum
from calc_index
where year ='2002'
order by concat(year,'-',month)
;

-- 수정버젼 

WITH
daily_purchase AS (
SELECT
   orderdate
    --, substring(orderdate, 1, 4) as year
    --, substring(orderdate, 6, 2) as month
    --, substring(orderdate, 9, 2) as day
   , year(orderdate) as year
    , month(orderdate) as month
    , day(orderdate) as day
    , sum(subtotal) as subtotal
FROM sales.SalesOrderHeader
GROUP BY orderdate
)
, monthly_purchase AS (
SELECT
   year
    ,month
    ,sum(subtotal) as amount
FROM daily_purchase
GROUP BY year, month
)
, calc_index AS (
SELECT top 100 percent
   year
    , month
    , amount
    -- 2012년도 누계 매출 집계하기
    , sum( CASE 
            when year='2013' 
                then amount 
      end )    OVER( Order by year, month rows unbounded preceding)
        as cum_amount
   , sum(amount)
      OVER( Order by year, month rows between 11 preceding and current row)
        as last_12_month_sum
FROM
    monthly_purchase
    Order by year, month
)
SELECT 
    -- concat(year,'-',month)  
   format(year,'0000')+'-'+format(month,'00')
    , amount
   , cum_amount
   , last_12_month_sum
from calc_index
where year ='2013'
order by format(year,'0000')+'-'+format(month,'00')
;

--158 페이지
--매출과 관련된 지표를 집계하는 쿼리
with 
daily_purchase AS (
SELECT
	orderdate
    , substring(orderdate, 1, 4) as year
    , substring(orderdate, 6, 2) as month
    , substring(orderdate, 9, 2) as day
    , sum(subtotal) as subtotal
FROM  sales.SalesOrderHeader
GROUP BY orderdate
)
, monthly_purchase AS (
SELECT
	year
    ,month
    ,COUNT(*) as OrderCounts
    ,AVG(subtotal) as avg_amount
    ,SUM(subtotal) as monthly
FROM daily_purchase
GROUP BY year, month
)
select 
concat(year,'-',month ) 
, OrderCounts
,  avg_amount
,  monthly
,  sum(monthly)
	over(partition by year  order by month  rows unbounded preceding)
   as agg_amount
,	LAG(monthly,12)
	over(order by year,month)
	as last_year
, 100.0*(monthly / LAG(monthly,12)
	over(order by year,month) ) 
    as rate
from monthly_purchase
order by 1
