CREATE PROC uspGetNamesWithoutBookLoans
AS
SELECT [Name]
FROM BORROWER
LEFT JOIN BOOK_LOANS ON BOOK_LOANS.CardNo = BORROWER.CardNo
WHERE BOOK_LOANS.CardNo IS NULL
;