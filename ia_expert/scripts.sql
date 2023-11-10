CREATE TABLE cliente (
    idcliente SERIAL,
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11),
    rg VARCHAR(15),
    data_nascimento DATE,
    genero CHAR(1),
    profissao VARCHAR(30),
    nacionalidade VARCHAR(30),
    logradouro VARCHAR(30),
    numero VARCHAR(10),
    complemento VARCHAR(30),
    bairro VARCHAR(30),
    municipio VARCHAR(30),
    uf VARCHAR(30),
    observacoes TEXT,
	
	-- PRIMARY KEY
	CONSTRAINT pk_clc_idcliente PRIMARY KEY (idcliente)
);

INSERT INTO cliente(
	nome, 
	cpf, 
	rg, 
	data_nascimento, 
	genero, profissao, 
	nacionalidade, 
	logradouro, 
	numero, 
	complemento, 
	bairro, 
	municipio, 
	UF
)
VALUES (
	'Manoel', 
	'88828383821',
	'32323','2001-01-30',
	'M',
	'Estudante', 
	'Brasileira', 
	'Rua Joaquim Nabuco',
	'23',
	'Casa',
	'Cidade Nova',
	'Porto Uniao',
	'SC'
);

INSERT INTO cliente(nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, UF)
VALUES 
    ('Geraldo', '12343299929','56565','1987-01-04','M','Engenheiro', 'Brasileira', 'Rua das Limas','200','Ap','Centro','Poro Uniao','SC'),
    ('Carlos','87732323227','55463','1967-10-01','M','Pedreiro','Brasileira','Rua das Laranjeiras','300','Apart.','Cto.','Canoinhas','SC'),
    ('Adriana','12321222122','98777','1989-09-10','F','Jornalista','Brasileira','Rua das Limas','240','Casa','São Pedro','General Carneiro','PR'),
    ('Amanda','99982838828','28382','1991-03-04','F','Jorn.','Italiana','Av. Central','100',null, 'São Pedro','General Carneiro','PR'),
    ('Ângelo', '99982828181','12323','2000-01-01','M','Professor','Brasileiro','Av. Beira Mar','300',null, 'Ctr.','São Paulo','SP'),
    ('Anderson',null,null,null,'M','Prof.','Italiano', 'Av. Brasil','100','Apartamento','Santa Rosa','Rio de Janeiro','SP'),
    ('Camila','9998282828',null,'2001-10-10','F','Professora','Norte-Americana','Rua Central','4333',null,'Centro','Porto Alegre','RS'),
    ('Cristiano',null,null,null,'M','Estudante','Alemã','Rua do Centro','877','Casa','Centro','Porto Alegre','RS'),
    ('Fabricio','8828282828','32323',null,'M','Estudante','Brasileiro',null,null,null,null, 'PU','SC'),
    ('Fernanda',null,null,null,'F',null,'Brasileira',null,null,null,null,'Porto União','SC'),
    ('Gilmar','88881818181','888','2000-02-10','M','Estud.',null,'Rua das Laranjeiras','200',null,'C. Nova','Canoinhas','SC'),
    ('Diego','1010191919','111939',null,'M','Professor','Alemão','Rua Central','455','Casa','Cidade N.','São Paulo','SP'),
    ('Jeferson',null,null,'1983-07-01','M',null,'Brasileiro',null,null, null,null,'União da Vitória','PR'),
    ('Jessica',null,null,null,'F','Estudante', null, null, null, null, null, 'União da Vitória','PR');


-- Consultas

SELECT * 
FROM cliente;

SELECT nome, data_nascimento 
FROM cliente;

SELECT 'CPF: ' || cpf || ' RG: ' || rg AS "CPF e RG" 
FROM cliente; -- Consulta com concatenacao

SELECT * 
FROM cliente 
LIMIT 3; -- Consultando os 3 primeiros clientes da tabela

SELECT nome, data_nascimento 
FROM cliente 
WHERE data_nascimento > '2000-01-01'; -- Consulta com filtro

SELECT nome 
FROM cliente 
WHERE nome 
LIKE 'C%'; -- Nomes que comecam com a letra 'C' e é seguido de qualqur caracter (%)

SELECT nome 
FROM cliente 
WHERE nome 
LIKE '%c%'; -- Começa e termmina com qualquer letra em tem 'C' no meio

SELECT nome, data_nascimento 
FROM cliente 
WHERE data_nascimento 
BETWEEN '1990-01-01' AND '1998-01-01';

-- Nome, genero e profissao de todos os clientes, ordenados pelo nome em ordem descrescente
SELECT nome, genero, profissao 
FROM cliente 
ORDER BY nome DESC;

-- Clientes que tem a letra 'R' no nome
SELECT nome 
FROM cliente 
WHERE nome 
LIKE '%r%';

-- Clientes que o nome inicia com a letra "C"
SELECT nome 
FROM cliente 
WHERE nome 
LIKE 'C%';

-- Clientes que o nome termina com a letra 'A'
SELECT nome 
FROM cliente 
WHERE nome 
LIKE '%a';

-- Clientes que moram no bairro "Centro"
SELECT nome, bairro 
FROM cliente 
WHERE bairro = 'Centro' OR bairro = 'Cto.' OR bairro = 'Ctr.';

-- Clientes que moram em complementos que iniciam com a letra "A"
SELECT nome, complemento
FROM cliente
WHERE complemento LIKE 'A%';

-- Somente clientes do sexo feminino
SELECT nome, genero
FROM cliente
WHERE genero = 'F';

-- Os clientes que não informaram o CPF
SELECT nome, cpf
FROM cliente
WHERE cpf IS null;

-- Comando UPDATE
SELECT * FROM cliente;

UPDATE cliente
SET nome = 'Manoel'
WHERE idcliente = 1;

-- Criando tabela de profissoes

CREATE TABLE profissao (
    idprofissao SERIAL,
    nome VARCHAR(30) NOT NULL,
   
	CONSTRAINT pk_prf_idprofissao PRIMARY KEY (idprofissao), -- PRIMARY KEY
	CONSTRAINT un_prf_nome UNIQUE (nome) -- Nomes únicos
);


SELECT profissao FROM cliente;

INSERT INTO profissao (nome)
VALUES 
	('Estudante'),
	('Engenheiro'),
	('Pedreiro'),
	('Jornalista'),
	('Professor');

SELECT * FROM profissao;

-- Tabela de nacionalidades

CREATE TABLE nacionalidade (
    idnacionalidade SERIAL,
    nome VARCHAR(30) NOT NULL,
   
	CONSTRAINT pk_ncn_idnacionalidade PRIMARY KEY (idnacionalidade), -- PRIMARY KEY
	CONSTRAINT un_ncn_nome UNIQUE (nome) -- Nomes únicos
);

SELECT nacionalidade FROM cliente;

INSERT INTO nacionalidade (nome)
VALUES
	('Brasileira'),
	('Italiana'),
	('Norte-americana'),
	('Alemã');
	
SELECT * FROM nacionalidade;


-- Tabela de complemento

CREATE TABLE complemento (
    idcomplemento SERIAL,
    nome VARCHAR(30) NOT NULL,
   
	CONSTRAINT pk_clp_idcomplemento PRIMARY KEY (idcomplemento), -- PRIMARY KEY
	CONSTRAINT un_clp_nome UNIQUE (nome) -- Nomes únicos
);


INSERT INTO complemento (nome)
VALUES 
	('Casa'),
	('Apartamento');
	
SELECT * FROM complemento;


-- Tabela de bairros

CREATE TABLE bairro (
    idbairro SERIAL,
    nome VARCHAR(30) NOT NULL,
   
	CONSTRAINT pk_brr_idbairro PRIMARY KEY (idbairro), -- PRIMARY KEY
	CONSTRAINT un_brr_nome UNIQUE (nome) -- Nomes únicos
);

SELECT bairro FROM cliente;

INSERT INTO bairro (nome)
VALUES
	('Centro'),
	('São Pedro'),
	('Santa Rosa'),
	('Cidade Nova');
	
SELECT * FROM bairro;