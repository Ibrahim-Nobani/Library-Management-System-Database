CREATE TABLE [Books] (
  [BookID] INT IDENTITY(1,1) PRIMARY KEY,
  [Title] VARCHAR(255),
  [Author] VARCHAR(255),
  [ISBN] VARCHAR(13),
  [PublishedDate] DATE,
  [Genre] VARCHAR(255),
  [ShelfLocation] VARCHAR(255),
  [CurrentStatus] VARCHAR(20)
);