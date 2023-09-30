/* 
11. **Stored Procedure - Borrowed Books Report**:
    - **Procedure Name**: **`sp_BorrowedBooksReport`**
    - **Purpose**: Generate a report of books borrowed within a specified date range.
    - **Parameters**: **`StartDate`**, **`EndDate`**
    - **Implementation**: Retrieve all books borrowed within the given range, with details like borrower name and borrowing date.
    - **Return**: Tabulated report of borrowed books.
*/

CREATE PROCEDURE sp_BorrowedBooksReport
(
	@StartDate DATE,
	@EndDate DATE
)
AS
BEGIN
	SELECT
		B.BookID,
		B.Title AS BookTitle,
		B.Author,
		B.Genre,
		B.ISBN,
		CONCAT(BR.FirstName, ' ', BR.LastName) AS BorrowerFullName,
		L.DateBorrowed
	FROM 
		Loans L
	INNER JOIN 
		Books B ON B.BookID = L.BookID
	INNER JOIN 
		Borrowers BR ON BR.BorrowerID = L.BorrowerID
	WHERE 
		L.DateBorrowed >= @StartDate AND L.DateBorrowed <= @EndDate;
END;

DECLARE @StartDate DATE = '2023-02-01';
DECLARE @EndDate DATE = '2023-04-19';
EXEC sp_BorrowedBooksReport
	@StartDate,
	@EndDate