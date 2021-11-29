# Basic-Database-Concepts

Some database projects developed in MySQL and SQL

SELECT * FROM person.Person;
SELECT Title FROM person.Person;
SELECT * FROM person.EmailAddress;
SELECT FirstName, LastName FROM person.Person;

SELECT DISTINCT FirstName FROM person.Person;
SELECT DISTINCT LastName FROM person.Person;

/*Coment*/

SELECT * FROM person.Person WHERE FirstName = 'anna' and LastName = 'miller';
SELECT * FROM production.Product WHERE color = 'blue' or color = 'black';


