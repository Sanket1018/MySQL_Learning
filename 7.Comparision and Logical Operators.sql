USE book_shop;

-- NOT EQUAL

SELECT * FROM books WHERE released_year != 2017;
SELECT title, author_lname books WHERE author_lname != 'Gaiman';

-- NOT LIKE

SELECT title FROM books WHERE title NOT LIKE '% %';
SELECT title,author_fname,author_lname FROM books WHERE author_fname NOT LIKE 'Da%';
SELECT title FROM books WHERE title NOT LIKE '%e%';
SELECT title FROM books WHERE title NOT LIKE '%a%';

