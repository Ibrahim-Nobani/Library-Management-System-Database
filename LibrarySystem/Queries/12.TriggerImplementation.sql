CREATE TABLE AuditLog 
(	
	LogID INT IDENTITY(1,1) PRIMARY KEY,
    BookID INT,
    StatusChange VARCHAR(255),
    ChangeDate DATETIME
);

GO
CREATE TRIGGER tr_CurrentStatusChange
ON Books
AFTER UPDATE
AS
BEGIN
    IF UPDATE(CurrentStatus)
    BEGIN
        INSERT INTO AuditLog (BookID, StatusChange, ChangeDate)
        SELECT
            i.BookID,
            CASE
                WHEN i.CurrentStatus = 'Available' AND d.CurrentStatus = 'Borrowed' THEN 'Borrowed to Available'
                WHEN i.CurrentStatus = 'Borrowed' AND d.CurrentStatus = 'Available' THEN 'Available to Borrowed'
            END AS StatusChange,
            GETDATE() AS ChangeDate
        FROM 
			inserted i
        JOIN 
			deleted d ON d.BookID = i.BookID;
    END
END;
GO