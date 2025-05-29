USE book_shop;

-- NOT EQUAL

	SELECT * FROM books WHERE released_year != 2017;
	SELECT title, author_lname books WHERE author_lname != 'Gaiman';

-- NOT LIKE

	SELECT title FROM books WHERE title NOT LIKE '% %';
	SELECT title,author_fname,author_lname FROM books WHERE author_fname NOT LIKE 'Da%';
	SELECT title FROM books WHERE title NOT LIKE '%e%';
	SELECT title FROM books WHERE title NOT LIKE '%a%';

-- Greater than 

	USE book_shop;
	SELECT * FROM books
	WHERE released_year > 2005;
 
	SELECT * FROM books
	WHERE pages > 500;

-- Less than or Equal to

	SELECT * FROM books
	WHERE pages < 200;
 
	SELECT * FROM books
	WHERE released_year < 2000;
 
	SELECT * FROM books
	WHERE released_year <= 1985;

-- Logical AND

	SELECT title, author_lname, released_year FROM books
	WHERE released_year > 2010
	AND author_lname = 'Eggers';
 
	SELECT title, author_lname, released_year FROM books
	WHERE released_year > 2010
	AND author_lname = 'Eggers'
	AND title LIKE '%novel%';

	SELECT title, pages FROM books 
	WHERE CHAR_LENGTH(title) > 30
	AND pages > 500;
 
	SELECT title, author_lname FROM books
	WHERE author_lname='Eggers' AND
	released_year > 2010;
 
	SELECT title, author_lname, released_year FROM books
	WHERE author_lname='Eggers' OR
	released_year > 2010;
 
	SELECT title, released_year FROM books
	WHERE released_year <= 2015
	AND released_year >= 2004;
 
	SELECT title, released_year FROM books
	WHERE released_year BETWEEN 2004 AND 2014;

-- Comparing the dates

	USE pet_shop;
	SELECT * FROM people WHERE birthdate < '2005-01-01';

	-- CAST : 
	SELECT * FROM people WHERE birthtime 
	BETWEEN CAST('12:00:00' AS TIME) 
	AND CAST('16:00:00' AS TIME);
	 
	 
	SELECT * FROM people WHERE HOUR(birthtime)
	BETWEEN 12 AND 16;
    
-- CASE STATEMENTS

	USE book_shop;

	SELECT title,released_year,
    CASE
		WHEN released_year > 2000 then 'Mordern lit'
        ELSE '19th century lit'
    END
    FROM BOOKS;
    
    SELECT title,stock_quantity,
    CASE
		WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS books
    FROM books;
    
    SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity <= 40 THEN '*'
        WHEN stock_quantity <= 70 THEN '**'
        WHEN stock_quantity <= 100 THEN '***'
        WHEN stock_quantity <= 140 THEN '****'
        ELSE '*****'
    END AS stock
	FROM
    books;

-- IS NULL

	SELECT * FROM books WHERE title IS NULL;
    

-- EXERCISE

	SELECT * FROM books WHERE released_year < 1980;
 
	SELECT * FROM books 
	WHERE author_lname = 'Eggers'
	OR author_lname = 'Chabon';
	 
	SELECT * FROM books
	WHERE author_lname = 'Lahiri'
	AND released_year > 2000;
	 
	SELECT * FROM books
	WHERE pages >= 100 
	AND pages <= 200;
	 
	SELECT * FROM books
	WHERE pages BETWEEN 100 and 200;
	 
	SELECT title, author_lname FROM books
	WHERE author_lname LIKE 'C%'
	OR author_lname LIKE 'S%';
	 
	SELECT title, author_lname
	FROM books WHERE SUBSTR(author_lname, 1, 1) in ('C', 'S');
	 
	SELECT title, author_lname,
	CASE
		WHEN title LIKE '%stories%' THEN 'Short Stories'
		WHEN title = 'Just Kids' THEN 'Memoir' 
		WHEN title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memior'
		ELSE 'Novel'
	END AS type
	FROM books;
	 
	 
	SELECT author_fname, author_lname,
		CASE
			WHEN COUNT(*) = 1 THEN '1 book'
			ELSE CONCAT(COUNT(*), ' books')
		END AS count
	FROM books
	WHERE author_lname IS NOT NULL
	GROUP BY author_fname, author_lname;
    
-- MANY TO MANY

	CREATE TABLE reviewers 
    (
    id INT PRIMARY KEY NOT NULL ,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
    );
    
    CREATE TABLE series
    (
		id INT PRIMARY KEY AUTO_INCREMENT,
        title VARCHAR(100),
        released_year YEAR,
        genre VARCHAR(100)
    );
    
    CREATE TABLE reviews
    (
		id INT PRIMARY KEY,
        rating DECIMAL(2,1),
        series_id INT,
        reviewer_id INT,
        FOREIGN KEY (series_id) REFERENCES series(id),
        FOREIGN KEY (reviewer_id) REFERENCES reviwer(id)
    );
	 
		


