create table Clientes(
Id_Cliente smallint primary key, --mudar para serial?
Nome varchar(70) not null
);

create table Juridico(
CNPJ varchar(14) unique,
Id_Cliente smallint primary key,
constraint fk_Id_Cliente_Juridico foreign key(Id_Cliente) references Cliente
);

create table Fisico(
CPF varchar(11) unique,
Id_Cliente smallint primary key,
constraint fk_Id_Cliente_Fisico foreign key(Id_Cliente) references Cliente
);

create table Telefones(
Id_Cliente smallint primary key,
constraint fk_Id_Cliente_Telefone foreign key (Id_Cliente) references Cliente,
Telefone1 varchar(11) not null,
Telefone2 varchar(11) default null
);

create table Entregadores(
CNH varchar(20) not null unique,
Nome varchar(70) not null,
Id_Entregador smallint primary key
);

create table Pagamentos(
Id_Pagamento smallint primary key,
Tipo_Pagamento varchar(50) not null,
Data_Pagamento date not null,
Valor numeric
);

create table Pedidos(
Id_Pedido smallint,
Valor_Entrega numeric,
Rua varchar(50) not null,
Numero smallint not null,
Hora_Pedido time,
Data_Pedido date not null,
Id_Pagamento smallint,
Id_Cliente smallint,
Id_Entregador smallint,
primary key (Id_Pedido), --pois se todas fizessem parte da PK, nenhuma poderia se repetir
constraint fk_Id_Cliente foreign key (Id_Cliente) references Cliente,
constraint fk_Id_Pagamento foreign key (Id_Pagamento) references Pagamento,
constraint fk_Id_Entregador foreign key (Id_Entregador) references Entregador
);

create table Pratos(
Id_Pratos smallint primary key,
Restricao varchar(40) default 'Sem restrição',
Tipo varchar(1) --Unico/Personalizado
);

create table Contem(
Id_Pratos smallint,
Id_Pedido smallint,
primary key (Id_Pratos, Id_Pedido),
constraint fk_Id_Pratos_Contem foreign key (Id_Pratos) references Pratos,
constraint fk_Id_Pedido_Contem foreign key (Id_Pedido) references Pedido
);

create table Guarnicoes(
Id_Guanicao smallint primary key,
Proteina varchar(40),
Guarnicao1 varchar(40),
Guarnicao2 varchar(40)
);

create table Possui(
Id_Pratos smallint,
Id_Guanicao smallint,
primary key (Id_Pratos, Id_Guarnicao),
constraint fk_Id_Pratos_Possui foreign key (Id_Pratos) references Pratos,
constraint fk_Id_Guarnicao_Possui foreign key (Id_Guarnicao) references Guarnicao
);

create table Ingredientes( --fusão com registro, filtrar pelo nome
Id_Ingrediente smallint primary key,
Nome varchar(40) not null,
Qtde_Ingrediente float --quantidade em estoque
);

create table Tem(
Id_Ingrediente smallint,
Id_Guarnicao smallint,
Qtde_Porcao float, --quantidade daquele ingrediente naquela guarnição
Tipo_Medida varchar(2), --kg/g/l/ml
primary key (Id_Ingrediente, Id_Guarnicao),
constraint fk_Id_Ingrediente_Tem foreign key (Id_Ingrediente) references Ingredientes,
constraint fk_Id_Guarnicao_Tem foreign key (Id_Guarnicao) references Guarnicao
);

create table Registro(
Id_Registro smallint,
Id_Ingrediente smallint,
Qtde_Registro float,
Valor_Registro numeric,
primary key (Id_Registro, Id_Ingrediente),
constraint fk_Id_Ingrediente foreign key (Id_Ingrediente) references Ingredientes
);



insert into Clientes(Id_Cliente, Nome) values (1, 'Adriano');
insert into Clientes(Id_Cliente, Nome) values (2, 'Renata');
insert into Clientes(Id_Cliente, Nome) values (3, 'Samuel');
insert into Clientes(Id_Cliente, Nome) values (4, 'Janainna');
insert into Clientes(Id_Cliente, Nome) values (5, 'Pablo');
insert into Clientes(Id_Cliente, Nome) values (6, 'Felipe');
insert into Clientes(Id_Cliente, Nome) values (7, 'IFPB');


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


insert into Entregadores(CNH, Nome, Id_Entregador) values ('736483727245', 'Rafael', 1);
insert into Entregadores(CNH, Nome, Id_Entregador) values ('765498720194', 'Pedro', 2);

--para cada pedido tem um e somente um pagamento
--para cada pagamento posso ter um ou mais pedidos
insert into Pagamentos(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (1, 'Dinheiro', '02/01/2019', 13.00);
insert into Pagamentos(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (2, 'Cartão Débito', '03/01/2019', 26.00);
insert into Pagamentos(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (3, 'Dinheiro', '04/01/2019', 52.00);
insert into Pagamentos(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (4, 'Cartão Crédito', '05/01/2019', 39.00);
insert into Pagamentos(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (5, 'Dinheiro', '06/01/2019', 13.00);
insert into Pagamentos(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (6, 'Dinheiro', '07/01/2019', 26.00);
insert into Pagamentos(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (7, 'Dinheiro', '08/01/2019', 13.00);
insert into Pagamentos(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (8, 'Cartão Débito', '09/01/2019', 26.00);
insert into Pagamentos(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (9, 'Cartão Crédito', '10/01/2019', 26.00);
insert into Pagamentos(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (10, 'Dinheiro', '11/01/2019', 13.00);



--Um pedido feito pelo cliente Adriano relacionado ao pagamento ID 1
insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (1, 5, 'Avenida Primeiro de Maio', 1251, CURRENT_TIME(0), CURRENT_DATE, 1, 1, 1);

--Dois pedidos feito pela cliente Renata relacionado ao pagamento ID 2
insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (2, 10, 'Rua Doutor Antônio Palitot', 160, CURRENT_TIME(0), CURRENT_DATE, 2, 2, 1);
insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (3, 5, 'Avenida Epitácio Pessoa', 1571, CURRENT_TIME(0), CURRENT_DATE, 2, 2, 1);

--Um pedido feito pelo cliente Samuel relacionado ao pagamento ID 3
insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (4, 10, 'Avenida Cabo Branco', 51, CURRENT_TIME(0), CURRENT_DATE, 3, 3, 1);

--Três pedidos feito pela cliente Janainna relacionado ao pagamento ID 3
insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (5, 10, 'Avenida Edson Ramalho', 176, CURRENT_TIME(0), CURRENT_DATE, 3, 4, 2);
insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (6, 5, 'Rua Duque de Caxias', 754, CURRENT_TIME(0), CURRENT_DATE, 3, 4, 2);
insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (7, 5, 'Rua Josefa Taveira', 348, CURRENT_TIME(0), CURRENT_DATE, 3, 4, 2);


insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (8, 5, 'Rua Maciel Pinheiro', 127, CURRENT_TIME(0), CURRENT_DATE, 4, 5, 2);
insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (9, 5, 'Rua Monsenhor Walfredo Leal', 941, CURRENT_TIME(0), CURRENT_DATE, 4, 6, 2);
insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (10, 5, 'Avenida João Machado', 5412, CURRENT_TIME(0), CURRENT_DATE, 4, 7, 1);
insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (11, 5, 'Rua Quintino Bocaiúva', 214, CURRENT_TIME(0), CURRENT_DATE, 5, 7, 1);
insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (12, 7, 'Rua Tito Silva', 146, CURRENT_TIME(0), CURRENT_DATE, 6, 2, 2);
insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (13, 0, 'Rua Treze de Maio', 741, CURRENT_TIME(0), CURRENT_DATE, 6, 1, 1);
insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (14, 5, 'Rua da Areia', 369, CURRENT_TIME(0), CURRENT_DATE, 7, 3, 2);
insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (15, 10, 'Avenida Beira Rio', 8421, CURRENT_TIME(0), CURRENT_DATE, 8, 1, 2);

insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (16, 15, 'Rua Abel Bezerra de Lima', 651, CURRENT_TIME(0), CURRENT_DATE, 8, 1, 2);
insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (17, 10, 'Avenida Beira Rio', 842, CURRENT_TIME(0), CURRENT_DATE, 9, 1, 2);
insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (18, 10, 'Avenida Beira Rio', 9612, CURRENT_TIME(0), CURRENT_DATE, 9, 1, 2);
insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (19, 10, 'Avenida Beira Rio', 245, CURRENT_TIME(0), CURRENT_DATE, 10, 1, 2);




insert into Pratos(Id_Pratos, Restricao, Tipo) values (1, default, 'U');
insert into Pratos(Id_Pratos, Restricao, Tipo) values (2, default, 'P');
insert into Pratos(Id_Pratos, Restricao, Tipo) values (3, default, 'U');
insert into Pratos(Id_Pratos, Restricao, Tipo) values (4, default, 'P');
insert into Pratos(Id_Pratos, Restricao, Tipo) values (5, default, 'P');
insert into Pratos(Id_Pratos, Restricao, Tipo) values (6, default, 'U');
insert into Pratos(Id_Pratos, Restricao, Tipo) values (7, default, 'U');
insert into Pratos(Id_Pratos, Restricao, Tipo) values (8, 'Sem sal', 'P');
insert into Pratos(Id_Pratos, Restricao, Tipo) values (9, 'Sem sal', 'P');
insert into Pratos(Id_Pratos, Restricao, Tipo) values (10, 'Sem salada', 'U');


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
insert into Contem(Id_Pratos, Id_Pedido) values (1, 11);
insert into Contem(Id_Pratos, Id_Pedido) values (2, 12);
insert into Contem(Id_Pratos, Id_Pedido) values (3, 13);
insert into Contem(Id_Pratos, Id_Pedido) values (4, 14);
insert into Contem(Id_Pratos, Id_Pedido) values (5, 15);


insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (1, );


insert into Possui(Id_Pratos, Id_Guanicao) values (1,1);


insert into Opcao1(Id_Pratos, PratoUnico) values (1, 'Lasanha de frango');
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





insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (1, 1.50, 'Sal');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (2, 24.00, 'Galinha');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (3, 8.50, 'Temperos variados');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (4, 52.50, 'Carne magra');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (5, 10.70, 'Arroz');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (6, 22.30, 'Feijão');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (7, 17.20, 'Macarrão');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (8, 22.00, 'Peixe');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (9, 5.00, 'Farinha');

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


insert into Telefones(Id_Cliente, Telefone1) values (1, '83996547164');
insert into Telefones(Id_Cliente, Telefone1) values (2, '83987809422');
insert into Telefones(Id_Cliente, Telefone1) values (3, '83987542415');
insert into Telefones(Id_Cliente, Telefone1) values (4, '83996854125');
insert into Telefones(Id_Cliente, Telefone1) values (5, '83988254516');
insert into Telefones(Id_Cliente, Telefone1, Telefone2) values (6, '83999342648', '8332352137');
insert into Telefones(Id_Cliente, Telefone1) values (7, '8332351955');



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


--Mostra quais pratos possuem galinha como ingrediente
--A relação está obrigando as duas tabelas op1 e op2 terem galinha quando o id ingrediente for 2, por causa da relação da tabela 'tem'
select *
from tem t
join ingredientes ing on t.Id_Ingrediente = ing.Id_Ingrediente
join pratos pra on t.Id_Pratos = pra.Id_Pratos
join opcao1 op1 on op1.Id_Pratos = pra.Id_Pratos
join opcao2 op2 on op2.Id_Pratos = pra.Id_Pratos
where op2.Proteina = '%Galinha%' --ing.Id_Ingrediente = 2 --ing.nome = 'Galinha'
