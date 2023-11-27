create database natural_thetajoin;
use natural_thetajoin;

CREATE TABLE tbPrereq(
	codDeptoPreReq CHAR(5)
	,numDiscPreReq INT
    ,codDepto CHAR(5)
    ,numDisc INT
);

CREATE TABLE tbDisciplina(
	codDepto CHAR(5)
    ,numDisc INT
    ,nomeDisc VARCHAR(40)
    ,creditoDisc INT
);

CREATE TABLE tbDepartamento(
	codDepto CHAR(5)
    ,nomeDepto VARCHAR(40)
);

CREATE TABLE tbProfessor(
	codProf INT
    ,codDepto CHAR(5)
    ,codTit INT
    ,nomeProf VARCHAR(40)
);

CREATE TABLE tbTitulacao(
    codTit INT
	,nomeTit VARCHAR(40)
);

CREATE TABLE tbTurma(
	  anoSem INT
    ,codDepto CHAR(5)
    ,numDisc INT
    ,siglaTur CHAR(2)
    ,capacTur INT
);

CREATE TABLE tbProfTurma(
	  anoSem INT
    ,codDepto CHAR(5)
    ,numDisc INT
    ,siglaTur CHAR(2)
    ,codProf INT
);

CREATE TABLE tbHorario(
	anoSem INT 
    ,codDepto CHAR(5)
    ,numDisc INT
    ,siglaTur CHAR(2)
    ,diaSem INT
    ,horaInicio INT
    ,numSala INT
    ,codPred INT
    ,numHoras INT
);

CREATE TABLE tbSala(
	codPred INT
    ,numSala INT
    ,descricaoSala VARCHAR(40)
    ,capacSala INT
);

CREATE TABLE tbPredio(  
	codPred INT
    ,nomePred VARCHAR(40)
);

-- PK'S E FK'S;

ALTER TABLE tbDepartamento add CONSTRAINT pkDepto PRIMARY KEY (codDepto);

ALTER TABLE tbProfessor add CONSTRAINT pkProf PRIMARY KEY (codProf);

ALTER TABLE tbProfessor add CONSTRAINT fkDeptoProf FOREIGN KEY (codDepto) REFERENCES tbDepartamento (codDepto);

ALTER TABLE tbTitulacao add CONSTRAINT pkTit PRIMARY KEY (codTit);

ALTER TABLE tbProfessor add CONSTRAINT fkTitulacaoProf FOREIGN KEY (codTit) REFERENCES tbTitulacao (codTit);

ALTER TABLE tbDisciplina add CONSTRAINT pkDisciplina PRIMARY KEY (numDisc);

ALTER TABLE tbDisciplina add CONSTRAINT fkDiscDepto FOREIGN KEY (codDepto) REFERENCES tbDepartamento (codDepto);

ALTER TABLE tbPrereq add CONSTRAINT fkDepartamentoPreReq FOREIGN KEY (codDepto) REFERENCES tbDepartamento (codDepto);

ALTER TABLE tbPrereq add CONSTRAINT fkDisciplinaPreReq FOREIGN KEY (numDisc) REFERENCES tbDisciplina (numDisc);

ALTER TABLE tbPrereq add CONSTRAINT fkDeptoPR FOREIGN KEY (codDepto) REFERENCES tbDepartamento (codDepto);

ALTER TABLE tbPrereq add CONSTRAINT fkDiscPR FOREIGN KEY (numDisc) REFERENCES tbDisciplina (numDisc);

ALTER TABLE tbTurma add CONSTRAINT pkAnoSigla PRIMARY KEY (anoSem, siglaTur);

ALTER TABLE tbTurma add CONSTRAINT fkDeptoTurma  FOREIGN KEY (codDepto) REFERENCES tbDepartamento (codDepto);

ALTER TABLE tbTurma add CONSTRAINT fkDiscTurma  FOREIGN KEY (numDisc) REFERENCES tbDisciplina (numDisc);

ALTER TABLE tbProfTurma ADD CONSTRAINT fkAnoSiglaProfTurma FOREIGN KEY (anoSem, siglaTur) REFERENCES tbTurma (anoSem, siglaTur);

ALTER TABLE tbProfTurma add CONSTRAINT fkDeptoProfTurma FOREIGN KEY (codDepto) REFERENCES tbDepartamento (codDepto);

ALTER TABLE tbProfTurma add CONSTRAINT fkDiscProfTurma FOREIGN KEY (numDisc) REFERENCES tbDisciplina (numDisc);

ALTER TABLE tbProfTurma add CONSTRAINT fkProfessorProfTurma FOREIGN KEY (codProf) REFERENCES tbProfessor (codProf);

ALTER TABLE tbPredio add CONSTRAINT pkPredio PRIMARY KEY (codPred);

ALTER TABLE tbSala add CONSTRAINT pkSala PRIMARY KEY (numSala);

ALTER TABLE tbSala add CONSTRAINT fkPredio FOREIGN KEY (codPred) REFERENCES tbPredio (codPred);

ALTER TABLE tbHorario add CONSTRAINT pkDiaSem PRIMARY KEY (diaSem, horaInicio);

ALTER TABLE tbHorario add CONSTRAINT fkDeptoHorario FOREIGN KEY (codDepto) REFERENCES tbDepartamento (codDepto);

ALTER TABLE tbHorario ADD CONSTRAINT fkAnoSiglaHorario FOREIGN KEY (anoSem, siglaTur) REFERENCES tbTurma (anoSem, siglaTur);

ALTER TABLE tbHorario add CONSTRAINT fkDiscHorario FOREIGN KEY (numDisc) REFERENCES tbDisciplina (numDisc);

ALTER TABLE tbHorario add CONSTRAINT fkSalaHorario FOREIGN KEY (numSala) REFERENCES tbSala (numSala);

ALTER TABLE tbHorario add CONSTRAINT fkPredioHorario FOREIGN KEY (codPred) REFERENCES tbPredio (codPred);

-- Insert:

INSERT INTO tbTurma (anoSem, codDepto, numDisc, siglaTur, capacTur)
VALUES (20021, 'INF01', 1, 'T1', 30),
     (20021, 'INF01', 3, 'T2', 25),
    (20021, 'INF01', 2, 'T3', 35);


INSERT INTO tbDepartamento (codDepto, nomeDepto)
VALUES ('1', 'Depto 1'),
    ('2', 'Depto 2'),
    ('3', 'Depto 3'),
    ('4', 'Depto 4'),
    ('5', 'Depto 5');
    
INSERT INTO tbDisciplina (codDepto, numDisc, nomeDisc, creditoDisc)
VALUES ('1', '1', 'Ética', '3'),
    ('1', '2', 'Português', '9'),
    ('2', '3', 'Matemática', '10'),
    ('2', '4', 'História', '7'),
    ('3', '5', 'Francês', '4'),
    ('3', '6', 'Inglês', '10');
    
    INSERT INTO tbPredio (codPred, nomePred) VALUES
    (1, 'Predio A'),
    (2, 'Predio B');
    
    INSERT INTO tbtitulacao (codTit, nomeTit) VALUES 
    (1, 'Doutor'),
    (2, 'Mestre'),
    (6, 'Especialista'),
    (4, 'Bacharel'),
    (5, 'Técnico');

    INSERT INTO tbProfessor (codProf, codDepto, codTit, nomeProf) VALUES
    (101, '1', 1, 'Prof. Novo'),
    (103, '1', 4, 'Prof. zé'),
    (102, '1', 2, 'Prof. joilson');
    
    INSERT INTO tbSala (codPred, numSala, descricaoSala, capacSala) VALUES
    (1, 101, 'Sala 101', 40),
    (1, 102, 'Sala 102', 25),
    (1, 103, 'Sala 103', 35),
    (2, 201, 'Sala 201', 28),
    (2, 202, 'Sala 202', 45),
    (2, 203, 'Sala 203', 30);
    
-- natural join
    SELECT DISTINCT d.nomeDepto
FROM tbDepartamento d
NATURAL JOIN tbTurma t
NATURAL JOIN tbHorario h
NATURAL JOIN tbSala s
NATURAL JOIN tbPredio p
WHERE t.anoSem = 20021
    AND s.numSala = 101
    AND p.nomePred = 'Informática - aulas';
    
-- theta join

SELECT DISTINCT d.nomeDepto
FROM tbDepartamento d, tbTurma t, tbHorario h, tbSala s, tbPredio p
WHERE t.anoSem = 20021
    AND t.siglaTur = h.siglaTur
    AND t.anoSem = h.anoSem
    AND t.codDepto = h.codDepto
    AND t.numDisc = h.numDisc
    AND h.numSala = s.numSala
    AND h.codPred = s.codPred
    AND s.codPred = p.codPred
    AND s.numSala = 101
    AND p.nomePred = 'Informática - aulas';

