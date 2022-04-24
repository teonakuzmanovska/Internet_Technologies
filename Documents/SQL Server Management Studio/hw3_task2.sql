CREATE TABLE [AdditionalService](
[Id] [int] IDENTITY(1,1) NOT NULL,
[Name] [nvarchar](100) NULL,
CONSTRAINT [PK_AdditionalService] PRIMARY KEY CLUSTERED(
[Id] ASC
)
)

CREATE TABLE [AdditionalPlan](
[Id] [int] IDENTITY(1,1) NOT NULL,
[Name] [nvarchar](100) NULL,
[Description] [nvarchar](100) NULL,
CONSTRAINT [PK_AdditionalPlan] PRIMARY KEY CLUSTERED(
[Id] ASC
)
)

CREATE TABLE [NumberPlan](
[Id] [int] IDENTITY(1,1) NOT NULL,
[TelephoneNumberId] [int] NOT NULL,
[Description] [nvarchar](100) NULL,
CONSTRAINT [PK_NumberPlan] PRIMARY KEY CLUSTERED(
[Id] ASC
)
)

CREATE TABLE [TelephoneNumber](
[Number] [int] IDENTITY(0,1) NOT NULL,
CONSTRAINT [PK_TelephoneNumber] PRIMARY KEY CLUSTERED(
[Number] ASC
)
)

CREATE TABLE [Aggreement](
[Id] [int] IDENTITY(1,1) NOT NULL,
[MobileOperatorId] [int] NOT NULL,
[Date] [date] NOT NULL,
CONSTRAINT [PK_Aggreement] PRIMARY KEY CLUSTERED(
[Id] ASC
)
)

CREATE TABLE [MobileOperator](
[Id] [int] IDENTITY(1,1) NOT NULL,
[Name] [nvarchar](100) NULL,
[Description] [nvarchar](100) NULL,
CONSTRAINT [PK_MobileOperator] PRIMARY KEY CLUSTERED(
[Id] ASC
)
)

CREATE TABLE [Client](
[SSN] [int] IDENTITY(1,1) NOT NULL,
[City] [nvarchar](100) NOT NULL,
[Street] [nvarchar](100) NOT NULL,
[TelephoneNumberId] [int] NOT NULL,
CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED(
[SSN] ASC
)
)

--constraints and references
ALTER TABLE [NumberPlan] ADD CONSTRAINT [FK_NumberPlan_TelephoneNumber] FOREIGN KEY([TelephoneNumberId])
REFERENCES [TelephoneNumber]([Number]) ON DELETE CASCADE
GO

ALTER TABLE [Aggreement] ADD CONSTRAINT [FK_Aggreement_MobileOperator] FOREIGN KEY([MobileOperatorId])
REFERENCES [MobileOperator]([Id]) ON DELETE CASCADE
GO

ALTER TABLE [Client]
ADD CONSTRAINT [UQ_Client] UNIQUE ([SSN]);   
GO  

ALTER TABLE [Client] ALTER COLUMN [SSN] INT NOT NULL;
GO

ALTER TABLE [MobileOperator] WITH CHECK 
ADD  CONSTRAINT [CHK_Name_Empty] CHECK  (([Name]<>N''))
GO

ALTER TABLE [MobileOperator] ADD  CONSTRAINT [CHK_TMobile]
CHECK ([Name] <> 'TMobile')
GO

ALTER TABLE [MobileOperator] ADD  CONSTRAINT [CHK_Vip]
CHECK ([Name] <> 'Vip.One')
GO