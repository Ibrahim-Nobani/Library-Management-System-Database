GO
CREATE FUNCTION fn_BookBorrowingFrequency 
(
	@BookID INT
)
RETURNS INT
AS
BEGIN
	DECLARE @BookCount INT;

	SELECT
		@BookCount = COUNT(*)
	FROM 
		Loans
	WHERE 
		BookID = @BookID;

	RETURN @BookCount;
END;
GO

DECLARE @BookFrequency INT;
DECLARE @BookID INT = 1;
SET @BookFrequency = dbo.fn_BookBorrowingFrequency(@BookID);
PRINT 'The Frequency for the following Book with the ID: ' + CAST (@BookID AS VARCHAR(10)) + ' is: ' + CAST(@BookFrequency AS VARCHAR (10));

 
