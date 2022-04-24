--id, code, currency , conv rate, particular date 
use hw6;

create table CurrencyRates(
	 rateId int identity(1,1),
	 currencyId int, 
	 --Code nvarchar(5), 
	 --Name nvarchar(100),
	 --ShortName nvarchar(20),
	 Rate decimal(18,2),
	 DateOfRate datetime,
	 primary key(rateId)
)

alter table CurrencyRates add constraint FK_CurrencyId foreign key (currencyId) references Currency(Id);

--Next, populate the newly created table CurrencyRates with some data for one particular date and then
--using a cross apply operator and the date range found in AccountDetails, insert additional data so we
--have a conversion rate for any date.

--za sekoe currency id da stavime rate i datum
insert into dbo.CurrencyRates (currencyId, Rate, DateOfRate) values (1,1, CURRENT_TIMESTAMP);
insert into dbo.CurrencyRates (currencyId, Rate, DateOfRate) values (2,31.5446, CURRENT_TIMESTAMP);
insert into dbo.CurrencyRates (currencyId, Rate, DateOfRate) values (3,0.52, CURRENT_TIMESTAMP);
insert into dbo.CurrencyRates (currencyId, Rate, DateOfRate) values (4,8.2052, CURRENT_TIMESTAMP);
insert into dbo.CurrencyRates (currencyId, Rate, DateOfRate) values (5,61.6950, CURRENT_TIMESTAMP);
insert into dbo.CurrencyRates (currencyId, Rate, DateOfRate) values (6,54.5057, CURRENT_TIMESTAMP);
																										  
select *
from CurrencyRates cr
join Currency c on  cr.currencyId=c.Id


--Next, you need to extend the Customer table with a new column CurrentBalanceMKD.
--This column should contain the current balance considering all accounts that the customer has in any of the currencies.


alter table Customer 
add CurrentBalanceMKD decimal(18,2);

select * from Customer

;with cte as(
select	ad.AccountId,
		sum(Amount) TotalAmount
from AccountDetails ad
group by ad.AccountId)

update a 
set CurrentBalance=TotalAmount
from Account a
join cte on a.Id=cte.AccountId

select * from Account

--za sekoj customer da se proveri currency id i vrz baza na toa da se zeme amountot od smetkata i da se pomnozi po rateot
--i da se zacuva vo currentBalMkd

select * from Customer
select * from Account
select * from CurrencyRates

;with cte1 as
(select c.Id, sum(a.CurrentBalance * cr.Rate) as CurrentMKD from Customer c inner join Account a on  c.Id = a.CustomerId
inner join CurrencyRates cr on a.CurrencyId = cr.currencyId group by c.Id
)
update c
set c.CurrencyBalanceMKD = cte1.CurrentMKD
from Customer c inner join cte1 on c.Id = cte1.Id

--;with cur as (
--		select c.Id,
--			   sum(a.CurrentBalance * cr.Rate) as CurrentMKD
--from Customer c
--join Account a on c.Id=a.CustomerId
--join CurrencyRates cr on a.CurrencyId=cr.currencyId
--group by c.Id)

--update c
--	set c.CurrentBalanceMKD = cr.CurrentMKD
--from Customer c 
--join cur cr on c.Id=cr.Id

select * from Customer

--s. After each insert, update or delete of a record in AccountDetails, the CurrentBalanceMKD
--needs to be updated accordingly
go
create or alter trigger TR_AccountDetails_INSERT
	on AccountDetails
	after insert
as
begin
	set nocount on;

	--insert statements for trigger
	with cte as (
	select i.AccountId,
		   sum(Amount) TotalAmount
	from inserted i
	group by i.AccountId)

	--action
	update a 
		set a.CurrentBalance = a.CurrentBalance+cte.TotalAmount
	from Account a
	join cte on a.Id=cte.AccountId
end

go
create or alter trigger TR_AccountDetails_DELETE
	on AccountDetails
	after delete
as
begin
	set nocount on;
	--insert statements for trigger
	with cte as (
	select i.AccountId,
		   sum(Amount) TotalAmount
	from inserted i
	group by i.AccountId)

	update a 
		set a.CurrentBalance = a.CurrentBalance-cte.TotalAmount
	from Account a
	join cte on a.Id=cte.AccountId
end
go
create or alter trigger TR_MKDBalance_Update
	on Account
	after update
as
begin
	set nocount on;
	--insert statements for trigger
	with cte as (
	select i.CustomerId,
			i.CurrencyId,
			i.CurrentBalance newBalance,
			d.CurrentBalance oldBalance
	from inserted i
	join deleted d on  d.Id=i.Id
	where d.CurrentBalance!=i.CurrentBalance
	group by i.CustomerId,
			i.CurrencyId,
			i.CurrentBalance,
			d.CurrentBalance)

	update c
			set c.CurrentBalanceMKD = c.CurrentBalanceMKD - (cte.oldBalance * cr.Rate) + (cte.newBalance * cr.Rate)
	from Customer c
	join cte on c.Id=cte.CustomerId
	join CurrencyRates cr on cte.CurrencyId=cr.currencyId
end

insert into AccountDetails (AccountId, LocationId, EmployeeId, TransactionDate, Amount, PurposeCode, PurposeDescription) 
values (9, 74, 9, CURRENT_TIMESTAMP, 10000, 930, 'isplata') 


select * from Account
select * from AccountDetails
select * from Customer

--Write a DML query that identifies the customers whose first name is 'Dime'. 
--Then, find the AccountDetails for the ‘Dime’ customer with the smallest Id (in the Customer’s table) and where the
--CurrencyCode is ('807','Denar','MKD'). 

select sum(ad.Amount) as SummarizedAmount
from (select c.Id,
		c.FirstName,
		cur.Code,
		a.Id as AccountId
from Customer c 
join Account a on c.Id=a.CustomerId
join Currency cur on a.CurrencyId=cur.Id
where FirstName like 'Aleksandra' and
	   cur.Code in ('807','Denar','MKD')
group by c.Id, 
		 c.FirstName,
		 cur.Code, 
		 a.Id) prv
join AccountDetails ad on prv.AccountId=ad.AccountId