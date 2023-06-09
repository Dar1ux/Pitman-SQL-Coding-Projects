CREATE PROC uspGetBookCountInEachBranch @BookTitle nvarchar(50)
AS
SELECT BranchName, BOOKS.Title, BOOK_COPIES.Number_Of_Copies
FROM LIBRARY_BRANCH
LEFT JOIN BOOK_COPIES ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
INNER JOIN BOOKS ON BOOKS.BookID = BOOK_COPIES.BookID
WHERE BOOKS.Title = @BookTitle
;