SHOW DATABASES;
-- To create a database

CREATE DATABASE soap_store;
CREATE DATABASE DogApp;
CREATE  DATABASE pet_shop;
CREATE DATABASE SlimeStore;

-- To USE database
SELECT DATABASE(); -- To know selected database
USE soap_store;
USE pet_shop;

SHOW TABLES;

-- To create a Table

CREATE TABLE cats
(  
	name VARCHAR(20),
    breed VARCHAR(40),
    age INT
);

SHOW COLUMNS FROM cats;
DESCRIBE cats;
DESC cats;

DROP TABLE cats;
SHOW TABLES;

CREATE DATABASE pastries_house;
USE pastries_house;

CREATE TABLE pastries
(
	name VARCHAR(50),
    quantity INT
);

SHOW COLUMNS FROM Pastries;
DESC pastries;

DROP TABLE pastries;


-- MySql comments

/*
 SHOW tables;
*/

USE pet_shop;
SHOW TABLES;

CREATE table cats
(
	name VARCHAR(50),
    age INT
);

INSERT INTO cats VALUES('Bluee Steele',5);
INSERT INTO cats VALUES('Jenkins',7);
SELECT * FROM cats;
INSERT INTO cats VALUES('Beth',2);

INSERT INTO cats (name, age) 
VALUES 
  ('Meatball', 5), 
  ('Turkey', 1), 
  ('Potato Face', 15);

USE pet_shop;
CREATE TABLE people
(
		first_name VARCHAR(20),
        last_name VARCHAR(20),
		age INT
);

INSERT INTO people(first_name,last_name,age)VALUES('Tina','Belcher',13);
INSERT INTO people(first_name,last_name,age)VALUES('Bob','Belcher',42);

INSERT INTO people(first_name,last_name,age)VALUES
('Linda','Belcher',45),
('Philip', 'Frond',38),
('Calvin','Fischoeder',70);
	
SELECT * FROM people;
DROP TABLE people;

INSERT INTO cats(name)values('Todd');
SELECT * FROM cats;

CREATE TABLE cats2
(
	name VARCHAR(50) NOT NULL,
    age INT NOT NULL
);

-- NOT NULL and Escape Character
CREATE TABLE shop
(
	name VARCHAR(20) NOT NULL
);

INSERT INTO shop (name) VALUES('mario \'s pizza');
SELECT * FROM shop;

INSERT INTO shop (name) VALUES('She said "ha ha ha"');

-- Default values
CREATE TABLE cats3
(
	name VARCHAR(100) DEFAULT 'mystrey',
    age INT DEFAULT 99
);

INSERT INTO cats3 (age) VALUES(2);
SELECT * FROM cats3;


-- Primary Key

CREATE TABLE unique_cats
(
 cat_ID int NOT NULL PRIMARY KEY,
 name VARCHAR(100),
 age INT 
 );
 
 INSERT INTO unique_cats(cat_id,name,age)VALUES(1,'Bingo',2);
 INSERT INTO unique_cats(cat_id,name,age)VALUES(-200,'Bingo',2);
 
 -- AUTO_INCREMENT
 
 USE pet_shop;
 CREATE TABLE unique_cats2
 (
	cat_id INT AUTO_INCREMENT,
    name VARCHAR(50 ),
    age INT,
    PRIMARY KEY(cat_id)
);

-- Primary ket is a combination of the not null and unique
INSERT INTO unique_cats2 (name,age) VALUES ('Bingo',10);
SELECT * FROM unique_cats2;

-- Practice exercise

CREATE TABLE employees
(
	id INT AUTO_INCREMENT,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    age INT,
    current_status VARCHAR(50) NOT NULL DEFAULT 'employed',
    PRIMARY KEY(id)
);

DESC employees;

INSERT INTO employees(first_name,last_name,age) VALUES('chickenman','thomas',87);
SELECT * FROM employees;

 














 
 
 


