--READ
SELECT * FROM medico;
SELECT * FROM doador;
SELECT * FROM bolsa_sangue;
SELECT * FROM tipo_sanguineo;
SELECT * FROM hospital;

--ADD
--USANDO ADD PARA ADICIONAR CAMPO NA TABELA DOADOR
ALTER TABLE doador ADD nome_mae VARCHAR(100);
ALTER TABLE doador ADD sexo CHAR(1);


--UPDATE
--USANDO O UPDATE PARA INSERIR UMA DOENÇA EM UM DOADOR
UPDATE doador SET doenca = 'HIV' WHERE doador.cpf = 8386333901;
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
DELETE FROM medico WHERE medico.nome = 'Ana Maria';


-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
/*
   ___                                      __     _         _              __  
  / _ \   _  _   ___   _ _   _  _   ___    / /  _ | |  ___  (_)  _ _    ___ \ \ 
 | (_) | | || | / -_) | '_| | || | (_-<   | |  | || | / _ \ | | | ' \  (_-<  | |
  \__\_\  \_,_| \___| |_|    \_, | /__/   | |   \__/  \___/ |_| |_||_| /__/  | |
                             |__/          \_\                              /_/ 
*/
--SELECIONA OS NOMES DOS DOADORES EM QUE O JURISCREDO TIROU O SANGUE
SELECT DISTINCT d.nome FROM doador AS d
INNER JOIN medico AS m ON d.crm = 815208;

--SELECIONA OS NOMES DOS DOADORES DE IDADE ENTRE 20 E 40 ANOS E COLOCA EM ORDEM CRESCENTE
SELECT nome, idade FROM doador WHERE idade BETWEEN 20 and 40
ORDER BY idade;

--SELECIONA OS NOMES DOS DOADORES DE TIPO SANGUÍNEO 'AB-'
SELECT doa.nome, tip.tipo FROM doador AS doa
INNER JOIN bolsa_sangue AS bol ON  doa.cpf = bol.cpf
INNER JOIN tipo_sanguineo AS tip ON tip.tipo = 'AB-' AND bol.cod_bolsa = tip.cod_bolsa;

--SELECIONA Para qual hospital foi a bolsa de sangue doada pela 'Mirella Farias'
SELECT h.nome FROM hospital h
INNER JOIN bolsa_sangue b ON h.cnpj = b.cnpj
INNER JOIN doador d ON b.cpf= d.cpf AND d.nome = 'Mirella Farias';


-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

/* __   __  _                     
   \ \ / / (_)  ___  __ __ __  ___
    \ V /  | | / -_) \ V  V / (_-<
     \_/   |_| \___|  \_/\_/  /__/ */

-- VIEW DOADORES COM IDADE ENTRE 20 E 40
CREATE VIEW vwDoador_idade_20_40 AS(
SELECT doador.nome AS Nome,
doador.idade AS Idade
FROM doador 
WHERE idade BETWEEN 20 and 40);
-- USANDO A VIEW CRIADA ACIMA
SELECT * FROM vwDoador_idade_20_40


--VIEW PARA PEGAR TODOS OS DOADORES EM QUE SUA BOLSA DE SANGUE ESTAVA SAUDAVEL
CREATE VIEW vwDoacaoSaudavel AS(
SELECT doa.nome FROM doador AS doa
INNER JOIN bolsa_sangue AS bol 
ON  doa.cpf = bol.cpf
INNER JOIN tipo_sanguineo AS tip 
ON tip.observacao_da_bolsa = 'saudavel' AND bol.cod_bolsa = tip.cod_bolsa);
-- USANDO A VIEW CRIADA ACIMA
SELECT * FROM vwDoacaoSaudavel

--VIEW PARA PEGAR TODOS OS DOADORES EM QUE SUA BOLSA DE SANGUE NÃO ESTAVA SAUDAVEL
CREATE VIEW vwDoacaoComprometida AS(
SELECT doa.nome, tip.observacao_da_bolsa FROM doador AS doa
INNER JOIN bolsa_sangue AS bol 
ON  doa.cpf = bol.cpf
INNER JOIN tipo_sanguineo AS tip 
ON tip.observacao_da_bolsa != 'saudavel' AND bol.cod_bolsa = tip.cod_bolsa);
-- USANDO A VIEW CRIADA ACIMA
SELECT * FROM vwDoacaoComprometida


-- VIEW: Quantidade de bolsas de sangue por tipo sanguíneo
CREATE VIEW vwQuantidadePorTipo AS(
SELECT tipo, COUNT(tipo) AS quantidade_de_bolsas FROM tipo_sanguineo
GROUP BY tipo);
-- Execução da view
SELECT * FROM vwQuantidadePorTipo


-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
/*
  _____         _                                
 |_   _|  _ _  (_)  __ _   __ _   ___   _ _   ___
   | |   | '_| | | / _` | / _` | / -_) | '_| (_-<
   |_|   |_|   |_| \__, | \__, | \___| |_|   /__/
                   |___/  |___/                  
*/
CREATE TRIGGER mensagem_doador_inserido
ON doador AFTER INSERT AS PRINT 'Foi inserido um doador';
--INSERT PARA TESTAR A TRIGGER
INSERT INTO doador VALUES(97865434221,'','Pamela Angels','palangel@gmail.com',69,'Rua dos Esquecidos, 413',5511985902773,347211,null,null);


-- TRIGGER AVISO DE INTERVALO MÍNIMO ENTRE DOAÇÕES NÃO RESPEITADO (2 MESES)
CREATE TRIGGER mensagem_intervalo_menor
ON bolsa_sangue 
INSTEAD OF INSERT AS 
DECLARE 
@date DATE,
@datenow DATE,
@CPF numeric
select @datenow = data_coleta FROM INSERTED
select @CPF = cpf FROM INSERTED
select @date = (SELECT MAX(data_coleta) FROM bolsa_sangue WHERE cpf = @CPF)
IF(datediff(month,@date,@datenow))<2 
PRINT 'Intervalo mínimo de dois meses não respeitado';
--INSERT PARA TESTAR A TRIGGER
INSERT INTO bolsa_sangue VALUES('2022-08-10',9173168573,60260266060,550487);


-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
/*
  ___                             _                         
 | _ \  _ _   ___   __   ___   __| |  _  _   _ _   ___   ___
 |  _/ | '_| / _ \ / _| / -_) / _` | | || | | '_| / -_) (_-<
 |_|   |_|   \___/ \__| \___| \__,_|  \_,_| |_|   \___| /__/
 */
--EXEMPLO DE PROCUDERE PARA RETORNAR TODAS AS INFORMAÇÕES DE CONTATO DE UM DOADOR
CREATE PROCEDURE doador_contact_information
    @Name VARCHAR(50)
AS
    SET NOCOUNT ON;
    SELECT nome, telefone, email
    FROM doador
    WHERE nome = @Name;
GO
--EXECUTANDO A PROCEDURE
EXECUTE doador_contact_information 'Elisa Nunes';

--SELECIONA OS HOSPITAIS QUE POSSUEM A BOLSA DE SANGUE COM O TIPO PASSADO
CREATE PROCEDURE hospital_com_bolsa
    @tipo CHAR(3)
AS
    SET NOCOUNT ON;
    SELECT hos.nome, COUNT(tip.tipo) 'Quantidade de Bolsas' FROM hospital AS hos
	INNER JOIN bolsa_sangue AS bol ON hos.cnpj = bol.cnpj
	INNER JOIN tipo_sanguineo AS tip ON tip.cod_bolsa = bol.cod_bolsa
    WHERE tip.tipo = @tipo
	group by hos.nome;
GO
--EXECUTANDO A PROCEDURE
EXECUTE hospital_com_bolsa 'AB-';


-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
/*
  ___                      _     _                   
 | __|  _  _   _ _    __  | |_  (_)  ___   _ _    ___
 | _|  | || | | ' \  / _| |  _| | | / _ \ | ' \  (_-<
 |_|    \_,_| |_||_| \__|  \__| |_| \___/ |_||_| /__/
 */                                                    
-- Função que verifica se o estoque de determinado tipo sanguíneo está baixo
CREATE FUNCTION alerta_estoque(
	@tipo CHAR(3))
RETURNS VARCHAR(60)
AS
BEGIN
DECLARE @resultado VARCHAR(60),
		@quantidade_bolsas INT
	SET @quantidade_bolsas = (SELECT COUNT(tipo) FROM tipo_sanguineo tip
			INNER JOIN bolsa_sangue bol ON tip.cod_bolsa = bol.cod_bolsa AND tip.tipo = @tipo)
IF (@quantidade_bolsas <= 2)
BEGIN
    SET @resultado='O estoque de bolsas de sangue do tipo ' + @tipo + ' está baixo';
END
ELSE
BEGIN
    SET @resultado='O estoque de bolsas de sangue do tipo ' + @tipo + ' está ok';
END
RETURN (@resultado);
END;
-- Execução da função
PRINT dbo.alerta_estoque('AB+') --exemplo de alto nivel
PRINT dbo.alerta_estoque('A-') --exemplo de baixo nivel


--FUNÇÃO QUE PEDE UM INTERVALO DE DATA E RETORNA AS DOAÇÕES FEITAS
CREATE FUNCTION retorna_doacoes_intervalo(
	@data_inicial DATE, 
	@data_final DATE)
RETURNS @valores table
	(CPF NUMERIC(18),
	nome VARCHAR(50),
	tipo CHAR(03),
	crm NUMERIC (18),
	hospital varchar(100))
AS 
BEGIN
INSERT @valores (CPF, nome, tipo, CRM, hospital)
	SELECT doa.CPF, doa.nome, tip.tipo, bol.crm, hos.nome  FROM doador AS doa 
	INNER JOIN bolsa_sangue AS bol ON
	doa.cpf = bol.cpf 
	INNER JOIN tipo_sanguineo AS tip ON
	bol.cod_bolsa = tip.cod_bolsa	
	INNER JOIN hospital AS hos ON
	bol.cnpj = hos.cnpj
	WHERE bol.data_coleta BETWEEN @data_inicial AND @data_final
RETURN
END
-- Execução da função
SELECT * FROM retorna_doacoes_intervalo('2022-08-01', '2022-08-05')

-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
/*
  ___                                            _                                         _             
 | __|  _  _   _ _    ___   ___   ___   ___     /_\    __ _   _ _   ___   __ _   __ _   __| |  __ _   ___
 | _|  | || | | ' \  / _ \ / -_) / -_) (_-<    / _ \  / _` | | '_| / -_) / _` | / _` | / _` | / _` | (_-<
 |_|    \_,_| |_||_| \___/ \___| \___| /__/   /_/ \_\ \__, | |_|   \___| \__, | \__,_| \__,_| \__,_| /__/
                                                      |___/              |___/   
*/
--CALCULA A MÉDIA DE IDADE DOS DOADORES
SELECT AVG (idade) AS 'Média dos Doadores' FROM doador;


-- QUANTIDADE DE BOLSAS DE SANGUE POR TIPO SANGUÍNEO
SELECT tipo, COUNT(tipo) AS 'Quantidade de bolsas' FROM tipo_sanguineo
GROUP BY tipo;

-- Quantidade de bolsas de sangue do tipo AB+ que o 'Hospital Albert Einstein' recebeu
SELECT COUNT(tipo) AS 'quantidade de bolsas do tipo AB+' FROM tipo_sanguineo tip
INNER JOIN bolsa_sangue bol ON tip.cod_bolsa = bol.cod_bolsa AND tip.tipo = 'AB+'
INNER JOIN hospital hos ON bol.cnpj = hos.cnpj AND hos.nome = 'Hospital Albert Einstein';

-- Tipo sanguíneo com mais bolsas de sangue
SELECT tipo, COUNT(tipo) AS 'quantidade de bolsas' FROM tipo_sanguineo
GROUP BY tipo
HAVING COUNT(tipo) = (SELECT MAX(highest_count) AS highest_count
FROM (SELECT tipo, COUNT(tipo) AS highest_count
     FROM tipo_sanguineo
     GROUP BY tipo) AS t);

-- Tipo sanguíneo com menos bolsas de sangue
SELECT tipo, COUNT(tipo) AS 'quantidade de bolsas' FROM tipo_sanguineo
GROUP BY tipo
HAVING COUNT(tipo) = (SELECT MIN(lowest_count) AS lowest_count
FROM (SELECT tipo, COUNT(tipo) AS lowest_count
     FROM tipo_sanguineo
     GROUP BY tipo) AS t);








