CREATE INDEX IX_Loans_LoanID ON Loans(LoanID);
CREATE INDEX IX_Loans_BookID ON Loans(BookID);
CREATE INDEX IX_Loans_BorrowerID ON Loans(BorrowerID);
CREATE INDEX IX_Loans_DateBorrowed ON Loans(DateBorrowed);
CREATE INDEX IX_Loans_DueDate ON Loans(DueDate);
CREATE INDEX IX_Loans_DateReturned ON Loans(DateReturned);