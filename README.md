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

SELECT COUNT(*) FROM person.Person;
SELECT COUNT(tittle) FROM person.Person;
SELECT COUNT(DISTINCT tittle) FROM person.Person;

SELECT COUNT(*) FROM production.Product;
SELECT COUNT(size) FROM production.Product;
 
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

SELECT * FROM person.Person WHERE FirstName LIKE 'ovi%';
SELECT * FROM person.Person WHERE FirstName LIKE '%to';
SELECT * FROM person.Person WHERE FirstName LIKE '%essa%';
SELECT * FROM person.Person WHERE FirstName LIKE '%ro_';

SELECT COUNT(ListPrice) FROM Production.Product WHERE ListPrice > 1500;
SELECT COUNT(LastName) FROM Person.Person WHERE LastName LIKE 'p%';
SELECT COUNT(DISTINCT(city)) FROM Person.Address;
SELECT DISTINCT(city) FROM Person.Address;
SELECT COUNT(*) FROM Production.Product WHERE color = 'red' AND ListPrice BETWEEN 500 AND 1000;
SELECT COUNT(*) FROM Production.Product WHERE name LIKE '%road%';

SELECT TOP 10 * FROM Sales.SalesOrderDetail;
SELECT TOP 10 SUM(LineTotal) FROM Sales.SalesOrderDetail;
SELECT TOP 10 SUM(LineTotal) AS "Sum" FROM Sales.SalesOrderDetail;
SELECT TOP 10 MAX(LineTotal) FROM Sales.SalesOrderDetail;
SELECT TOP 10 MIN(LineTotal) FROM Sales.SalesOrderDetail;
SELECT TOP 10 AVG(LineTotal) FROM Sales.SalesOrderDetail;

SELECT * FROM Sales.SalesOrderDetail;
SELECT SpecialOfferID, UnitPrice FROM Sales.SalesOrderDetail WHERE SpecialOfferID = 9;
SELECT SpecialOfferID, SUM(UNitPrice) AS "Sum" FROM Sales.SalesOrderDetail GROUP BY SpecialOfferID;
SELECT ProductID, COUNT(ProductID) AS "Count" FROM Sales.SalesOrderDetail GROUP BY ProductID;
SELECT FirstName, COUNT(FirstName) AS "Count" FROM Person.Person GROUP BY FirstName;
SELECT Color, AVG(ListPrice) AS "Price" FROM Production.Product GROUP BY Color;
SELECT MiddleName, COUNT(Firstname) AS "qtd" FROM Person.Person GROUP BY MiddleName;
SELECT ProductID, AVG(OrderQty) AS "avg" FROM Sales.SalesOrderDetail GROUP BY ProductID;
SELECT TOP 10 ProductID, SUM(LineTotal) FROM Sales.SalesOrderDetail GROUP BY ProductID ORDER BY SUM(LineTotal) DESC;
SELECT ProductID, COUNT(ProductID) AS "Count" AVG(OrderQty) AS "avg" FROM Production.WorkOrder GROUP BY ProductID;

SELECT ProductID, SUM(LineTotal) AS "Total" FROM Sales.SalesOrderDetail GROUP BY ProductID HAVING SUM(LineTotal) BETWEEN 162000 AND 500000;
SELECT StateProvinceID, COUNT(StateProvinceID) AS "qtd" FROM Person.Address GROUP BY StateProvinceID HAVING COUNT(StateProvinceID) > 1000;
SELECT ProductID, AVG(LineTotal) FROM Sales.SalesOrderDetail GROUP BY ProductID HAVING AVG(LineTotal) > 1000000;

SELECT TOP 10 ListPrice AS "Product Price" FROM Production.Product;
SELECT TOP 10 FirstName AS "Name", LastName AS "LastName" FROM Person.Person;
SELECT TOP 10 ProductNumber AS "Product Number" FROM Production.Product;
SELECT UnitPrice AS "Unit Price" FROM Sales.SalesOrderDetail;
























