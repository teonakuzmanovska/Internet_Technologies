--helpers
select * from dbo.OrderDetails
select * from dbo.Products
select * from dbo.Orders
select * from dbo.Consultants
select * from dbo.Categories
select * from dbo.Suppliers
select * from dbo.PostalCode

--1va
select * from dbo.Consultants con where con.ConsultantName like '% P%'

--2ra
select * from dbo.Consultants con where con.ConsultantName like '%ska M%'

--3ta
select con.ConsultantName from dbo.Consultants con where con.ConsultantName like '% _____'

--4ta
select con.ConsultantName from dbo.Consultants con where con.ConsultantName like '% _____%'

--5ta
select * from dbo.Products p where p.ProductName like '% %'

--6ta
select * from dbo.Products p where p.ProductName like '% %' and p.ProductName not like '% % %'

--7ma
select * from dbo.Products pro where pro.ProductName like '%D%' --dava i mali i golemi

--8ma
select p.ProductName from dbo.Products p left join dbo.OrderDetails od on p.ProductID = od.ProductID where od.ProductID is null

--9ta
select od.OrderID, sum(od.Quantity) from dbo.OrderDetails od group by od.OrderID

--10ta
select od.ProductID, count(od.OrderID) from dbo.OrderDetails od group by od.ProductID

--11ta 
create table NumberOfOrders(
ProductID [int] NOT NULL,
OrderCount [int] NOT NULL
)
insert into dbo.NumberOfOrders
select od.ProductID, count(od.OrderID) as OrderCount from dbo.OrderDetails od group by od.ProductID

create table MoreThan2Orders(
ProductID [int] NOT NULL,
OrderCount [int] NOT NULL
)
insert into MoreThan2Orders
select * from dbo.NumberOfOrders noo where noo.OrderCount >= 2

select p.* from dbo.MoreThan2Orders m2o inner join dbo.Products p on m2o.ProductID = p.ProductID

--12ta
create table ProfitsPerConsultants(
[ConsultantID] [int] NOT NULL,
[ProductPoints] [int] NOT NULL
)
insert into dbo.ProfitsPerConsultants
select o.ConsultantID, p.ProductPoints from dbo.Orders o inner join dbo.OrderDetails od 
on o.OrderID = od.OrderID inner join dbo.Products p 
on od.ProductID = p.ProductID

select ppc.ConsultantID,sum(ppc.ProductPoints) from dbo.ProfitsPerConsultants ppc group by ppc.ConsultantID

--13ta

create table Perfumes(
Productname nvarchar(100) NOT NULL,
ProductID [int] NOT NULL,
ProductPrice [int] NOT NULL,
ProductCategory [int] NOT NULL
)
insert into Perfumes
select p.ProductName, p.ProductID, p.ProductPrice, p.CategoryID from dbo.Products p where p.CategoryID = 1

create table NotPerfumes(
Productname nvarchar(100) NOT NULL,
ProductID [int] NOT NULL,
ProductPrice [int] NOT NULL,
ProductCategory [int] NOT NULL
)
insert into NotPerfumes
select pro.ProductName, pro.ProductID, pro.ProductPrice, pro.CategoryID from dbo.Products pro 
left join dbo.Perfumes per on pro.ProductID = per.ProductID where per.ProductID is null

select distinct np.Productname from dbo.NotPerfumes np, dbo.Perfumes p where np.ProductPrice > p.ProductPrice

--14ta

create table SumsProfitsPerConsultant(
[ProfitsPerConsultant] [int] NOT NULL
)
insert into dbo.SumsProfitsPerConsultant
select sum(ppc.ProductPoints) from dbo.ProfitsPerConsultants ppc group by ppc.ConsultantID

select avg(sppc.ProfitsPerConsultant) from dbo.SumsProfitsPerConsultant sppc

--15ta
create table OrderPrices(
ProductID [int] NOT NULL,
ProductPrice [int] NOT NULL,
OrderID [int] NOT NULL,
Quantity [int] NOT NULL
)
insert into OrderPrices
select p.ProductID,p.ProductPrice,od.OrderID,od.Quantity from dbo.Products p 
inner join dbo.OrderDetails od on p.ProductID = od.ProductID

create table SumOrderPrices(
OrderID [int] NOT NULL,
OrderPrice [int] NOT NULL
)

insert into SumOrderPrices
select op.OrderID, sum(op.ProductPrice*op.Quantity) from dbo.OrderPrices op group by op.OrderID

select avg(sop.OrderPrice) from SumOrderPrices sop

--16ta
create table ProductsPerOrder(
OrderID [int] NOT NULL,
NumProducts [int] NOT NULL
)
insert into ProductsPerOrder 
select od.OrderID,sum(od.Quantity) from dbo.OrderDetails od group by od.OrderID

select avg(ppo.NumProducts) from ProductsPerOrder ppo

--17ta
create table MaxPrice(
ProductID [int] NOT NULL,
ProductPrice [int] NOT NULL
)
insert into MaxPrice
select p.ProductID, p.ProductPrice from dbo.Products p 
where p.ProductPrice = (select max(p.ProductPrice) from dbo.Products p inner join Products q on p.ProductID = q.ProductID)

create table JoinedOrderDetailsAndOrder(
OrderId [int] NOT NULL,
ConsultantId [int] NOT NULL,
ProductID [int] NOT NULL
)
insert into JoinedOrderDetailsAndOrder
select o.OrderID,o.ConsultantID,od.ProductID from dbo.Orders o inner join dbo.OrderDetails od on o.OrderID = od.OrderID

select count(ConsultantId),count(OrderId) from dbo.JoinedOrderDetailsAndOrder jodo 
inner join dbo.MaxPrice mp on jodo.ProductID = mp.ProductID group by jodo.ConsultantId, jodo.ProductID

create table JoinedConsultantNames(
OrderID [int] NOT NULL,
ConsultantID [int] NOT NULL,
ProductID [int] NOT NULL,
ConsultantName nvarchar(100) NOT NULL
)
insert into JoinedConsultantNames
select jodo.*, con.ConsultantName from dbo.JoinedOrderDetailsAndOrder jodo inner join dbo.Consultants con 
on jodo.ConsultantId = con.ConsultantID

select jcn.ConsultantName from JoinedConsultantNames jcn inner join MaxPrice mp on jcn.ProductID = mp.ProductID