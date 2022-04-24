--NumberOfEmployees of type Integer, NumberOfEmployeesActive of type Integer, and AverageSickHours of type decimal in the Department table
--TotalDurationHours of type Integer in the Shift table
--NumberOfPayouts of type Integer in the Employee table

select * from [HumanResources].[Department]
select * from [HumanResources].[Shift]
select * from [HumanResources].[Employee]

ALTER TABLE [HumanResources].[Department]
ADD NumberOfEmployees INT

ALTER TABLE [HumanResources].[Department]
ADD NumberOfEmployeesActive INT

ALTER TABLE [HumanResources].[Department]
ADD AverageSickHours DECIMAL(10,2)

ALTER TABLE [HumanResources].[Shift]
ADD TotalDurationHours INT

ALTER TABLE [HumanResources].[Employee]
ADD NumberOfPayouts INT

select * from [HumanResources].[Employee] e 
where e.MaritalStatus = 'M' and e.Gender='F' and e.HireDate like '2009-__-__'

CREATE INDEX ix_Married on [HumanResources].[Employee](MaritalStatus, Gender, HireDate)

select * from [HumanResources].[Department]
select * from [HumanResources].[Shift]
select * from [HumanResources].[Employee]

select * from [HumanResources].[EmployeeDepartmentHistory]

--departmani koi rabotat prva smena
GO
create view v1
as
select distinct dh.DepartmentID from [HumanResources].[EmployeeDepartmentHistory] dh
where dh.EndDate is null
GO

--departmani koi ne rabotat prva smena

;with cte1 as
(select distinct dh.DepartmentID from [HumanResources].[EmployeeDepartmentHistory] dh
where dh.EndDate is null and dh.ShiftID <> 1)
--,cte2 as 
select cte1.DepartmentID as NePrva, v1.DepartmentID as PrvaSmena from cte1 right join v1 on cte1.DepartmentID = v1.DepartmentID
--delete from cte2 where cte2.NePrva is not null





--select c.*
--from dbo.Customer c
--left join dbo.Account a on c.Id=a.CustomerId and a.CurrencyId=@CurrencyId
----left join dbo.Account a on c.Id=a.CustomerId and a.CurrencyId=(select Id from dbo.Currency where Name='Euro')
--where a.Id is null -- anti-join
