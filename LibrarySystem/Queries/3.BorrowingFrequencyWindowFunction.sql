SELECT 
	B.BorrowerID, 
	B.FirstName, 
	B.LastName, 
	COUNT(L.BorrowerID) AS BorrowerFrequency,
	DENSE_RANK() OVER(ORDER BY COUNT(L.BorrowerID) DESC) AS BorrowerRank
FROM 
	Borrowers B 
LEFT JOIN 
	Loans L 
	ON L.BorrowerID = B.BorrowerID
GROUP BY 
	B.BorrowerID, B.FirstName, B.LastName