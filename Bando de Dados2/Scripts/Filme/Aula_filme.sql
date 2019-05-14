
CREATE TABLE Filme ( 
       CodFILME       Integer  NOT NULL,
       Titulo          Varchar(25),
       Ano             integer,
       Duracao         integer,
       CodCATEG       integer,
       CodEst         integer);

CREATE TABLE Artista ( 
       CodART      integer  NOT NULL,
       NomeART    Varchar(25),
       Cidade          Varchar(20),
       Pais            Varchar(20),
       DataNasc       Date);

CREATE TABLE Estudio ( 
       CodEst     integer  NOT NULL,
       NomeEst    Varchar(25));

CREATE TABLE Categoria ( 
       CodCATEG       integer  NOT NULL,
       DescCATEG VARCHAR(25));

CREATE TABLE Personagem ( 
       CodART     integer  NOT NULL,
       CodFILME       integer  NOT NULL,
       NomePers  VARCHAR(25),
       Cache           numeric(15,2));

ALTER TABLE Filme ADD CONSTRAINT PKFilme PRIMARY KEY(CodFILME);

ALTER TABLE Artista ADD CONSTRAINT PKArtista PRIMARY KEY(CodART);

ALTER TABLE Estudio ADD CONSTRAINT PKEst PRIMARY KEY(CodEst);

ALTER TABLE Categoria ADD CONSTRAINT PKCategoria PRIMARY KEY(CodCATEG);

ALTER TABLE Personagem ADD CONSTRAINT PKPersonagem PRIMARY KEY(CodART,CodFILME);

ALTER TABLE Filme ADD CONSTRAINT FKFilme1Categ FOREIGN KEY(CodCATEG) REFERENCES Categoria;

ALTER TABLE Filme ADD CONSTRAINT FKFilme2Estud FOREIGN KEY(CodEst) REFERENCES Estudio;

ALTER TABLE Personagem ADD CONSTRAINT FKPersonagem2Artis FOREIGN KEY(CodART) REFERENCES Artista;

ALTER TABLE Personagem ADD CONSTRAINT FKPersonagem1Filme FOREIGN KEY(CodFILME) REFERENCES Filme;

insert into artista values(1,'Cameron Diaz',null,'USA','15/07/75');
insert into artista values(2,'Julia Roberts',null,'USA','20/08/67');
insert into artista values(3,'Brad Pitt',null,null,'05/03/70');
insert into artista values(4,'Mel Gibson',null,null,'06/04/59');
insert into artista values(5,'Russel Crowe',null,'USA','06/06/62');
insert into artista values(6,'Tom Cruise',null,'USA','10/09/64');
insert into artista values(7,'Antonio Fagundes','Rio de Janeiro','Brasil','12/10/58');

insert into categoria values(1,'Aventura');
insert into categoria values(2,'Romance');
insert into categoria values(3,'Comédia');
insert into categoria values(4,'Ação');
insert into categoria values(5,'Suspense');
insert into categoria values(6,'Drama');

insert into estudio values(1,'Paramount');
insert into estudio values(2,'Disney');
insert into estudio values(3,'Universal');

insert into filme values(1,'Encontro Explosivo',2010,134,4,1);
insert into filme values(2,'O Besouro Verde',2010,155,1,1);
insert into filme values(3,'Comer, Rezar, Amar',2010,177,2,1);
insert into filme values(4,'Bastardos Inglórios',2009,122,4,1);
insert into filme values(5,'Sr e Sra Smith',2005,119,4,2);
insert into filme values(6,'O Fim da Escuridão',2009,100,6,1);

insert into personagem values(1,1,'Natalie',10000);
insert into personagem values(1,2,'Tom',10000);
insert into personagem values(5,3,'John',10000);
insert into personagem values(3,2,'Ana',6000);
insert into personagem values(2,1,'Kate',11000);
insert into personagem values(6,4,'Mel',8000);

update filme set codest = 3 where codfilme = 1



--lista 1
--1ª questão
create view artistaV (codigo, nome, datanasc) as
select a.codart, a.nomeart, a.datanasc
from artista as a;

--2ª questão
create view filmeV (titulo, duracao, ano, codigoest, descricao) as
select f.titulo, f.duracao, f.ano, f.codest, e.nomeest
from filme as f
join estudio as e
on e.codest = f.codest

--3ª questão
insert into artistaV values (8, 'Mariana Ximenes', '01/10/51')

--4ª questão
insert into filmeV values ('O homem aranha', 180, 2017, 2, 'Disney')--Não funciona para adicionar direto na view
insert into filme values (7, 'O homem aranha', 2017, 180, 4, 2)--adiciona direito na tabela filme

--5ªquestão
update artistaV set datanasc = '28/11/1978' where codart = 8


--lista 2
--1.1 seleciona os titulos dos filmes que o estudio desse filme comece com "P"
select titulo
from filme
where codest in (select codest
 from estudio
 where nomeest like 'P%');


--1.2 seleciona a descrição da tabela categoria onde o codigo da categia está em codigo da categoria na tabela filme
select c.desccateg as descricao
from categoria as c
where c.codcateg in (select f.codcateg from filme as f)


--1.3 mostra o nome do artista que o cod for igual ao nome Natalie
select a.nomeart
from artista as a
where a.codart in (select p.codart from personagem as p --seleciona o cod do artista que tiver nome Natalie
		   where p.nomepers = 'Natalie')

--1.4
select *
from artista as a
where a.codart not in (select p.codart from personagem as p)

--1.5


select * from filme
select * from categoria
select * from artista
select * from personagem
select * from estudio

--2
create table filmeEst, e.nomeest
as select f.titulo from filme as f
where f.codest in (select e.nomeest from estudio as e
			where e.codest = f.codest)


drop table filmeEst


--função para adicionar valores na tabela categoria
CREATE OR REPLACE FUNCTION InsereCategoria
(codigo INTEGER, nome VARCHAR(25))
 RETURNS void
 AS $$
 BEGIN
 INSERT INTO "public".categoria VALUES (codigo,
nome);
 END;
 $$ LANGUAGE 'plpgsql';


Select * from Categoria;

--chamando afunção InsereCategoria criada a cima, onde vai adicionar os dados passados por parâmetros em categoria
Select InsereCategoria (7, 'Sci-Fi');


--função para mostrar os filmes da categoria passada por parâmetro
CREATE OR REPLACE function mostra_filmes (v_categoria IN
categoria.desccateg%type)
returns void
as $$
 declare
 vfilme cursor (v_categoria categoria.desccateg%type) for
 select titulo, ano
 from filme f join categoria c on f.codcateg = c.codcateg
 where desccateg = v_categoria;
BEGIN
 FOR v_f IN vfilme(v_categoria) LOOP
 raise notice 'Título = %',v_f.titulo;
 raise notice 'Ano = %',v_f.ano;
 END LOOP;
END;
$$ LANGUAGE 'plpgsql';

select * from categoria;
select * from filme;

Select mostra_filmes('Ação'); 



--função que retorna a quantidade de filmes de determinada categoria
Create or replace function contafilme (
 cat IN categoria.desccateg%type)
 RETURNS integer as $$
 declare totalfilme integer;
 Begin
 Select count(*) into totalfilme
 from filme f join categoria c on f.codcateg = c.codcateg
 Where desccateg = cat;
 Return totalfilme;
 End;
$$ LANGUAGE 'plpgsql';

Select contafilme('Ação'); 



--exemplo 4 slide funções
Create or replace function DolarToReal
(dolar in numeric, cotacao numeric)
Returns numeric
As $$
 Begin
 Return dolar *cotacao;
 End;
 $$ LANGUAGE 'plpgsql';


--exemplo 4 slide funções
 Do $$ declare v numeric;
 begin
 v:= DolarToReal(100, 3.69);
 raise notice 'Valor em Real: %',v;
 End$$;




--indices
Create table c (c1 INT, c2 INT);
Create unique INDEX ci ON c (c1, c2);
Alter table c ADD CONSTRAINT cpk PRIMARY KEY
USING INDEX ci;


CREATE TABLE d (d1 INT, d2 INT);
ALTER TABLE d ADD CONSTRAINT dpk PRIMARY
KEY (d1,d2);


Select *
From filme
Where ano = 2010;


CREATE INDEX anoIn ON filme(ano);


--exercicio indices
--1
create table testaFilme as select * from filme;


select * from testafilme;


DO $$DECLARE i int:= 0;
BEGIN
 WHILE I <= 200000 LOOP
 INSERT INTO testafilme select * from filme;
 I := I + 1;
 END LOOP;
END$$;


select titulo from testafilme order by titulo;


EXPLAIN select titulo from testafilme order by titulo;


create index testaFilmeindex on testafilme(titulo);


select titulo from testafilme order by titulo;


EXPLAIN select titulo from testafilme order by titulo;


select relpages from pg_class where relname = 'filme';


select relpages from pg_class where relname = 'testafilme';


--2

select titulo from testafilme where ano = 2010;

create index testaFilmeindexAno on testafilme(ano);

select titulo from testafilme where ano = 2010;


--funções e exceções

Create or replace function verificaArt(codigo integer)
Returns varchar
As $$
Declare nome varchar(25);
Begin
 select nomeart into nome from artista
 where codart = codigo;
 IF NOT FOUND THEN
 Return 'Nenhum artista com esse código foi encontrado.';
 END IF;
 return nome;
End;
$$ LANGUAGE 'plpgsql';


Select verificaart(1);

select verificaart(111);


create or replace function verificaart2(integer)
returns varchar
As $$
 Declare r record;
 begin
 select into r * from artista where codart = $1;
 if not found then
 RAISE EXCEPTION 'Artista não existente--> %', $1
 USING HINT = 'Por favor, verifique o código do artista';
 end if;
 return r.nomeart;
 End;
 $$ LANGUAGE 'plpgsql';

 
 select verificaart2(1);
 
 select verificaart2(111);


--exemplo 3
CREATE OR REPLACE FUNCTION testains(cod integer,nome
varchar(25))
RETURNS integer AS $$
BEGIN
 Insert into estudio(codest,nomeest) values (cod,nome);
 Return 1;
 EXCEPTION
 WHEN unique_violation THEN
 raise notice 'Já existe esse registro';
 return -1;
 WHEN OTHERS THEN
 -- fazer algo
 RETURN -1;
END;
$$ LANGUAGE plpgsql;


select * from estudio;
select testains(4,'Teste');
select testains(5,'Teste'); 


--exemplo 5 falta executar
create table logcontagem (id serial, info varchar(40));

create or replace function testeContagem(limite integer, vpais artista.pais%type)--vai pegar o tipo de pais dentro de artista, no caso, varchar(20)
returns void as $$
declare
  contagem integer;
  info2 varchar(40);
begin
  select count(*) into strict contagem from artista where pais = vpais;
  if contagem >= limite then
    raise exception 'Atingiu o limite';
  end if;
expeption
  when raise_exception then
    info2 = 'Artista de' || vpais || ' possuem ' || contagem;
    insert into logcontagem(id, info) values (default, info2);
end;
$$ language plpsql;


select testeContagem(5, 'USA');

select # from logcontagem;