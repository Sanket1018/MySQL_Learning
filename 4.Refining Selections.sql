USE book_shop;

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
SELECT * FROM books;

-- DISTINCT 

	SELECT DISTINCT author_lname FROM books;
    SELECT released_year FROM books;
    SELECT DISTINCT released_year FROM books;
    SELECT DISTINCT CONCAT(author_fname, ' ',author_lname) FROM books;
    SELECT DISTINCT author_fname,author_lname,released_year FROM books;
    
-- ORDER BY

	INSERT INTO books(title,author_lname) VALUES('my life','steele');
    SELECT * FROM books;
    SELECT book_id,author_fname,author_lname FROM books ORDER BY author_lname; -- Ascdending by default
	SELECT book_id,author_fname,author_lname FROM books ORDER BY author_lname DESC;
	SELECT title,pages FROM books ORDER BY pages;
    SELECT released_year FROM books ORDER BY released_year;
    SELECT title,author_fname,author_lname FROM books ORDER BY 2;
    SELECT book_id,title,author_fname,author_lname,pages FROM books ORDER BY pages;
    SELECT book_id,title,author_fname,author_lname,pages FROM books ORDER BY 4;
    SELECT author_lname,released_year FROM books ORDER BY author_lname,released_year;
    SELECT CONCAT(author_fname, '
    
    ', author_lname) AS author FROM books ORDER BY author;
    

-- LIMIT

	USE book_shop;
	SELECT book_id,title,released_year FROM books LIMIT 5;
    SELECT book_id,title,released_year FROM books ORDER BY released_year  DESC LIMIT 5;
    SELECT book_id,title,released_year FROM books ORDER BY released_year  DESC LIMIT 3,2;
    
-- LIKE OPERATOR

	SELECT * FROM books WHERE author_fname LIKE 'N%';
    SELECT * FROM books WHERE author_fname LIKE '___';
    SELECT * FROM books WHERE author_fname LIKE '%D';
    
    SELECT * FROM books;
    
-- ESCAPING WILDCARDS
	SELECT * FROM books WHERE title LIKE '%\%%';
    SELECT * FROM books WHERE title LIKE '%\_%';
    SELECT title,page FROM  books LIMIT 1;
    
-- REFINING SELECTIONS EXERCISE

    DESC books;
	SELECT title,pages FROM boks WHERE title LIKE '%Stories%';
    SELECT * FROM books ORDER BY pages LIMIT 1;
    SELECT pages FROM books;
    SELECT title AS summury FROM books ORDER by released_year DESC LIMIT 3;
    SELECT * FROM books WHERE author_lname LIKE "% " ; 
	SELECT * FROM books ORDER BY released_year LIMIT 3;
    SELECT title,author_lname FROM books ORDER BY author_lname,title;
    
    USE book_shop;
	SELECT
    CONCAT(
        'MY FAVORITE AUTHOR IS ',
        UPPER(author_fname),
        ' ',
        UPPER(author_lname),
        '!'
    ) AS yell
FROM books ORDER BY author_lname;