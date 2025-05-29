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
	 
		


        
				
			
    
       
