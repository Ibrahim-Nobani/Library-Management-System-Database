WITH BorrowersNotReturnedBooks AS (
SELECT 
	L.BorrowerID,
	COUNT(*) AS NotReturnedBooks 
FROM 
	Loans L 
WHERE 
	L.DateReturned is NULL 
GROUP BY 
	L.BorrowerID 
HAVING 
	COUNT(*) >= 2 
)
SELECT 
	B.BorrowerID,
	B.Email,
	CONCAT(B.FirstName, ' ', B.LastName) AS FullName
FROM 
	Borrowers B
JOIN 
	BorrowersNotReturnedBooks BNR 
	ON BNR.BorrowerID = B.BorrowerID;
