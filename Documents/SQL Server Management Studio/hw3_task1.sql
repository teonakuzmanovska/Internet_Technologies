CREATE TABLE [Room](
[Id] [int] IDENTITY(1,1) NOT NULL,
[HotelId] [int] NOT NULL,
[RoomTypeId] [int] NOT NULL,
[Floor] [int] NOT NULL,
CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED(
[Id] ASC
)
)

CREATE TABLE [RoomType](
[Id] [int] IDENTITY(1,1) NOT NULL,
[Name] [nvarchar](100) NOT NULL,
[NumBeds] [int] NOT NULL,
[NumPersons] [int] NOT NULL,
CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED(
[Id] ASC
)
)

CREATE TABLE [Reservation](
[Id] [int] IDENTITY(1,1) NOT NULL,
[PaymentTypeId] [int] NOT NULL,
[RoomId] [int] NOT NULL,
[ReservationDate] [date] NOT NULL,
[ArrivalDate] [date] NULL,
[DepartureDate] [date] NULL,
[Status] [nvarchar](100) NOT NULL,
[NumRooms] [int] NOT NULL,
CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED(
[Id] ASC
)
)

CREATE TABLE [Client](
[Id] [int] IDENTITY(1,1) NOT NULL,
[LandMarkId] [int] NULL,
[FirstName] [nvarchar](100) NOT NULL,
[LastName] [nvarchar](100) NOT NULL,
[Address] [nvarchar](100) NOT NULL,
[Country] [nvarchar](100) NOT NULL,
CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED(
[Id] ASC
)
)

CREATE TABLE [Hotel] (
[Id] [int] IDENTITY(1,1) NOT NULL,
[ClientCommentId] [int] NOT NULL,
[Name] [nvarchar](100) NOT NULL,
[Address] [nvarchar](100) NOT NULL,
[City] [nvarchar](100) NOT NULL,
[Country] [nvarchar](100) NOT NULL,
CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED(
[Id] ASC
)
)

CREATE TABLE [LandMark](
[Id] [int] IDENTITY(1,1) NOT NULL,
[Name] [nvarchar](100) NOT NULL,
[Description] [nvarchar](100) NOT NULL,
[Attractiveness] [int] NULL,
[OpeningHours] [time] NOT NULL,
[City] [nvarchar](100) NOT NULL,
CONSTRAINT [PK_LandMark] PRIMARY KEY CLUSTERED(
[Id] ASC
)
)

CREATE TABLE [PaymentType](
[Id] [int] IDENTITY(1,1) NOT NULL,
[RoomTypeId] [int] NOT NULL,
[HotelId] [int] NOT NULL,
[Price] [int] NOT NULL,
CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED(
[Id] ASC
)
)

CREATE TABLE [HotelsAndLandMarks](
[Id] [int] IDENTITY(1,1) NOT NULL,
[HotelId] [int] NOT NULL,
[LandMarkId] [int] NOT NULL,
[Distance] [float] NOT NULL,
CONSTRAINT [PK_HotelsAndLandMarks] PRIMARY KEY CLUSTERED(
[Id] ASC
)
)

CREATE TABLE [ClientComment](
[Id] [int] IDENTITY(1,1) NOT NULL,
[HotelId] [int] NOT NULL,
[ClientId] [int] NOT NULL,
[Date] [date] NOT NULL,
[Comment] [nvarchar](100) NULL,
[Rating] [float] NULL,
CONSTRAINT [PK_ClientComment] PRIMARY KEY CLUSTERED(
[Id] ASC
)
)

--references
ALTER TABLE [Room] ADD CONSTRAINT [FK_Room_Hotel] FOREIGN KEY([HotelId])
REFERENCES [Hotel]([Id])
GO

ALTER TABLE [Room] ADD CONSTRAINT [FK_Room_RoomType] FOREIGN KEY([RoomTypeId])
REFERENCES [RoomType]([Id])
GO

ALTER TABLE [Reservation] ADD CONSTRAINT [FK_Reservation_PaymentType] FOREIGN KEY([PaymentTypeId])
REFERENCES [PaymentType]([Id])
GO

ALTER TABLE [Reservation] ADD CONSTRAINT [FK_Reservation_Room] FOREIGN KEY([RoomId])
REFERENCES [Room]([Id])
GO

ALTER TABLE [Client] ADD CONSTRAINT [FK_Client_LandMark] FOREIGN KEY([LandMarkId])
REFERENCES [LandMark]([Id])
GO

ALTER TABLE [Hotel] ADD CONSTRAINT [FK_Hotel_ClientComment] FOREIGN KEY([ClientCommentId])
REFERENCES [ClientComment]([Id])
GO

ALTER TABLE [PaymentType] ADD CONSTRAINT [FK_PaymentType_RoomType] FOREIGN KEY([RoomTypeId])
REFERENCES [RoomType]([Id])
GO

ALTER TABLE [PaymentType] ADD CONSTRAINT [FK_PaymentType_Hotel] FOREIGN KEY([HotelId])
REFERENCES [Hotel]([Id])
GO

ALTER TABLE [HotelsAndLandMarks] ADD CONSTRAINT [FK_HotelsAndLandMarks_Hotel] FOREIGN KEY([HotelId])
REFERENCES [Hotel]([Id])
GO

ALTER TABLE [HotelsAndLandMarks] ADD CONSTRAINT [FK_HotelsAndLandMarks_LandMark] FOREIGN KEY([LandMarkId])
REFERENCES [LandMark]([Id])
GO

ALTER TABLE [ClientComment] ADD CONSTRAINT [FK_ClientComment_Hotel] FOREIGN KEY([HotelId])
REFERENCES [Hotel]([Id])
GO

ALTER TABLE [ClientComment] ADD CONSTRAINT [FK_ClientComment_Client] FOREIGN KEY([ClientId])
REFERENCES [Client]([Id])
GO