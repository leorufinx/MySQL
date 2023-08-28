create database ex2;
use ex2;

create table tb_aluno (
cod_aluno SMALLINT,
nome_aluno VARCHAR(45),
end_aluno VARCHAR(100),
sigla_estado CHAR(2),
id_classe SMALLINT
);

create TABLE tb_estado (
sigla_estado CHAR(2),
nome_estado VARCHAR(40)
);

create table tb_aluno_disciplina (
cod_aluno SMALLINT,
id_disciplina CHAR(3),
nota_aluno SMALLINT
);

create table tb_disciplina (
id_disciplina CHAR(3),
nome_disciplina VARCHAR(15),
id_professor_disciplina CHAR(3),
nota_minima_disciplina SMALLINT
);

create table tb_professor (
id_professor CHAR(3),
nome_professor VARCHAR(25)
);

create TABLE tb_classe (
id_classe SMALLINT,
id_andar SMALLINT
);

-- pk

alter table tb_aluno add constraint pkaulo primary key (cod_aluno);
alter table tb_professor add constraint pkprofessor primary key (id_professor);
alter table tb_disciplina add constraint pkdisciplina primary key (id_disciplina);
alter table tb_classe add constraint pkclasse primary key (id_classe);
alter table tb_estado add constraint pkestado primary key (sigla_estado);

-- fk

alter table tb_aluno add constraint fkclasse foreign key (id_classe) references tb_classe (id_classe);
alter table tb_aluno add constraint fksigla foreign key (sigla_estado) references tb_estado (sigla_estado);
alter table tb_disciplina add constraint fkprofessordisciplina foreign key (id_professor_disciplina) references tb_professor (id_professor);
alter table tb_aluno_disciplina add constraint fkcodigoaluno foreign key (cod_aluno) references tb_aluno (cod_aluno);
alter table tb_aluno_disciplina add constraint fkiddisciplina foreign key (id_disciplina) references tb_disciplina (id_disciplina);

-- update 

insert into tb_professor (id_professor, nome_professor)
values ('JOI','OSEAS SANTAN');
insert into tb_professor (id_professor, nome_professor)
values ('OSE','OSEAS SANTAN');
insert into tb_professor (id_professor, nome_professor)
values ('VIT','VITOR VASCONCEL');
insert into tb_professor (id_professor, nome_professor)
values ('FER','JOSE ROBERTO FERRO');
insert into tb_professor (id_professor, nome_professor)
values ('LIM','VALMIR LIMA');
insert into tb_professor (id_professor, nome_professor)
values ('EDS','EDSON SILVA');
insert into tb_professor (id_professor, nome_professor)
values ('WAG','WAGNER OKIDA');

SELECT * FROM tb_professor;

insert into tb_estado (sigla_estado) values ('SP');
insert into tb_classe (id_classe) values (1);
insert into tb_classe (id_classe) values (2);
insert into tb_classe (id_classe) values (3);

select * from tb_disciplina;
select * from tb_aluno_disciplina;
select * from tb_aluno;

INSERT INTO TB_ALUNO (COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE)
VALUES (' 1','ANTONIO CARLOS PENTEAD ','RUA X ','SP ','1 ');
INSERT INTO TB_ALUNO (COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE)
VALUES ('2 ',' AUROMIR DA SILVA VALDEVINO',' RUA W','SP ',' 1');
INSERT INTO TB_ALUNO (COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE)
VALUES ('3 ',' ANDRE COSTA','RUA T ','SP ','1 ');
INSERT INTO TB_ALUNO (COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE)
VALUES (' 4',' ROBERTO SOARES DE MENEZES ','RUA BW ','SP ',' 2');
INSERT INTO TB_ALUNO (COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE)
VALUES ('5',' DANIA ','RUA CCC ','SP ','2 ');
INSERT INTO TB_ALUNO (COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE)
VALUES ('6 ','CARLOS MAGALHAES ','AV SP ','SP ','2 ');
INSERT INTO TB_ALUNO (COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE)
VALUES ('7 ','MARCELO RAUBA ','AV SAO LUIS ','SP',' 3');
INSERT INTO TB_ALUNO (COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE)
VALUES ('8 ','FERNANDO ','AV COUNTRY ','SP','3 ');
INSERT INTO TB_ALUNO (COD_ALUNO, NOME_ALUNO, END_ALUNO, SIGLA_ESTADO, ID_CLASSE)
VALUES ('9 ','WALMIR BURIN ',' RUA ASSIS','SP','3 ');

INSERT INTO TB_DISCIPLINA (ID_DISCIPLINA, NOME_DISCIPLINA, ID_PROFESSOR_DISCIPLINA, NOTA_MINIMA_DISCIPLINA)
VALUES ('MAT','MATEMATICA','JOI','7');
INSERT INTO TB_DISCIPLINA (ID_DISCIPLINA, NOME_DISCIPLINA, ID_PROFESSOR_DISCIPLINA, NOTA_MINIMA_DISCIPLINA)
VALUES ('POR','PORTUGUES','VIT','5');
INSERT INTO TB_DISCIPLINA (ID_DISCIPLINA, NOME_DISCIPLINA, ID_PROFESSOR_DISCIPLINA, NOTA_MINIMA_DISCIPLINA)
VALUES ('FIS','FISICA','OSE','3');
INSERT INTO TB_DISCIPLINA (ID_DISCIPLINA, NOME_DISCIPLINA, ID_PROFESSOR_DISCIPLINA, NOTA_MINIMA_DISCIPLINA)
VALUES ('HIS','HISTORIA','EDS','2');
INSERT INTO TB_DISCIPLINA (ID_DISCIPLINA, NOME_DISCIPLINA, ID_PROFESSOR_DISCIPLINA, NOTA_MINIMA_DISCIPLINA)
VALUES ('GEO','GEOGRAFIA','WAG','4');
INSERT INTO TB_DISCIPLINA (ID_DISCIPLINA, NOME_DISCIPLINA, ID_PROFESSOR_DISCIPLINA, NOTA_MINIMA_DISCIPLINA)
VALUES ('ING','INGLES','LIM','2');

INSERT INTO tb_aluno_disciplina (cod_aluno,id_disciplina,nota_aluno)
VALUES (1,'MAT',0);
INSERT INTO tb_aluno_disciplina (cod_aluno,id_disciplina,nota_aluno)
VALUES (2,'MAT',0);
INSERT INTO tb_aluno_disciplina (cod_aluno,id_disciplina,nota_aluno)
VALUES (3,'MAT',1);
INSERT INTO tb_aluno_disciplina (cod_aluno,id_disciplina,nota_aluno)
VALUES (4,'POR',2);
INSERT INTO tb_aluno_disciplina (cod_aluno,id_disciplina,nota_aluno)
VALUES (5,'POR',2);
INSERT INTO tb_aluno_disciplina (cod_aluno,id_disciplina,nota_aluno)
VALUES (6,'POR',2);
INSERT INTO tb_aluno_disciplina (cod_aluno,id_disciplina,nota_aluno)
VALUES (7,'FIS',3);
INSERT INTO tb_aluno_disciplina (cod_aluno,id_disciplina,nota_aluno)
VALUES (8,'FIS',3);
INSERT INTO tb_aluno_disciplina (cod_aluno,id_disciplina,nota_aluno)
VALUES (9,'FIS',3);
INSERT INTO tb_aluno_disciplina (cod_aluno,id_disciplina,nota_aluno)
VALUES (1,'POR',2);
INSERT INTO tb_aluno_disciplina (cod_aluno,id_disciplina,nota_aluno)
VALUES (2,'POR',2);
INSERT INTO tb_aluno_disciplina (cod_aluno,id_disciplina,nota_aluno)
VALUES (7,'POR',2);
INSERT INTO tb_aluno_disciplina (cod_aluno,id_disciplina,nota_aluno)
VALUES (1,'fis',3);

-- select

-- A) 
-- 1) Queremos selecionar todos os alunos cadastrados.
select nome_aluno from tb_aluno;

-- 2)  Queremos selecionar todos os nomes de disciplina,
-- cujo a nota mínima seja maior que 5 ( cinco ).

select * from tb_disciplina;
select d.nome_disciplina from tb_disciplina d where d.nota_minima_disciplina >5;

-- 3) Queremos selecionar todas disciplinas que tenham
-- nota mínima entre 3 (três) e 5 (cinco).

select * from tb_disciplina;
select d.nome_disciplina from tb_disciplina d where d.nota_minima_disciplina >= 3 and d.nota_minima_disciplina <=5;

-- B)  Exercícios de SELECT (Ordenando e agrupando dados)
-- 1) Queremos selecionar todos os alunos em ordem alfabética de nome de aluno, e também o número da classe que estuda.

select a.nome_aluno, c.id_classe from tb_aluno a inner join tb_classe c on a.id_classe = c.id_classe order by a.nome_aluno asc;

-- 2) Selecionaremos o item anterior, porém ordenado alfabeticamente pelo identificador do aluno de forma descendente
-- (ascendente é “default” que é do A até o Z "ASC").

select * from tb_aluno;
select convert (cod_aluno, char) cod_aluno, nome_aluno, id_classe from tb_aluno order by cod_aluno desc;

-- 3) Selecionaremos  todos os alunos que cursam as disciplinas de matemática E de português agrupados por aluno e disciplina.

select * from tb_aluno;
select * from tb_disciplina;
select * from tb_aluno_disciplina;
select cod_aluno from tb_aluno_disciplina where id_disciplina = 'POR' and cod_aluno in (select cod_aluno from tb_aluno_disciplina where id_disciplina = 'MAT');

-- C) Exercícios de SELECT (Junção de Tabelas)
-- 1) Queremos selecionar todos os nomes de alunos que cursam Português ou Matemática.

select a.nome_aluno, d.nome_disciplina from tb_aluno_disciplina ad inner join tb_aluno a on ad.cod_aluno = a.cod_aluno inner join tb_disciplina d on ad.id_disciplina = d.id_disciplina where d.nome_disciplina in ('PORTUGUES','MATEMATICA') group by a.nome_aluno, d.nome_disciplina;

-- 2) Queremos selecionar todos os nomes de alunos cadastrados que cursam  a disciplina FÍSICA e seus respectivos endereços.

select a.nome_aluno, a.end_aluno from tb_aluno_disciplina ad inner join tb_aluno a on ad.cod_aluno = a.cod_aluno inner join tb_disciplina d on ad.id_disciplina = d.id_disciplina where d.nome_disciplina in ('FISICA');  

-- 3). Queremos selecionar todos os nomes de alunos cadastrados que cursam física e o andar que se encontra a classe dos mesmos.
-- Preste atenção ao detalhe da concatenação de uma string "andar" junto à coluna do número do andar (Apenas para estética do resultado).

select a.nome_aluno, c.id_andar from tb_aluno a inner join tb_aluno_disciplina ad on a.cod_aluno = ad.cod_aluno inner join tb_classe c on a.id_classe = c.id_classe inner join tb_disciplina d on d.id_disciplina = ad.id_disciplina where d.nome_disciplina in ('FISICA');

-- D) Exercícios de SELECT (OUTER JOIN)
-- 1) Selecionar todos os Professores com suas respectivas disciplinas e os demais Professores que não lecionam disciplina alguma.

select * from tb_professor ;
select * from tb_disciplina ;

select p.nome_professor , d.nome_disciplina from tb_professor p left join tb_disciplina d on p.id_professor = d.id_professor_disciplina;





