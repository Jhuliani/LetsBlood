--5 MÉDICOS
INSERT INTO medico VALUES(815208, 'Juriscreudo Clevinho');
INSERT INTO medico VALUES(667700, 'Isabella Cardoso');
INSERT INTO medico VALUES(550487, 'Reinaldo Janiquine');
INSERT INTO medico VALUES(347211, 'Maria Santos');
INSERT INTO medico VALUES(151091, 'Ricardo Pires');
GO

-- 5 HOSPITAL
INSERT INTO hospital VALUES(6495949787,'Casa da Saude','Hospital de Fraturados','Avenida Moraes Sales 9875','casadasaude@hospital',1159495674);
INSERT INTO hospital VALUES(5642549569,'Santa Casa','Hospital de Queimaduras','Rua Oscar Tompsom 754','santacasa@hospital',1143095000);
INSERT INTO hospital VALUES(2354326372,'Hospital Albert Einstein','Hospital Geral','Avenida Tiradentes 142','hospitalalberteinstein@hospital',1164477790);
INSERT INTO hospital VALUES(7016634051,'Hospital Sirio Libanes','Hospital Geral','Rua da Saudade 69','hospitalsiriolibanes@hospital',1122168107);
INSERT INTO hospital VALUES(9173168573,'Hospital da Criança','Hospital Infantil','Rua Narciso Yangue 412','hospitaldacriança@hospital',1175020420);
GO

--30 DOADORES
INSERT INTO doador VALUES(8386333901,'','Srta. Amanda da Conceição','srta.amandadaconceição@gmail.com',24,'Avenida Brasil, 55',5511323882443,151091);
INSERT INTO doador VALUES(31373028114,'diabetes','Dra. Eduarda Ribeiro','dra.eduardaribeiro@gmail.com',26,'Avenida Japão, 400',5511985902773,347211);
INSERT INTO doador VALUES(3318769576,'hipertensão','Catarina Cardoso','catarinacardoso@gmail.com',44,'Avenida Brasil, 55',5511055368159,550487);
INSERT INTO doador VALUES(61662955618,'alto colesterol','Alexia Monteiro','alexiamonteiro@gmail.com',55,'Avenida Paulista, 1254',5511527916160,667700);
INSERT INTO doador VALUES(87289066758,'','Lorenzo Duarte','lorenzoduarte@gmail.com',30,'Rua Dez, 11',5511193694971,815208);
INSERT INTO doador VALUES(86494206212,'hipertensão','Paulo Monteiro','paulomonteiro@gmail.com',25,'Rua Oscar Filho, 256',5511919445360,151091);
INSERT INTO doador VALUES(31334296553,'','Mirella Farias','mirellafarias@gmail.com',50,'Avenida Brasil, 55',5511165856463,347211);
INSERT INTO doador VALUES(64932132158,'alto colesterol','Sr. Marcos Vinicius Ramos','sr.marcosviniciusramos@gmail.com',54,'Rua Clara, 751',5511144414811,550487);
INSERT INTO doador VALUES(27270354111,'alto colesterol','Luiza Viana','luizaviana@gmail.com',44,'Avenida Brasil, 55',5511511456992,667700);
INSERT INTO doador VALUES(98990542162,'','Sr. Kevin da Conceição','sr.kevindaconceição@gmail.com',36,'Avenida Deodato, 5426',5511236821567,815208);
INSERT INTO doador VALUES(95840378895,'','Heitor Sales','heitorsales@gmail.com',36,'Avenida Paulista, 1254',5511193534026,151091);
INSERT INTO doador VALUES(31812374500,'hipertensão','Laura Porto','lauraporto@gmail.com',56,'Rua Cleo Pires, 24',5511212468058,347211);
INSERT INTO doador VALUES(37245575401,'alto colesterol','Eduarda Freitas','eduardafreitas@gmail.com',22,'Rua Onze, 12',5511617299346,550487);
INSERT INTO doador VALUES(7911360944,'','Sr. Lucas Gabriel Rodrigues','sr.lucasgabrielrodrigues@gmail.com',28,'Avenida Paulista, 1254',5511371635037,667700);
INSERT INTO doador VALUES(78520815766,'','Igor Mendes','igormendes@gmail.com',49,'Rua Uruguaina, 754',5511508744650,815208);
INSERT INTO doador VALUES(90046756558,'diabetes','Dr. Vitor Gabriel Sales','dr.vitorgabrielsales@gmail.com',58,'Avenida Brasil, 55',5511965695639,151091);
INSERT INTO doador VALUES(63376657912,'alto colesterol','Gustavo Henrique da Paz','gustavohenriquedapaz@gmail.com',33,'Rua Palmeira, 04A',5511539692105,347211);
INSERT INTO doador VALUES(98399494119,'','Dra. Lorena Ferreira','dra.lorenaferreira@gmail.com',39,'Rua Argentina, 99',5511709684050,550487);
INSERT INTO doador VALUES(58564305062,'hipertensão','Raul Duarte','raulduarte@gmail.com',27,'Rua Barão de Jaceguai, 641',5511998567020,667700);
INSERT INTO doador VALUES(76786998240,'hipertensão','Stella Moreira','stellamoreira@gmail.com',39,'Avenida Ipirana, 623',5511453422733,815208);
INSERT INTO doador VALUES(21496397509,'diabetes','Dra. Elisa Sales','dra.elisasales@gmail.com',51,'Avenida Lima Duarte, 965',5511204162678,151091);
INSERT INTO doador VALUES(72632269792,'','Isabel da Costa','isabeldacosta@gmail.com',54,'Avenida Paulista, 1254',5511975731534,347211);
INSERT INTO doador VALUES(79119446101,'alto colesterol','Elisa Nunes','elisanunes@gmail.com',33,'Avenida Moraes Sales, 1254',5511491743017,550487);
INSERT INTO doador VALUES(92451124113,'alto colesterol','Caroline Cavalcanti','carolinecavalcanti@gmail.com',45,'Rua Barão de Itapura, 578',5511494811179,667700);
INSERT INTO doador VALUES(40674454073,'diabetes','Dr. Miguel Peixoto','dr.miguelpeixoto@gmail.com',40,'Avenida Neymar, 10',5511497961115,815208);
INSERT INTO doador VALUES(27934384483,'','Nicolas Jesus','nicolasjesus@gmail.com',40,'Avenida Paulista, 1254',5511795979381,151091);
INSERT INTO doador VALUES(60260266060,'hipertensão','Yasmin da Cruz','yasmindacruz@gmail.com',48,'Rua Wesley, 02',5511259740968,347211);
INSERT INTO doador VALUES(87694424958,'','Sr. Isaac Moura','sr.isaacmoura@gmail.com',44,'Avenida Luan Santana, 34',5511628424546,550487);
INSERT INTO doador VALUES(33712381727,'diabetes','Alana Sales','alanasales@gmail.com',55,'Avenida Messi, 09',5511149636665,667700);
INSERT INTO doador VALUES(123456789,'','Carolina Rezende','marcelinhodopneu@gmail.com',18,'Rua dos bobos, 23',5511940028922,815208);
GO

--30 DOAÇÕES
INSERT INTO bolsa_sangue VALUES('2022-08-02',6495949787,123456789,151091);
INSERT INTO bolsa_sangue VALUES('2022-08-05',5642549569,8386333901,347211);
INSERT INTO bolsa_sangue VALUES('2022-08-06',2354326372,31373028114,550487);
INSERT INTO bolsa_sangue VALUES('2022-08-05',7016634051,3318769576,667700);
INSERT INTO bolsa_sangue VALUES('2022-08-01',9173168573,61662955618,815208);
INSERT INTO bolsa_sangue VALUES('2022-08-07',5642549569,87289066758,151091);
INSERT INTO bolsa_sangue VALUES('2022-08-04',2354326372,86494206212,347211);
INSERT INTO bolsa_sangue VALUES('2022-08-05',7016634051,31334296553,550487);
INSERT INTO bolsa_sangue VALUES('2022-08-06',9173168573,64932132158,667700);
INSERT INTO bolsa_sangue VALUES('2022-08-04',5642549569,27270354111,815208);
INSERT INTO bolsa_sangue VALUES('2022-08-07',2354326372,98990542162,151091);
INSERT INTO bolsa_sangue VALUES('2022-08-07',7016634051,95840378895,347211);
INSERT INTO bolsa_sangue VALUES('2022-08-03',9173168573,31812374500,550487);
INSERT INTO bolsa_sangue VALUES('2022-08-03',5642549569,37245575401,667700);
INSERT INTO bolsa_sangue VALUES('2022-08-07',2354326372,7911360944,815208);
INSERT INTO bolsa_sangue VALUES('2022-08-01',6495949787,78520815766,151091);
INSERT INTO bolsa_sangue VALUES('2022-08-06',5642549569,90046756558,347211);
INSERT INTO bolsa_sangue VALUES('2022-08-02',2354326372,63376657912,550487);
INSERT INTO bolsa_sangue VALUES('2022-08-01',7016634051,98399494119,667700);
INSERT INTO bolsa_sangue VALUES('2022-08-05',9173168573,58564305062,815208);
INSERT INTO bolsa_sangue VALUES('2022-08-07',5642549569,76786998240,151091);
INSERT INTO bolsa_sangue VALUES('2022-08-07',2354326372,21496397509,347211);
INSERT INTO bolsa_sangue VALUES('2022-08-02',7016634051,72632269792,550487);
INSERT INTO bolsa_sangue VALUES('2022-08-01',9173168573,79119446101,667700);
INSERT INTO bolsa_sangue VALUES('2022-08-02',5642549569,92451124113,815208);
INSERT INTO bolsa_sangue VALUES('2022-08-01',2354326372,40674454073,151091);
INSERT INTO bolsa_sangue VALUES('2022-08-03',7016634051,27934384483,347211);
INSERT INTO bolsa_sangue VALUES('2022-08-02',9173168573,60260266060,550487);
INSERT INTO bolsa_sangue VALUES('2022-08-02',5642549569,87694424958,667700);
INSERT INTO bolsa_sangue VALUES('2022-08-04',2354326372,33712381727,815208);
GO

--30 bolsas no tipo sanguineo
INSERT INTO tipo_sanguineo VALUES(1,'B-','saudavel');
INSERT INTO tipo_sanguineo VALUES(2,'B-','saudavel');
INSERT INTO tipo_sanguineo VALUES(3,'O-','HIV');
INSERT INTO tipo_sanguineo VALUES(4,'AB-','saudavel');
INSERT INTO tipo_sanguineo VALUES(5,'O-','saudavel');
INSERT INTO tipo_sanguineo VALUES(6,'B+','saudavel');
INSERT INTO tipo_sanguineo VALUES(7,'O+','diabetes');
INSERT INTO tipo_sanguineo VALUES(8,'O+','saudavel');
INSERT INTO tipo_sanguineo VALUES(9,'AB+','saudavel');
INSERT INTO tipo_sanguineo VALUES(10,'O-','saudavel');
INSERT INTO tipo_sanguineo VALUES(11,'O-','HIV');
INSERT INTO tipo_sanguineo VALUES(12,'O-','saudavel');
INSERT INTO tipo_sanguineo VALUES(13,'AB+','saudavel');
INSERT INTO tipo_sanguineo VALUES(14,'A-','diabetes');
INSERT INTO tipo_sanguineo VALUES(15,'AB+','saudavel');
INSERT INTO tipo_sanguineo VALUES(16,'AB+','saudavel');
INSERT INTO tipo_sanguineo VALUES(17,'O+','cífilis');
INSERT INTO tipo_sanguineo VALUES(18,'AB+','saudavel');
INSERT INTO tipo_sanguineo VALUES(19,'B+','saudavel');
INSERT INTO tipo_sanguineo VALUES(20,'AB+','diabetes');
INSERT INTO tipo_sanguineo VALUES(21,'B-','saudavel');
INSERT INTO tipo_sanguineo VALUES(22,'A+','saudavel');
INSERT INTO tipo_sanguineo VALUES(23,'AB+','saudavel');
INSERT INTO tipo_sanguineo VALUES(24,'O+','saudavel');
INSERT INTO tipo_sanguineo VALUES(25,'A+','HIV');
INSERT INTO tipo_sanguineo VALUES(26,'AB+','saudavel');
INSERT INTO tipo_sanguineo VALUES(27,'B+','saudavel');
INSERT INTO tipo_sanguineo VALUES(28,'A+','saudavel');
INSERT INTO tipo_sanguineo VALUES(29,'A+','saudavel');
INSERT INTO tipo_sanguineo VALUES(30,'AB-','saudavel');