SELECT 
    BK.BookID, 
    BK.Title, 
    BK.Author, 
    BK.ISBN
FROM 
    Books AS BK
JOIN 
    Loans AS L 
    ON BK.BookID = L.BookID
JOIN 
    Borrowers AS B 
    ON L.BorrowerID = B.BorrowerID
WHERE 
    B.FirstName = 'Wait';
