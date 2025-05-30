-- One-to-Many and Joins

CREATE DATABASE SHOP;
USE shop;

-- Primary Key and Foreign Key

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);
 
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
 
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
       
-- Cross Joins

	SELECT id FROM customers WHERE last_name = 'George';
	SELECT * FROM orders WHERE customer_id = 1;
	 
	 
	SELECT * FROM orders 
	WHERE customer_id = (SELECT id FROM customers WHERE last_name = 'George');
	 
	-- To perform a (kind of useless) cross join:
	SELECT * FROM customers, orders;


-- Our first inner join!
	SELECT * FROM customers
	JOIN orders ON orders.customer_id = customers.id;
	 
	SELECT first_name, last_name, order_date, amount FROM customers
	JOIN orders ON orders.customer_id = customers.id;
 
	-- The order doesn't matter here:

	SELECT * FROM orders
	JOIN customers ON customers.id = orders.customer_id;
    
-- INNER JOINS WITH GROUP BY
    
	SELECT 
		first_name, last_name, SUM(amount) AS total
	FROM
		customers
			JOIN
		orders ON orders.customer_id = customers.id
	GROUP BY first_name , last_name
	ORDER BY total;
    
    
-- LEFT JOIN

	SELECT 
		first_name, last_name, order_date, amount
	FROM
		customers
			LEFT JOIN
		orders ON orders.customer_id = customers.id;
 
 
	SELECT 
		order_date, amount, first_name, last_name
	FROM
		orders
			LEFT JOIN
		customers ON orders.customer_id = customers.id;
        
	-- LEFT JOIN WITH GROUP BY
    
		USE shop;
		
		SELECT 
			first_name, 
			last_name, 
			IFNULL(SUM(amount), 0) AS money_spent
		FROM
			customers
		LEFT JOIN
			orders ON customers.id = orders.customer_id
		GROUP BY first_name , last_name;
    
    -- ON DELETE CASCADE
    
		DROP TABLE orders;
		DROP TABLE customers;
        
        CREATE TABLE customers (
		id INT PRIMARY KEY AUTO_INCREMENT,
		first_name VARCHAR(50),
		last_name VARCHAR(50),
		email VARCHAR(50)
		);
        
        CREATE TABLE orders (
		id INT PRIMARY KEY AUTO_INCREMENT,
		order_date DATE,
		amount DECIMAL(8 , 2 ),
		customer_id INT,
		FOREIGN KEY (customer_id)
			REFERENCES customers (id)
			ON DELETE CASCADE
		);
        
-- JOIN EXERCISE

		CREATE TABLE students
        (
		   id INT PRIMARY KEY AUTO_INCREMENT,
           first_name VARCHAR(20)
        );

        CREATE TABLE papers
        (
			student_id INT,
			title VARCHAR(100),
            grade INT,
            FOREIGN KEY(student_id)
				REFERENCES students(id)
        );
        
        DROP TABLE papers;
        DROP TABLE students;
        
        INSERT INTO students (first_name) VALUES 
		('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
		 
		INSERT INTO papers (student_id, title, grade ) VALUES
		(1, 'My First Book Report', 60),
		(1, 'My Second Book Report', 75),
		(2, 'Russian Lit Through The Ages', 94),
		(2, 'De Montaigne and The Art of The Essay', 98),
		(4, 'Borges and Magical Realism', 89);
		
        SELECT * FROM students;
        SELECT * FROM papers;
        
        SELECT first_name ,title,grade
        FROM students
        JOIN papers
        ON students.id = papers.student_id;
        
		SELECT first_name ,title,grade
        FROM students
        LEFT JOIN papers
        ON students.id = papers.student_id;
        
        SELECT first_name,IFNULL(title,'MISSING'),IFNULL(grade,0)
        FROM students
        LEFT JOIN papers
        ON students.id = papers.student_id;
        
        
        SELECT 
			first_name, IFNULL(AVG(grade), 0) AS average
		FROM
			students
        LEFT JOIN
			papers ON students.id = papers.student_id
		GROUP BY first_name
		ORDER BY average DESC;
        
        SELECT 
			first_name,
		IFNULL(AVG(grade), 0) AS average,
			CASE
				WHEN IFNULL(AVG(grade), 0) >= 75 THEN 'passing'
				ELSE 'failing'
			END AS passing_status
		FROM
			students
        LEFT JOIN
			papers ON students.id = papers.student_id
		GROUP BY first_name
		ORDER BY average DESC;
        
        
-- MANY TO MANY

	CREATE DATABASE TV_challenge;
    USE TV_challenge;
    
	CREATE TABLE reviewers 
    (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
    );
    DROP TABLE reviewers;
    DROP TABLE series;
    DROP TABLE reviews;
    
    CREATE TABLE series
    (
		id INT PRIMARY KEY AUTO_INCREMENT,
        title VARCHAR(100),
        released_year YEAR,
        genre VARCHAR(100)
    );
    
    CREATE TABLE reviews
    (
		id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        rating DECIMAL(2,1),
        series_id INT,
        reviewer_id INT,
        FOREIGN KEY (series_id) REFERENCES series(id),
        FOREIGN KEY (reviewer_id) REFERENCES reviewers(id)
    );
    
    
    
    INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
 
 

INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);
    
    SELECT * FROM series;
    SELECT * FROM reviewers;
    SELECT * FROM reviews;

	--
    
    SELECT * FROM series
    JOIN reviews 
    ON series.id = reviews.series_id;
    
    SELECT 
		title, rating
	FROM
		series
        JOIN
		reviews ON series.id = reviews.series_id;
        
	SELECT 
		title, ROUND(avg(rating),2) AS 'Avg_rating'
	FROM series 
	JOIN reviews
        ON series.id = reviews.series_id
	GROUP BY title
    ORDER BY Avg_rating;
	 
	SELECT * FROM series;
    SELECT * FROM reviewers;
    SELECT * FROM reviews;
    
    
    -- 
    
    USE TV_challenge;
    SHOW DATABASES;
    
    SELECT first_name,last_name,rating FROM reviewers JOIN reviews
    ON reviewers.id = reviews.reviewer_id;
    
    -- Non-viewed reviews
    
    USE  TV_challenge;
    SELECT * FROM series;
    SELECT * FROM reviews;
    
    SELECT * FROM series LEFT JOIN reviews
    ON series.id = reviews.series_id
    WHERE rating IS NULL;
    
    SELECT title  AS unviewed_series 
    FROM series LEFT JOIN reviews
    ON series.id = reviews.series_id
    WHERE rating IS NULL;
    
    
    
    
    
	
		


        
				
			
    
       
