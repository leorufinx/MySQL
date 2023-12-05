-- Leonardo Sanchez Rufino
-- ímpar
-- funcionou

-- criar trigger para limitar a inclusão de horário para turmas cujo professor tenha um título de nome PHD. utilize pelo menos um natural join

-- ------------------------------------------------------- CRIAR DATABASE
DROP DATABASE IF EXISTS prova2;
CREATE DATABASE prova2;
USE prova2;
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
VALUES ('1', 'Doutor'),
    ('2', 'Mestre'),
    ('3', 'Especialista'),
    ('4', 'Bacharel'),
    ('5', 'Técnico'),
    ('6', 'PHD');
    
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
    
 DELIMITER //
CREATE TRIGGER before_insert_tb_horario_professor
BEFORE INSERT ON tb_horario
FOR EACH ROW
BEGIN
    IF (
        SELECT CodTit
        FROM tb_professor p
        JOIN tb_profturma pt ON p.CodProf = pt.CodProf
        WHERE pt.AnoSem = NEW.AnoSem
            AND pt.CodDepto = NEW.CodDepto
            AND pt.NumDisc = NEW.NumDisc
            AND pt.SiglaTur = NEW.SiglaTur
    ) = 'PHD' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Não é permitido agendar horário para turmas com professores PHD.';
    END IF;
END;

//
DELIMITER ;

INSERT INTO tb_horario (AnoSem, CodDepto, NumDisc, SiglaTur, DiaSem, HoraInicio, NumSala, CodPred, NumHoras)
VALUES ('20238', '1', '1', '1', '3', '2', '2', '1', '1');








