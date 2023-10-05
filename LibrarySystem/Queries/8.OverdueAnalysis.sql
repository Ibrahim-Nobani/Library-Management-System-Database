SELECT 
	BK.BookID,
	BK.Title,
	B.BorrowerID,
	B.FirstName,
	DATEDIFF(DAY, L.DueDate,  GETDATE()) AS DaysOverDue
FROM 
	Loans L
JOIN
	Books BK ON BK.BookID = L.BookID
JOIN
	Borrowers B ON B.BorrowerID = L.BorrowerID
WHERE
	DATEDIFF(DAY, L.DueDate,  GETDATE()) > 30
	AND L.DateReturned IS NULL
ORDER BY 
	DaysOverDue DESC;