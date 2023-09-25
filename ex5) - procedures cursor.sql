
-- 1.Entender Ano-Semestre no seguinte formato:  1º semestre de 2002 = 20021  , 2º semestre de 2004 = 20042 ........etc.; 
-- 2.INT4 ... nada mais é que o tipo int  onde será inserido valor numérico com 4 digitos tipo Ano-semestre, citado acima; 


CREATE DATABASE db_escola;
USE db_escola;

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
    NomeDisc VARCHAR(10),
    CreditoDisc INT
);
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

ALTER TABLE tb_disciplina ADD CONSTRAINT FK_DISCIPLINA_RELATION_DEPTO FOREIGN KEY (CodDepto) REFERENCES tb_depto (CodDepto);
ALTER TABLE tb_sala ADD CONSTRAINT FK_SALA_RELATION_PREDIO FOREIGN KEY (CodPred) REFERENCES tb_predio (CodPred);
ALTER TABLE tb_horario ADD CONSTRAINT FK_HORARIO_RELATION_SALA FOREIGN KEY (NumSala, CodPred) REFERENCES tb_sala (NumSala, CodPred);
ALTER TABLE tb_horario ADD CONSTRAINT FK_HORARIO_RELATION_TURMA FOREIGN KEY (AnoSem, CodDepto, NumDisc, SiglaTur) REFERENCES tb_turma (AnoSem, CodDepto, NumDisc, SiglaTur);
ALTER TABLE tb_turma ADD CONSTRAINT FK_TURMA_RELATION_DISCIPLINA FOREIGN KEY (CodDepto, NumDisc) REFERENCES tb_disciplina (CodDepto, NumDisc);
ALTER TABLE tb_profTurma ADD CONSTRAINT FK_PROFTURMA_RELATION_TURMA FOREIGN KEY (AnoSem, CodDepto, NumDisc, SiglaTur) REFERENCES tb_turma (AnoSem, CodDepto, NumDisc, SiglaTur);
ALTER TABLE tb_profTurma ADD CONSTRAINT FK_PROFTURMA_RELATION_PROFESSOR FOREIGN KEY (CodProf) REFERENCES tb_professor (CodProf);
ALTER TABLE tb_professor ADD CONSTRAINT FK_PROFESSOR_RELATION_TITULACAO FOREIGN KEY (CodTit) REFERENCES tb_titulacao (CodTit);
ALTER TABLE tb_professor ADD CONSTRAINT FK_PROFESSOR_RELATION_DEPTO FOREIGN KEY (CodDepto) REFERENCES tb_depto (CodDepto);
ALTER TABLE tb_preReq ADD CONSTRAINT FK_PREREQ_TEM_PRE_DISCIPLINA FOREIGN KEY (CodDeptoPreReq, NumDiscPreReq) REFERENCES tb_disciplina (CodDepto, NumDisc);
ALTER TABLE tb_preReq ADD CONSTRAINT FK_PREREQ_EH_PRE_DISCIPLINA FOREIGN KEY (CodDepto, NumDisc) REFERENCES tb_disciplina (CodDepto, NumDisc);

INSERT INTO tb_depto (CodDepto, NomeDepto)
VALUES ('1', 'Depto 01'),
    ('2', 'Depto 02'),
    ('3', 'Depto 03'),
    ('4', 'Depto 04');
    
INSERT INTO tb_disciplina (CodDepto, NumDisc, NomeDisc, CreditoDisc)
VALUES  ('2', '2', 'Matemática', '2'),
('1', '1', 'Português', '10'),
 ('3', '5', 'Física', '2');
    ('2', '3', 'Geografia', '4'),
    ('3', '4', 'Espanhol', '1'),
   
DELIMITER $$ CREATE PROCEDURE selectComCursor() BEGIN
DECLARE CodDepto_Cursor CHAR(5);
DECLARE NumDisc_Cursor INT;
DECLARE done INT DEFAULT 0;
DECLARE C1 CURSOR FOR
SELECT CodDepto AS "Cod do Depto",
    COUNT(NumDisc) AS "Quant de Disciplinas"
FROM tb_disciplina
GROUP BY CodDepto;
DECLARE CONTINUE HANDLER FOR NOT FOUND
SET done = 1;
OPEN C1;
WHILE done = 0 DO FETCH C1 INTO CodDepto_Cursor,
NumDisc_Cursor;
SELECT CodDepto_Cursor,
    NumDisc_Cursor;
END WHILE;
CLOSE C1;
END $$ 
DELIMITER ;