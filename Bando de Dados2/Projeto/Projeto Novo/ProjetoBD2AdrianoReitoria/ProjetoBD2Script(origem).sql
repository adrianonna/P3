create table Cliente(
Id_Cliente smallint primary key, --mudar para serial?
Nome varchar(70) not null
)

create table Juridico(
CNPJ varchar(14) unique,
Id_Cliente smallint primary key,
constraint fk_Id_Cliente_Juridico foreign key(Id_Cliente) references Cliente
)

create table Fisico(
CPF varchar(11) unique,
Id_Cliente smallint primary key,
constraint fk_Id_Cliente_Fisico foreign key(Id_Cliente) references Cliente
)

create table Entregador(
CNH varchar(20) not null unique,
Nome varchar(70) not null,
Id_Entregador smallint primary key
)

create table Pagamento(
Id_Pagamento smallint primary key,
Tipo_Pagamento varchar(30),
DiaPag date not null,
Valor money not null
)

create table Pratos(
Id_Pratos smallint primary key,
Restricao varchar(40) default 'Sem restrição'
)

create table Opcao1(
Id_Pratos smallint,
primary key (Id_Pratos),
constraint fk_Id_Pratos_Opcao1 foreign key (Id_Pratos) references Pratos,
PratoUnico varchar(40)
)

create table Opcao2(
Id_Pratos smallint,
primary key (Id_Pratos),
constraint fk_Id_Pratos_Opcao2 foreign key (Id_Pratos) references Pratos,
Proteina varchar(40),
PrimeiraOp varchar(40),
SegundaOp varchar(40)
)

create table Pedido(
Id_Pedido smallint,
Brinde varchar(40) default 'Sem brinde',
Rua varchar(50) not null,
Numero smallint not null,
Hora time,
DataPed date not null,
Id_Pagamento smallint,
Id_Cliente smallint,
Id_Entregador smallint,
primary key (Id_Pedido), --pois se todas fizessem parte da PK, nenhuma poderia se repetir
constraint fk_Id_Pagamento foreign key (Id_Pagamento) references Pagamento,
constraint fk_Id_Cliente foreign key (Id_Cliente) references Cliente,
constraint fk_Id_Entregador foreign key (Id_Entregador) references Entregador
--primary key (Id_Pedido, Id_Pratos, Id_Pagamento, Id_Cliente, Id_Entregador)
)

create table Contem(
Id_Pratos smallint,
Id_Pedido smallint,
primary key (Id_Pratos, Id_Pedido),
constraint fk_Id_Pratos_Contem foreign key (Id_Pratos) references Pratos,
constraint fk_Id_Pedido_Contem foreign key (Id_Pedido) references Pedido
)

create table Ingredientes(
Id_Ingrediente smallint primary key,
Valor money,
Nome varchar(40) not null
)

create table Tem(
Id_Ingrediente smallint,
Id_Pratos smallint,
Quantidade varchar(40),
primary key (Id_Ingrediente, Id_Pratos),
constraint fk_Id_Ingrediente_Tem foreign key (Id_Ingrediente) references Ingredientes,
constraint fk_Id_Pratos_Tem foreign key (Id_Pratos) references Pratos
--primary key (Id_Pratos, Id_Ingrediente)
)

create table Telefone(
Id_Cliente smallint primary key,
constraint fk_Id_Cliente_Telefone foreign key (Id_Cliente) references Cliente,
Telefone1 varchar(11) not null,
Telefone2 varchar(11) default null
)



insert into Cliente(Id_Cliente, Nome) values (1, 'Adriano');
insert into Cliente(Id_Cliente, Nome) values (2, 'Renata');
insert into Cliente(Id_Cliente, Nome) values (3, 'Samuel');
insert into Cliente(Id_Cliente, Nome) values (4, 'Janainna');
insert into Cliente(Id_Cliente, Nome) values (5, 'Pablo');
insert into Cliente(Id_Cliente, Nome) values (6, 'Felipe');
insert into Cliente(Id_Cliente, Nome) values (7, 'IFPB');


insert into Juridico(CNPJ, Id_Cliente) values (null, 1);
insert into Fisico(CPF, Id_Cliente) values ('01136425470', 1);

insert into Juridico(CNPJ, Id_Cliente) values (null, 2);
insert into Fisico(CPF, Id_Cliente) values ('87463728194', 2);

insert into Juridico(CNPJ, Id_Cliente) values (null, 3);
insert into Fisico(CPF, Id_Cliente) values ('76453898752', 3);

insert into Juridico(CNPJ, Id_Cliente) values (null, 4);
insert into Fisico(CPF, Id_Cliente) values ('87645362718', 4);

insert into Juridico(CNPJ, Id_Cliente) values (null, 5);
insert into Fisico(CPF, Id_Cliente) values ('47769876532',5);

insert into Juridico(CNPJ, Id_Cliente) values ('69325741651000', 6);
insert into Fisico(CPF, Id_Cliente) values ('10956329875', 6);

insert into Juridico(CNPJ, Id_Cliente) values ('65946371851000', 7);
insert into Fisico(CPF, Id_Cliente) values (null, 7);


insert into Entregador(CNH, Nome, Id_Entregador) values ('736483727245', 'Rafael', 1);
insert into Entregador(CNH, Nome, Id_Entregador) values ('765498720194', 'Pedro', 2);


insert into Pagamento(Id_Pagamento, Tipo_Pagamento, DiaPag, Valor) values (1, 'Dinheiro', '02/01/2019', 13.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, DiaPag, Valor) values (2, 'Cartão Débito', '03/01/2019', 26.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, DiaPag, Valor) values (3, 'Dinheiro', '04/01/2019', 52.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, DiaPag, Valor) values (4, 'Cartão Crédito', '05/01/2019', 39.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, DiaPag, Valor) values (5, 'Dinheiro', '06/01/2019', 13.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, DiaPag, Valor) values (6, 'Dinheiro', '07/01/2019', 26.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, DiaPag, Valor) values (7, 'Dinheiro', '08/01/2019', 13.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, DiaPag, Valor) values (8, 'Cartão Débito', '09/01/2019', 65.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, DiaPag, Valor) values (9, 'Cartão Crédito', '10/01/2019', 26.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, DiaPag, Valor) values (10, 'Dinheiro', '11/01/2019', 39.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, DiaPag, Valor) values (11, 'Cartão Crédito', '12/01/2019', 13.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, DiaPag, Valor) values (12, 'Cartão Crédito', '13/01/2019', 117.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, DiaPag, Valor) values (13, 'Dinheiro', '14/01/2019', 26.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, DiaPag, Valor) values (14, 'Dinheiro', '15/01/2019', 52.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, DiaPag, Valor) values (15, 'Dinheiro', '16/01/2019', 13.00);


insert into Pratos(Id_Pratos, Restricao) values (1, default);
insert into Pratos(Id_Pratos, Restricao) values (2, default);
insert into Pratos(Id_Pratos, Restricao) values (3, default);
insert into Pratos(Id_Pratos, Restricao) values (4, default);
insert into Pratos(Id_Pratos, Restricao) values (5, default);
insert into Pratos(Id_Pratos, Restricao) values (6, default);
insert into Pratos(Id_Pratos, Restricao) values (7, default);
insert into Pratos(Id_Pratos, Restricao) values (8, default);
insert into Pratos(Id_Pratos, Restricao) values (9, default);
insert into Pratos(Id_Pratos, Restricao) values (10, default);
insert into Pratos(Id_Pratos, Restricao) values (11, default);
insert into Pratos(Id_Pratos, Restricao) values (12, default);
insert into Pratos(Id_Pratos, Restricao) values (13, 'Pouco sal');
insert into Pratos(Id_Pratos, Restricao) values (14, 'Salada');
insert into Pratos(Id_Pratos, Restricao) values (15, default);


insert into Opcao1(Id_Pratos, PratoUnico) values (1, 'Lasanha');
insert into Opcao1(Id_Pratos, PratoUnico) values (2, 'Arrumadinho');
insert into Opcao1(Id_Pratos, PratoUnico) values (3, 'Cuscuz recheado');
insert into Opcao1(Id_Pratos, PratoUnico) values (4, 'Rubacão');
insert into Opcao1(Id_Pratos, PratoUnico) values (5, 'Purê de macaxeira');
insert into Opcao1(Id_Pratos, PratoUnico) values (6, 'Prato pronto 1');
insert into Opcao1(Id_Pratos, PratoUnico) values (7, 'Prato pronto 2');
insert into Opcao1(Id_Pratos, PratoUnico) values (8, 'Prato pronto 3');
insert into Opcao1(Id_Pratos, PratoUnico) values (9, 'Prato pronto 4');
insert into Opcao1(Id_Pratos, PratoUnico) values (10, 'Prato pronto 5');
insert into Opcao1(Id_Pratos, PratoUnico) values (11, 'Prato pronto 6');
insert into Opcao1(Id_Pratos, PratoUnico) values (12, 'Prato pronto 7');
insert into Opcao1(Id_Pratos, PratoUnico) values (13, 'Prato pronto 8');
insert into Opcao1(Id_Pratos, PratoUnico) values (14, 'Prato pronto 9');
insert into Opcao1(Id_Pratos, PratoUnico) values (15, 'Prato pronto 10');

insert into Opcao2(Id_Pratos, Proteina, PrimeiraOp, SegundaOp) values (1, 'Carne batizada', 'Macarrão acebolado', 'Purê de macaxeira');
insert into Opcao2(Id_Pratos, Proteina, PrimeiraOp, SegundaOp) values (2, 'Galinha cozida', 'Arroz temperado', 'Feijão verde');
insert into Opcao2(Id_Pratos, Proteina, PrimeiraOp, SegundaOp) values (3, 'Galinha assada', 'Arroz cremoso', 'Feijão verde');
insert into Opcao2(Id_Pratos, Proteina, PrimeiraOp, SegundaOp) values (4, 'Porco molhado', 'Arroz com ervas', 'Macarrão acebolado');
insert into Opcao2(Id_Pratos, Proteina, PrimeiraOp, SegundaOp) values (5, 'Carne ao molho madeira', 'Arroz integral', 'Macarrão com legumes');
insert into Opcao2(Id_Pratos, Proteina, PrimeiraOp, SegundaOp) values (6, 'Carne moída apimentada', 'Macarrão integral', 'Arroz com ervas');
insert into Opcao2(Id_Pratos, Proteina, PrimeiraOp, SegundaOp) values (7, 'Peixe cozido', 'Arroz integral', 'Farofa de temperos');
insert into Opcao2(Id_Pratos, Proteina, PrimeiraOp, SegundaOp) values (8, 'Proteina 1', 'opcão 1', 'opcão 2');
insert into Opcao2(Id_Pratos, Proteina, PrimeiraOp, SegundaOp) values (9, 'Proteina 2', 'opcão 1', 'opcão 2');
insert into Opcao2(Id_Pratos, Proteina, PrimeiraOp, SegundaOp) values (10, 'Proteina 3', 'opcão 1', 'opcão 2');
insert into Opcao2(Id_Pratos, Proteina, PrimeiraOp, SegundaOp) values (11, 'Proteina 4', 'opcão 1', 'opcão 2');
insert into Opcao2(Id_Pratos, Proteina, PrimeiraOp, SegundaOp) values (12, 'Proteina 5', 'opcão 1', 'opcão 2');
insert into Opcao2(Id_Pratos, Proteina, PrimeiraOp, SegundaOp) values (13, 'Proteina 6', 'opcão 1', 'opcão 2');
insert into Opcao2(Id_Pratos, Proteina, PrimeiraOp, SegundaOp) values (14, 'Proteina 7', 'opcão 1', 'opcão 2');
insert into Opcao2(Id_Pratos, Proteina, PrimeiraOp, SegundaOp) values (15, 'Proteina 8', 'opcão 1', 'opcão 2');


insert into Pedido(Id_Pedido, Brinde, Rua, Numero, Hora, DataPed, Id_Pagamento, Id_Cliente, Id_Entregador)
values (1, default, 'Avenida Primeiro de Maio', 1251, CURRENT_TIME(0), CURRENT_DATE, 1, 1, 1);
insert into Pedido(Id_Pedido, Brinde, Rua, Numero, Hora, DataPed, Id_Pagamento, Id_Cliente, Id_Entregador)
values (2, default, 'Rua Doutor Antônio Palitot', 160, CURRENT_TIME(0), CURRENT_DATE, 2, 1, 1);
insert into Pedido(Id_Pedido, Brinde, Rua, Numero, Hora, DataPed, Id_Pagamento, Id_Cliente, Id_Entregador)
values (3, default, 'Avenida Epitácio Pessoa', 1571, CURRENT_TIME(0), CURRENT_DATE, 3, 2, 1);
insert into Pedido(Id_Pedido, Brinde, Rua, Numero, Hora, DataPed, Id_Pagamento, Id_Cliente, Id_Entregador)
values (4, default, 'Avenida Cabo Branco', 51, CURRENT_TIME(0), CURRENT_DATE, 4, 3, 1);
insert into Pedido(Id_Pedido, Brinde, Rua, Numero, Hora, DataPed, Id_Pagamento, Id_Cliente, Id_Entregador)
values (5, default, 'Avenida Edson Ramalho', 176, CURRENT_TIME(0), CURRENT_DATE, 5, 4, 2);
insert into Pedido(Id_Pedido, Brinde, Rua, Numero, Hora, DataPed, Id_Pagamento, Id_Cliente, Id_Entregador)
values (6, default, 'Rua Duque de Caxias', 754, CURRENT_TIME(0), CURRENT_DATE, 6, 4, 2);
insert into Pedido(Id_Pedido, Brinde, Rua, Numero, Hora, DataPed, Id_Pagamento, Id_Cliente, Id_Entregador)
values (7, default, 'Rua Josefa Taveira', 348, CURRENT_TIME(0), CURRENT_DATE, 7, 4, 2);
insert into Pedido(Id_Pedido, Brinde, Rua, Numero, Hora, DataPed, Id_Pagamento, Id_Cliente, Id_Entregador)
values (8, default, 'Rua Maciel Pinheiro', 127, CURRENT_TIME(0), CURRENT_DATE, 8, 5, 2);
insert into Pedido(Id_Pedido, Brinde, Rua, Numero, Hora, DataPed, Id_Pagamento, Id_Cliente, Id_Entregador)
values (9, default, 'Rua Monsenhor Walfredo Leal', 941, CURRENT_TIME(0), CURRENT_DATE, 9, 6, 2);
insert into Pedido(Id_Pedido, Brinde, Rua, Numero, Hora, DataPed, Id_Pagamento, Id_Cliente, Id_Entregador)
values (10, default, 'Avenida João Machado', 5412, CURRENT_TIME(0), CURRENT_DATE, 10, 7, 1);
insert into Pedido(Id_Pedido, Brinde, Rua, Numero, Hora, DataPed, Id_Pagamento, Id_Cliente, Id_Entregador)
values (11, default, 'Rua Quintino Bocaiúva', 214, CURRENT_TIME(0), CURRENT_DATE, 11, 7, 1);
insert into Pedido(Id_Pedido, Brinde, Rua, Numero, Hora, DataPed, Id_Pagamento, Id_Cliente, Id_Entregador)
values (12, default, 'Rua Tito Silva', 146, CURRENT_TIME(0), CURRENT_DATE, 12, 2, 2);
insert into Pedido(Id_Pedido, Brinde, Rua, Numero, Hora, DataPed, Id_Pagamento, Id_Cliente, Id_Entregador)
values (13, default, 'Rua Treze de Maio', 741, CURRENT_TIME(0), CURRENT_DATE, 13, 1, 1);
insert into Pedido(Id_Pedido, Brinde, Rua, Numero, Hora, DataPed, Id_Pagamento, Id_Cliente, Id_Entregador)
values (14, default, 'Rua da Areia', 369, CURRENT_TIME(0), CURRENT_DATE, 14, 3, 2);
insert into Pedido(Id_Pedido, Brinde, Rua, Numero, Hora, DataPed, Id_Pagamento, Id_Cliente, Id_Entregador)
values (15, default, 'Avenida Beira Rio', 8421, CURRENT_TIME(0), CURRENT_DATE, 15, 1, 2);


insert into Contem(Id_Pratos, Id_Pedido) values (1, 1);
insert into Contem(Id_Pratos, Id_Pedido) values (2, 2);
insert into Contem(Id_Pratos, Id_Pedido) values (3, 3);
insert into Contem(Id_Pratos, Id_Pedido) values (4, 4);
insert into Contem(Id_Pratos, Id_Pedido) values (5, 5);
insert into Contem(Id_Pratos, Id_Pedido) values (6, 6);
insert into Contem(Id_Pratos, Id_Pedido) values (7, 7);
insert into Contem(Id_Pratos, Id_Pedido) values (8, 8);
insert into Contem(Id_Pratos, Id_Pedido) values (9, 9);
insert into Contem(Id_Pratos, Id_Pedido) values (10, 10);
insert into Contem(Id_Pratos, Id_Pedido) values (11, 11);
insert into Contem(Id_Pratos, Id_Pedido) values (12, 12);
insert into Contem(Id_Pratos, Id_Pedido) values (13, 13);
insert into Contem(Id_Pratos, Id_Pedido) values (14, 14);
insert into Contem(Id_Pratos, Id_Pedido) values (15, 15);

insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (1, 1.50, '1kg de sal');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (2, 24.00, '2kg de galinha');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (3, 8.50, 'Temperos variados');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (4, 52.50, '3.2kg de carne magra');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (5, 10.70, '5kg de arroz');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (6, 22.30, '5kg de feijão');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (7, 17.20, '5kg macarrão');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (8, 22.00, '2kg de peixe');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (9, 5.00, '1kg de farinha');

insert into Tem(Id_Ingrediente, Id_Pratos, Quantidade) values (1, 13, '1g de sal');
insert into Tem(Id_Ingrediente, Id_Pratos, Quantidade) values (1, 2, '5g de sal');
insert into Tem(Id_Ingrediente, Id_Pratos, Quantidade) values (1, 3, '3g de sal');
insert into Tem(Id_Ingrediente, Id_Pratos, Quantidade) values (3, 1, '10g de temperos');
insert into Tem(Id_Ingrediente, Id_Pratos, Quantidade) values (2, 1, '250g de galinha');
insert into Tem(Id_Ingrediente, Id_Pratos, Quantidade) values (1, 15, '3g de sal');
insert into Tem(Id_Ingrediente, Id_Pratos, Quantidade) values (2, 2, '250g de galinha');
insert into Tem(Id_Ingrediente, Id_Pratos, Quantidade) values (3, 3, '15g de temperos');
insert into Tem(Id_Ingrediente, Id_Pratos, Quantidade) values (4, 4, '200g de carne');
insert into Tem(Id_Ingrediente, Id_Pratos, Quantidade) values (5, 5, '150g de arroz');
insert into Tem(Id_Ingrediente, Id_Pratos, Quantidade) values (6, 6, '150g de feijão');
insert into Tem(Id_Ingrediente, Id_Pratos, Quantidade) values (7, 7, ' 200g de macarrão');
insert into Tem(Id_Ingrediente, Id_Pratos, Quantidade) values (8, 8, '250g de peixe');
insert into Tem(Id_Ingrediente, Id_Pratos, Quantidade) values (9, 9, '100g de farofa');
insert into Tem(Id_Ingrediente, Id_Pratos, Quantidade) values (1, 10, '4g de sal');
insert into Tem(Id_Ingrediente, Id_Pratos, Quantidade) values (2, 11, '250g de galinha');
insert into Tem(Id_Ingrediente, Id_Pratos, Quantidade) values (3, 12, '20g de temperos');
insert into Tem(Id_Ingrediente, Id_Pratos, Quantidade) values (5, 13, '150g de arroz');
insert into Tem(Id_Ingrediente, Id_Pratos, Quantidade) values (8, 14, '250g de peixe');


insert into Telefone(Id_Cliente, Telefone1) values (1, '83996547164');
insert into Telefone(Id_Cliente, Telefone1) values (2, '83987809422');
insert into Telefone(Id_Cliente, Telefone1) values (3, '83987542415');
insert into Telefone(Id_Cliente, Telefone1) values (4, '83996854125');
insert into Telefone(Id_Cliente, Telefone1) values (5, '83988254516');
insert into Telefone(Id_Cliente, Telefone1, Telefone2) values (6, '83999342648', '8332352137');
insert into Telefone(Id_Cliente, Telefone1) values (7, '8332351955');



--cria usuario 'usuario1'
create role usuario1 login
password 'ifpb'

--cria usuário adrianonna como superuser
create role adrianonna login
password 'ifpb'
superuser createdb createrole

--atribuindo permissões
grant select, insert on cliente, pedido, pagamento to usuario1



--mostra o nome do cliente e a rua dos pedidos que foram entregues pelo entregador pedro(id=2) 
select cli.nome as nome_cliente, ped.rua, e.nome as nome_entregador
from cliente cli
join pedido ped on cli.id_cliente = ped.id_cliente
join entregador e on e.id_entregador = ped.id_entregador
where ped.id_entregador = 2


--mostra todos os clientes que pagaram em dinheiro
select pag.Tipo_Pagamento, cli.nome from pagamento pag
join pedido ped on pag.Id_Pagamento = ped.Id_Pagamento
join cliente cli on ped.Id_Cliente = cli.Id_Cliente
where Tipo_Pagamento = 'Dinheiro'


--
select *
from tem t
join ingredientes ing on t.Id_Ingrediente = ing.Id_Ingrediente
join pratos pra on t.Id_Pratos = pra.Id_Pratos
join opcao1 op1 on op1.Id_Pratos = pra.Id_Pratos
join opcao2 op2 on op2.Id_Pratos = pra.Id_Pratos
