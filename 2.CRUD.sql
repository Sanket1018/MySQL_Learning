-- CRUD
-- C - Create
-- R - Read
-- U - Upadate
-- D -- Delete

USE pet_shop;
SHOW tables;
DROP TABLE cats;

--  C - CREATE 
	CREATE TABLE cats (
		cat_id INT AUTO_INCREMENT,
		name VARCHAR(100),
		breed VARCHAR(100),
		age INT,
		PRIMARY KEY (cat_id)
	); 

	INSERT INTO cats(name, breed, age) 
	VALUES ('Ringo', 'Tabby', 4),
		   ('Cindy', 'Maine Coon', 10),
		   ('Dumbledore', 'Maine Coon', 11),
		   ('Egg', 'Persian', 4),
		   ('Misty', 'Tabby', 13),
		   ('George Michael', 'Ragdoll', 9),
		   ('Jackson', 'Sphynx', 7);
           
-- R - READ

	 SELECT * FROM cats;
     SELECT name FROM cats;
     SELECT age FROM cats;
     SELECT name,age FROM cats;
     SELECT name,breed FROM cats;
     
     -- WHERE clause 
     
     USE pet_shop;
     SELECT * FROM cats WHERE age = 4;
     SELECT name FROM cats WHERE age = 4;
     SELECT * FROM cats WHERE name = 'Egg';
     SELECT * FROM cats WHERE name = 'egg';
     
		 -- Rapid fire exercises 
		 SELECT * FROM cats;
		 SELECT cat_id FROM cats;
		 SELECT name,breed FROM cats;
		 SELECT name,age FROM cats WHERE breed = 'Tabby';
		 SELECT cat_id,age FROM cats WHERE cat_id = age;
         
         -- Alias
         SELECT cat_id AS id FROM cats;
         SELECT name AS kittyname FROM cats; 
       
-- U - UPDATE

	SET SQL_SAFE_UPDATES = 0;

	SELECT * FROM employees;
	UPDATE employees  SET last_name = 'roosterbeard';
	UPDATE employees SET current_status = 'laid-off',last_name = 'who cares';

	UPDATE cats SET age = 14 WHERE name = 'Misty';
	SELECT * FROM cats;

	-- A Good Rule of thumb - try SELECTING before UPDATING
    
    
	-- UPDATE exercise
	USE pet_shop;

	SET SQL_SAFE_UPDATES = 0;

	SELECT * FROM cats WHERE name = 'Jackson';
	UPDATE cats SET name = 'Jack' WHERE name = 'Jackson';
	SELECT * FROM cats;

	UPDATE cats SET breed = 'British Shorthair' WHERE name = 'Ringo';
	UPDATE cats SET age =2 WHERE breed = 'Maine Coon';
    
-- D - DELETE 

	DELETE FROM cats WHERE name = 'Egg';
    SELECT * FROM cats;
    
    -- DELETE Exercise
    
    DELETE FROM cats WHERE age = 4;
    SELECT * FROM cats;
    DELETE FROM cats WHERE cat_id = age;
    SELECT * FROM cats;
    DELETE FROM cats;
    
    
-- Section 6 CRUD Challenge

CREATE DATABASE shirts_db;
USE shirts_db;

CREATE TABLE shirts
(
	shirt_id INT PRIMARY KEY AUTO_INCREMENT,
    article VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL,
    shirt_size VARCHAR(10) NOT NULL, 
    last_worn INT NOT NULL
);



INSERT INTO shirts (article, color, shirt_size, last_worn)  
VALUES 
	('t-shirt', 'white', 'S', 10),
	('t-shirt', 'green', 'S', 200),
	('polo shirt', 'black', 'M', 10),
	('tank top', 'blue', 'S', 50),
	('t-shirt', 'pink', 'S', 0),
	('polo shirt', 'red', 'M', 5),
	('tank top', 'white', 'S', 200),
	('tank top', 'blue', 'M', 15);
    
INSERT INTO shirts(article,color,shirt_size,last_worn)
VALUES
	('polo-shirt','purple','M',50);
    
SELECT article,color FROM shirts;
SELECT article,color,shirt_size,last_worn FROM shirts;
SELECT * FROM shirts;

UPDATE shirts SET shirt_size = 'L' WHERE article = 'polo shirt';
UPDATE shirts SET last_worn = 0 WHERE last_worn = 15;
SELECT * FROM shirts;
UPDATE shirts SET shirt_size = 'XS',color = 'off white';

DELETE FROM shirts WHERE last_worn = 200;
DELETE FROM shirts WHERE article = 'tank top';
DELETE FROM shirts;

DROP TABLE shirts;



    

 



    
    

		



     
     


		   
       