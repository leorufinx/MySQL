create database ex3;
use ex3;

create table peca (
cod_peca varchar(2),
nome_peca varchar(50),
cor_peca varchar(50),
peso_peca int,
cidade_peca varchar(20)
);

create table fornecedor (
cod_fornecedor varchar(2),
nome_fornecedor varchar(100),
status_fornecedor smallint,
cidade_fornecedor varchar(50)
);

alter table peca add constraint pk_cod_peca primary key (cod_peca);
alter table fornecedor add constraint pk_cod_fornecedor primary key (cod_fornecedor);
alter table embarque add constraint fk_cod_peca foreign key (cod_peca) references peca (cod_peca);
alter table embarque add constraint fk_cod_fornecedor foreign key (cod_fornecedor) references fornecedor (cod_fornecedor);

create table embarque (
quantidade_embarque int,
cod_peca varchar(2),
cod_fornecedor varchar(2)
);

select * from peca;

insert into peca (cod_peca,nome_peca,cor_peca,peso_peca,cidade_peca)
values ('P1','Eixo','Cinza',10,'Poa');
insert into peca (cod_peca,nome_peca,cor_peca,peso_peca,cidade_peca)
values ('P2','Rolamento','Preto',16,'Rio');
insert into peca (cod_peca,nome_peca,cor_peca,peso_peca,cidade_peca)
values ('P3','Mancal','Verde',30,'São Paulo');

select * from fornecedor;

insert into fornecedor (cod_fornecedor,nome_fornecedor,status_fornecedor,cidade_fornecedor)
values('F1','Silva',5,'São Paulo');
insert into fornecedor (cod_fornecedor,nome_fornecedor,status_fornecedor,cidade_fornecedor)
values('F2','Souza',10,'Rio');
insert into fornecedor (cod_fornecedor,nome_fornecedor,status_fornecedor,cidade_fornecedor)
values('F3','Alvares',5,'São Paulo');
insert into fornecedor (cod_fornecedor,nome_fornecedor,status_fornecedor,cidade_fornecedor)
values('F4','Tavares',8,'Rio');

select * from embarque;

insert into embarque (cod_peca,cod_fornecedor,quantidade_embarque)
values('P1','F1',300);
insert into embarque (cod_peca,cod_fornecedor,quantidade_embarque)
values('P1','F2',400);
insert into embarque (cod_peca,cod_fornecedor,quantidade_embarque)
values('P1','F3',200);
insert into embarque (cod_peca,cod_fornecedor,quantidade_embarque)
values('P2','F1',300);
insert into embarque (cod_peca,cod_fornecedor,quantidade_embarque)
values('P2','F4',350);

-- 1) Obter o número de fornecedores na base de dados 

select nome_fornecedor, count(nome_fornecedor) from fornecedor group by nome_fornecedor;

-- 2) Obter o número de cidades em que há fornecedores 

select count(distinct f.cidade_fornecedor) numerocidade from fornecedor f;

-- 3) Obter o número de fornecedores com cidade informada 

select count(f.cidade_fornecedor) from fornecedor f;

-- 4) Obter a quantidade máxima embarcada

select max(q.quantidade_embarque) from embarque q;

-- 5) Obter o número de embarques de cada fornecedor 

select e.cod_fornecedor, count(quantidade_embarque)
from embarque e
group by e.cod_fornecedor;

-- 6) Obter o número de embarques de quantidade maior que 300 de cada fornecedor 

select e.cod_fornecedor, sum(e.quantidade_embarque) Numerobarques from embarque e where e.quantidade_embarque >300 group by e.cod_fornecedor, e.quantidade_embarque;

-- 7) Obter a quantidade total embarcada de peças de cor cinza para cada fornecedor 

select n.nome_peca, count(cor_peca)
from peca n where cor_peca = 'Cinza'
group by n.nome_peca;

-- 8) Obter o quantidade total embarcada de peças para cada fornecedor. Exibir o resultado por ordem descendente de quantidade total embarcada. 

select q.cod_fornecedor, sum(q.quantidade_embarque)
from embarque q group by quantidade_embarque order by q.quantidade_embarque desc;

-- 9) Obter os códigos de fornecedores que tenham embarques de mais de 500 unidades de peças cinzas, junto com a quantidade de embarques de peças cinzas

SELECT cod_fornecedor, count(quantidade_embarque) AS quantidade_embarque
FROM embarque 
WHERE cod_peca IN (SELECT cod_peca FROM peca WHERE cor_peca = 'Cinza')
GROUP BY cod_fornecedor
HAVING sum(quantidade_embarque) > 500;




