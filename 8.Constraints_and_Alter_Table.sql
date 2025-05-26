-- CONSTRAINT AND ALTER TABLE

USE pet_shop;
-- UNIQUE
    CREATE TABLE contacts (
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
	);
 
	INSERT INTO contacts (name, phone)
	VALUES ('billybob', '8781213455');
 
	-- This insert would result in an error:
	INSERT INTO contacts (name, phone)
	VALUES ('billybob', '8781213455');
    
-- CHECK
	
	CREATE TABLE users (
	username VARCHAR(20) NOT NULL,
    age INT CHECK (age > 0)
	);
 
	CREATE TABLE palindromes (
	  word VARCHAR(100) CHECK(REVERSE(word) = word)
	);
    
-- NAMED CONSTRAINTS

	CREATE TABLE users2 (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >= 0)
	);
 
	CREATE TABLE palindromes2 (
	  word VARCHAR(100),
	  CONSTRAINT word_is_palindrome CHECK(REVERSE(word) = word)
	);

--
	CREATE TABLE companies (
		name VARCHAR(255) NOT NULL,
		address VARCHAR(255) NOT NULL,
		CONSTRAINT name_address UNIQUE (name , address)
	);
	 
	CREATE TABLE houses (
	  purchase_price INT NOT NULL,
	  sale_price INT NOT NULL,
	  CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
	);
    
	
-- ALTER TABLE - ALTER COLUMNS - ADD COLUMN

			ALTER TABLE companies 
			ADD COLUMN phone VARCHAR(15);
			 
			ALTER TABLE companies
			ADD COLUMN employee_count INT NOT NULL DEFAULT 1;
            
            SET SQL_SAFE_UPDATES = 0;
            USE pet_shop;
            SELECT * FROM companies;
			DELETE FROM companies;
            INSERT INTO companies (name,address,phone,employee_count) VALUES('blackbird auto','123 spruce',null,0);
            INSERT INTO companies (name,address,phone,employee_count) VALUES('luigis pies','123 spruce',null,0);
            
-- ALTER TABLE - ALTER COLUMNS -- DROP COLUMN

			ALTER TABLE companies DROP COLUMN phone;
            ALTER TABLE companies DROP COLUMN employee_count;
            
-- ALTER TABLE - RENAME TABLE

			RENAME TABLE companies to suppliers;
            SELECT * FROM suppliers;
            ALTER TABLE suppliers RENAME TO companies;
            SELECT * FROM companies;
            
			-- RENAME COLUMN
				
			ALTER TABLE companies RENAME COLUMN name TO company_name;
            DESC companies;

-- ALTER TABLE -- ALTER COLUMNS -- MODIFY COLUMNS

			ALTER TABLE companies MODIFY company_name VARCHAR(100) DEFAULT '1';
            DESC companies;
            
-- ALTER TABLE -- CONSTARINTS
			
            -- ADD CONSTARINTS
            
			SELECT * FROM houses;
            ALTER TABLE houses ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);
            
            DESC houses;
            INSERT INTO houses VALUES(-2,10); -- CHECK CONSTARINT VIOLATED
            
            -- DROP CONSTARINTS
            ALTER TABLE houses DROP CONSTRAINT positive_pprice;
            INSERT INTO houses VALUES(-2,10);
            
            
