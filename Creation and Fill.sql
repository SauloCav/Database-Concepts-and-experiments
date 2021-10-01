
create database JogoDePerguntas;

CREATE TABLE usuarios (
    id_usuario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(10) NOT NULL UNIQUE,
    nickname VARCHAR(10) NOT NULL,
    avatar LONGBLOB,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE admim (
    id_admim INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(10) NOT NULL UNIQUE,
    nickname VARCHAR(10) NOT NULL,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE questoes (
    id_questao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    pergunta varchar(100) NOT NULL,
	valida enum ('v','i') NOT NULL
);

CREATE TABLE respostas (
    id_respostas INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	resp_a varchar(50) NOT NULL,
	resp_b varchar(50) NOT NULL,
	resp_c varchar(50) NOT NULL,
	resp_d varchar(50) NOT NULL,
	resp_correta varchar(6) NOT NULL,
    id_quest int NOT NULL,
	FOREIGN KEY(id_quest) references questoes(id_questao)
);

CREATE TABLE estatisticas (
	id_estats INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    n_part_jogadas int NOT NULL,
	n_derr_erro int NOT NULL,
	n_derr_desis int NOT NULL,
	n_perg_resp int NOT NULL,
	premio_total int NOT NULL,
	n_util_eli_duas_altern int NOT NULL,
    id_user int NOT NULL,
	FOREIGN KEY(id_user) references usuarios(id_usuario)
);

insert into usuarios values
	(default, 'Gordon', 'gordon12', null, '12345678'),
    (default, 'Max', 'madmax', null, '87654321'),
    (default, 'Maria', 'maria001', null, '01293847'),
    (default, 'Silvia', 'silvinha', null, '09465201'),
    (default, 'Edimar', 'edioceano', null, '00001928'),
    (default, 'Francisco', 'chiquim02', null, '11126374'),
    (default, 'Ana', 'aninha12', null, '09275849'),
    (default, 'Amado', 'batista', null, '99990192'),
    (default, 'Tereza', 'terezinha', null, '09129839'),
    (default, 'Creuza', 'creuza8', null, '08092733'),
    (default, 'Augusto', 'augustin', null, '44440944'),
    (default, 'Jacinto', 'jacinto43', null, '09129839'),
    (default, 'Furtuoso', 'furtuoso2', null, '99990192'),
    (default, 'Americo', 'americo98', null, '09275849'),
    (default, 'Hozanan', 'hozanan8', null, '11126374'),
    (default, 'Gabriel', 'gabriel22', null, '00001928'),
    (default, 'Nina', 'nina345', null, '09465201'),
    (default, 'Marconi', 'ian234', null, '01293847'),
    (default, 'Maura', 'maurinha0', null, '87654321'),
    (default, 'Marinalva', 'marinalva2', null, '12345678');

insert into admim values
	(default, 'Samantha', 'samantha00', '12345678');

insert into questoes values
	(default, 'Normalmente, quantos litros de sangue uma pessoa tem?', 'i'),
    (default, 'De quem é a famosa frase “Penso, logo existo”?', 'v'),
    (default, 'De onde é a invenção do chuveiro elétrico?', 'v'),
    (default, 'Quais o menor e o maior país do mundo?', 'i'),
    (default, 'Qual o nome do presidente do Brasil que ficou conhecido como Jango?', 'v'),
    (default, 'Qual o grupo em que todas as palavras foram escritas corretamente?', 'v'),
    (default, 'Qual o livro mais vendido no mundo a seguir à Bíblia?', 'v'),
    (default, 'Quantas casas decimais tem o número pi?', 'v'),
    (default, 'Atualmente, quantos elementos químicos a tabela periódica possui?', 'i'),
    (default, 'Quais os países que têm a maior e a menor expectativa de vida do mundo?', 'v'),
    (default, 'O que a palavra legend significa em português?', 'v'),
    (default, 'Qual o número mínimo de jogadores numa partida de futebol?', 'v'),
    (default, 'Quais os principais autores do Barroco no Brasil?', 'v'),
    (default, 'Quais as duas datas que são comemoradas em novembro?', 'v'),
    (default, 'Quem pintou "Guernica"?', 'v'),
    (default, 'Quanto tempo a luz do Sol demora para chegar à Terra?', 'i'),
    (default, 'Qual a tradução da frase “Fabiano cogió su saco antes de salir”?', 'v'),
    (default, 'Qual a nacionalidade de Che Guevara?', 'v'),
    (default, 'Qual a altura da rede de vôlei nos jogos masculino e feminino?', 'v'),
    (default, 'Em que período da pré-história o fogo foi descoberto?', 'i');

insert into respostas values
	(default, 'Tem entre 2 a 4 litros', 'Tem entre 4 a 6 litros', 'Tem 10 litros', 'Tem 7 litros', 'resp_b', '1'),
    (default, 'Platão', 'Galileu Galilei', 'Descartes', 'Sócrates', 'resp_c', '2'),
    (default, 'França', 'Inglaterra', 'Brasil', 'Austrália', 'resp_c', '3'),
    (default, 'Vaticano e Rússia', 'Nauru e China', 'Mônaco e Canadá', 'Malta e Estados Unidos', 'resp_a', '4'),
    (default, 'Jacinto Anjos', 'Getúlio Vargas', 'João Figueiredo', 'João Goulart', 'resp_d', '5'),
    (default, 'Asterístico, beneficiente, meteorologia, entertido', 'Asterisco, beneficente, meteorologia, entretido',
		'Asterisco, beneficente, metereologia, entretido', 'Asterístico, beneficiente, metereologia, entretido', 'resp_b', '6'),
    (default, 'O Senhor dos Anéis', 'Dom Quixote', 'O Pequeno Príncipe', 'Ela, a Feiticeira', 'resp_b', '7'),
    (default, 'Duas', 'Centenas', 'Infinitas', 'Vinte', 'resp_c', '8'),
    (default, '113', '109', '108', '118', 'resp_d', '9'),
    (default, 'Japão e Serra Leoa', 'Austrália e Afeganistão', 'Itália e Chade', 'Brasil e Congo', 'resp_a', '10'),
    (default, 'Legenda', 'Conto', 'História', 'Lenda', 'resp_d', '11'),
    (default, '10', '9', '5', '7', 'resp_d', '12'),
    (default, 'Gregório de Matos e Bento Teixeira', 'Miguel de Cervantes e Gregório de Matos', 'Padre Antônio Vieira e Padre Manuel de Melo',
		'Castro Alves e Bento Teixeira', 'resp_a', '13'),
    (default, 'Independência do Brasil', 'Proclamação da República', 'Dia do Médico e Dia de São Lucas', 'Dia de Finados', 'resp_b', '14'),
    (default, 'Paul Cézanne', 'Pablo Picasso', 'Diego Rivera', 'Tarsila do Amaral', 'resp_b', '15'),
    (default, '12 minutos', '1 dia', '12 horas', '8 minutos', 'resp_d', '16'),
    (default, 'Fabiano coseu seu paletó antes de sair', 'Fabiano fechou o saco antes de sair', 'Fabiano pegou seu paletó antes de sair c',
		'Fabiano cortou o saco antes de cair', 'resp_c', '17'),
    (default, 'Peruana', 'Panamenha', 'Boliviana', 'Argentina', 'resp_d', '18'),
    (default, '2,5 m e 2,0 m', '1,8 m e 1,5 m', '2,45 m e 2,15 m', '2,43 m e 2,24 m', 'resp_d', '19'),
    (default, 'Neolítico', 'Paleolítico', 'Idade dos Metais', 'Período da Pedra Polida', 'resp_b', '20');
    
insert into estatisticas values
##(id_estats, n_part_jogadas, n_derr_erro, n_derr_desis, n_perg_resp, premio_total, n_util_eli_duas_altern, id_user)
	(default, '2', '2', '0', '5', '500', '2', '1'),
    (default, '1', '1', '0', '2', '0', '1', '2'),
    (default, '2', '2', '0', '6', '500', '2', '3'),
    (default, '3', '3', '0', '8', '0', '3', '4'),
    (default, '2', '2', '0', '5', '500', '1', '5'),
    (default, '1', '1', '0', '3', '0', '1', '6'),
    (default, '1', '1', '0', '1', '0', '1', '7'),
    (default, '4', '4', '0', '9', '500', '2', '8'),
    (default, '5', '5', '0', '8', '500', '3', '9'),
    (default, '6', '6', '0', '12', '0', '4', '10'),
    (default, '2', '2', '0', '3', '2500', '1', '11'),
    (default, '2', '2', '0', '2', '0', '1', '12'),
    (default, '4', '4', '0', '7', '500', '1', '13'),
    (default, '1', '1', '0', '1', '500', '1', '14'),
    (default, '3', '3', '0', '8', '0', '2', '15'),
    (default, '2', '2', '0', '3', '2500', '2', '16'),
    (default, '6', '6', '0', '9', '500', '1', '17'),
    (default, '2', '2', '0', '2', '0', '2', '18'),
    (default, '3', '3', '0', '5', '500', '1', '19'),
    (default, '2', '2', '0', '5', '0', '2', '20');

select *from usuarios;
desc usuarios;

select *from admim;
desc admim;

select *from questoes;
desc questoes;

select *from respostas;
desc respostas;

select *from estatisticas;
desc estatisticas;

drop database JogoDePerguntas;

insert into usuarios values
	(default, 'Saul', 'saulo123', null, '12345678');	
    
update usuarios set nome = 'Saulo' where id_usuario = 21;

delete from usuarios where id_usuario = 21;

