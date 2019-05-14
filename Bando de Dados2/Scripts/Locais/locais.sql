create database "Locais"
with owner = adrianonna
encoding = 'UTF8'
tablespace = pg_default
lc_collate = 'Portuguese_Brazil.1252'
lc_ctype = 'Portuguese_Brazil.1252'
connection limit = -1;


create table cidade(cod integer, nome varchar(20), constraint
pkcid primary key(cod));

insert into cidade values (1,'João Pessoa');

select * from cidade;

CREATE ROLE bd2 LOGIN PASSWORD 'bd2'
 valid until '28-02-2019 18:00';

 grant select on cidade to bd2;

 revoke select on cidade from bd2;

 grant insert on cidade to bd2;

--verifica os roles/usuários que existem 
select rolname from pg_roles;

create role grupoBD2;

grant select on cidade to grupoBD2;

grant grupoBD2 to bd2;

--comando realizado com usuário bd2
 insert into cidade values(2,'Campina Grande'); 

--não funcionou pq bd2 não tem privilegio para deletar
delete from cidade where nome like 'Campina Grande'; 

--dar permissão de delete para bd2(comando realizado com usuário adrianonna)
grant delete on cidade to bd2

select * from cidade