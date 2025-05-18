USE booK_shop;


-- COUNT 

	SELECT COUNT(*) FROM books;
    SELECT COUNT(author_fname) FROM books;
    
    SELECT COUNT(DISTINCT author_fname) FROM books;
    SELECT COUNT(DISTINCT released_year) FROM books;
    SELECT COUNT(DISTINCT author_lname) FROM books;
    SELECT COUNT(*) FROM books WHERE title LIKE '%the%';
    
-- GROUP BY

	SELECT author_lname,COUNT(*) AS 'Books Written' FROM books GROUP BY author_lname ORDER BY 'Books Written';
    SELECT released_year,COUNT(*) FROM books GROUP BY released_year ORDER BY released_year DESC;
    SELECT author_lname FROM books GROUP BY author_lname;
    -- SELECT * FROM books GROUP BY author_lname; ERROR
    SELECT title,author_lname,author_lname FROM books GROUP BY author_lname; -- ERROR
    
-- MIN AND MAX 

	-- Without GROUP BY
    SELECT MIN(released_year) FROM books;
    SELECT MIN(author_lname) FROM books;
    SELECT MIN(author_lname),MAX(author_fname) FROM books;
    SELECT MAX(pages),title FROM books; -- ERROR 
    
-- SUBQUERIES 

	INSERT INTO books(title,pages)VALUES('my life in words',634);
	SELECT MAX(pages) FROM books;
    SELECT pages,title FROM books WHERE pages = (SELECT MAX(pages) FROM books);
    SELECT pages,title FROM books WHERE pages = (SELECT MAX(pages) FROM books) LIMIT 1;
	SELECT pages,title FROM books WHERE pages = (SELECT MAX(pages) FROM books) LIMIT 2;

    INSERT INTO books(title,pages)VALUES('my life in words',634);
    
    SELECT MIN(released_year) FROM books;
    SELECT title,author_fname,author_lname,released_year FROM books WHERE released_year = (SELECT MIN(released_year) FROM books);
    
    SELECT author_fname,author_lname,COUNT(*)FROM books GROUP BY author_fname,author_lname;
    SELECT 
		CONCAT(author_fname,' ',author_lname)
        AS 'author',COUNT(*)
        FROM books
        GROUP BY author;

-- MIN AND MAX WITH GROUP BY

	SELECT author_fname,
		   author_lname,
		   min(released_year)
	FROM books 
    GROUP BY 
			author_fname,
            author_lname;
            
	SELECT 
		author_lname, 
		COUNT(*) as books_written, 
		MAX(released_year) AS latest_release,
		MIN(released_year)  AS earliest_release,
		MAX(pages) AS longest_page_count
	FROM books GROUP BY author_lname;
    
    SELECT 
		author_lname, 
		author_fname,
		COUNT(*) as books_written, 
		MAX(released_year) AS latest_release,
		MIN(released_year)  AS earliest_release
	FROM books 
    GROUP BY author_lname, author_fname;
    
-- SUM
	
    SELECT SUM(pages) FROM books;
    SELECT author_fname,
		   author_lname,
		   SUM(pages) 
    FROM books GROUP BY 
			author_fname,author_lname;
    
    SELECT SUM(pages) FROM books;
 
	SELECT author_lname, COUNT(*), SUM(pages)
	FROM books
	GROUP BY author_lname;
    
    SELECt SUM(author_fname) FROM books; -- 0 
    
-- AVG

	SELECT AVG(released_year) FROM books;
    SELECT AVG(pages) FROM books;
    SELECT AVG(stock_quantity) FROM books;
    
	SELECT 
		released_year, 
		AVG(stock_quantity), 
		COUNT(*) FROM books
	GROUP BY released_year;
    
-- Aggregate Functions Excercise

   SELECT * FROM books;
   
   SELECT SUM(stock_quantity) FROM books;
   
   SELECT released_year,
   COUNT(*) 
   FROM books
   GROUP BY released_year;
   
   
   SELECT author_lname,
		  AVG(released_year) 
   FROM books 
   GROUP BY author_lname;

	SELECT 
		 CONCAT(author_fname,' ',author_lname) AS 'full name'
         FROM books 
		 WHERE pages  = (SELECT max(pages) FROM books);

	SELECT
		 released_year AS 'year',
         COUNT(*),
         AVG(pages) AS 'avg pages' 
         FROM books
         GROUP BY released_year
         ORDER BY released_year;
         
         
	
         

				
        
   
	
	
	