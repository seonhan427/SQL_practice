select *
from Sales.SalesOrderHeader as SOH join Sales.SalesOrderDetail as SOD
on SOH.SalesOrderID = SOD.SalesOrderID


select *
from Sales.SalesOrderDetail

select *
from Sales.SalesOrderHeader

select SOH.SubTotal, SOD.LineTotal
from Sales.SalesOrderHeader as SOH join Sales.SalesOrderDetail as SOD
on SOH.SalesOrderID = SOD.SalesOrderID
group by SOH.SubTotal, SOD.LineTotal
having SOH.SubTotal != SOD.LineTotal

