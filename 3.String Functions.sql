CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

USE book_shop;

-- Adding new books 
	INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

SELECT * FROM books;

-- CONCAT
	SELECT CONCAT('H','E','L','L','O');

	SELECT CONCAT(author_fname,'!!!') FROM books;
	SELECT CONCAT(author_fname,' ',author_fname) FROM books;
	SELECT CONCAT(author_fname,' ',author_fname) AS author_name FROM books;

		-- CONCAT WS(With Seprator)
	SELECT CONCAT_WS('!','H','e','l','l','o');
	SELECT CONCAT_WS('-',title,author_fname,author_lname) FROM books;
    
-- SUBSTRING
	SELECT SUBSTRING('Hello World',1,4);
	SELECT SUBSTRING('Hello World',1,5);
	SELECT SUBSTRING('Hello World',2,5);
    SELECT SUBSTRING('Hello World',7); -- World
    SELECT SUBSTRING('Hello World',7,2); -- Wo
    SELECT SUBSTRING('Hello World',-3); -- rld
	SELECT SUBSTRING('Hello World',-1); -- d
    SELECT SUBSTRING('Hello World',-2,1); -- l
    
    SELECT SUBSTRING(title,1,15) FROM books;
	SELECT SUBSTR(title,1,15) FROM books;
    SELECT SUBSTRING(author_lname,1,1) FROM books;
    SELECT SUBSTRING(author_lname,1,1)AS intial,author_lname FROM books;
    
-- Combing CONCAT AND SUBSTRING
	
	SELECT SUBSTRING(title,1,10) FROM books;
    SELECT CONCAT(SUBSTRING(title,1,10),'...') AS 'Short title'FROM books;
    
    SELECT CONCAT
    (
		SUBSTRING(title,1,10),
        '...'
	) AS 'Short title'
    FROM books;
    
    SELECT SUBSTRING(author_fname,1,1) FROM books;
	SELECT SUBSTRING(author_lname,1,1) FROM books;
    
    SELECT CONCAT(SUBSTRING(author_fname,1,1),'.',SUBSTRING(author_lname,1,1),'.')FROM books;
    
	SELECT CONCAT(	 
				SUBSTRING(author_fname,1,1),
				'.',
				SUBSTRING(author_lname,1,1),
				'.'
			) AS 'author intials'
	FROM books;

-- REPLACE 

	SELECT REPLACE('Hello World','Hell','%$#@');
	SELECT REPLACE('Cheese bread coffe milk',' ',' and ');  
    -- Replace is case sensitive
    
    SELECT REPLACE(title,' ','-') FROM books;
    
-- REVERSE
	USE book_shop;
	SELECT REVERSE('Sanket');
    SELECT CONCAT(author_fname,REVERSE(author_lname)) FROM books;
    
-- CHAR_LENGTH
	SELECT CHAR_LENGTH('Hello World');
    SELECT CHAR_LENGTH('写汉字');
    SELECT CHAR_LENGTH(title) FROM books;
    SELECT CHAR_LENGTH(title) AS length FROM books;
    SELECT * FROM books;
    
-- UPPPER AND LOWER
	SELECT UPPER('Hello World!');
    SELECT UCASE('Hello World');
    SELECT LOWER('Hello World!');
    SELECT CONCAT('I LOVE ', UPPER(title), '!!!') FROM  books;
    
-- INSERT
	SELECT INSERT ('Hello Boby',6,0,' There'); -- (Text,From Where,insert 0 or replace how many characters)
	SELECT INSERT ('Hello Bobby',6,4,'There');
    SELECT INSERT ('Hello Bobby',6,6,'There');
    
-- 	LEFT
	SELECT LEFT('Hello World',1) ;
    SELECT LEFT(title,1) FROM books;
    
-- RIGHT 
	SELECT RIGHT('Hello World',1);
    SELECT RIGHT(title,1) FROM books;
    
-- REPEAT
	SELECT REPEAT('MYSQL',3);
    SELECT (REPEAT (LEFT(title,1),3)) FROM books;
    
-- TRIM 
	SELECT TRIM('   BOSTON    ');
    SELECT TRIM(LEADING 'X' FROM 'XXXXXABC');
    SELECT TRIM(TRAILING 'X' FROM 'ABCDXXXXX');
    SELECT TRIM(BOTH '.' FROM '....AB......');

-- STRING FUNCTIONS EXERCISE

	SELECT REVERSE(UPPER('Why does my cat look with such hatred?'));
    SELECT REPLACE(title,' ','->') FROM books;
    SELECT author_lname AS 'forwards',REVERSE(author_lname) AS 'backwards' FROM books;
    SELECT CONCAT(author_fname,' ',author_lname) AS 'full name in caps' FROM books;
    DESC books;
    
    SELECT CONCAT(title,' was released in ',released_year) FROM books;
    SELECT title,CHAR_LENGTH(title) FROM books;
    SELECT * FROM books;
    SELECT CONCAT
		(SUBSTR(title,1,10), '...') AS short_title,
        CONCAT(author_lname, ',',author_fname) AS author,
        CONCAT(stock_quantity, ' in stock') AS quantity 
	FROM books;
	
    
    
    
	
    
    
    
		
    
    
    
	
        
        

    
    
    


    

