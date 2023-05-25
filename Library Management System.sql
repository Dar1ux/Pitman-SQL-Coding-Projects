/* Final Project - Library Management System Project */

-- Creating Database
CREATE DATABASE db_Library;

USE db_Library;
GO

-- Creating Tables
CREATE TABLE LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	[Address] VARCHAR(50) NOT NULL
);

CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (10000,1),
	[Name] VARCHAR(50) NOT NULL,
	[Address] VARCHAR(50) NOT NULL,
	Phone VARCHAR(30) NOT NULL
);

CREATE TABLE PUBLISHER (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	[Address] VARCHAR(50) NOT NULL,
	Phone VARCHAR(30) NOT NULL
);

CREATE TABLE BOOKS (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_publisherName FOREIGN KEY REFERENCES PUBLISHER(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE BOOK_AUTHORS (
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE BOOK_COPIES (
	BookID INT NOT NULL CONSTRAINT fk_BookID_inCopies FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID_inCopies FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);

CREATE TABLE BOOK_LOANS (
	BookID INT NOT NULL CONSTRAINT fk_BookID_inLoans FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID_inLoans FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo_inLoans FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

-- Populating Tables
INSERT INTO LIBRARY_BRANCH
	(BranchName, [Address])
	VALUES
	('Sharpstown', 'Main Street 321'),
	('Alexandria', 'Ancient  Street 17'),
	('Trinity', 'College Green 2'),
	('Knowledge Base', 'Bermuda''s Square 314'),
	('Andersen', 'Denmark Close 404'),
	('Biblioteka', 'Vilnius 1323')
;

INSERT INTO BORROWER
	([Name], [Address], Phone)
	VALUES
	('Jon Bonjovi', 'Grand Street 11', '07878-223-457'),
	('Luke Belmar', 'Blackrock Street 420', '07625-111-846'),
	('Lisa Simpson', 'Springfield Street 14', '07745-996-080'),
	('Robert Bobby', 'Surgery Street 41', '07123-090-635'),
	('Loreta Bell', 'Fancy Road 777', '07788-873-493'),
	('Rose Park', 'Hangul Street 407', '0764-728-648'),
	('Jennie Kim', 'Klein Street 888', '07887-627-846'),
	('Chuck Norris', 'Chuck Street 1', '07777-777-777')
;

INSERT INTO PUBLISHER
	(PublisherName, [Address], Phone)
	VALUES
	('Big Letters', 'Albert''s Road 17', '07736-123-421'),
	('Luminocity', 'Morning Street 18', '0736-827-834'),
	('Clarity Press', 'Melbourne Road 340', '07733-928-009'),
	('The Sun', 'Basanavicius 14', '07878-008-635'),
	('Reader''s Paradise', 'Beach Road 147', '07989-723-772'),
	('Prime Fiction', 'Galaxy Lane 299', '0792-458-299'),
	('Black&White', 'Contrast Road 19', '07909-102-948'),
	('Papyrus Works', 'Old Town Raod 23', '07071-283-847'),
	('Alma Littera', 'Latin Lane 50', '07050-150-250'),
	('Sunday Magazine', 'Church Street 7', '07374-237-932')
;

INSERT INTO BOOKS
	(Title, PublisherName)
	VALUES
	('The Lion, the Witch and the Wardrobe', 'Alma Littera'),
	('Alice''s Adventures in Wonderland', 'Luminocity'),
	('Harry Potter and the Prisoner of Azkaban', 'Big Letters'),
	('Neverwhere', 'Luminocity'),
	('American Gods', 'Big Letters'),
	('The Voyage of the Dawn Treader', 'Reader''s Paradise'),
	('A Wrinkle in Time', 'Sunday Magazine'),
	('The Phantom Tollbooth', 'Prime Fiction'),
	('The Lost Tribe', 'Papyrus Works'),
	('Watership Down', 'Black&White'),
	('The Eye of the World', 'The Sun'),
	('A Swiftly Tilting Planet', 'Prime Fiction'),
	('Redwall', 'Clarity Press'),
	('Dragonflight', 'Prime Fiction'),
	('The Fifth Season', 'Alma Littera'),
	('A Storm of Swords', 'Sunday Magazine'),
	('Outlander', 'Papyrus Works'),
	('The Name of the Wind', 'Luminocity'),
	('The Tombs of Atuan', 'Big Letters'),
	('The Crystal Cave', 'Black&White')
;

INSERT INTO BOOK_AUTHORS
	(BookID, AuthorName)
	VALUES
	(100, 'C. S. Lewis'),
	(101, 'Lewis Carroll'),
	(102, 'J. K. Rowling'),
	(103, 'Neil Gaiman'),
	(108, 'Neil Gaiman'),
	(105, 'Neil Gaiman'),
	(110, 'Lewis Carroll'),
	(119, 'William Goldman'),
	(117, 'William Goldman'),
	(104, 'C. S. Lewis')
;

INSERT INTO BOOK_COPIES
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(100, 2, 3),
	(117, 3, 5),
	(100, 1, 5),
	(102, 2, 2),
	(108, 5, 4),
	(101, 6, 5),
	(102, 4, 12),
	(101, 4, 3),
	(119, 6, 11),
	(108, 1, 7),
	(117, 1, 9)
;

INSERT INTO BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(100, 2, 10003, '2023-05-02', '2023-08-02'),
	(117, 3, 10005, '2023-05-12', '2023-08-12'),
	(100, 1, 10005, '2023-05-22', '2023-08-22'),
	(102, 2, 10002, '2023-05-04', '2023-08-04'),
	(108, 5, 10004, '2023-04-20', '2023-07-20'),
	(101, 6, 10005, '2023-04-13', '2023-07-13'),
	(102, 4, 10000, '2023-05-14', '2023-08-14'),
	(101, 4, 10003, '2023-05-11', '2023-08-11'),
	(119, 6, 10006, '2023-03-15', '2023-06-15'),
	(108, 1, 10007, '2023-04-15', '2023-07-15')
;
-- End of Populating Tables

-- FULL OUTER JOIN on three tables
SELECT * FROM ((Book_Loans FULL OUTER JOIN Borrower ON Book_Loans.CardNo = Borrower.CardNo) FULL OUTER JOIN Books ON Book_Loans.BookID = Books.BookID);

-- Query that returns all book titles and the authors name
SELECT Title, BOOK_AUTHORS.AuthorName 
FROM BOOKS
LEFT JOIN BOOK_AUTHORS ON BOOKS.BookID = BOOK_AUTHORS.BookID
;

-- Creating Stored Procedures
-- A. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
CREATE PROC uspGetBookCountInBranch @BookTitle nvarchar(50), @BranchName nvarchar(50)
AS
SELECT Title, LIBRARY_BRANCH.BranchName, BOOK_COPIES.Number_Of_Copies
FROM BOOKS
INNER JOIN BOOK_COPIES ON BOOK_COPIES.BookID = BOOKS.BookID
INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID
WHERE BOOKS.Title = @BookTitle AND LIBRARY_BRANCH.BranchName = @BranchName
;

EXEC uspGetBookCountInBranch @BookTitle = 'The Lost Tribe', @BranchName = 'Sharpstown';

-- B. How many copies of the book titled "The Lost Tribe" are owned by each library branch?
CREATE PROC uspGetBookCountInEachBranch @BookTitle nvarchar(50)
AS
SELECT LIBRARY_BRANCH.BranchName, BOOKS.Title, BOOK_COPIES.Number_Of_Copies
FROM LIBRARY_BRANCH
LEFT JOIN BOOK_COPIES ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
LEFT JOIN BOOKS ON BOOKS.BookID = BOOK_COPIES.BookID
WHERE BOOKS.Title = @BookTitle
;

EXEC uspGetBookCountInEachBranch @BookTitle = 'The Lost Tribe';

-- C. Retrieve the names of all borrowers who do not have any books checked out.
CREATE PROC uspGetNamesWithoutBookLoans
AS
SELECT [Name]
FROM BORROWER
LEFT JOIN BOOK_LOANS ON BOOK_LOANS.CardNo = BORROWER.CardNo
WHERE BOOK_LOANS.CardNo IS NULL
;

EXEC uspGetNamesWithoutBookLoans;
