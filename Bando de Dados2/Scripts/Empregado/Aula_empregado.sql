create table departamento (
   CodDepto                      serial not null, 
   Nome                          varchar(20),
   Local                         varchar(20));

--adiciona chave primária de departamento
alter table departamento add constraint pkdepto primary key(coddepto);

create table empregado (
       Matricula               serial not null,
       PrimeiroNome            varchar(15),
       Sobrenome   	           varchar(15),
       Dataadmissao            date,
       Cargo                   varchar(30),
       Salario                 numeric(13,2),
       gerente		             integer,
       CodDepto                integer);

--adiciona chave primária de empregado
alter table empregado add constraint pkEmp primary key(matricula);

--adiciona chave estrangeira e a de auto relacionamento
Alter table empregado add constraint fkgerente foreign key(gerente) references empregado;
Alter table empregado add constraint fkdepto foreign key(coddepto) references departamento;

--insere valores na tabela departamento
insert into departamento values (default,'Informática','Sede');
insert into departamento values (default,'Pessoal','Sede');

--insere valores na tabela empregado
insert into empregado values (default,'Jõao', 'Guedes',current_date,'Analista de Sistemas Junior',1400.00,null,1);
insert into empregado values (default,'José', 'Batista',current_date,'Analista de Sistemas Pleno',2200.00,1,1);
insert into empregado values (default,'Ana Maria', 'Silva',current_date,'Analista de Sistemas Junior',1400.00,1,1);
insert into empregado values (default,'Ricardo', 'Neves',current_date,'Analista de Sistemas Pleno',2200.00,2,1);
insert into empregado values (default,'Valter', 'Moura',current_date,'Analista de Suporte Junior',1400.00,2,1);
insert into empregado values (default,'Mariana','Oliveira',current_date,'Designer de Interface',1800.00,1,1);

--atualiza coddepto do empregado de matrícula 6
update empregado set coddepto = null where matricula = 6



--Códigos/aulas

Select e.sobrenome as "Empregado", d.nome as
"Departamento", e.dataadmissao as "Data de
Admissão"
From empregado e join departamento d on
e.coddepto = d.coddepto;


--identifica automaticamente os campos iguais, igual ao join on
Select *
From empregado natural JOIN departamento;


Select e.primeironome as "Empregado",
g.primeironome as "Gerente"
 From (empregado e join empregado g on
e.gerente = g.matricula);


select d.nome as Departamento, e.primeironome as
Empregado
from departamento d full join empregado e
on d.coddepto = e.coddepto;


select d.nome as Departamento, e.primeironome as
Empregado
from departamento d join empregado e
on d.coddepto = e.coddepto;


Select d.nome as Departamento,
e.primeironome as Funcionario
From departamento d left join empregado e
on d.coddepto = e.coddepto
 Where e.coddepto is null
 Order by d.nome; 


--trigger
CREATE TABLE empaudit (
 matemp integer NOT NULL,
 dataalter varchar NOT NULL );


 CREATE OR REPLACE FUNCTION emplogfunc()
 RETURNS trigger AS $$
 BEGIN
 INSERT INTO empaudit (matemp, dataalter) VALUES
(new.matricula, current_timestamp);
 RETURN NEW;
END;
$$ LANGUAGE plpgsql; 


CREATE TRIGGER logEmptrigger AFTER INSERT
ON empregado FOR EACH ROW
EXECUTE PROCEDURE emplogfunc();


select * from empregado;
select * from empaudit;


create table empregado_backup as
select * from empregado where 1= 2; 


create or replace function repempfunc()
  returns trigger as $$
  begin
    insert into empregado_backup values
    (new.matricula, new.primeironome, new.sobrenome, new.dataadmissao, new.cargo,
    new.salario, new.gerente, new.coddepto);
    return new;
  end; $$ language plpgsql;


create trigger replicalnsEmp
  after insert on empregado
for each row execute procedure repempfunc();


insert into empregado values (default, 'Jorge', 'Alberto', current_date, 'Analista de Sistemas', 6000, 1, 1);


select * from empregado
select * from empregado_backup


CREATE OR REPLACE FUNCTION verificaop_emp() RETURNS
TRIGGER AS $$
 BEGIN
 -- Utiliza a variável TG_OP para descobrir a operação sendo realizada.
 IF (TG_OP = 'DELETE') THEN
 raise notice 'Operação Delete sobre %', TG_TABLE_NAME;
 RETURN OLD;
 ELSIF (TG_OP = 'UPDATE') THEN
 raise notice 'Operação Update sobre %', TG_TABLE_NAME;
 RETURN NEW;
 ELSIF (TG_OP = 'INSERT') THEN
 raise notice 'Operação Insert sobre %', TG_TABLE_NAME;
 RETURN NEW;
 END IF;
 RETURN NULL;
 END;
 $$ language plpgsql;


 CREATE TRIGGER emp_audit
 AFTER INSERT OR UPDATE OR DELETE ON empregado
 FOR EACH ROW EXECUTE PROCEDURE verificaop_emp();


 select * from empregado;


 insert into empregado(matricula,primeironome)
values(default,'Mariana');
 delete from empregado where matricula = 22;
 update empregado set salario = 3000 where matricula = 2; 


update empregado set salario = 3000;

drop trigger emp_audit on empregado;

CREATE TRIGGER emp_audit
 AFTER INSERT OR UPDATE OR DELETE ON empregado
 EXECUTE PROCEDURE verificaop_emp();

 update empregado set salario = 3000; 


 
CREATE OR REPLACE FUNCTION impedeAlteração() RETURNS
TRIGGER AS $$
Declare
 v_hoje integer;
 v_agora integer;
Begin
 v_hoje := to_number(to_char(current_timestamp,'d'),'99');
 v_agora := to_number(to_char(current_timestamp,'hh24mi'),'9999');
 If v_agora > 1330 then
 RAISE EXCEPTION '%', 'Hora proibida para atualizações' USING
ERRCODE = 45000;
 End if;
 If v_hoje = 1 then
 RAISE EXCEPTION '%', 'Dia proibido para atualizações' USING
ERRCODE = 45001;
 End if;
 return new;
End;
$$ language plpgsql; 


CREATE TRIGGER empnotifTrig
 BEFORE INSERT OR UPDATE ON empregado
 FOR EACH ROW EXECUTE PROCEDURE
impedeAlteração();


 insert into empregado values
(default,'Teste333','xxx',current_date,1,3450,1,1);

select current_timestamp;

select * from empregado order by primeironome;


--lista exercicio trigger
Create or Replace Function trocaNome()
Returns trigger as $$
declare msg varchar(40);
Begin
 msg = 'Primeiro nome '||old.primeironome|| ' mudou para '||new.primeironome;
 raise notice 'Foi feito: %',msg;
 return null;
End;
$$ LANGUAGE plpgsql;


CREATE TRIGGER veNome AFTER UPDATE
 of primeironome ON empregado
 FOR EACH ROW
 EXECUTE PROCEDURE trocaNome();
 
select * from empregado;

update empregado
set primeironome = 'TROCA'
where primeironome = 'Mariana'; 

--2ª a) usando update, chama o trigger(que está vinculado ao update) que chama a função para trocar o primeironome pelo nome TROCA
--   b) através do update que chamou o trigger, podendo ser confirmado dando select na tabela empregado e verificando se o nome foi alterado
--   c) old é o objeto antigo, o que já existe e o new é o objeto novo, que vai ser inserido

--3ª
create table empLog(
	usuario varchar(20),
	operacao char(1),
	dataHora timestamp
)


create or replace function logUser()
returns trigger as $$
declare hora varchar(20);
begin
  hora := current_timestamp;
  insert into empLog(usuario, operacao, dataHora) values (current_user, substr(tg_op,1,1), current_date + hora);
  end;
  $$ language plpgsql;


create trigger logEmp after update or delete or insert
on empregado for each row execute procedure logUser();


select * from empregado

update empregado
set primeironome = 'Qualquer'
where matricula = 8