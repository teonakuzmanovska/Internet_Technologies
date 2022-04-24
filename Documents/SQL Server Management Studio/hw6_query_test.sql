use hw6

GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Gender] [nchar](1) NULL,
	[NationalIDNumber] [nvarchar](15) NULL,
	[DateOfBirth] [date] NULL,
	[City] [nvarchar](100) NULL,
	ClientAddress [nvarchar](400) NULL,
	[RegionName] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))


CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[NationalIDNumber] [nvarchar](15) NULL,
	[JobTitle] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[MaritalStatus] [nchar](1) NULL,
	[Gender] [nchar](1) NULL,
	[HireDate] [date] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
))


CREATE TABLE [dbo].[LocationType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_LocationType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))

CREATE TABLE [dbo].[Location](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LocationTypeId] [int] NOT NULL,-- foreign key references [dbo].[LocationType](Id),
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))


CREATE TABLE [dbo].[Currency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](5) NULL,
	[Name] [nvarchar](100) NULL,
	[ShortName] [nvarchar](20) NULL,
	[CountryName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))

CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountNumber] [nvarchar](20) NULL,
	[CustomerId] [int] NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[AllowedOverdraft] [decimal](18, 2) NULL,
	[CurrentBalance] [decimal](18, 2) NULL,
	[CreatedBy_EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))

--

CREATE TABLE [dbo].[AccountDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[EmployeeId] [int] NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[PurposeCode] [smallint] NULL,
	[PurposeDescription] [nvarchar](100) NULL,
 CONSTRAINT [PK_AccountDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))

-- References
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Currency] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currency] ([id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Currency]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE dbo.Account add constraint UQ_Account_Currency  UNIQUE (CustomerId, CurrencyId)
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Customer]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Employee] FOREIGN KEY([CreatedBy_EmployeeId])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Employee]
GO
ALTER TABLE [dbo].[AccountDetails]  WITH CHECK ADD  CONSTRAINT [FK_AccountDetails_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[AccountDetails] CHECK CONSTRAINT [FK_AccountDetails_Account]
GO
ALTER TABLE [dbo].[AccountDetails]  WITH CHECK ADD  CONSTRAINT [FK_AccountDetails_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[AccountDetails] CHECK CONSTRAINT [FK_AccountDetails_Employee]
GO
ALTER TABLE [dbo].[AccountDetails]  WITH CHECK ADD  CONSTRAINT [FK_AccountDetails_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([Id])
GO
ALTER TABLE [dbo].[AccountDetails] CHECK CONSTRAINT [FK_AccountDetails_Location]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_LocationType] FOREIGN KEY([LocationTypeId])
REFERENCES [dbo].[LocationType] ([Id])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_LocationType]
GO

DROP TABLE IF EXISTS #City;
DROP TABLE IF EXISTS #nums;

CREATE TABLE #City (Name nvarchar(100))
INSERT INTO #City values ('Skopje'),('Bitola'),('Ohrid'),('Kumanovo'),('Prilep'),('Resen')
GO
--select * from #City

Create table #nums (id int, idText nvarchar(100))
insert into #nums
select top 100 row_Number() OVER (Order by (select 0)) as id, cast(row_Number() OVER (Order by (select 0)) as nvarchar(100)) as idText
FROM sys.objects


delete from dbo.AccountDetails where 1=1;
delete from dbo.Account where 1=1;
delete from dbo.Location where 1=1;
delete from dbo.LocationType where 1=1;
DELETE from dbo.Customer where 1=1;
DELETE from dbo.Currency where 1=1;
delete from dbo.Employee where 1=1;
GO

------ add rest of tables
--DBCC CHECKIDENT ('Employee', RESEED, 0)
--DBCC CHECKIDENT ('LocationType', RESEED, 0)
--DBCC CHECKIDENT ('Location', RESEED, 0)
--DBCC CHECKIDENT ('Currency', RESEED, 0)
--DBCC CHECKIDENT ('AccountDetails', RESEED, 0)
--DBCC CHECKIDENT ('Account', RESEED, 0)
--DBCC CHECKIDENT ('Customer', RESEED, 0)
--GO

insert into dbo.LocationType (Name,Description)
values ('Region Branch','Regional office'), ('City Branch','City branch office'), ('Internet','Internet from e-bank')
GO

insert into dbo.LocationType (Name,Description)
values ('ATM','ATM cash')
GO

insert into dbo.LocationType (Name,Description)
values ('Clearing House','Clearing House')
GO

--select * from dbo.locationType

-- location
insert into dbo.Location (LocationTypeId,Name)
values (1,'Bitola branch office'), (1,'Ohrid branch office'), (1,'Stip branch office'), (1,'Strumica branch office'), (1,'Veles branch office'), (1,'Tetovo branch office')
GO

insert into dbo.Location (LocationTypeId,Name)
values (2,'Kavadarci city branch office'), (2,'Negotino city branch office'), (2,'Kocani city branch office'), (2,'Gostivar city branch office')
GO

insert into dbo.Location (LocationTypeId,Name)
values (3,'E-bank'), (3,'M-bank')
GO

insert into dbo.Location (LocationTypeId,Name)
select 4 as LocationTypeId , 'ATM ' + c.Name + ' ' + n.idText
from #City c 
cross apply #nums n 
where n.id <= 10
order by c.Name

insert into dbo.Location (LocationTypeId,Name)
values (5,'KIBS'), (5,'MIPS')
GO

--select * from dbo.locationtype
--select * from Location

-- Employee

-- Employee table
declare @id bigint=null
declare @FirstName table (FirstName nvarchar(50))
insert into @FirstName values ('Dime'),('Ivan'),('Borce'),('Goce'),('Dimitar'),('Vaska'),('Nikola'),('Marija'),('Marina'),('Vesna')

declare @LastName table (LastName nvarchar(50))
insert into @LastName values ('Popovski'),('Petrovski'),('Nikolov'),('Dimitrov'),('Lazarov'),('Ristovski'),('Naumovski'),('Todorov'),('Trajanov'),('Petrov')

insert into dbo.Employee (FirstName,LastName,DateOfBirth,Gender,HireDate,NationalIdNumber)
select f.FirstName, l.LastName,'1900.01.01' as dateOfBirth,
	case when FirstName in ('Vaska','Marija','Marina','Vesna') then 'F'
		 when LastName like '%' or FirstName in  ('Dime','Ivan','Borce','Goce','Dimitar') then 'M'
		else 'U' end as Gender,
	'2015-01-01' as HireDate,	1 as IdNumber
from @FirstName f
CROSS JOIN @LastName l
GO

drop table if exists #tmp
select e.Id, e.FirstName + N' ' + e.LastName as FullName
into #tmp
from dbo.Employee e
where Id<10

select * from #tmp

go

select * from #tmp
select * from dbo.Employee e


update e
set DateOfBirth = dateadd(MM,Id,DateOfBirth),  
	HireDate = dateadd(MM,2*Id,'1990.01.01'), 
	NationalIdNumber =  id + cast(10000000 * rand(id*10) as int)
from dbo.Employee e
GO


go

-- Customer data
declare @FirstName table (FirstName nvarchar(50))
insert into @FirstName values ('Aleksandra'),('Ana'),('Biljana'),('Biba'),('Branka'),('Viktorija'),('Violeta'),('Gordana'),('Gabriela'),('Galaba'),('Dushanka'),('Danka'),('Daniela'),('Dragana'),('Divna')
insert into @FirstName values ('Goce'),('Goran'),('Gligor'),('Gorast'),('Zlatko'),('Zivko'),('Ivan'),('Ilija'),('Jordan'),('Kire'),('Koco'),('Kristijan'),('Krsto'),('Kalin'),('Petar')

declare @LastName table (LastName nvarchar(50))
insert into @LastName values ('Atanasov'),('Aleksovski'),('Andonov'),('Bojcevski'),('Boskovski'),('Bojadzive'),('Gogov'),('Gligorov'),('Todorov'),('Trajkovski')


insert into dbo.customer (FirstName,LastName,DateOfBirth,Gender,NationalIdNumber, isActive)
select f.FirstName, l.LastName,'1900.01.01' as date, case when FirstName in ('Aleksandra','Ana','Biljana','Biba','Branka','Viktorija','Violeta','Gordana','Gabriela','Galaba','Dushanka','Danka','Daniela','Dragana','Divna') then 'F' else 'M' end as Gender,
1 as IdNumber, 1 as isActive
from @FirstName f
CROSS JOIN @LastName l

update e set DateOfBirth = dateadd(MM,Id,DateOfBirth),  
			 NationalIdNumber =  id + cast(10000000 * rand(id*10) as int),
			 City = case when id % 6 = 0 then 'Skopje' 
						 when id % 6 = 1 then 'Bitola' 
						 when id % 6 = 2 then 'Ohrid' 
						 when id % 6 = 3 then 'Kumanovo' 
						 when id % 6 = 4 then 'Prilep' 
						 when id % 6 = 5 then 'Resen' end
from dbo.customer e
GO

-- Currency rates
insert into dbo.Currency (code, Name, ShortName, CountryName) values ('807','Denar','MKD','REPUBLIC OF MACEDONIA')
insert into dbo.Currency (code, Name, ShortName, CountryName) values ('975','Bulgarian Lev','BGN','BULGARIA')
insert into dbo.Currency (code, Name, ShortName, CountryName) values ('941','Serbian Dinar','RSD','SERBIA')
insert into dbo.Currency (code, Name, ShortName, CountryName) values ('191','Kuna','HRK','CROATIA')
insert into dbo.Currency (code, Name, ShortName, CountryName) values ('978','Euro','EUR','GERMANY')
insert into dbo.Currency (code, Name, ShortName, CountryName) values ('840','US Dollar','USD','UNITED STATES OF AMERICA')
GO

-- Account

-- mkd and eur accounts
insert into dbo.Account (AccountNumber,CustomerId,CurrencyId,AllowedOverdraft,CurrentBalance,CreatedBy_EmployeeId)
select '210123456789012' as AcctNum, c.id CustomerId, e.id as CurrencyId, 10000 as AllowedOverDraft, 0 as CurrentBalance, 1 AS EmployeeId
from dbo.Customer c
cross apply dbo.Currency e
where e.code in ('807','978')

update A
	set AccountNumber = CAST((cast(AccountNumber AS BIGINT) + id) AS nvarchar(20)) ,
	AllowedOverdraft = a.AllowedOverdraft + 100*id ,
	CreatedBy_EmployeeId = (select top 1 id from dbo.Employee e where e.id%100 = a.id%100)
from dbo.Account A



--select * from dbo.Account

-- Account Details

-- priliv

-- odliv

--select * from dbo.Currency
--select * from dbo.AccountDetails
--select * from dbo.Location


-- plata na denarska smetka
insert into dbo.AccountDetails(AccountId,LocationId,EmployeeId,TransactionDate,Amount,PurposeCode,PurposeDescription)
select a.id as AcctId, l.id as LocationId, null as EmployeeId,'2019.01.01' as TransactionDate,40000 + 25*a.id as Amount, '101' as purposeCode,'plata' as PurposeDescription
from dbo.Account a
cross apply dbo.Location l 
where l.name = 'MIPS'
and a.CurrencyId = 1

-- uplata kes na devizna smetka (eur)
insert into dbo.AccountDetails
select a.id as AcctId, l.id as LocationId, null as EmployeeId,'2019.01.01' as TransactionDate,1000 + l.Id*25 as Amount, '930' as purposeCode,'uplata na devizi' as PurposeDescription
from dbo.Account a
cross apply dbo.Location l 
where l.id %10 = a.id %100
and a.CurrencyId = 5

-- isplata od denarska smetka
insert into dbo.AccountDetails
select a.id as AcctId, l.id as LocationId, 
case when l.name like '%branch%' then (select top 1 id from dbo.Employee e where e.id%100 =  a.id %100) else null end as EmployeeId,
dateadd(dd,(a.id % 20 + l.id % 100),'2019.01.15')  as TransactionDate,- (972 + 13*l.Id) as Amount, '930' as purposeCode,'isplata' as PurposeDescription
from dbo.Account a
cross apply dbo.Location l 
where l.id %10 = a.id %10
and a.CurrencyId = 1

-- isplata od dev smetka
-- to do

select count(*) from dbo.AccountDetails


---- sostojba
--select AccountId, sum(amount) 
--from dbo.AccountDetails
-- where 1=1 -- AccountId = 1
-- group by AccountId
-- order by 1 asc


select * from dbo.Employee
select * from dbo.Currency
select * from dbo.Customer
select * from dbo.Location
select * from dbo.LocationType
select * from dbo.Account
select * from dbo.AccountDetails

--Part 1
create table CurrencyConversion(Id int primary key identity(1,1),
MKDId int foreign key references Currency(Id) default 1,
CurrencyId int foreign key references Currency(Id),
CreatedDate date default getutcdate(),
CurrencyRate decimal(10,2) not null
)


insert into CurrencyConversion(CurrencyId,CurrencyRate)
values
(2, 31.48), --BGN
(3, 0.52), --RSD
(4, 8.20), --HRK
(5, 61.64), --EUR
(6, 53.77) --USD

insert into CurrencyConversion(MKDId,CurrencyId,CurrencyRate, CreatedDate)
select distinct cc.MKDId, cc.CurrencyId, cc.CurrencyRate, ad.TransactionDate 
from CurrencyConversion cc cross apply AccountDetails ad

--same as the one up

--select * from (select MKDId, CurrencyId, CurrencyRate from CurrencyConversion) as cc
--cross apply
--(select distinct TransactionDate from AccountDetails) as ad

--Part 2

GO
CREATE OR ALTER TRIGGER dbo.TR_AccountDetails_Insert
   ON dbo.AccountDetails
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

	select * from Customer
	select * from Account
	select * from CurrencyConversion

	create index ix_CurrentBalance on Account(CurrentBalance)

	alter table Customer
	add CurrencyBalanceMKD decimal(18,2) default 0.00 not null
	
	;with cte as 
	(select i.AccountId, sum(i.Amount) as TotalAmount from inserted i group by i.AccountId)
	select * from cte

	--action
	update a 
		set a.CurrentBalance = a.CurrentBalance+cte.TotalAmount
	from Account a
	join cte on a.Id=cte.AccountId

END
GO