# Basic-Database-Concepts

Some database projects developed in MySQL and SQL

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


-----------------------------------------------------------------------------------------------------------------------------------------------------

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

---------------------------------------------------------------------------------------------------------------------------------------




