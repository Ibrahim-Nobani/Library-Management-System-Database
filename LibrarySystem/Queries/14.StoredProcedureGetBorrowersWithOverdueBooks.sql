CREATE PROCEDURE sp_GetBorrowersWithOverdueBooks
AS
BEGIN
    CREATE TABLE #TempBorrowersWithOverdueBooks (
        BorrowerID INT,
        FirstName NVARCHAR(100),
        LastName NVARCHAR(100)
    );

    INSERT INTO #TempBorrowersWithOverdueBooks (BorrowerID, FirstName, LastName)
    SELECT DISTINCT
        BR.BorrowerID,
        BR.FirstName,
        BR.LastName
    FROM
        Loans L
    INNER JOIN
        Borrowers BR ON L.BorrowerID = BR.BorrowerID
    WHERE
        L.DateReturned IS NULL
        AND L.DueDate < GETDATE();

    SELECT
        T.BorrowerID,
        T.FirstName,
        T.LastName,
        L.BookID,
        L.DueDate
    FROM
        #TempBorrowersWithOverdueBooks T
    INNER JOIN
        Loans L ON T.BorrowerID = L.BorrowerID
    WHERE
        L.DateReturned IS NULL
        AND L.DueDate < GETDATE();

    DROP TABLE #TempBorrowersWithOverdueBooks;
END;