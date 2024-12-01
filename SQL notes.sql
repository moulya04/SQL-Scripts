                                                         ALL ABOUT SQL WITH QUERIES

/* 1.DATABASE is a system that allows users to store and organise data.
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
WHERE id = 3; -- Delete statement is used to delete existing records in a table 

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

TRUNCATE TABLE customer; -- TRUNCATE TABLE command deletes the data inside a table, but not the table itself

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

