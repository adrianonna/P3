
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



