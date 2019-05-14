CREATE TABLE Cliente (
CodCLI Integer PRIMARY KEY,
Nome Varchar(30),
Endereco Varchar(30),
Telefone Varchar(12),
InscE Varchar(10),
CNPJ Varchar(10),
Cidade Varchar(15),
UF Varchar(2)
);

CREATE TABLE Produto (
CodPROD Integer not null,
Descricao Varchar(20),
Valor Numeric(10,2),
Unidade Char(2),
constraint pk_prod primary key(CodPROD));

CREATE TABLE Pedido (
NumPED Integer PRIMARY KEY,
PrazoEntrega Integer,
Data Date,
CodCLI Integer,
CodVEND Integer,
FOREIGN KEY(CodCLI) REFERENCES Cliente (CodCLI)
);

CREATE TABLE Vendedor (
CodVEND Integer PRIMARY KEY,
Nome Varchar(30),
DataNasc Date,
SalarioFixo Numeric(12,2),
FaixaComissao Char(1)
);

CREATE TABLE ItensPedido (
NumPED Integer,
CodPROD Integer,
Quantidade Integer,
constraint pk_itens PRIMARY KEY(CodPROD,NumPED),
constraint fk_prod FOREIGN KEY(CodPROD) REFERENCES Produto (CodPROD),
constraint fk_ped FOREIGN KEY(NumPED) REFERENCES Pedido (NumPED)
);
 

ALTER TABLE Pedido ADD FOREIGN KEY(CodVEND) REFERENCES Vendedor (CodVEND);


insert into cliente values(1,'Claudia Dias',null,null, '564325','786534','Recife','PE');
insert into cliente values(2,'Joaquim Moraes','Epitacio Pessoa, 123','32425643', '500925','789004','Joao Pessoa','PB');
insert into cliente values(3,'Janaina Rodrigues','Rui Carneiro, 342',null, '764325','386534','Joao Pessoa','PB');
insert into cliente values(4,'Maria Portela','Boa Viagem, 345','76435678', null,null,'Recife','PE');
insert into cliente values(5,'Ana Moura','Nego, 321','32465432', '87325','780978','Joao Pessoa','PB');
insert into cliente values(6,'Cassandra Doura',null,null, '786525','79876','Recife','PE');
insert into cliente values(7,'Cicero Novaes',null,null, '123525','432534','Natal','RN');
insert into cliente values(8,'Marcos Araruna','Sergipe,267','43265432', '900325','800534','Joao Pessoa','PB');

insert into vendedor values(1,'Juan Gomes', '28/07/1978', 2300.80,'C');
insert into vendedor values(2,'Joao Peregrino', '20/05/1970', 3300.80,'B');
insert into vendedor values(3,'Carla Gomes', '12/02/1968', 5300.80,'A');
insert into vendedor values(4,'Josefa Cirino', '23/08/1980', 2300.80,'C');
insert into vendedor values(5,'Ariane Dutra', '28/09/1983', 3300.80,'B');

insert into produto values(25,'Queijo', 12.00, 'KG');
insert into produto values(22,'Chocolate', 4.12, 'G');
insert into produto values(15,'Leite', 5.00, 'L');
insert into produto values(45,'Linho', 20.00, 'M');
insert into produto values(44,'Feijao', 4.00, 'KG');
insert into produto values(10,'Acucar', 1.00, 'KG');

insert into pedido values(205,23, '12/09/2009', 1,1);
insert into pedido values(120,10, '21/09/2009', 2,1);
insert into pedido values(222,5, '25/09/2009', 3,4);
insert into pedido values(123,2, '28/09/2009', 4,2);
insert into pedido values(201,3, '28/09/2009', 5,3);
insert into pedido values(204,3, '26/09/2009', 5,2);

insert into itenspedido values(205,25, 35);
insert into itenspedido values(205,22, 30);
insert into itenspedido values(205,15, 10);
insert into itenspedido values(120,45, 35);
insert into itenspedido values(120,44, 10);
insert into itenspedido values(123,45, 35);
insert into itenspedido values(123,10, 10);

--insere 3 vendedores
insert into vendedor values(6,'Adriano', '19/04/1990', 5300.80,'A');
insert into vendedor values(7,'Paolla', '20/05/1987', 2300.80,'C');
insert into vendedor values(8,'Myrna', '12/02/1997', 3300.80,'B');

--insere 3 clientes
insert into cliente values(9, 'Pedro', 'Epitácio Pessoa', '32351956', null, null, 'João Pessoa', 'PB');
insert into cliente values(10, 'Lais', 'Pedro II', null, '321424', '187637', 'Salvador', 'BA');
insert into cliente values(11, 'João', 'Mangueiras', '233425', null, null, 'Belém', 'PA');

--insere 3 pedidos
insert into pedido values(206, 10, '01/02/2000', 9, 6);
insert into pedido values(207, 7, '02/03/2002', 10, 7);
insert into pedido values(208, 8, '03/04/2008', 11, 8);

--insere 1 produto
 insert into produto values (12, 'XXX', 1.2, 'KG');

--insere um pedido que não tenha vendedor cadastrado
insert into pedido values(100,10,'12/10/2017',4,null);


--atualiza o valor de um produto que o código seja igual a 1
update produto
set valor = 10
where codprod = 1


--atualiza o salario de todos os vend
update vendedor
set salariofixo = salariofixo * 1.1
where --todos vendedores

select * from produto

--deleta um vend cadastrado
delete from vendedor
where codvend = 8





--Consultas

--seleciona os KG com valor acima de 4.0
Select descricao, unidade, valor
From produto
Where unidade = 'KG' and valor > 4.0


-- seleciona os produtos com valor entre 1 e 5.5
Select codprod, descricao
From produto
Where valor between 1.00 and 5.50


--nome do vendedor que a comissao é A ou B
Select nome, faixacomissao
From vendedor
Where faixacomissao IN ('A','B')


--mostra os clientes que não tem inscE
Select nome, inscE
From cliente
Where InscE is null


--mostra novo salário para faixa de comissão C
Select nome, (salariofixo *1.15) + 120 as "Novo
Salário"
From vendedor
Where faixacomissao = 'C'
Order by nome


--mostra os que terminam com 'A' maiúscula
Select *
From Cliente
Where nome like '________A'


--termina com a letra 'a' minuscula
Select *
From Cliente
Where nome like '________a'


--mostra quantas faixacomissao distintas existem
select count(distinct(faixacomissao))
from vendedor


--mostra quantas faixacomissao existem
select count(faixacomissao)
from vendedor


--mostra quais faixacomissao existem
select distinct(faixacomissao)
from vendedor


--agrupa(como se fosse distinct) e conta quantas faixacomissao tem de cada tipo
select faixacomissao, count(*)
from vendedor
group by faixacomissao


--agrupa e conta quantos produto tem em cada pedido distinto
Select numped, count(*) as "Total de Produtos"
from itenspedido
group by numped


--seleciona a faixacomissao, salariofixo minimo e maximo
--onde o nome começa com J ou A
--faixacomissao de forma agrupada
--as faixacomissao que tiverem mais do que um
select faixacomissao, min(Salariofixo),
max(Salariofixo)
from vendedor
where nome like 'J%'or nome like 'A%'
group by faixacomissao
having count(*) > 1


--produto cartesiano, junta todos da tabela cliente com todos da tabela pedido e filtra os que tiver codcli iguais
select cliente.codcli, nome, numped, pedido.codcli
from cliente, pedido
where cliente.codcli = pedido.codcli


--nome do vendedor que vendeu mais de 5 itens com descrição chocolate CONFIRMAR
select v.nome
from vendedor v join pedido p
 on v.codvend = p.codvend
 join itenspedido i on p.numped = i.numped
 join produto pr on i.codprod = pr.codprod
where i.quantidade > 5 and pr.descricao = 'Chocolate'


--mostra total de pedidos(que os clientes fizeram) para cada cidade
Select cidade, count(*) ped --saber se é pedido
from cliente C, pedido P, vendedor V
where C.codcli = P.codcli and
 P.codvend = V.codvend
Group by cidade;


--Produto que não está vinculado a nenhum pedido
select codprod, descricao
From produto P
Where not exists (select *
 From itenspedido
Where codprod = P.codprod);


--João Pessoa é diferente de Joao Pessoa
--Conta quantos clientes de Joao Pessoa e de Recife
Select distinct
 (Select COUNT(*) from cliente where cidade like
'Joao Pessoa') AS Pessoenses,
 (Select COUNT(*) from cliente where cidade like
'Recife') AS Recifenses
 From cliente


--foi criado um pedido sem vendedor associado mais a cima
--deleta pedidos que não tenham vendedores associados
 delete from pedido P
where not exists (select nome --vai pegar/consultar o que não tiver codvend igual a P.codvend
 from vendedor
 where codvend = P.codvend); --filtra todos que tiver codvend igual a P.codvend


--consulta com join
--consultar a data do pedido do produto chocolate
 Select p.data as datapedido, pr.descricao
from pedido p join itenspedido i
on i.numped = p.numped
join produto pr
on i.codprod = pr.codprod
where pr.descricao like 'Chocolate'


--mesma consulta anterior com subconsulta
where p.numped in
 (select i.numped
 from itenspedido i
 where i.codprod in
 (select pr.codprod
 from produto pr
 where descricao like 'Chocolate'))


select * from vendedor
select * from produto
select * from itenspedido
select * from pedido
select * from cliente


--REVISAR
--Tabela com o numero do pedido e o nome do vendedor referente ao pedido onde a data é menor que 12/12/2017
 CREATE TABLE pedidoVendedor AS
select p.numped, v.nome as NomeVendedor
from pedido p join vendedor v on p.codvend =
v.codvend
where data < '12/12/20017';


--na tabela pedidoVendedor cria um valor com numped repetido 
insert into pedidoVendedor values(201, 'Bruno Assis');


--deleta o valor criado acima
delete from pedidoVendedor P
where nome = 'Bruno Assis'


--Cria um tabela igual a outra sem os valores, apenas com os campos
create table vendedor1 as
 select * from vendedor where 1=2; --Indica que deve ser falso pois 1=2 é falso

select * from vendedor1;

drop table vendedor1;


--seleciona nome e cod do cliente que não realizou pedido
SELECT nome, codcli
FROM cliente
WHERE codcli NOT IN
(SELECT codcli
FROM pedido)
ORDER BY nome;


--seleciona nome e cod do cliente que não realizou pedido, outra forma de fazer
Select nome, c.codcli
from cliente c left join pedido p on c.codcli =
p.codcli
where p.codcli is null
Order by nome;


Select nome, c.codcli as cliente, p.codcli as
ClienteemPedido, numped
from cliente c left join pedido p on c.codcli = p.codcli
Order by nome;



Select * from Produto
--Cria uma nova tabela em memória com apenas os dados que tiver a unidade em KG
CREATE VIEW Prquilo (codigo, descricao, unidade)
 AS Select codprod,descricao,unidade
From produto
Where unidade = 'KG';

--tabela apenas com os produtos que a unidade for KG
Select * from Prquilo;

Insert into Prquilo
values (110,'Arroz','KG');

Update Prquilo
Set descricao = 'Arroz Integral'
Where codigo = 110;

Select * from Prquilo;

Delete from Prquilo where descricao = 'Arroz Integral';

--cria view com restrição onde só pode adicionar descrição que começe com a letra "A"
CREATE OR REPLACE VIEW ProdutodescA AS
SELECT codprod, descricao
FROM produto
WHERE descricao like 'A%'
WITH CHECK OPTION;

Select * from produtodesca;

--não adiciona Manteira pq não começa com "A" mas aceita Azeite
Insert into ProdutodescA values (40, 'Manteiga');
Insert into ProdutodescA values (41, 'Azeite');


CREATE VIEW VendSal(codigo,nome,salario)
 AS Select codvend,nome,salariofixo
 From vendedor;

Select nome from vendsal v join pedido p on
v.codigo = p.codvend;

Select nome from vendedor v join pedido p on
v.codvend = p.codvend;


--exemplo 4 exceções e funções
--exemplo 4
CREATE OR REPLACE FUNCTION retornaInfoProd(v_cod in
produto.codprod%type)
RETURNS varchar AS $$
Declare
 V_nome produto.descricao%type;
 V_preco produto.valor%type;
 Msg varchar(30);
Begin
 Select descricao, valor into strict v_nome, v_preco From produto
 Where codprod = v_cod;
 select v_nome || '--'|| v_preco into msg;
 return msg;
 Exception
 When No_data_found then
 msg = 'Nenhum produto encontrado';
 Return msg;
 When others then
 Return 'Erro desconhecido ';
End;
$$ LANGUAGE plpgsql; 


Select * from produto;
Select retornaInfoProd(25);
Select retornaInfoprod(100);


--trigger
 Create or replace view vPessoas as
 select nome as nome, 'c' as tipo
from cliente
Union
Select nome, 'v' from vendedor;

Select * from vPessoas;


CREATE or replace FUNCTION insere_view_vPessoas()
 RETURNS trigger AS $$
 Declare v_cod_vend integer;
 v_cod_cli integer;
Begin
 Select max(codvend)+1 into v_cod_vend from vendedor;
 Select max(codcli)+1 into v_cod_cli from cliente;
 If new.tipo = 'c' then
 Insert into cliente(codcli, nome) values (v_cod_cli, new.nome);
 Else
 Insert into vendedor (codvend,nome) values
(v_cod_vend,new.nome);
 End if;
 Return null;
 END;
 $$ language plpgsql; 


 Create trigger insViewVPessoas
 Instead of insert on vPessoas
 for each row
 execute procedure insere_view_vPessoas();

select * from vendedor;
select * from cliente;
select * from vPessoas order by tipo;

insert into vPessoas values('Mercia','v');
insert into vPessoas values('Catarina','c');


create table tabClienteaudit(atualizacao integer, ultimadata date, quem varchar);
select * from tabClienteaudit;


CREATE OR REPLACE FUNCTION registra_upd_cliente() RETURNS TRIGGER
AS $$
 declare qtd_linhas integer;
Begin
 select count(*) into qtd_linhas from tabClienteaudit;
 if qtd_linhas = 0 then
 insert into tabclienteAudit values(1,current_date, current_user);
 else
 Update tabClienteAudit
 Set atualizacao = atualizacao + 1, ultimadata = current_date, quem =
current_user;
 end if;
 return null;
End;
$$ language plpgsql; 


CREATE TRIGGER cliente_audit
 AFTER UPDATE ON cliente
 FOR EACH ROW EXECUTE PROCEDURE registra_upd_cliente();


select * from cliente;

update cliente set cidade = 'Belém' Where codcli = 8;

Select * from tabclienteAudit;

