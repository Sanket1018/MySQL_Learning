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

