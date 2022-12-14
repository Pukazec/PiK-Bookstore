
USE [master]
GO
DROP DATABASE IF EXISTS [PraKnjizara]
GO
CREATE DATABASE [PraKnjizara]
GO
USE [PraKnjizara]

---------------------------------------------------------Tables----------------------------------------------

CREATE TABLE Author(
	[IDAuthor] [int] PRIMARY KEY IDENTITY,
	[FirstName] [nvarchar](250) NULL,
	[LastName] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[Biography] [nvarchar](max) NULL,
	[DeletedAt] [datetime] NULL
)

CREATE TABLE Person(
	IDUser int PRIMARY KEY IDENTITY,
	FirstName nvarchar(250) NOT NULL,
	LastName nvarchar(250) NOT NULL,
	Email nvarchar(250) NOT NULL,
	Password nvarchar(250) NOT NULL,
	City nvarchar(250) NULL,
	ZipCode nvarchar(250) NULL,
	StreetName nvarchar(250) NULL,
	PersonCode nvarchar(250) NULL,
	StreetNumber nvarchar(250) NULL,
	OIB nvarchar(250) NULL,
	Workplace nvarchar(250) NULL,
	CreatedAt DATETIME NOT NULL,
	DeletedAt datetime NULL
)

CREATE TABLE Book(
	IDBook int PRIMARY KEY IDENTITY,
	Title nvarchar(250) NOT NULL,
	AuthorID int FOREIGN KEY REFERENCES [Author] (IDAuthor),
	Description nvarchar(max) NULL,
	ISBN NVARCHAR(50) NOT NULL,
	Used BIT NOT NULL,
	InStock INT NOT NULL,
	Price MONEY NOT NULL,
	Cover nvarchar(MAX) NULL,
	Publisher nvarchar(250) NULL,
	Ganre nvarchar(250) NULL,
	Tags nvarchar(max) NULL,
	ReleseYear datetime NULL,
	CreatedAt DATETIME NOT NULL,
	DeletedAt datetime NULL
)

CREATE TABLE Contact
(
	IdContact INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(250) NULL,
	Email NVARCHAR(250) NOT NULL,
	Message NVARCHAR(MAX) NOT NULL,
	Viewed BIT NULL,
	CreatedAt DATETIME
)

CREATE TABLE Bookstore(
	[IDBookstore] [int] PRIMARY KEY IDENTITY,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[IBAN] [nvarchar](100) NOT NULL,
)

CREATE TABLE Purchase(
	IDPurchase int PRIMARY KEY IDENTITY,
	CreatedAt datetime NOT NULL,
	InStorePayment BIT NULL,
	Payed BIT NOT NULL,
	Delivery BIT NULL,
	UserId int FOREIGN KEY REFERENCES [Person] (IDUser),
	BookID int FOREIGN KEY REFERENCES [Book] (IDBook)
)

CREATE TABLE BorrowBook(
	IDBorrow int PRIMARY KEY IDENTITY,
	Returned BIT NOT NULL,
	CreatedAt DATETIME NOT NULL,
	ReturnDate DATETIME NOT NULL,
	InStorePayment BIT NULL,
	Payed BIT NOT NULL,
	Delivery BIT NULL,
	BookstoreId INT FOREIGN KEY REFERENCES Bookstore(IdBookstore),
	UserId int FOREIGN KEY REFERENCES Person (IDUser),
	BookID int FOREIGN KEY REFERENCES Book (IDBook)
)

CREATE TABLE [dbo].[BookstoreEmployees](
	[IDbookstoreEmployee] [int] PRIMARY KEY IDENTITY,
	[EmployeeID] [int] FOREIGN KEY REFERENCES [Person] (IDUser),
	[BookstoreID] [int] FOREIGN KEY REFERENCES [Bookstore] (IDBookstore)
)
GO
