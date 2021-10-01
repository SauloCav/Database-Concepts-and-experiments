
#01 | SELECT / FROM / WHERE
# Seleciona todos os nomes que possuírem um 'a' como substring e os mostra em ordem alfabética
select nome 
	from usuarios 
    where LOCATE( 'a', nome ) > 0 
    ORDER BY LOCATE( 'a', nome );


#02 | SELECT / FROM / WHERE / AND
# Seleciona todos os id's de usuários os quais possuem premiação total maior que 0 e tenham respondido um número de questões menor que 6
select id_user 
	from estatisticas 
    where (premio_total > 0) 
    AND (n_perg_resp < 6);


#03 | SELECT / AS / FROM
# Seleciona todas as questões válidas e as mostra como 'PerguntasValidas'
select pergunta 
	AS PerguntasValidas 
    from questoes 
    where valida = 'v';


#04 | SELECT / FROM / WHERE / IS NULL
# Seleciona todos os dados de todos os usuários que possuírem seus avatares nulos
select *
	from usuarios 
	where avatar IS NULL;


#05 | SELECT / DISTINCT / FROM
# Seleciona todos os nomes distintos entre si da tabela usuários
select distinct nome 
	from usuarios;


#06 | UNION
# Seleciona todos os nomes dos usuários e os une ao nome do admim
select nome 
	from usuarios 
    UNION 
	select nome 
	from admim;


#07 | LIKE
# Seleciona todos os usuários os quais possuem nomes iguais a 'marconi'
select *
	from usuarios 
    where nome 
    LIKE '%marconi%';


#08 | ORDER BY / ASC
# Seleciona todas as estatísticas e as ordena de forma crescente de acordo com a premição total de cada um dos usuários 
select *
	from estatisticas 
    ORDER BY premio_total 
    ASC;


#09 | ORDER BY / DESC
# Seleciona todas as estatísticas e as ordena de forma decrescente de acordo com o número de perguntas respondidas por usuários 
select *
	from estatisticas 
    ORDER BY n_perg_resp 
    DESC;


#10 | ALL
# retorna os id's de usuários que não possuem prêmio total maior que 500
select id_user 
	from estatisticas 
    where premio_total < 
    ALL (select premio_total 
		 from estatisticas 
         where premio_total > 500);


#11 | SOME
# retorna os id's de usuários que possuem prêmio total maior que 500
select id_user 
	from estatisticas 
    where premio_total > 
    SOME (select premio_total 
		  from estatisticas 
		  where premio_total > 0);


#12 | EXISTS
# Seleciona todos os nomes dos usuários que possuem uma premiação total maior que zero utilizando EXISTS
select nome 
	from usuarios 
    where EXISTS (select premio_total 
				  from estatisticas 
                  where id_usuario = id_user 
                  AND premio_total > 0);


#13 | NOT EXISTS
# Seleciona todos os nomes dos usuários que possuem uma premiação igual a zero utilizando NOT EXISTS
select nome 
	from usuarios 
    where NOT EXISTS (select premio_total 
					  from estatisticas 
					  where id_usuario = id_user 
					  AND premio_total > 0);


#14 | JOIN
# Seleciona todas as perguntas válidas e suas respectivas respostas por meio de JOIN
select Q.pergunta, R.resp_correta
	from (questoes Q 
		  JOIN 
          respostas R 
          ON 
          Q.id_questao=R.id_quest) 
          where Q.valida = 'v';


#15 | LEFT OUTER JOIN
# Faz a junção externa a esquerda entre a tabela usuarios e a tabela estatisticas
select *
	from (usuarios 
		  LEFT OUTER JOIN 
          estatisticas 
          ON 
          id_usuario = id_user); 


#16 | RIGHT OUTER JOIN
# Faz a junção externa a direita entre a tabela questoes e a tabela respostas
select *
	from (questoes 
		  RIGHT OUTER JOIN 
          respostas 
          ON 
          id_questao = id_quest); 


#17 | CROSS JOIN
# Faz o produto cartesiano entre a tabela usuarios e a tabela admim
select *
	from (usuarios CROSS JOIN admim);


#18 | COUNT
# Retorna o número de perguntas válidas
select COUNT(*) 
	AS NumeroDePerguntasValidas 
    from questoes 
    where valida = 'v';


#19 | MIN
# Seleciona a menor premiação total
select MIN(premio_total) 
	AS MenorPremioTot 
    from estatisticas;


#20 | MAX
# Seleciona a maior premiação total
select MAX(premio_total) 
	AS MaiorPremioTot 
    from estatisticas;


#21 | AVG
# Retorna a média das premiações totais
select AVG(premio_total) 
	AS MediaPremioTot 
    from estatisticas;


#22 | CASE
# Retorna algumas informações estatísticas adicionando uma coluna que diz se o usuário pontuou ou não
select id_user, premio_total, n_perg_resp, n_part_jogadas, 
	CASE 
    WHEN premio_total = 0 THEN 'Nao Pontuou' 
    WHEN premio_total > 0 THEN 'Ja Pontuou' 
    END AS Pontuacao from estatisticas;
