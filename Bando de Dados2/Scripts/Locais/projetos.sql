create schema Projs

create table Projs.engenheiro(cod integer, nome varchar(30), salario numeric(15,2),
constraint pkeng primary key(cod));

create table Projs.projeto(cod integer, titulo varchar(30),
constraint pkpro primary key(cod));

create table Projs.atua(cod integer, codpro integer, codeng integer,
constraint pkatu primary key(cod));

Alter table Projs.atua add constraint fkpro foreign key(codpro) references Projs.projeto;

Alter table Projs.atua add constraint fkeng foreign key(codeng) references Projs.engenheiro;

insert into Projs.engenheiro values (1,'Adriano', 10000);
insert into Projs.engenheiro values (2,'Paolla', 7000);
insert into Projs.engenheiro values (3,'Ada', 5000);

insert into Projs.projeto values (1,'Universidade');
insert into Projs.projeto values (2,'Casa');
insert into Projs.projeto values (3,'Apartamento');

insert into Projs.atua values (1, 1, 1);
insert into Projs.atua values (2, 2, 1);
insert into Projs.atua values (3, 1, 2);
insert into Projs.atua values (4, 1, 3);
insert into Projs.atua values (5, 3, 2);


--setima questão
create view EngPro(nome, titulo)
as select nome, titulo
from projs.engenheiro
join projs.projeto
on projs.engenheiro.cod = projs.projeto.cod
