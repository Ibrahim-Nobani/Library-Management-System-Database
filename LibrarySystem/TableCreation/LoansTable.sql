CREATE TABLE [Loans] (
  [ID] INT IDENTITY(1,1) PRIMARY KEY,
  [BookID] INT,
  [BorrowerID] INT,
  [DateBorrowed] DATE,
  [DueDate] DATE,
  [DateReturned] DATE NULL,
  FOREIGN KEY ([BookID]) REFERENCES [Books]([BookID]),
  FOREIGN KEY ([BorrowerID]) REFERENCES [Borrowers]([BorrowerID])
);