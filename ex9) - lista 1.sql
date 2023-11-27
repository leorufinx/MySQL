create database lista1;
use lista1;

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
    
    
    -- 1
SELECT DISTINCT tb.codDepto FROM tbDepartamento tb 
INNER JOIN tbTurma tt ON tb.codDepto = tt.codDepto WHERE tt.anoSem = 2002 AND tt.siglaTur = 1;
    
    -- 2
SELECT DISTINCT p.codProf
FROM tbProfessor p
JOIN tbProfTurma pt ON p.codProf = pt.codProf
JOIN tbTurma t ON pt.anoSem = t.anoSem AND pt.siglaTur = t.siglaTur
WHERE p.codDepto = 'INF01' AND t.anoSem = 20021;

-- 3
SELECT h.diaSem, h.horaInicio, h.numHoras
FROM tbProfessor p
JOIN tbProfTurma pt ON p.codProf = pt.codProf
JOIN tbTurma t ON pt.anoSem = t.anoSem AND pt.siglaTur = t.siglaTur
JOIN tbHorario h ON t.anoSem = h.anoSem AND t.siglaTur = h.siglaTur
WHERE p.nomeProf = 'Antunes' AND t.anoSem = 20021;

-- 4
SELECT DISTINCT d.nomeDepto
FROM tbDepartamento d
JOIN tbTurma t ON d.codDepto = t.codDepto
JOIN tbHorario h ON t.anoSem = h.anoSem AND t.siglaTur = h.siglaTur AND t.codDepto = h.codDepto AND t.numDisc = h.numDisc
JOIN tbSala s ON h.numSala = s.numSala AND h.codPred = s.codPred
JOIN tbPredio p ON s.codPred = p.codPred
WHERE p.nomePred = 'Informática - aulas' AND s.numSala = 101 AND t.anoSem = 20021;

-- 5
SELECT p.codProf
FROM tbProfessor p
WHERE p.codTit = (SELECT codTit FROM tbTitulacao WHERE nomeTit = 'Doutor')
  AND NOT EXISTS (
    SELECT 1
    FROM tbProfTurma pt
    WHERE pt.codProf = p.codProf AND pt.anoSem = 20021
  );
  
  -- 6
SELECT DISTINCT s.codPred, s.numSala
FROM tbSala s
JOIN tbHorario h ON s.numSala = h.numSala AND s.codPred = h.codPred
JOIN tbTurma t ON h.anoSem = t.anoSem AND h.siglaTur = t.siglaTur AND h.codDepto = t.codDepto AND h.numDisc = t.numDisc
WHERE h.diaSem = 2 AND t.codDepto = 'INF01' AND t.anoSem = 20021;

SELECT DISTINCT s.codPred, s.numSala
FROM tbSala s
JOIN tbHorario h ON s.numSala = h.numSala AND s.codPred = h.codPred
JOIN tbTurma t ON h.anoSem = t.anoSem AND h.siglaTur = t.siglaTur
JOIN tbProfTurma pt ON t.anoSem = pt.anoSem AND t.siglaTur = pt.siglaTur AND t.codDepto = pt.codDepto AND t.numDisc = pt.numDisc
JOIN tbProfessor p ON pt.codProf = p.codProf
WHERE h.diaSem = 4 AND p.nomeProf = 'Antunes' AND t.anoSem = 20021;

-- 7
SELECT h.diaSem, h.horaInicio, h.numHoras
FROM tbProfessor p
JOIN tbProfTurma pt ON p.codProf = pt.codProf
JOIN tbTurma t ON pt.anoSem = t.anoSem AND pt.siglaTur = t.siglaTur
JOIN tbHorario h ON t.anoSem = h.anoSem AND t.siglaTur = h.siglaTur AND t.codDepto = h.codDepto AND t.numDisc = h.numDisc
JOIN tbSala s ON h.numSala = s.numSala AND h.codPred = s.codPred
WHERE p.nomeProf = 'Antunes' AND t.anoSem = 20021 AND s.numSala = 101 AND s.codPred = 43423;

-- 8
SELECT DISTINCT p.codProf, p.nomeProf, d.nomeDepto AS deptoAtual, dMinistrado.nomeDepto AS deptoMinistrado
FROM tbProfessor p
JOIN tbProfTurma pt ON p.codProf = pt.codProf
JOIN tbTurma t ON pt.anoSem = t.anoSem AND pt.siglaTur = t.siglaTur
JOIN tbDisciplina dDisc ON t.codDepto = dDisc.codDepto AND t.numDisc = dDisc.numDisc
JOIN tbDepartamento d ON p.codDepto = d.codDepto
JOIN tbDepartamento dMinistrado ON dDisc.codDepto = dMinistrado.codDepto
WHERE d.codDepto <> dMinistrado.codDepto;

-- 9
SELECT DISTINCT p1.nomeProf, p2.nomeProf, t1.anoSem, t1.siglaTur, t2.siglaTur, h1.diaSem, h1.horaInicio
FROM tbProfessor p1
JOIN tbProfTurma pt1 ON p1.codProf = pt1.codProf
JOIN tbTurma t1 ON pt1.anoSem = t1.anoSem AND pt1.siglaTur = t1.siglaTur
JOIN tbHorario h1 ON t1.anoSem = h1.anoSem AND t1.siglaTur = h1.siglaTur AND t1.codDepto = h1.codDepto AND t1.numDisc = h1.numDisc

JOIN tbProfessor p2 ON p1.codProf < p2.codProf 
JOIN tbProfTurma pt2 ON p2.codProf = pt2.codProf
JOIN tbTurma t2 ON pt2.anoSem = t2.anoSem AND pt2.siglaTur = t2.siglaTur
JOIN tbHorario h2 ON t2.anoSem = h2.anoSem AND t2.siglaTur = h2.siglaTur AND t2.codDepto = h2.codDepto AND t2.numDisc = h2.numDisc

WHERE p1.codProf <> p2.codProf 
  AND h1.diaSem = h2.diaSem
  AND h1.horaInicio = h2.horaInicio
  AND t1.anoSem = t2.anoSem
ORDER BY p1.nomeProf, p2.nomeProf, t1.anoSem, t1.siglaTur, t2.siglaTur, h1.diaSem, h1.horaInicio;

-- 10
SELECT d1.nomeDisc AS Disciplina, d2.nomeDisc AS PreRequisito
FROM tbPrereq pr
JOIN tbDisciplina d1 ON pr.codDepto = d1.codDepto AND pr.numDisc = d1.numDisc
JOIN tbDisciplina d2 ON pr.codDeptoPreReq = d2.codDepto AND pr.numDiscPreReq = d2.numDisc;

-- 11
SELECT d.nomeDisc
FROM tbDisciplina d
WHERE NOT EXISTS (
    SELECT 1
    FROM tbPrereq pr
    WHERE pr.codDepto = d.codDepto AND pr.numDisc = d.numDisc
);

-- 12
SELECT d.nomeDisc
FROM tbDisciplina d
JOIN (
    SELECT codDepto, numDisc
    FROM tbPrereq
    GROUP BY codDepto, numDisc
    HAVING COUNT(*) >= 2
) prCount ON d.codDepto = prCount.codDepto AND d.numDisc = prCount.numDisc;











    