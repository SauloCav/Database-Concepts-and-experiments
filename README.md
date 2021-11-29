# Basic-Database-Concepts

Some database projects developed in MySQL and SQL

SELECT * FROM person.Person;
SELECT Title FROM person.Person;
SELECT * FROM person.EmailAddress;
SELECT FirstName, LastName FROM person.Person;

SELECT DISTINCT FirstName FROM person.Person;
SELECT DISTINCT LastName FROM person.Person;

/*Coment*/
SELECT * FROM person.Person WHERE FirstName = 'anna' AND LastName = 'miller';
SELECT * FROM production.Product WHERE color = 'blue' OR color = 'black';
SELECT * FROM production.Product WHERE ListPrice > 1500 AND ListPrice < 5000;
SELECT * FROM production.Product WHERE color <> 'red';
SELECT Name FROM production.Product WHERE Weight > 500kg AND Weight < 700;
SELECT * FROM HumanResources.Employee WHERE MaritalStatus = 'm' AND SalarieFlag = 1;
SELECT * FROM person.Person WHERE FirstName = 'peter' AND LastName = 'krebs';
SELECT * FROM person.EmailAdress WHERE BusinessEntityID = 26;

SELECT count(*) FROM person.Person;
SELECT count(tittle) FROM person.Person;
SELECT count(DISTINCT tittle) FROM person.Person;

SELECT count(*) FROM production.Product;
SELECT count(size) FROM production.Product;
 
SELECT TOP 10 * FROM production.Product;
SELECT TOP 100 * FROM production.Product;

SELECT * FROM person.Person ORDER BY FirstName asc;
SELECT * FROM person.Person ORDER BY FirstName desc;
SELECT * FROM person.Person ORDER BY FirstName desc, LastName asc;
SELECT FirstName, LastName FROM person.Person ORDER BY FirstName desc, LastName asc; 
SELECT TOP 10 productId FROM Production.Product ORDER BY ListPrice desc;
SELECT TOP 4 name, ProductNumber FROM Production.Product ORDER BY productId asc;

SELECT * FROM production.Product WHERE ListPrice BETWEEN 1000 AND 1500;
SELECT * FROM production.Product WHERE ListPrice NOT BETWEEN 1000 AND 1500;
SELECT * FROM HumanResources.Employee WHERE HIreDate BETWEEN '2009/01/01' AND '2010/01/01';
SELECT * FROM HumanResources.Employee WHERE HIreDate BETWEEN '2009/01/01' AND '2010/01/01' ORDER BY HireDate;

SELECT * FROM person.Person WHERE BusinessEntityID IN (2,7,13);
SELECT * FROM person.Person WHERE BusinessEntityID NOT IN (2,7,13);



