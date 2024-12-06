/* ALL ABOUT SQL WITH QUERIES

1.DATABASE is a system that allows users to store and organise data.
2.SQL(Structured Query Language) is a programming language used to interact with database.
3.SQL STRUCTURE: Database> Tables> Data(Rows & Columns) 
4.CRUD is an acronym that stands for: Create (INSERT), Read (SELECT), Update (UPDATE), Delete (DELETE)
	These represent the four fundamental operations performed on database records.
5.SQL COMMANDS: There are mainly 3 types of SQL Commands: 
	DDL(Data Definition Language): create, alter and drop
    DML(Data Manipulation Language): select, insert, update and delete
    DCL(Data Control Language): grant and revoke permission to users
6.DATA TYPES mainly classified into three categories:
	String: char, varchar, etc
    Numeric: int, float, bool, etc
    Date and Time: date, datetime, etc
7.1 A PRIMARY KEY is a unique column we set in a table to easily identify and locate data in queries.
    A table can have only one primary key, which should be unique and NOT NULL
7.2 A foreign key is a column use to link two or more tables together
    A table can have any number of foreign keys, can contain duplicate and NULL values.
8. CONSTRAINTS are used to specify rules for data in a table.*/

CREATE DATABASE sql_notes; -- to create new database
USE sql_notes; -- to use the current database

CREATE TABLE customer
(
ID int PRIMARY KEY,
Name varchar(50) NOT NULL,
Age int NOT NULL,
City char(50),
Salary numeric
); -- table created

INSERT INTO customer
(ID, Name, Age, City, Salary)
VALUES
(1, 'Sam', 26, 'Delhi', 9000),
(2, 'Ram', 19, 'Bangalore', 11000),
(3, 'Pam', 31, 'Mumabi', 6000),
(4, 'Jam', 42, 'Pune', 10000); -- new values inserted into "customer" table

INSERT INTO customer
(ID, Name, Age, City, Salary)
VALUES
(5, 'Soma', 28, 'Goa', 10000) -- to insert new values in existing record

UPDATE customer -- UPDATE command is used to update existing rows in a table 
SET name = 'Xam', age = 32
WHERE id = 4;

DELETE FROM customer
WHERE id = 3;-- Delete statement is used to delete existing records in a table 

ALTER TABLE customer -- ALTER TABLE statement is used to add, delete and modify columns in existing table
ADD COLUMN PET CHAR(10) NULL; -- to add new column in exisiting table
UPDATE customer SET PET = 'Dog' WHERE ID = 1;
UPDATE customer SET PET = 'Cat' WHERE ID = 2; -- to insert values into new column 

ALTER TABLE customer
DROP COLUMN PET -- to delete the column

ALTER TABLE customer
MODIFY Name CHAR(10) NOT NULL; -- to change the datatype/ constraint

ALTER TABLE customer
CHANGE Name CustName CHAR(10) NOT NULL; -- to change the name of column

TRUNCATE TABLE customer;-- TRUNCATE TABLE command deletes the data inside a table, but not the table itself

DROP TABLE customer; -- DROP TABLE command deletes a table in the database

SELECT * FROM customer -- SELECT statement is used to select data from a database
SELECT DISTINCT CustName from customer -- to select distinct/unique fields available in the table

/* WHERE clause is used to filter records
	It is used to extract only those records that fulfill a specified condition */
SELECT name FROM classroom
WHERE grade = 'A' 

/* The SQL reserved words and characters are called operators, 
which are used with a WHERE clause in a SQL query
MOST USED OPERATORS:
1. Aritmetic operators: Addition(+), Subtraction(-), Multiplication(*), Division(/), Modulus(%)
2. Comparison operators: (compare two different data of SQL table) 
	Equal(=), Not Equal(!=), Greater Than(>), Greater Than Equals
3. Logical operators: (perform the Boolean operations)
	ALL, IN, BETWEEN, LIKE, AND, OR, NOT, ANY
4. Bitwise operators: (perform the bit operations on the integers)
	Bitwise AND(&), Bitwise OR(|) */
    
SELECT name FROM classroom
WHERE grade = 'A' AND rollno > 3 -- WHERE clause with OPERATORS
ORDER BY grade -- ORDER BY is used to sort the result-set in ascending(ASC) or descending order(DESC)
LIMIT 5 -- will return only the Top by 5 rows from the table 

STRING FUNCTIONS are used to perform an operation on input string and return an output string
SELECT UPPER(CustName) FROM customer -- converts value to uppercase
SELECT LOWER(City) FROM customer -- converts value to lowercase
SELECT LENGTH(CustName) -- returns length of value in a text field
SELECT SUBSTRING(CustName, 1, 3), CustName FROM customer-- extracts a substring from a string
SELECT CONCAT(CustName, City), CustName, City FROM Customer -- adds two or more strings together
SELECT REPLACE(CustName, 'Sam', 'Rom'), CustName FROM customer -- replaces all occurrences of a substring within a string, with a new substring
-
-- AGGREGATE FUNCTION perform a calculation on multiple values and returns a single value
SELECT COUNT(amount) FROM payment -- returns number of values
SELECT SUM(amount) FROM payment -- returns sum of all values
SELECT MAX(amount) FROM payment -- returns maximum value
SELECT MIN(amount) FROM payment -- returns minimum value
SELECT AVG(amount) FROM payment -- returns average value
SELECT ROUND(AVG(amount), 2) FROM payment -- rounds a number to a specified number of decimal places

SELECT mode

/* GROUP BY statement group rows that have the same values into summary rows. 
It is often used with aggregate functions, to group the result-set by one or more columns.
HAVING clause is used to apply a filter on the result of GROUP BY based on the specified condition. */

SELECT mode, SUM(amount) AS total FROM payment
GROUP BY mode
HAVING COUNT(amount) >= 3 AND COUNT(amount) < 4
ORDER BY total ASC

-- Order of execution in SQL: FROM --> JOINS --> WHERE --> GROUP BY --> HAVING --> SELECT --> ORDER BY --> LIMIT

TIMESTAMP -- data type is used fpr va;ues that contain both date and time parts.
SELECT NOW() -- displays the current time and date
SELECT CURRENT_TIME -- displays the current time
SELECT CURRENT_DATE -- displays the current date
SELECT CURTIME() AS CurrentTime, DAYNAME(CURDATE()) AS Weekday; -- displays the time and day
SELECT DAYNAME(CURDATE()) AS Weekday; -- displays the day

-- EXTRACT() extracts  a part from a given date value.
SELECT EXTRACT(MONTH FROM payment_date) AS payment_month, payment_date FROM payment -- extracts month from mentioned column
SELECT EXTRACT(YEAR FROM payment_date) AS payment_year, payment_date FROM payment -- extracts year from mentioned date column
SELECT EXTRACT(HOUR FROM payment_date) AS payment_hour, payment_date FROM payment -- extracts hour from mentioned date column
SELECT EXTRACT(DAY FROM payment_date) AS payment_day, payment_date FROM payment -- extracts day(date) from mnetioned date column
SELECT EXTRACT(MINUTE FROM payment_date) AS payment_minute, payment_date FROM payment -- extracts minute from mnetioned date column
SELECT EXTRACT(QUARTER FROM payment_date) AS payment_quarter, payment_date FROM payment -- extracts quarter from mnetioned date column

SELECT DAYOFWEEK(payment_date) AS payment_day, payment_date FROM payment; -- it gives the corresponding weekday index
SELECT DAYNAME(payment_date) AS payment_day, payment_date FROM payment; -- it displays the weekday name

JOINS 
-- TO BE CONTINUED 
