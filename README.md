# Library Management System: Database Project

## Introduction

This project aims to transform a local library's book-keeping system into a robust digital platform. The Library Management System database will efficiently manage books, borrowers, loans, and returns while offering valuable insights into borrowing trends.

## Objective

The primary objective of this project is to design and implement a comprehensive relational database using MS SQL that fully supports the library's day-to-day operations and provides extensive querying capabilities.

## Requirements

### 1. Entity Relationship Model (ERM) Diagram

- **Entities**: Visualize entities such as **`Books`**, **`Borrowers`**, and **`Loans`**.
- **Attributes**: Specify detailed attributes for each entity.
- **Relationships**: Illustrate connections between entities.
- **Connectivity and Cardinality**: Define relationship types and their cardinality.
- **Keys**: Identify primary keys (PK) and foreign keys (FK).
- **Tools**: Utilize ERD tools like ERDPlus, Lucidchart, or similar, and include the diagram in the repository.

## Entity Relationship Model (ERM) Diagram

![Library Management System ER Diagram](LibrarySchema/Library%20Management%20System%20ER%20diagram.jpeg)

### 2. Relational Schema Design using MS SQL

**Books**:
- BookID (PK)
- Title
- Author
- ISBN
- Published Date
- Genre
- Shelf Location
- Current Status ('Available' or 'Borrowed')

**Borrowers**:
- BorrowerID (PK)
- First Name
- Last Name
- Email
- Date of Birth
- Membership Date

**Loans**:
- LoanID (PK)
- BookID (FK)
- BorrowerID (FK)
- Date Borrowed
- Due Date
- Date Returned (NULL if not returned yet)

### 3. Database Creation and Seeding

- Establish the database in MS SQL.
- Populate it with fictitious data: Insert 1000 books, 1000 borrowers, and 1000 loan records. Include DML scripts for seeding in the GitHub repository. You may generate data using tools, scripts, or websites, ensuring consistency and meaningfulness.

### 4. Complex Queries and Procedures

**Note**: Implement each requirement in a separate SQL file and push them as individual commits to the GitHub repository.

1. **List of Borrowed Books**: Retrieve all books borrowed by a specific borrower, including those currently unreturned.

2. **Active Borrowers with CTEs**: Identify borrowers who've borrowed 2 or more books but haven't returned any. Utilize Common Table Expressions (CTEs).

3. **Borrowing Frequency using Window Functions**: Rank borrowers based on their borrowing frequency.

4. **Popular Genre Analysis using Joins and Window Functions**: Determine the most popular genre for a given month.

5. **Stored Procedure - Add New Borrowers**:
   - **Procedure Name**: **`sp_AddNewBorrower`**
   - **Purpose**: Simplify the process of adding a new borrower.
   - **Parameters**: **`FirstName`**, **`LastName`**, **`Email`**, **`DateOfBirth`**, **`MembershipDate`**.
   - **Implementation**: Check for existing email addresses; if not found, add to **`Borrowers`**. If found, return an error message.
   - **Return**: Provide the new **`BorrowerID`** or an error message.

6. **Database Function - Calculate Overdue Fees**:
   - **Function Name**: **`fn_CalculateOverdueFees`**
   - **Purpose**: Compute overdue fees for a specific loan.
   - **Parameter**: **`LoanID`**
   - **Implementation**: Calculate fees based on overdue days: $1/day for the first 30 days, $2/day thereafter.
   - **Return**: The overdue fee for the given **`LoanID`**.

7. **Database Function - Book Borrowing Frequency**:
   - **Function Name**: **`fn_BookBorrowingFrequency`**
   - **Purpose**: Measure the borrowing frequency of a book.
   - **Parameter**: **`BookID`**
   - **Implementation**: Count how many times the book has been borrowed.
   - **Return**: Provide the borrowing count for the book.

8. **Overdue Analysis**: List all books that are overdue by more than 30 days, along with their associated borrowers.

9. **Author Popularity using Aggregation**: Rank authors by the frequency of their books being borrowed.

10. **Genre Preference by Age using Group By and Having**: Determine the preferred genre of borrowers within different age groups (e.g., (0-10), (11-20), (21-30), etc.).

11. **Stored Procedure - Borrowed Books Report**:
    - **Procedure Name**: **`sp_BorrowedBooksReport`**
    - **Purpose**: Generate a report of books borrowed within a specified date range.
    - **Parameters**: **`StartDate`**, **`EndDate`**
    - **Implementation**: Retrieve all books borrowed within the given range, including borrower names and borrowing dates.
    - **Return**: Deliver a formatted report of borrowed books.

12. **Trigger Implementation**:
    - Design a trigger to log an entry into an **`AuditLog`** table whenever a book's status changes from 'Available' to 'Borrowed' or vice versa. Capture details such as **`BookID`**, **`StatusChange`**, and **`ChangeDate`**.

13. **SQL Stored Procedure with Temp Table**:
    - Design a stored procedure that identifies all borrowers with overdue books. Store these borrowers in a temporary table and then join this temporary table with the **`Loans`** table to list the specific overdue books for each borrower.