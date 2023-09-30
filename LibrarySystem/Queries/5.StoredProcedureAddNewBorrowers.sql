CREATE PROCEDURE sp_AddNewBorrower
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @Email NVARCHAR(100),
    @DateOfBirth DATE,
    @MembershipDate DATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Borrowers WHERE Email = @Email)
    BEGIN
        SELECT 'Error: Email already exists in the database.' AS ErrorMessage;
    END
    ELSE
    BEGIN
        INSERT INTO Borrowers (FirstName, LastName, Email, DateOfBirth, MembershipDate)
        VALUES (@FirstName, @LastName, @Email, @DateOfBirth, @MembershipDate);

        SELECT SCOPE_IDENTITY() AS BorrowerID;
    END
END;

EXEC sp_AddNewBorrower
    'Ibrahim',
    'Ibra',
    'ibrahim@gmail.com',
    '1999-09-09',
    '2023-09-09';
