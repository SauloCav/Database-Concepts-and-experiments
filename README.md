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

SELECT Top 10 * FROM Person.BusinessEntityAdress BA INNER JOIN Person.Adress PA ON PA.AdressID = BA.AdressID;
SELECT p.BUsinessEntityID, p.FirstName, p.LastName, pe.EmailAddress FROM Person.Person AS P INNER JOIN Person.EmailAddress PE ON p.BusinessEntityID = pe.BusinessEntityID;
SELECT pr.ListPrice, pr.Name, pc.Name FROM Production.Product Pr INNER JOIN Production.ProductSubcategory PC ON PC.ProductSubcategoryID = pr.ProductSubcategoryID;
SELECT pp.BusinessEntityID, pt.PhoneNumberTypeID, pp.PhoneNumber FROM Person.PersonPhone PP INNER JOIN Person.PhoneNumberType PT ON PT.PhoneNumberTypeID = pp.PhoneNumberTypeID;
SELECT TOP 10 PA.AddressID, PA.City, PS.StateProvinceID, PS.Name FROM Person.Address PA INNER JOIN Person.StateProvince PS ON PS.StateProvinceID = PA.StateProvinceID;

SELECT * FROM Person.Person PP INNER JOIN Sales.PersonCreditCard PC ON PP.BusinessEntityID = PC.BusinessEntityID;
SELECT * FROM Person.Person PP LEFT JOIN Sales.PersonCreditCard PC ON PP.BusinessEntityID = PC.BusinessEntityID;

SELECT Firstname, Title, MiddleName FROM Person.Person WHERE Title = 'Mr.' UNION SELECT FirstName, Title, MiddleName FROM Person.Person WHERE MiddleName = 'A';

SELECT A.ContactName, A.Region, B.ContactName, B.Region FROM Customers A, Customers B WHERE A.Region = B.Region;
SELECT A.FirstName, A.HireDate, B.FirstName, B.HireDate FROM Employees A, Employees B WHERE DATEPART(YEAR, A.Hiredate) = DATEPART(YEAR, B.Hiredate);

SELECT * FROM Production.Product WHERE ListPrice > (SELECT AVG(ListPrice) FROM Production.Product);
SELECT FirstName FROM Person.Person WHERE BusinessEntityID IN (SELECT BusinessEntityID FROM HumanResources.Employee WHERE JobTitle = 'Design Engineer');
SELECT P.FirstName FROM Person.Person P INNER JOIN HumanResources.Employee E ON P.BusinessEntityID = E.BusinessEntityID AND E.JobTitle = 'Design Engineer';

SELECT SalesOrderID, DATEPART(month, OrderDate) AS Month FROM Sales.SalesOrderHeader;
SELECT SalesOrderID, DATEPART(day, OrderDate) AS Day FROM Sales.SalesOrderHeader;
SELECT SalesOrderID, DATEPART(year, OrderDate) AS Year FROM Sales.SalesOrderHeader;

String Manipulation: CONCAT | UPPER | LOWER | LEN | SUBSTRING | REPLACE 

CREATE TABLE Chanel (
   ChanelId INT PRIMARY KEY,
   Name VARCHAR(150) NOT NULL,
);
SELECT * FROM Chanel;

CREATE TABLE Video (
   VideoId INT PRIMARY KEY,
   Wiels INT DEFAULT 0,
   Likes INT DEFAULT 0,
);
SELECT * FROM Video;

CREATE TABLE Class(
   Id INT PRIMARY KEY,
   Name VARCHAR(150) NOT NULL,
);
INSERT INTO Class(Id, Name) VALUES(1, 'Class 1');
SELECT * FROM Class;
UPDATE Class SET Name = 'Class 2' WHERE Id = 1;
DELETE FROM Class WHERE Name = 'Class 2';
DELETE FROM Class;
EXEC sp_rename 'youtube', 'youtube2';

DROP TABLE Class; 

----------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Alunos (
   id_aluno int PRIMARY KEY NOT NULL,
   nome varchar(200) NOT NULL,
   data_nascimento date NOT NULL,
   sexo varchar(1) NOT NULL,
   data_cadastro dateline NOT NULL,
   login_cadastro varchar(15) NOT NULL
);

ALTER TABLE turmas
   ADD CONSTRAINT fk_ALunos FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno);

ALTER TABLE turmas
   ADD CONSTRAINT fk_Turmas FOREIGN KEY (id_aluno) REFERENCES Turmas (id_turma);

CREATE TABLE Situacao (
   id_situacao int PRIMARY KEY NOT NULL,
   situacao varchar(25) NOT NULL,
   data_cadastro datetime NOT NULL,
   login_cadastro varchar(15) NOT NULL
);

CREATE TABLE Cursos (
   id_curso int PRIMARY KEY NOT NULL,
   nome_curso varchar(200) NOT NULL,
   data_cadastro datetime NOT NULL,
   login_cadastro varchar(15) NOT NULL
);

CREATE TABLE Turmas (
   id_turma int PRIMARY KEY NOT NULL,
   id_aluno int NOT NULL,
   id_curso int NOT NULL,
   valor_turma numeric(15, 2) NOT NULL,
   desconto numeric(3, 2) NOT NULL,
   data_inicio date NOT NULL,
   data_termino date,
   data_cadastro datetime NOT NULL,
   login_cadastro varchar(15)
);

ALTER TABLE turmas
   ADD CONSTRAINT fk_Alunos FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno);

ALTER TABLE turmas
   ADD CONSTRAINT fk_Curso FOREIGN KEY (id_aluno) REFERENCES Cursos (id_curso);

CREATE TABLE Registro_Presenca (
   id_turma int NOT NULL,
   id_aluno int NOT NULL,
   id_situacao int NOT NULL,
   data_presenca date NOT NULL,
   data_cadastro date NOT NULL,
   login_cadastro varchar(15) NOT NULL
);

ALTER TABLE Registro_Presenca
   ADD CONSTRAINT fk_TurmasRP FOREIGN KEY (id_turma) REFERENCES Turmas (id_turma);

ALTER TABLE Registro_Presenca
   ADD CONSTRAINT fk_AlunoRP FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno);

ALTER TABLE Registro_Presenca
   ADD CONSTRAINT fk_SituacaoRP FOREIGN KEY (id_situacao) REFERENCES Situacao (id_situacao);

DROP TABLE Alunos;
DROP TABLE Situacao;
DROP TABLE Cursos;
DROP TABLE Turmas;
DROP TABLE Registro_Presenca;

SELECT tt.id_curso IDC, tt.id_turma IDT, tt.data_inicio "DATA COMEÇO" FROM dbo.turmas TT;
SELECT * FROM AlunosxTurmas AT, Turmas T, Cursos C WHERE AT.id_turma = T.id_turma AND T.id_curso = C.id_curso;

SELECT C.id_curso, C.nome_curso, COUNT(T.id_turma) Total_turmas FROM dbo.turmas T INNER JOIN dbo.cursos C ON C.id_curso = T.id_curso GROUP BY C.id_curso, C.nome_curso;
SELECT C.nome_curso, COUNT(T.id_turma) Total_Turmas FROM dbo.Turmas T RIGHT JOIN dbo.cursos C ON C.id_curso = T.id_curso GROUP BY C.nome_curso;

SELECT * FROM dbo.turmas WHERE id_curso IN (1, 5);
SELECT * FROM dbo.turmas WHERE id_curso NOT IN (1, 5);
SELECT DISTINCT DATEPART(YEAR, data_nascimento) AS Ano FROM dbo.alunos ORDER BY 1 ASC;
SELECT DISTINCT DATEPART(YEAR, data_nascimento) AS Ano FROM dbo.alunos ORDER BY 1 DESC;

SELECT CONVERT(char, GETDATE(), 103); -- CONVERT is very important and has a huge documentation!

SELECT DIFERENCE('Alessandro', 'Alex');











