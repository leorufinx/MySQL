-- ------------------------------------------------------- CRIAR DATABASE
DROP DATABASE IF EXISTS db_escola;
CREATE DATABASE db_escola;
USE db_escola;
-- ------------------------------------------------------- CRIAR TABLES
CREATE TABLE tb_depto (
    CodDepto CHAR(5),
    NomeDepto VARCHAR(40)
);
CREATE TABLE tb_predio (
    CodPred INT,
    NomePred VARCHAR(40)
);
CREATE TABLE tb_sala (
    CodPred INT,
    NumSala INT,
    DescSala VARCHAR(40),
    CapacSala INT
);
CREATE TABLE tb_titulacao (
    CodTit INT,
    NomeTit VARCHAR(40)
);
CREATE TABLE tb_professor (
    CodProf INT,
    CodDepto CHAR(5),
    CodTit INT,
    NomeProf VARCHAR(40)
);
CREATE TABLE tb_turma (
    AnoSem INT,
    CodDepto CHAR(5),
    NumDisc INT,
    SiglaTur CHAR(2),
    CapacTur INT
);
CREATE TABLE tb_horario (
    AnoSem INT,
    CodDepto CHAR(5),
    NumDisc INT,
    SiglaTur CHAR(2),
    DiaSem INT,
    HoraInicio INT,
    NumSala INT,
    CodPred INT,
    NumHoras INT
);
CREATE TABLE tb_profTurma (
    AnoSem INT,
    CodDepto CHAR(5),
    NumDisc INT,
    SiglaTur CHAR(2),
    CodProf INT
);
CREATE TABLE tb_preReq (
    CodDeptoPreReq CHAR(5),
    NumDiscPreReq INT,
    CodDepto CHAR(5),
    NumDisc INT
);
CREATE TABLE tb_disciplina (
    CodDepto CHAR(5),
    NumDisc INT,
    NomeDisc VARCHAR(50),
    CreditoDisc INT
);
-- ------------------------------------------------------- CRIAR PRIMARY KEYS
ALTER TABLE tb_preReq ADD CONSTRAINT PK_PREREQ PRIMARY KEY(CodDeptoPreReq, NumDiscPreReq, CodDepto, NumDisc);
ALTER TABLE tb_depto ADD CONSTRAINT PK_DEPTO PRIMARY KEY (CodDepto);
ALTER TABLE tb_disciplina ADD CONSTRAINT PK_DISCIPLINA PRIMARY KEY (CodDepto, NumDisc);
ALTER TABLE tb_professor ADD CONSTRAINT PK_PROFESSOR PRIMARY KEY (CodProf);
ALTER TABLE tb_titulacao ADD CONSTRAINT PK_TITULACAO PRIMARY KEY (CodTit);
ALTER TABLE tb_profTurma ADD CONSTRAINT PK_PROFTURMA PRIMARY KEY (AnoSem, CodDepto, NumDisc, SiglaTur, CodProf);
ALTER TABLE tb_turma ADD CONSTRAINT PK_TURMA PRIMARY KEY (AnoSem, CodDepto, NumDisc, SiglaTur);
ALTER TABLE tb_horario ADD CONSTRAINT PK_HORARIO PRIMARY KEY (AnoSem, CodDepto, NumDisc, SiglaTur, DiaSem, HoraInicio);
ALTER TABLE tb_sala ADD CONSTRAINT PK_SALA PRIMARY KEY (CodPred, NumSala);
ALTER TABLE tb_predio ADD CONSTRAINT PK_PREDIO PRIMARY KEY (CodPred);
-- ------------------------------------------------------- CRIAR FOREIGN KEYS

-- ------------------------------------------------------- INSERINDO DADOS
INSERT INTO tb_depto (CodDepto, NomeDepto)
VALUES ('1', 'Departamento 1'),
    ('2', 'Departamento 2'),
    ('3', 'Departamento 3'),
    ('4', 'Departamento 4'),
    ('5', 'Departamento 5'),
    ('6', 'Departamento 6');
INSERT INTO tb_predio (CodPred, NomePred)
VALUES ('1', 'Prédio 1'),
    ('2', 'Prédio 2'),
    ('3', 'Prédio 3'),
    ('4', 'Prédio 4'),
    ('5', 'Prédio 5'),
    ('6', 'Prédio 6');
INSERT INTO tb_sala (CodPred, NumSala, DescSala, CapacSala)
VALUES ('1', '1', 'Sala 1', '40'),
    ('1', '2', 'Sala 2', '40'),
    ('1', '3', 'Sala 3', '40'),
    ('2', '1', 'Sala 1', '40'),
    ('2', '2', 'Sala 2', '40'),
    ('2', '3', 'Sala 3', '40');
INSERT INTO tb_titulacao (CodTit, NomeTit)
VALUES ('1', 'Titulação 1'),
    ('2', 'Titulação 2'),
    ('3', 'Titulação 3'),
    ('4', 'Titulação 4'),
    ('5', 'Titulação 5'),
    ('6', 'Titulação 6');
INSERT INTO tb_professor (CodProf, CodDepto, CodTit, NomeProf)
VALUES ('1', '1', '1', 'Antunes'),
    ('2', '2', '2', 'Professor 2'),
    ('3', '2', '1', 'Professor 3'),
    ('4', '3', '2', 'Professor 4'),
    ('5', '4', '5', 'Professor 5');
INSERT INTO tb_disciplina (CodDepto, NumDisc, NomeDisc, CreditoDisc)
VALUES ('1', '1', 'Português', '10'),
    ('2', '2', 'Matemática', '2'),
    ('2', '3', 'Inglês', '4'),
    ('3', '4', 'Espanhol', '1'),
    ('3', '5', 'Espanhol II', '1'),
    ('3', '6', 'Espanhol III', '1'),
    ('3', '7', 'Física', '2');
INSERT INTO tb_turma (AnoSem, CodDepto, NumDisc, SiglaTur, CapacTur)
VALUES ('20021', '1', '1', '1', '40'),
    ('20022', '2', '2', '2', '40'),
    ('20031', '2', '1', '3', '40'),
    ('20032', '3', '2', '4', '40'),
    ('20041', '4', '5', '5', '40');
INSERT INTO tb_profturma (AnoSem, CodDepto, NumDisc, SiglaTur, CodProf)
VALUES ('20021', '1', '1', '1', '1'),
    ('20022', '2', '2', '2', '1'),
    ('20031', '2', '1', '3', '2'),
    ('20032', '3', '2', '4', '3'),
    ('20041', '4', '5', '5', '4');
INSERT INTO tb_horario (AnoSem, CodDepto, NumDisc, SiglaTur, DiaSem, HoraInicio, NumSala, CodPred, NumHoras)
VALUES ('20021', '1', '1', '1', '2', '1', '1', '1', '1'),
    ('20022', '2', '2', '2', '2', '1', '2', '1', '1'),
    ('20031', '2', '1', '3', '3', '1', '2', '1', '1'),
    ('20032', '3', '2', '4', '4', '1', '1', '2', '1');
INSERT INTO tb_preReq (CodDeptoPreReq, NumDiscPreReq, CodDepto, NumDisc)
VALUES ('3', '5', '3', '6'),
    ('3', '4', '3', '5'),
    ('1', '1', '3', '6');
    -- ------------------------------------------------------- CRIAR PROCEDURE
    DROP PROCEDURE IF EXISTS select1;
    DROP PROCEDURE IF EXISTS select2;
    DROP PROCEDURE IF EXISTS select3;
    DROP PROCEDURE IF EXISTS select4;
    DROP PROCEDURE IF EXISTS select5;
    DROP PROCEDURE IF EXISTS select6;
    DROP PROCEDURE IF EXISTS select7;
    DROP PROCEDURE IF EXISTS select8;
    DROP PROCEDURE IF EXISTS select9;
    DROP PROCEDURE IF EXISTS select10;
    DROP PROCEDURE IF EXISTS select11;
    DROP PROCEDURE IF EXISTS select12;
    -- ------------------------------------------ SELECT 1
DELIMITER $$ 
    CREATE PROCEDURE select1()
    BEGIN

        DECLARE CodDepto_Cursor CHAR(5);
        DECLARE done INT DEFAULT 0;
        DECLARE C1 CURSOR FOR

            SELECT d.CodDepto FROM tb_depto d INNER JOIN tb_turma t ON d.CodDepto = t.CodDepto AND t.AnoSem = '20021';

        DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;
        OPEN C1;

            WHILE done = 0 DO FETCH C1 INTO CodDepto_Cursor;
            SELECT CodDepto_Cursor;
            END WHILE;

        CLOSE C1;
END $$ 
DELIMITER ;

    -- ------------------------------------------ SELECT 2
DELIMITER $$ 
    CREATE PROCEDURE select2()
    BEGIN

        DECLARE CodProf_Cursor INT;
        DECLARE done INT DEFAULT 0;
        DECLARE C1 CURSOR FOR

            SELECT p.CodProf FROM tb_professor p INNER JOIN tb_profturma pt ON p.CodProf = pt.CodProf AND p.CodDepto = 'INF01' AND pt.AnoSem = '20021';
        
        DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;
        OPEN C1;

            WHILE done = 0 DO FETCH C1 INTO CodProf_Cursor;
            SELECT CodProf_Cursor;
            END WHILE;

        CLOSE C1;
END $$ 
DELIMITER ;

    -- ------------------------------------------ SELECT 3
DELIMITER $$ 
    CREATE PROCEDURE select3()
    BEGIN

        DECLARE DiaSem_Cursor INT;
        DECLARE HoraInicio_Cursor INT;
        DECLARE NumHoras_Cursor INT;
        DECLARE done INT DEFAULT 0;
        DECLARE C1 CURSOR FOR

            SELECT h.DiaSem, h.HoraInicio, h.NumHoras FROM tb_horario h INNER JOIN tb_turma t ON h.SiglaTur = t.SiglaTur INNER JOIN tb_profturma pt ON t.SiglaTur = pt.SiglaTur INNER JOIN tb_professor p ON pt.CodProf = p.CodProf AND p.NomeProf = 'Antunes' AND pt.AnoSem = '20021';

        DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;
        OPEN C1;

            WHILE done = 0 DO FETCH C1 INTO DiaSem_Cursor, HoraInicio_Cursor, NumHoras_Cursor;
            SELECT DiaSem_Cursor, HoraInicio_Cursor, NumHoras_Cursor;
            END WHILE;

        CLOSE C1;
END $$ 
DELIMITER ;

    -- ------------------------------------------ SELECT 4
DELIMITER $$ 
    CREATE PROCEDURE select4()
    BEGIN

        DECLARE NomeDepto_Cursor VARCHAR(40);
        DECLARE done INT DEFAULT 0;
        DECLARE C1 CURSOR FOR

            SELECT d.NomeDepto FROM tb_depto d INNER JOIN tb_turma t ON d.CodDepto = t.CodDepto AND t.AnoSem = '20021' INNER JOIN tb_horario h ON t.SiglaTur = h.SiglaTur AND h.NumSala = '101' INNER JOIN tb_predio p ON h.CodPred = p.CodPred AND p.NomePred = 'Informática - aulas';

        DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;
        OPEN C1;

            WHILE done = 0 DO FETCH C1 INTO NomeDepto_Cursor;
            SELECT NomeDepto_Cursor;
            END WHILE;

        CLOSE C1;
END $$ 
DELIMITER ;

    -- ------------------------------------------ SELECT 5
DELIMITER $$ 
    CREATE PROCEDURE select5()
    BEGIN

        DECLARE CodProf_Cursor INT;
        DECLARE done INT DEFAULT 0;
        DECLARE C1 CURSOR FOR

            SELECT p.CodProf FROM tb_professor p INNER JOIN tb_titulacao t ON p.CodTit = t.CodTit AND t.NomeTit = 'Doutor' INNER JOIN tb_profturma pt ON p.CodProf = pt.CodProf AND pt.AnoSem != '20021';

        DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;
        OPEN C1;

            WHILE done = 0 DO FETCH C1 INTO CodProf_Cursor;
            SELECT CodProf_Cursor;
            END WHILE;

        CLOSE C1;
END $$ 
DELIMITER ;

    -- ------------------------------------------ SELECT 6
DELIMITER $$ 
    CREATE PROCEDURE select6()
    BEGIN

        DECLARE CodPred_Cursor INT;
        DECLARE NumSala_Cursor INT;
        DECLARE done INT DEFAULT 0;
        DECLARE C1 CURSOR FOR

            SELECT s1.CodPred, s1.NumSala FROM (SELECT s.CodPred, s.NumSala, h.DiaSem FROM tb_sala s INNER JOIN tb_horario h ON s.CodPred = h.CodPred AND s.NumSala = h.NumSala AND h.AnoSem = '20021' INNER JOIN tb_depto d ON h.CodDepto = d.CodDepto INNER JOIN tb_professor p ON d.CodDepto = p.CodDepto AND d.NomeDepto = 'Informática' AND h.DiaSem = '2') AS s1 INNER JOIN (SELECT s.CodPred, s.NumSala, h.DiaSem FROM tb_sala s INNER JOIN tb_horario h ON s.CodPred = h.CodPred AND s.NumSala = h.NumSala AND h.AnoSem = '20021' INNER JOIN tb_depto d ON h.CodDepto = d.CodDepto INNER JOIN tb_professor p ON d.CodDepto = p.CodDepto AND p.NomeProf = 'Antunes' AND h.DiaSem = '4') AS s2 ON s1.CodPred = s2.CodPred AND s1.NumSala = s2.NumSala;

        DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;
        OPEN C1;

            WHILE done = 0 DO FETCH C1 INTO CodPred_Cursor, NumSala_Cursor;
            SELECT CodPred_Cursor, NumSala_Cursor;
            END WHILE;

        CLOSE C1;
END $$ 
DELIMITER ;

    -- ------------------------------------------ SELECT 7
DELIMITER $$ 
    CREATE PROCEDURE select7()
    BEGIN

        DECLARE DiaSem_Cursor INT;
        DECLARE HoraInicio_Cursor INT;
        DECLARE NumHoras_Cursor INT;
        DECLARE done INT DEFAULT 0;
        DECLARE C1 CURSOR FOR

            SELECT h.DiaSem, h.HoraInicio, h.NumHoras FROM tb_horario h INNER JOIN tb_sala s ON h.NumSala = s.NumSala AND h.CodPred = s.CodPred AND s.NumSala = '101' AND s.CodPred = '43423' INNER JOIN tb_turma t ON h.AnoSem = t.AnoSem AND h.CodDepto = t.CodDepto AND h.NumDisc = t.NumDisc AND h.SiglaTur = t.SiglaTur INNER JOIN tb_profturma pt ON t.AnoSem = pt.AnoSem AND t.CodDepto = pt.CodDepto AND t.NumDisc = pt.NumDisc AND t.SiglaTur = pt.SiglaTur AND pt.AnoSem = '20021' INNER JOIN tb_professor p ON pt.CodProf = p.CodProf AND p.NomeProf = 'Antunes';

        DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;
        OPEN C1;

            WHILE done = 0 DO FETCH C1 INTO DiaSem_Cursor, HoraInicio_Cursor, NumHoras_Cursor;
            SELECT DiaSem_Cursor, HoraInicio_Cursor, NumHoras_Cursor;
            END WHILE;

        CLOSE C1;
END $$ 
DELIMITER ;

    -- ------------------------------------------ SELECT 8
DELIMITER $$ 
    CREATE PROCEDURE select8()
    BEGIN

        DECLARE CodProf_Cursor INT;
        DECLARE NomeProf_Cursor VARCHAR(40);
        DECLARE NomeDepto_Cursor VARCHAR(40);
        DECLARE NomeDepto2_Cursor VARCHAR(40);
        DECLARE done INT DEFAULT 0;
        DECLARE C1 CURSOR FOR

            SELECT p.CodProf, p.NomeProf, d.NomeDepto, d2.NomeDepto FROM tb_professor p INNER JOIN tb_depto d ON p.CodDepto = d.CodDepto INNER JOIN tb_profturma pt ON p.CodProf = pt.CodProf AND pt.CodDepto != p.CodDepto INNER JOIN tb_depto d2 ON pt.CodDepto = d2.CodDepto;

        DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;
        OPEN C1;

            WHILE done = 0 DO FETCH C1 INTO CodProf_Cursor, NomeProf_Cursor, NomeDepto_Cursor, NomeDepto2_Cursor;
            SELECT CodProf_Cursor, NomeProf_Cursor, NomeDepto_Cursor, NomeDepto2_Cursor AS "NomeDepto2";
            END WHILE;

        CLOSE C1;
END $$ 
DELIMITER ;

    -- ------------------------------------------ SELECT 9
DELIMITER $$ 
    CREATE PROCEDURE select9()
    BEGIN

        DECLARE NomeProf_Cursor VARCHAR(40);
        DECLARE AnoSem_Cursor INT;
        DECLARE CodDepto_Cursor CHAR(5);
        DECLARE NumDisc_Cursor INT;
        DECLARE SiglaTur_Cursor CHAR(2);
        DECLARE AnoSem_Cursor2 INT;
        DECLARE CodDepto_Cursor2 CHAR(5);
        DECLARE NumDisc_Cursor2 INT;
        DECLARE SiglaTur_Cursor2 CHAR(2);
        DECLARE done INT DEFAULT 0;
        DECLARE C1 CURSOR FOR

            SELECT p.NomeProf, h.AnoSem, h.CodDepto, h.NumDisc, h.SiglaTur, h2.AnoSem, h2.CodDepto, h2.NumDisc, h2.SiglaTur FROM tb_professor p INNER JOIN tb_profturma pt ON p.CodProf = pt.CodProf INNER JOIN tb_turma t ON pt.AnoSem = t.AnoSem AND pt.CodDepto = t.CodDepto AND pt.NumDisc = t.NumDisc AND pt.SiglaTur = t.SiglaTur INNER JOIN tb_horario h ON t.AnoSem = h.AnoSem AND t.CodDepto = h.CodDepto AND t.NumDisc = h.NumDisc AND t.SiglaTur = h.SiglaTur INNER JOIN tb_horario h2 ON h.AnoSem = h2.AnoSem AND h.DiaSem = h2.DiaSem AND h.HoraInicio = h2.HoraInicio AND h.SiglaTur != h2.SiglaTur;

        DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;
        OPEN C1;

            WHILE done = 0 DO FETCH C1 INTO NomeProf_Cursor, AnoSem_Cursor, CodDepto_Cursor, NumDisc_Cursor, SiglaTur_Cursor, AnoSem_Cursor2, CodDepto_Cursor2, NumDisc_Cursor2, SiglaTur_Cursor2;
            SELECT NomeProf_Cursor, AnoSem_Cursor, CodDepto_Cursor, NumDisc_Cursor, SiglaTur_Cursor, AnoSem_Cursor2, CodDepto_Cursor2, NumDisc_Cursor2, SiglaTur_Cursor2;
            END WHILE;

        CLOSE C1;
END $$ 
DELIMITER ;

    -- ------------------------------------------ SELECT 10
DELIMITER $$ 
    CREATE PROCEDURE select10()
    BEGIN

        DECLARE NomeDisc_Cursor VARCHAR(50);
        DECLARE NomeDisc2_Cursor VARCHAR(50);
        DECLARE done INT DEFAULT 0;
        DECLARE C1 CURSOR FOR

            SELECT d.NomeDisc, d2.NomeDisc FROM tb_disciplina d INNER JOIN tb_prereq pr ON d.CodDepto = pr.CodDepto AND d.NumDisc = pr.NumDisc INNER JOIN tb_disciplina d2 ON pr.CodDeptoPreReq = d2.CodDepto AND pr.NumDiscPreReq = d2.NumDisc;

        DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;
        OPEN C1;

            WHILE done = 0 DO FETCH C1 INTO NomeDisc_Cursor, NomeDisc2_Cursor;
            SELECT NomeDisc_Cursor, NomeDisc2_Cursor;
            END WHILE;

        CLOSE C1;
END $$ 
DELIMITER ;

    -- ------------------------------------------ SELECT 11
DELIMITER $$ 
    CREATE PROCEDURE select11()
    BEGIN

        DECLARE NomeDisc_Cursor VARCHAR(50);
        DECLARE done INT DEFAULT 0;
        DECLARE C1 CURSOR FOR

            SELECT d.NomeDisc FROM tb_disciplina d INNER JOIN tb_prereq pr ON d.NumDisc != pr.NumDisc GROUP BY d.NomeDisc HAVING COUNT(d.NomeDisc) = (SELECT MAX(Contagem) FROM (SELECT COUNT(d2.NomeDisc) AS Contagem FROM tb_disciplina d2 INNER JOIN tb_prereq pr2 ON d2.NumDisc != pr2.NumDisc GROUP BY d2.NomeDisc) AS Subquery);

        DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;
        OPEN C1;

            WHILE done = 0 DO FETCH C1 INTO NomeDisc_Cursor;
            SELECT NomeDisc_Cursor;
            END WHILE;

        CLOSE C1;
END $$ 
DELIMITER ;

    -- ------------------------------------------ SELECT 12
DELIMITER $$ 
    CREATE PROCEDURE select12()
    BEGIN

        DECLARE NomeDisc_Cursor VARCHAR(50);
        DECLARE done INT DEFAULT 0;
        DECLARE C1 CURSOR FOR

            SELECT d.NomeDisc FROM tb_disciplina d INNER JOIN tb_prereq pr ON d.CodDepto = pr.CodDepto AND d.NumDisc = pr.NumDisc GROUP BY d.NomeDisc HAVING COUNT(d.NomeDisc) >= 2;

        DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;
        OPEN C1;

            WHILE done = 0 DO FETCH C1 INTO NomeDisc_Cursor;
            SELECT NomeDisc_Cursor;
            END WHILE;

        CLOSE C1;
END $$ 
DELIMITER ;