use AdventureWorks2019

select 
ProductID
, ReorderPoint
,row_number()over (Order by reorderpoint desc ) as row_number_
,rank() over (Order by reorderpoint desc ) as rank_
,Dense_rank()over (Order by reorderpoint desc ) as dense_rank_
,Lag(productid)over (Order by reorderpoint desc ) as Lag1
,Lag(productid,2)over (Order by reorderpoint desc ) as Lag2
,Lead(productid)over (Order by reorderpoint desc ) as Lead1
,Lead(productid,2)over (Order by reorderpoint desc ) as Lead2
from [Production].[Product]
order by rank_


select SalesPersonID, CustomerID, SubTotal
,count(*) as rows
,avg(subtotal) as sub_total
,avg(subtotal) over() as sub_total_avg_over
,avg(subtotal) over(Partition by SalesPersonid) as sub_total_avg_by_salesPersonid
,avg(subtotal) over(Partition by SalesPersonid,customerid) as sub_total_avg_by_salesPersonid2
from[sales].[SalesOrderHeader]
--where SalesPersonID is not null
group by SalesPersonID,CustomerID,SubTotal