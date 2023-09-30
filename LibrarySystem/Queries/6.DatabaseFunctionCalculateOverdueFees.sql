GO
CREATE FUNCTION fn_CalculateOverdueFees
(
    @LoanID INT
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @OverdueFee DECIMAL(10, 2);
    DECLARE @DueDate DATE;
    SELECT @DueDate = DueDate FROM Loans WHERE LoanID = @LoanID;
    DECLARE @CurrentDate DATE = GETDATE();
    DECLARE @OverdueDays INT = DATEDIFF(DAY, @DueDate, @CurrentDate);

    IF @OverdueDays <= 30
    BEGIN
        SET @OverdueFee = @OverdueDays;
    END
    ELSE
    BEGIN
        SET @OverdueFee = 30 + ((@OverdueDays - 30) * 2);
    END

    RETURN @OverdueFee;
END;
GO

DECLARE @LoanID INT = 1;
DECLARE @OverdueFee DECIMAL(10, 2);

SET @OverdueFee = dbo.fn_CalculateOverdueFees(@LoanID);

PRINT 'Overdue Fee for LoanID ' + CAST(@LoanID AS VARCHAR(10)) + ': $' + CAST(@OverdueFee AS VARCHAR(10));
