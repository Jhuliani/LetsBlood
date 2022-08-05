CREATE TABLE medico(
	crm NUMERIC UNIQUE NOT NULL,
	nome VARCHAR (100) NOT NULL,
    CONSTRAINT PK_crm_medico PRIMARY KEY (crm),
);
GO

CREATE TABLE doador(
	cpf NUMERIC UNIQUE NOT NULL,
	doenca VARCHAR (50) NULL,
	nome VARCHAR (100) NOT NULL,
	email VARCHAR (50) NOT NULL,
	idade INT NOT NULL,
	endereco VARCHAR (100) NOT NULL,
	telefone NUMERIC NOT NULL,
	crm NUMERIC NOT NULL, 
	CONSTRAINT PK_cpf_doador PRIMARY KEY (cpf),
	CONSTRAINT FK_crm_medico FOREIGN KEY (crm) REFERENCES medico (crm),
);
GO

CREATE TABLE hospital(
	cnpj NUMERIC UNIQUE NOT NULL,
	nome VARCHAR (100) NOT NULL,
	segmento VARCHAR (100) NOT NULL,
	endereco VARCHAR (100) NOT NULL,
	email VARCHAR (50) NOT NULL,
	telefone NUMERIC NOT NULL,
	CONSTRAINT PK_cnpj_hospital PRIMARY KEY (cnpj),
);
GO 


CREATE TABLE bolsa_sangue(
	cod_bolsa INT IDENTITY (1,1) NOT NULL,

	data_coleta DATE NOT NULL,
	cnpj NUMERIC NOT NULL,
	cpf NUMERIC NOT NULL,
	crm NUMERIC NOT NULL,
    CONSTRAINT PK_cod_bolsa PRIMARY KEY (cod_bolsa),
	CONSTRAINT FK_cnpj_hospital_bolsa FOREIGN KEY (cnpj) REFERENCES hospital (cnpj),
	CONSTRAINT FK_cpf_doador_bolsa FOREIGN KEY (cpf) REFERENCES doador (cpf),
	CONSTRAINT FK_crm_medico_bolsa FOREIGN KEY (crm) REFERENCES medico (crm),
);
GO

CREATE TABLE tipo_sanguineo(
	cod_bolsa INT,
	tipo CHAR (3) NOT NULL,
	observacao_da_bolsa VARCHAR (40) NULL,
	CONSTRAINT FK_cod_bolsa_tipo FOREIGN KEY (cod_bolsa) REFERENCES bolsa_sangue (cod_bolsa),
);

--READ
SELECT * FROM medico;
SELECT * FROM doador;
SELECT * FROM bolsa_sangue;
SELECT * FROM hospital;

--UPDATE
--USANDO O UPDATE PARA INSERIR UMA DOENÇA EM UM DOADOR
UPDATE doador SET doenca = 'Diabetes' WHERE doador.cpf = 8386333901;
--USANDO O UPDATE PARA MODICAR O ENDEREÇO DO HOSPITAL
UPDATE hospital SET endereco = 'Avenida Marechal Deodoro' WHERE endereco = 'Rua Narciso Yangue 412';
--EDIT
--USANDO O ALTER PARA EDITAR UM CAMPO, NO CASO AUMENTANDO A CAPACIDADE DE CARACTERES DO NOME DO DOADOR
ALTER TABLE doador ALTER COLUMN nome VARCHAR (120) NOT NULL;


--DELETE
--EXCLUINDO TELEFONE DO DOADOR
ALTER TABLE doador DROP COLUMN telefone;
--EXCLUINDO APENAS O MÉDICO ANA MARIA
INSERT INTO medico VALUES (8157271, 'Ana Maria') -- insert da Ana só para rodar o delete abaixo
DELETE FROM medico WHERE medico.nome='Ana Maria';