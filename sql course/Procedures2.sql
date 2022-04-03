
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
