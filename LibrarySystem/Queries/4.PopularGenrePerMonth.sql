SELECT
	BK.Genre, 
	DATEPART(MONTH, L.DateBorrowed) AS BorrowMonth,
	DATEPART(YEAR, L.DateBorrowed) AS BorrowYear,
	COUNT(*) AS GenreFrequency,
	DENSE_RANK() OVER(PARTITION BY DATEPART(MONTH, L.DateBorrowed) ORDER BY COUNT(*)) AS GenreRank
FROM 
	Books BK
JOIN 
	Loans L ON L.BookID = BK.BookID
WHERE
	 DATEPART(YEAR, L.DateBorrowed) = 2023
     AND DATEPART(MONTH, L.DateBorrowed) = 1
GROUP BY
	DATEPART(MONTH, L.DateBorrowed),
	DATEPART(YEAR, L.DateBorrowed),
	BK.Genre;