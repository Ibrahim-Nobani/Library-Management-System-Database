SELECT 
	B.Author,
    COUNT(L.LoanID) AS BorrowingFrequency,
    DENSE_RANK() OVER (ORDER BY COUNT(L.LoanID) DESC) AS AuthorRank
FROM
    Loans L
RIGHT JOIN
    Books B ON L.BookID = B.BookID
GROUP BY
    B.Author
