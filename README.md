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

SELECT x.*
   INTO tTemp
   FROM (
      SELECT row_number() OVER(ORDER BY id_aluno) linha,
         y.id_aluno, y.nome, y.sexo, y.nome_curso, y.data_inicio, y.data_termino, y.valor
      FROM (
         SELECT a.id_aluno, a.nome, a.sexo, c.nome_curso, t.data_inicio, t.data_termino, at.valor
            FROM alunosxTurmas at
               inner join turmas t on (t.id_turma = at.id_turma)
               inner join turmas c on (c.id_turma = t.id_turma)
               inner join turmas a on (a.id_turma = at.id_turma)      
      ) x;
      
SELECT * FROM tTemp;

BEGIN TRY
   SELECT * FROM temTable;
END TRY
BEGIN CATCH 
   SELECT
      ERROR_NUMBER() AS Número_erro;
      ERROR_MESSAGE() AS Mensagem_erro;
END CATCH;

CREATE PROCEDURE prc Exemplo
AS
   SELECT * FROM tempTable;
GO

BEGIN TRY
   EXECUTE prc_Exemplo;
END TRY
BEGIN CATCH 
   SELECT
      ERROR_NUMBER() AS Número_erro;
      ERROR_MESSAGE() AS Mensagem_erro;
END CATCH;




CREATE PROCEDURE BuscaCurso
   @NomeCurso VARCHAR(20)
AS
   SET @NomeCurso = '%' + @NomeCurso + '%';
   SELECT C.id_curso, C.nome_curso, A.nome, isnull(a.sexo, 'NI') sexo FROM Cursos C
      INNER JOIN Turmas T ON (T.id_turma = C.id_turma)
      INNER JOIN AlunosXTurmas alt ON (alt.id_turma = T.id_turma)
      INNER JOIN Alunos A ON (A.id_aluno = alt.id_aluno)
   WHERE nome_curso like @NomeCurso;

EXEC BuscaCurso 'Powerpoint';
EXEC BuscaCurso 'Excel';
EXEC BuscaCurso '%';

CREATE PROCEDURE IncluirNovoCurso
   @NomeCurso VARCHAR(100),
   @LoginCadastro VARCHAR(100)
AS
BEGIN
   DECLARE @vIdCurso INT;
   SELECT @vIdCurso = MAX(id_curso) + 1 FROM cursos;
   
   INSERT INTO cursos (id_curso, nome_curso, data_cadastro, login_cadastro)
      VALUES (@vIdCurso, @NomeCurso, getdate(), @LoginCadastro);
   
   SELECT @vIdCurso = id_curso FROM cursos WHERE id_curso = @vIdCurso;
   
   SELECT @vIdCurso AS retorno;
   
END;
GO

EXEC IncluirNovoCurso 'VBA I', 'ATROVATO';

CREATE PROCEDURE IncluirNovoCursoComValidacao
   @NomeCurso VARCHAR(100),
   @LoginCadastro VARCHAR(100)
AS
BEGIN
   DECLARE @vIdCurso INT;
   SELECT @vExisteCurso INT;
   
   SELECT @vExisteCurso = id_curso FROM cursos WHERE nome_curso = @NomeCurso;
   
   IF @vExisteCurso > 0
      BEGIN
         SELECT 'O curso já existe! Gravação não realizada!' AS retorno
      END
   ELSE
      BEGIN
         SELECT @vIdCurso = MAX(id_curso) + 1 FROM cursos;
         INSERT INTO cursos (id_curso, nome_curso, data_cadastro, login_cadastro) VALUES (@vIdCurso, @NomeCurso, getdate(), @LoginCadastro);
         SELECT @vIdCurso = id_curso FROM cursos WHERE id_curso = @vIdCurso;
         SELECT @vIdCurso AS retorno;
      END
      
END;
GO

EXEC IncluirNovoCursoComValidacao 'VBA I', 'ATROVATO';
EXEC IncluirNovoCursoComValidacao 'VBA II', 'ATROVATO';

SELECT *
   FROM dbo.turmas
   WHERE id_curso NOT IN (1, 5);

SELECT *
   FROM dbo.turmas
   WHERE id_curso NOT IN (1, 5);

---------------------------------------------------------------------------------------------------------------------------------------

SELECT FirstName, LastName, Department  
FROM HumanResources.vEmployeeDepartmentHistory  
WHERE FirstName = @FirstName AND LastName = @LastName  
    AND EndDate IS NULL;  
    
USE AdventureWorks2012;  
GO  
CREATE PROCEDURE HumanResources.uspGetEmployeesTest2   
    @LastName nvarchar(50),   
    @FirstName nvarchar(50)   
AS   

    SET NOCOUNT ON;  
    SELECT FirstName, LastName, Department  
    FROM HumanResources.vEmployeeDepartmentHistory  
    WHERE FirstName = @FirstName AND LastName = @LastName  
    AND EndDate IS NULL;  
GO  

EXECUTE HumanResources.uspGetEmployeesTest2 N'Ackerman', N'Pilar';  
-- Or  
EXEC HumanResources.uspGetEmployeesTest2 @LastName = N'Ackerman', @FirstName = N'Pilar';  
GO  
-- Or  
EXECUTE HumanResources.uspGetEmployeesTest2 @FirstName = N'Pilar', @LastName = N'Ackerman';  
GO  

----------------------------------------------------------------------------------------------------------------------------------------

CREATE PROC What_DB_is_this
AS
SELECT DB_NAME() AS ThisDB;

CREATE PROC What_DB_is_that @ID INT
AS
SELECT DB_NAME(@ID) AS ThatDB;

-- Passing the function value as a variable.
DECLARE @CheckDate DATETIME = GETDATE();
EXEC dbo.uspGetWhereUsedProductID 819, @CheckDate;
GO

CREATE PROCEDURE dbo.usp_add_kitchen @dept_id INT, @kitchen_count INT NOT NULL
WITH EXECUTE AS OWNER, SCHEMABINDING, NATIVE_COMPILATION
AS
BEGIN ATOMIC WITH (TRANSACTION ISOLATION LEVEL = SNAPSHOT, LANGUAGE = N'us_english')

UPDATE dbo.Departments
SET kitchen_count = ISNULL(kitchen_count, 0) + @kitchen_count
WHERE ID = @dept_id
END;
GO

CREATE PROCEDURE HumanResources.uspGetAllEmployees
AS
    SET NOCOUNT ON;
    SELECT LastName, FirstName, JobTitle, Department
    FROM HumanResources.vEmployeeDepartment;
GO

SELECT * FROM HumanResources.vEmployeeDepartment;

EXECUTE HumanResources.uspGetAllEmployees;
GO
-- Or
EXEC HumanResources.uspGetAllEmployees;
GO
-- Or, if this procedure is the first statement within a batch:
HumanResources.uspGetAllEmployees;

CREATE ASSEMBLY HandlingLOBUsingCLR
FROM '\\MachineName\HandlingLOBUsingCLR\bin\Debug\HandlingLOBUsingCLR.dll';
GO
CREATE PROCEDURE dbo.GetPhotoFromDB
(
    @ProductPhotoID INT
    , @CurrentDirectory NVARCHAR(1024)
    , @FileName NVARCHAR(1024)
)
AS EXTERNAL NAME HandlingLOBUsingCLR.LargeObjectBinary.GetPhotoFromDB;
GO

IF OBJECT_ID ( 'HumanResources.uspGetEmployees', 'P' ) IS NOT NULL
    DROP PROCEDURE HumanResources.uspGetEmployees;
GO
CREATE PROCEDURE HumanResources.uspGetEmployees
    @LastName NVARCHAR(50),
    @FirstName NVARCHAR(50)
AS

    SET NOCOUNT ON;
    SELECT FirstName, LastName, JobTitle, Department
    FROM HumanResources.vEmployeeDepartment
    WHERE FirstName = @FirstName AND LastName = @LastName;
GO

IF OBJECT_ID ( 'HumanResources.uspGetEmployees', 'P' ) IS NOT NULL
    DROP PROCEDURE HumanResources.uspGetEmployees;
GO
CREATE PROCEDURE HumanResources.uspGetEmployees
    @LastName NVARCHAR(50),
    @FirstName NVARCHAR(50)
AS

    SET NOCOUNT ON;
    SELECT FirstName, LastName, JobTitle, Department
    FROM HumanResources.vEmployeeDepartment
    WHERE FirstName = @FirstName AND LastName = @LastName;
GO

IF OBJECT_ID ( 'HumanResources.uspGetEmployees2', 'P' ) IS NOT NULL
    DROP PROCEDURE HumanResources.uspGetEmployees2;
GO
CREATE PROCEDURE HumanResources.uspGetEmployees2
    @LastName NVARCHAR(50) = N'D%',
    @FirstName NVARCHAR(50) = N'%'
AS
    SET NOCOUNT ON;
    SELECT FirstName, LastName, JobTitle, Department
    FROM HumanResources.vEmployeeDepartment
    WHERE FirstName LIKE @FirstName AND LastName LIKE @LastName;

EXECUTE HumanResources.uspGetEmployees2;
-- Or
EXECUTE HumanResources.uspGetEmployees2 N'Wi%';
-- Or
EXECUTE HumanResources.uspGetEmployees2 @FirstName = N'%';
-- Or
EXECUTE HumanResources.uspGetEmployees2 N'[CK]ars[OE]n';
-- Or
EXECUTE HumanResources.uspGetEmployees2 N'Hesse', N'Stefen';
-- Or
EXECUTE HumanResources.uspGetEmployees2 N'H%', N'S%';

IF OBJECT_ID ( 'Production.uspGetList', 'P' ) IS NOT NULL
    DROP PROCEDURE Production.uspGetList;
GO  
CREATE PROCEDURE Production.uspGetList @Product VARCHAR(40)
    , @MaxPrice MONEY
    , @ComparePrice MONEY OUTPUT
    , @ListPrice MONEY OUT
AS  
    SET NOCOUNT ON;
    SELECT p.[Name] AS Product, p.ListPrice AS 'List Price'
    FROM Production.Product AS p
    JOIN Production.ProductSubcategory AS s
      ON p.ProductSubcategoryID = s.ProductSubcategoryID
    WHERE s.[Name] LIKE @Product AND p.ListPrice < @MaxPrice;
-- Populate the output variable @ListPprice.
SET @ListPrice = (SELECT MAX(p.ListPrice)
    FROM Production.Product AS p
    JOIN Production.ProductSubcategory AS s
      ON p.ProductSubcategoryID = s.ProductSubcategoryID
    WHERE s.[Name] LIKE @Product AND p.ListPrice < @MaxPrice);
-- Populate the output variable @compareprice.
SET @ComparePrice = @MaxPrice;
GO

DECLARE @ComparePrice MONEY, @Cost MONEY;
EXECUTE Production.uspGetList '%Bikes%', 700,
    @ComparePrice OUT,
    @Cost OUTPUT
IF @Cost <= @ComparePrice
BEGIN
    PRINT 'These products can be purchased for less than
    $'+RTRIM(CAST(@ComparePrice AS VARCHAR(20)))+'.'
END
ELSE
    PRINT 'The prices for all products in this category exceed
    $'+ RTRIM(CAST(@ComparePrice AS VARCHAR(20)))+'.';

/* Create a table type. */
CREATE TYPE LocationTableType AS TABLE
( LocationName VARCHAR(50)
, CostRate INT );
GO

/* Create a procedure to receive data for the table-valued parameter. */
CREATE PROCEDURE usp_InsertProductionLocation
    @TVP LocationTableType READONLY
    AS
    SET NOCOUNT ON
    INSERT INTO [AdventureWorks2012].[Production].[Location]
       ([Name]
       , [CostRate]
       , [Availability]
       , [ModifiedDate])
    SELECT *, 0, GETDATE()
    FROM @TVP;
GO

/* Declare a variable that references the type. */
DECLARE @LocationTVP
AS LocationTableType;

/* Add data to the table variable. */
INSERT INTO @LocationTVP (LocationName, CostRate)
    SELECT [Name], 0.00
    FROM
    [AdventureWorks2012].[Person].[StateProvince];

/* Pass the table variable data to a stored procedure. */
EXEC usp_InsertProductionLocation @LocationTVP;
GO

CREATE PROCEDURE dbo.uspCurrencyCursor
    @CurrencyCursor CURSOR VARYING OUTPUT
AS
    SET NOCOUNT ON;
    SET @CurrencyCursor = CURSOR
    FORWARD_ONLY STATIC FOR
      SELECT CurrencyCode, Name
      FROM Sales.Currency;
    OPEN @CurrencyCursor;
GO

DECLARE @MyCursor CURSOR;
EXEC dbo.uspCurrencyCursor @CurrencyCursor = @MyCursor OUTPUT;
WHILE (@@FETCH_STATUS = 0)
BEGIN;
    FETCH NEXT FROM @MyCursor;
END;
CLOSE @MyCursor;
DEALLOCATE @MyCursor;
GO

CREATE PROCEDURE HumanResources.Update_VacationHours
@NewHours SMALLINT, @Rowcount INT OUTPUT
AS
SET NOCOUNT ON;
UPDATE HumanResources.Employee
SET VacationHours =
    ( CASE
        WHEN SalariedFlag = 0 THEN VacationHours + @NewHours
        ELSE @NewHours
        END
    )
WHERE CurrentFlag = 1;
SET @Rowcount = @@rowcount;

GO
DECLARE @Rowcount INT
EXEC HumanResources.Update_VacationHours 40, @Rowcount OUTPUT
PRINT @Rowcount;

CREATE PROCEDURE Production.uspDeleteWorkOrder ( @WorkOrderID INT )
AS
SET NOCOUNT ON;
BEGIN TRY
  BEGIN TRANSACTION
  -- Delete rows from the child table, WorkOrderRouting, for the specified work order.
    DELETE FROM Production.WorkOrderRouting
    WHERE WorkOrderID = @WorkOrderID;
  -- Delete the rows from the parent table, WorkOrder, for the specified work order.
    DELETE FROM Production.WorkOrder
    WHERE WorkOrderID = @WorkOrderID;
  COMMIT
END TRY

BEGIN CATCH
  -- Determine if an error occurred.
  IF @@TRANCOUNT > 0
    ROLLBACK

  -- Return the error information.
  DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT;
  SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY();
  RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
END CATCH;

GO
EXEC Production.uspDeleteWorkOrder 13;
GO
/* Intentionally generate an error by reversing the order in which rows
   are deleted from the parent and child tables. This change does not
   cause an error when the procedure definition is altered, but produces
   an error when the procedure is executed.
*/
ALTER PROCEDURE Production.uspDeleteWorkOrder ( @WorkOrderID INT )
AS

BEGIN TRY
  BEGIN TRANSACTION
  -- Delete the rows from the parent table, WorkOrder, for the specified work order.
    DELETE FROM Production.WorkOrder
    WHERE WorkOrderID = @WorkOrderID;

  -- Delete rows from the child table, WorkOrderRouting, for the specified work order.
    DELETE FROM Production.WorkOrderRouting
    WHERE WorkOrderID = @WorkOrderID;
  COMMIT TRANSACTION
END TRY

BEGIN CATCH
  -- Determine if an error occurred.
  IF @@TRANCOUNT > 0
    ROLLBACK TRANSACTION

  -- Return the error information.
  DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT;
  SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY();
  RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
END CATCH;
GO
-- Execute the altered procedure.
EXEC Production.uspDeleteWorkOrder 15;
GO
DROP PROCEDURE Production.uspDeleteWorkOrder;

CREATE PROCEDURE HumanResources.uspEncryptThis
WITH ENCRYPTION
AS
    SET NOCOUNT ON;
    SELECT BusinessEntityID, JobTitle, NationalIDNumber,
        VacationHours, SickLeaveHours
    FROM HumanResources.Employee;
GO

EXEC sp_helptext 'HumanResources.uspEncryptThis';

SELECT definition FROM sys.sql_modules
WHERE object_id = OBJECT_ID('HumanResources.uspEncryptThis');

IF OBJECT_ID ( 'dbo.uspProductByVendor', 'P' ) IS NOT NULL
    DROP PROCEDURE dbo.uspProductByVendor;
GO
CREATE PROCEDURE dbo.uspProductByVendor @Name VARCHAR(30) = '%'
WITH RECOMPILE
AS
    SET NOCOUNT ON;
    SELECT v.Name AS 'Vendor name', p.Name AS 'Product name'
    FROM Purchasing.Vendor AS v
    JOIN Purchasing.ProductVendor AS pv
      ON v.BusinessEntityID = pv.BusinessEntityID
    JOIN Production.Product AS p
      ON pv.ProductID = p.ProductID
    WHERE v.Name LIKE @Name;

CREATE PROCEDURE Purchasing.uspVendorAllInfo
WITH EXECUTE AS CALLER
AS
    SET NOCOUNT ON;
    SELECT v.Name AS Vendor, p.Name AS 'Product name',
      v.CreditRating AS 'Rating',
      v.ActiveFlag AS Availability
    FROM Purchasing.Vendor v
    INNER JOIN Purchasing.ProductVendor pv
      ON v.BusinessEntityID = pv.BusinessEntityID
    INNER JOIN Production.Product p
      ON pv.ProductID = p.ProductID
    ORDER BY v.Name ASC;
GO

CREATE PROCEDURE dbo.TruncateMyTable
WITH EXECUTE AS SELF
AS TRUNCATE TABLE MyDB..MyTable;

-- Uses AdventureWorksDW database

--Run CREATE PROCEDURE as the first statement in a batch.
CREATE PROCEDURE Get10TopResellers
AS
BEGIN
    SELECT TOP (10) r.ResellerName, r.AnnualSales
    FROM DimReseller AS r
    ORDER BY AnnualSales DESC, ResellerName ASC;
END
;
GO

--Show 10 Top Resellers
EXEC Get10TopResellers;




