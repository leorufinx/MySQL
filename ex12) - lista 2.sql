create database lista2;
use lista2;

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
    

select * from profturma;
-- 1. Obter os nomes docentes cuja titulação tem código diferente de 3.
select NomeProf from professor where CodTit in (select CodTit from titulacao where CodTit= 3);

/* 2. Obter os nomes dos departamentos que têm turmas que, em 2002/1, têm aulas na
sala 101 do prédio denominado 'Informática - aulas'. Resolver usando theta-join
e junção natural. */
-- Theta Join
select NomeDepto from depto dp, horario hr, predio pd
	where dp.CodDepto = hr.CodDepto and hr.CodPred = pd.CodPred and
    hr.AnoSem = 2002/1 and hr.NumSala = 101 and pd.NomePred = 'Informática - aulas';

-- Natural Join
select NomeDepto from depto dp natural join horario hr, predio pd 
	where hr.AnoSem = 2002/1 and hr.NumSala = 101 and pd.NomePred = 'Informática - aulas';

/*  3.Obter o nome dos professores que possuem horários conflitantes (possuem
turmas que tenham a mesma hora inicial, no mesmo dia da semana e no mesmo
semestre). */
SELECT p.NomeProf AS "Professores com horário conflitante" 
FROM professor p 
INNER JOIN profturma pt ON p.CodProf = pt.CodProf 
INNER JOIN turma t ON pt.AnoSem = t.AnoSem AND pt.CodDepto = t.CodDepto AND pt.NumDisc = t.NumDisc AND pt.SiglaTur = t.SiglaTur 
INNER JOIN horario h ON t.AnoSem = h.AnoSem AND t.CodDepto = h.CodDepto AND t.NumDisc = h.NumDisc AND t.SiglaTur = h.SiglaTur 
INNER JOIN horario h2 ON h.AnoSem = h2.AnoSem AND h.DiaSem = h2.DiaSem AND h.HoraInicio = h2.HoraInicio AND h.SiglaTur != h2.SiglaTur;


/* 4. Para cada disciplina que possui pré-requisito, obter o nome da disciplina seguido
do nome da disciplina que é seu pré-requisito (usar junções explícitas - quando
possível usar junção natural). */
select d.CodDepto, d.NomeDisc, p.CodDeptoPreReq, dd.NomeDisc
	from prereq p
	inner join (select * from disciplina where NumDisc = 101) d on d.CodDepto =  p.CodDepto
    inner join (select * from disciplina where NumDisc = 201) dd on dd.CodDepto =  p.CodDeptoPreReq;
    
/* 5. Para cada disciplina, mesmo para aquelas que não possuem pré-requisito, obter o
nome da disciplina seguido do nome da disciplina que é seu pré-requisito (usar
junções explícitas - quando possível usar junção natural). */

SELECT d.NomeDisc AS "Disciplina", d2.NomeDisc AS "Pré-requisito" 
FROM disciplina d 
LEFT JOIN prereq pr ON d.CodDepto = pr.CodDepto AND d.NumDisc = pr.NumDisc 
LEFT JOIN disciplina d2 ON pr.CodDeptoPreReq = d2.CodDepto AND pr.NumDiscPreReq = d2.NumDisc;


/* 6. Para cada disciplina que tem um pré-requisito que a sua vez também tem um
pré-requisito, obter o nome da disciplina seguido do nome do pré-requisito de
seu pré-requisito. */

SELECT d1.NomeDisc AS "Disciplina", d3.NomeDisc AS "Pré-requisito do Pré-requisito" 
FROM disciplina d1 
JOIN prereq pr1 ON d1.CodDepto = pr1.CodDepto AND d1.NumDisc = pr1.NumDisc 
JOIN disciplina d2 ON pr1.CodDeptoPreReq = d2.CodDepto AND pr1.NumDiscPreReq = d2.NumDisc 
JOIN preReq pr2 ON d2.CodDepto = pr2.CodDepto AND d2.NumDisc = pr2.NumDisc 
JOIN disciplina d3 ON pr2.CodDeptoPreReq = d3.CodDepto AND pr2.NumDiscPreReq = d3.NumDisc;


/* 7. Obter uma tabela que contém três colunas. Na primeira coluna aparece o nome
de cada disciplina que possui pré-requisito, na segunda coluna aparece o nome
de cada um de seus pré-requisitos e a terceira contém o nível de pré-requisito.
Nível 1 significa que trata-se de um pré-requisito imediato da disciplina, nível 2
significa que trata-se de um pré-requisito de um pré-requisito da disciplina, e
3 
assim por diante. Limitar a consulta para três níveis. (DICA USAR UNION
ALL) */

SELECT d1.NomeDisc AS "Disciplina", d2.NomeDisc AS "Pré-Requisito", 1 AS "Nivel" 
FROM disciplina d1
NATURAL JOIN prereq pr
JOIN disciplina d2 ON pr.CodDeptoPreReq = d2.CodDepto AND pr.NumDiscPreReq = d2.NumDisc

UNION ALL

SELECT d1.NomeDisc AS "Disciplina", d3.NomeDisc AS "Pré-Requisito", 2 AS "Nivel" 
FROM disciplina d1
NATURAL JOIN prereq pr1
JOIN disciplina d2 ON pr1.CodDeptoPreReq = d2.CodDepto AND pr1.NumDiscPreReq = d2.NumDisc
NATURAL JOIN prereq pr2
JOIN disciplina d3 ON pr2.CodDeptoPreReq = d3.CodDepto AND pr2.NumDiscPreReq = d3.NumDisc

UNION ALL

SELECT d1.NomeDisc AS "Disciplina", d4.NomeDisc AS "Pré-Requisito", 3 AS "Nivel" 
FROM disciplina d1
NATURAL JOIN prereq pr1
JOIN disciplina d2 ON pr1.CodDeptoPreReq = d2.CodDepto AND pr1.NumDiscPreReq = d2.NumDisc
NATURAL JOIN prereq pr2
JOIN disciplina d3 ON pr2.CodDeptoPreReq = d3.CodDepto AND pr2.NumDiscPreReq = d3.NumDisc
NATURAL JOIN prereq pr3
JOIN disciplina d4 ON pr3.CodDeptoPreReq = d4.CodDepto AND pr3.NumDiscPreReq = d4.NumDisc;


/* 8. Obter os códigos dos professores com código de título vazio que não
ministraram aulas em 2001/2 (resolver com junção natural). */
-- Natural Join
    SELECT p.CodProf 
    FROM professor p 
    NATURAL JOIN profturma pt 
    WHERE p.CodTit = "0" AND pt.AnoSem != "20021";