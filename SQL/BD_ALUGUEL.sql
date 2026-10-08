CREATE DATABASE IF NOT EXISTS BD_ALUGUEL;
USE BD_ALUGUEL;

CREATE TABLE IF NOT EXISTS CLIENTE(
	CLI_ID INT AUTO_INCREMENT PRIMARY KEY,
    CLI_NOME 		VARCHAR(50) NOT NULL,
    CLI_CPF 		VARCHAR(11) NOT NULL,
    CLI_EMAIL 		VARCHAR(50) NOT NULL,
    CLI_TELEFONE 	VARCHAR(9) NOT NULL
);

ALTER TABLE CLIENTE
MODIFY COLUMN CLI_CPF VARCHAR(11) NOT NULL UNIQUE;

CREATE TABLE IF NOT EXISTS PRODUTO(
	PRO_ID		 		INT AUTO_INCREMENT PRIMARY KEY,
    PRO_NOME 			VARCHAR(50) NOT NULL,
    PRO_DESCRICAO 		VARCHAR(200),
    PRO_PRECO 			DOUBLE NOT NULL,
    PRO_QTD_DISPONIVEL 	INT NOT NULL
);

CREATE TABLE IF NOT EXISTS ALUGUEL(
	ALU_ID 				INT AUTO_INCREMENT PRIMARY KEY,
    ALU_DATA_ALUGUEL 	DATE NOT NULL,
    ALU_DATA_DEVOLUCAO	DATE NOT NULL,
    ALU_VALOR_TOTAL 	DOUBLE NOT NULL,
    FK_CLI_ID 			INT,
    FOREIGN KEY (FK_CLI_ID) REFERENCES CLIENTE(CLI_ID)
);

CREATE TABLE IF NOT EXISTS ALUGUEL_PRODUTO(
	ALP_ID 			INT AUTO_INCREMENT PRIMARY KEY,
    FK_PRO_ID 		INT NOT NULL,
    FK_ALU_ID 		INT NOT NULL,
    FOREIGN KEY (FK_PRO_ID) REFERENCES PRODUTO(PRO_ID),
    FOREIGN KEY (FK_ALU_ID) REFERENCES ALUGUEL(ALU_ID)
);

INSERT INTO CLIENTE (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
VALUES ("Thiago", "98898170041", "thiago@gmail.com", "912032382");

INSERT INTO CLIENTE (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
VALUES ("Leonardo", "45810705030", "leo_eva@gmail.com", "915213281");

SELECT * FROM CLIENTE;

INSERT INTO PRODUTO (	PRO_NOME,
						PRO_PRECO,
						PRO_QTD_DISPONIVEL)
                        
VALUES					("Iphone 18 Pro Max",
						589.90,
                        100);
                        
INSERT INTO PRODUTO (	PRO_NOME,
						PRO_DESCRICAO,
						PRO_PRECO,
						PRO_QTD_DISPONIVEL)
                        
VALUES					("Lancha Turbo",
						"Lancha para rio e mar",
						1067.90,
                        3);
                        
SELECT * FROM PRODUTO;

INSERT INTO ALUGUEL (ALU_DATA_ALUGUEL,
					ALU_DATA_DEVOLUCAO,
                    ALU_VALOR_TOTAL,
                    FK_CLI_ID)
			VALUES 	("2026-10-08",
					"2026-10-15",
                    600.89,
                    2);
                    
SELECT * FROM ALUGUEL;

INSERT INTO ALUGUEL_PRODUTO(FK_PRO_ID, FK_ALU_ID)
VALUES(1,1);

SELECT * FROM ALUGUEL_PRODUTO;

INSERT INTO CLIENTE (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
VALUES ("Ana Silva", 12345678900, "ana.silva@example.com", 987654321),
		("Bruno Souza", 12345678999, "bruno.souza@example.com", 123456789),
		("Carla Mendes", 34382018759, "carla.mendes@example.com", 193678910),
        ("Daniel Rocha", 12345678924, "daniel.rocha@example.com", 182984938),
        ("Leo", 93873091396, "leozin@example.com", 739201698),
        ("Lau", 07491755917, "lau@example.com", 590478294),
        ("Loe", 09017847932, "loe@example.com", 083493673),
        ("LauLau", 08947821904, "Laulau@example.com", 927501093),
        ("Lio", 29850128559, "lio@example.com", 930681749),
        ("LiuLiu", 80207391801, "Liliu@example.com", 091684905);

SELECT * FROM CLIENTE;

INSERT INTO PRODUTO (PRO_NOME,
						PRO_DESCRICAO,
                        PRO_PRECO,
                        PRO_QTD_DISPONIVEL)
				VALUES ("Notebook Dell Ispiron","Notebook com processador Intel Core i7 16gb de ram 512GB SSD", 450, 10),
						("Smartphone Samsung Galaxy S21","Smartphone com tela de 6.2 polegadas 128GB de armazenamento", 350, 15),
                        ("TV LG 55 4K","Smart TV com resolução 4K e HDR", 280, 8),
                        ("Drone DJI Phantom 4","Drone com camera 4K", 300, 55),
                       ("Cam Canon EOSI T7","Camera DSLR com lente 18-55mm", 250, 2),
                        ("Camera GoPro Hero 9","Camera de ação com resolução 5K", 80, 60),
                        ("Tenda Eventos 5x5m","Tenda Resistente", 200, 4),
                        ("Microfone Shure SM58","Microfone para Apresentações", 40, 35),
                        ("Mesa de Som Behringer","Mesa de som com 16 canais", 500, 3),
                        ("Kit de Iluminação Fotográfica","Kit com softbox", 100, 6);
                        
SELECT * FROM PRODUTO;

SELECT PRO_NOME, PRO_DESCRICAO FROM PRODUTO;
SELECT PRO_NOME, PRO_DESCRICAO, PRO_PRECO	 FROM PRODUTO;

-- Selecionar apenas os produtos com o preço > 250

SELECT * 
FROM PRODUTO
WHERE PRO_PRECO > 250;

-- SELECIONAR APENAS O PRODUTO DE ID 3

SELECT PRO_ID,
		PRO_NOME
FROM PRODUTO 
WHERE PRO_ID = 3;

-- SELECIONAR TODOS OS PRODUTOS QUE TENHAM NOTEBOOK NO NOME

SELECT *
FROM PRODUTO
WHERE PRO_NOME LIKE '%NOTEBOOK%';

-- ATUALIZAR A QUANTIDADE DE NOTEBOOKS PARA 200

UPDATE PRODUTO
SET PRO_QTD_DISPONIVEL = 200
WHERE PRO_ID = 3; -- UPDATE TEM QUE TER WHERE

-- ATUALIZAR A DESCRICAO DO NOTEBOOK PARA VAZIO

UPDATE PRODUTO
SET PRO_DESCRICAO = NULL
WHERE PRO_ID = 3; -- UPDATE TEM QUE TER WHERE

-- APAGAR/DELETAR O  NOTEBOOK

DELETE FROM PRODUTO
WHERE PRO_ID = 3; -- DELETE TEM QUE TER O WHERE