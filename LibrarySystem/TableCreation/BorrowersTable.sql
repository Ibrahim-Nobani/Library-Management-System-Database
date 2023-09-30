CREATE TABLE [Borrowers] (
  [ID] INT IDENTITY(1,1) PRIMARY KEY,
  [FirstName] varchar(100),
  [LastName] varchar(100),
  [Email] varchar(100),
  [DateOfBirth] DATE,
  [MembershipDate] DATE
);