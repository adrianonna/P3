Create table Esporte (codesp serial, descesp varchar(25));

Create table Atleta ( Codatl serial, Nome varchar(30), datanasc date, bolsa numeric (14,2), esporte integer);

alter table esporte add constraint pkesp primary key(codesp);

alter table atleta add constraint pkatleta primary key(codatl);

alter table atleta add constraint fkatlesp foreign key(esporte) references esporte;



insert into esporte (codesp, descesp) values (1, 'Volei')
insert into esporte (codesp, descesp) values (2, 'Natação')
insert into esporte (codesp, descesp) values (3, 'Futebol')

insert into atleta (nome, datanasc, bolsa, esporte) values ('Adriano', '19/04/1990', 525.00, 1);
insert into atleta (nome, datanasc, bolsa, esporte) values ('Renata', '20/04/1990', 525.00, 2);
insert into atleta (nome, datanasc, bolsa, esporte) values ('Karol', '21/04/1990', 525.00, 3);
insert into atleta (nome, datanasc, bolsa, esporte) values ('Pablo', '22/04/1990', 525.00, 1);
insert into atleta (nome, datanasc, bolsa, esporte) values ('Janaina', '23/04/1990', 525.00, 2);




do $$
begin
update atleta
set bolsa = bolsa * 1.1
where codatl = 6;
if not found then
insert into atleta (nome, datanasc, bolsa, esporte)
values ('Renato', '24/04/1990', 525.00*1.1, 3);
end if;
end$$;



create or replace function aumento(poc float)
returns void as $$
declare
media atleta.bolsa%type;
vcursor_atl cursor for select * from atleta;
begin
select avg(bolsa) into media from atleta;
for vatl in vcursor_atl loop
if vatl.bolsa < media then
update atleta
set bolsa = bolsa * poc
where codatl = vatl.codatl;
raise notice 'nome atleta = %', vatl.nome;
raise notice 'bolsa = %', vatl.bolsa;
raise notice 'status = %', 'atualizado';
else
raise notice 'nome atleta = %', vatl.nome;
raise notice 'bolsa = %', vatl.bolsa;
raise notice 'status = %', 'não atualizado';
end if;
end loop;
end;
$$ language plpgsql;

select aumento(1.1)

select * from atleta
select * from esporte

truncate table atleta






create or replace function qtde (esp varchar)
returns integer as $$
declare
soma integer;
idesp integer;
begin
select codesp into strict idesp from esporte where descesp = esp;
select count(*) into strict soma from atleta a join esporte e on e.codesp = a.esporte where descesp = esp;
return soma;
exception
when no_data_found then
raise notice 'erro';
return 0;
end;
$$ language plpgsql;


select qtde('Volei')


do $$
declare result integer;
begin
select qtde('judo') into result;
raise notice 'resultado = %', result;
end$$;




create view atletaEsp (nome, bolsa, esporte)
as select nome, bolsa, descesp from atleta a join esporte e on e.codesp = a.esporte


