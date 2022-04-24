--1. Find the Customers whose PostalCity=’New York’ (or any city of your choice) and that have the
--same number of CustomerTransactions and StockItemTransactions

;with cte3 as(select count(ct.CustomerTransactionID) as TransactionsCount, CustomerID as CustomerID 
from Sales.CustomerTransactions ct group by ct.CustomerID -- number of transactions by customer
)
,cte3Cities as
(select cte3.*, cus.PostalCityID from cte3 inner join Sales.Customers cus on cte3.CustomerID = cus.CustomerID
)
,cte4 as(select count(sit.StockItemTransactionID) as StockItemTransactionsCount, CustomerID as CustomerID 
from Warehouse.StockItemTransactions sit group by sit.CustomerID -- number of stock item transactions by customer
)
,cte4Cities as
(select cte4.*, cus.PostalCityID from cte4 inner join Sales.Customers cus on cte4.CustomerID = cus.CustomerID
)
--join by same number of transactions and same cities
,cte5 as
(select cte3Cities.CustomerID as TCustumerID, 
cte4Cities.CustomerID as SITCustomerID, 
cte3Cities.PostalCityID
from cte3Cities inner join cte4Cities 
on cte3Cities.PostalCityID = cte4Cities.PostalCityID and cte3Cities.TransactionsCount = cte4Cities.StockItemTransactionsCount
)
select * from cte5 where cte5.PostalCityID = 1075

--2. Find the customers that haven’t had an order with DeliveryMethod=”FedEx” (or any delivery
--method of your choice).

select cus.CustomerID as CustomerID, dm.DeliveryMethodName 
from [Sales].[Customers] cus inner join [Application].[DeliveryMethods] dm 
on cus.DeliveryMethodID = dm.DeliveryMethodID where dm.DeliveryMethodName <> 'Air Freight'

--3. Find the People that are employees (IsEmploye=TRUE) and are a Primary or Alternate Contact
--Person for less than 3 customers.

;with cte1 as
(select p.PersonID, count(c.CustomerID) as NumberOfCustomers from [Application].[People] p 
inner join Sales.Customers c on p.PersonID =  c.PrimaryContactPersonID 
or 
p.PersonID =  c.AlternateContactPersonID 
where p.IsEmployee = 1 group by p.PersonID)
select * from cte1 where cte1.NumberOfCustomers < 3

--4. Update these people from the previous requirement, so that the
--People.IsPermitedToLogon=FALSE.

;with cte1 as
(select p.PersonID, count(c.CustomerID) as NumberOfCustomers from [Application].[People] p 
inner join Sales.Customers c on p.PersonID =  c.PrimaryContactPersonID 
or 
p.PersonID =  c.AlternateContactPersonID 
where p.IsEmployee = 1 and p.IsPermittedToLogon=0 group by p.PersonID)
select * from cte1 where cte1.NumberOfCustomers < 3

--5. Find the number of different customers for each DeliveryMethod based on the Invoices table

select distinct count(CustomerID), DeliveryMethodID from [Sales].[Invoices] group by DeliveryMethodID

--6. Find the DeliveryMethodName of the most popular DeliveryMethod (the one which was used in the highest number of Invoices).

;with cte1 as
(select distinct count(CustomerID) as NumberOfCustomers, DeliveryMethodID from [Sales].[Invoices] group by DeliveryMethodID)
select dm.DeliveryMethodName, cte1.DeliveryMethodID, max(cte1.NumberOfCustomers) 
from cte1 inner join [Application].[DeliveryMethods] dm 
on cte1.DeliveryMethodID = dm.DeliveryMethodID group by cte1.DeliveryMethodID, dm.DeliveryMethodName

--7.For the CustomerCategory “Corporate Clients” (or any category of your choice), find the
--FullName of all SalesPersons and the number of Orders in which they received the order.

;with cte1 as
(select c.CustomerName, c.CustomerID, cc.CustomerCategoryName from [Sales].[CustomerCategories] cc 
inner join [Sales].[Customers] c on cc.CustomerCategoryID = c.CustomerCategoryID
where cc.CustomerCategoryName = 'Corporate')
select cte1.CustomerName, count(o.PickingCompletedWhen) from cte1 
inner join [Sales].[Orders] o on cte1.CustomerID = o.CustomerID 
where o.PickingCompletedWhen is NOT NULL group by cte1.CustomerID,cte1.CustomerName

--8. For each DeliveryCity, DeliveryMethod, TransactionType, PaymentMethod, find the number of
--CustomerTransactions and sum of TransactionAmount.

--Number of CustomerTransactions and sum of TransactionAmount grouped by DeliveryCity
select c.DeliveryCityID, count(ct.CustomerTransactionID) as NumberOfTransactions, sum(ct.TransactionAmount) as SumOfTransactionAmount
from [Sales].[CustomerTransactions] ct inner join [Sales].[Customers] c on ct.CustomerID = c.CustomerID
group by c.DeliveryCityID

--Number of CustomerTransactions and sum of TransactionAmount grouped by DeliveryMethod
select c.DeliveryMethodID, count(ct.CustomerTransactionID) as NumberOfTransactions, sum(ct.TransactionAmount) as SumOfTransactionAmount
from [Sales].[CustomerTransactions] ct inner join [Sales].[Customers] c on ct.CustomerID = c.CustomerID
group by c.DeliveryMethodID

--Number of CustomerTransactions and sum of TransactionAmount grouped by TransactionType
select ct.TransactionTypeID, count(ct.CustomerTransactionID) as NumberOfTransactions, sum(ct.TransactionAmount) as SumOfTransactionAmount
from [Sales].[CustomerTransactions] ct group by ct.TransactionTypeID

--Number of CustomerTransactions and sum of TransactionAmount grouped by PaymentMethod
select ct.PaymentMethodID, count(ct.CustomerTransactionID) as NumberOfTransactions, sum(ct.TransactionAmount) as SumOfTransactionAmount
from [Sales].[CustomerTransactions] ct group by ct.PaymentMethodID

--9. For each DeliveryCity, DeliveryMethod, TransactionType, PaymentMethod, find the average
--number of CustomerTransactions and average sum of TransactionAmount per Order. Create a
--view for this report.

--View of number of CustomerTransactions and average sum of TransactionAmount grouped by DeliveryCity
GO
create view v1 as
select c.DeliveryCityID, count(ct.CustomerTransactionID) as NumberOfTransactions, sum(ct.TransactionAmount) as SumOfTransactionAmount
from [Sales].[CustomerTransactions] ct inner join [Sales].[Customers] c on ct.CustomerID = c.CustomerID
group by c.DeliveryCityID
GO

select avg(v1.SumOfTransactionAmount) as AverageSumOfTransactions from v1
select v1.NumberOfTransactions from v1

--View of number of CustomerTransactions and average sum of TransactionAmount grouped by DeliveryMethod
GO
create view v2 as
select c.DeliveryMethodID, count(ct.CustomerTransactionID) as NumberOfTransactions, sum(ct.TransactionAmount) as SumOfTransactionAmount
from [Sales].[CustomerTransactions] ct inner join [Sales].[Customers] c on ct.CustomerID = c.CustomerID
group by c.DeliveryMethodID
GO

select avg(v2.SumOfTransactionAmount) as AverageSumOfTransactions from v2
select v2.NumberOfTransactions from v2

--View of number of CustomerTransactions and average sum of TransactionAmount grouped by TransactionType
GO
create view v3 as
select ct.TransactionTypeID, count(ct.CustomerTransactionID) as NumberOfTransactions, sum(ct.TransactionAmount) as SumOfTransactionAmount
from [Sales].[CustomerTransactions] ct group by ct.TransactionTypeID
GO

select avg(v3.SumOfTransactionAmount) as AverageSumOfTransactions from v3
select v3.NumberOfTransactions from v3

--View of number of CustomerTransactions and average sum of TransactionAmount grouped by PaymentMethod
GO
create view v4 as
select ct.PaymentMethodID, count(ct.CustomerTransactionID) as NumberOfTransactions, sum(ct.TransactionAmount) as SumOfTransactionAmount
from [Sales].[CustomerTransactions] ct group by ct.PaymentMethodID
GO

select avg(v4.SumOfTransactionAmount) as AverageSumOfTransactions from v4
select v4.NumberOfTransactions from v4

--10. Find the CustomerCategories that have at least one customer which had less than 5
--StockItemTransactions. 

;with cte1 as
(select sit.CustomerID, count(sit.StockItemTransactionID) as NumberOfSITransactions from Warehouse.StockItemTransactions sit
group by sit.CustomerID)
,cte2 as
(select c.CustomerCategoryID, cte1.* from cte1 inner join Sales.Customers c on cte1.CustomerID = c.CustomerID)
,cte3 as
(select * from cte2 where cte2.NumberOfSITransactions < 5)
,cte4 as
(select cte3.CustomerCategoryID, count(cte3.CustomerID) as NumberOfCustomers from cte3 group by CustomerCategoryID)
select * from cte4 where cte4.NumberOfCustomers >= 1