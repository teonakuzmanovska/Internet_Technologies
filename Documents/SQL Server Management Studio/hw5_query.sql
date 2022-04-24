select * from dbo.Employee
select * from dbo.Currency
select * from dbo.Customer
select * from dbo.Location
select * from dbo.LocationType
select * from dbo.Account
select * from dbo.AccountDetails

--HW6 Triggers and Indexing

--part1

create table CurrencyRates(
	CurrencyRateId int primary key identity(1,1),
	CurrencyRate decimal(10,2) not null,
	CurrencyIdFrom int foreign key references Currency(id),
	CurrencyIdTo int foreign key references Currency(id) default 1,
	CreatedDate date default cast(getdate() as date)
)

insert into CurrencyRates (CurrencyRate,CurrencyIdFrom)
values
(31.48, 2), --to BGN
(0.52, 3), --to RSD
(8.20, 4), --to HRK
(61.64, 5), --to EUR
(53.77, 6) --to USD	

select * from dbo.CurrencyRates
select * from dbo.Currency
select * from dbo.Account
select * from dbo.AccountDetails

insert into CurrencyRates (CreatedDate,CurrencyRate,CurrencyIdFrom)
select  distinct ad.TransactionDate, cr.CurrencyRate,cr.CurrencyIdFrom 
from AccountDetails ad cross join CurrencyRates cr

--part 2

select * from Customer
select * from AccountDetails
select * from Account

alter table Customer
add CurrentBalanceMKD decimal(18,2) default 0.00

GO
CREATE OR ALTER TRIGGER dbo.TR_Account_Delete
   ON dbo.Account
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	
END
GO

