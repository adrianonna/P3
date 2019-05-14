create table Cliente(
Id_Cliente serial primary key, --mudar para serial?
Nome varchar(70) not null
);

create table Juridico(
CNPJ varchar(14) unique,
Id_Cliente smallint primary key,
constraint fk_Id_Cliente_Juridico foreign key(Id_Cliente) references Clientes
);

create table Fisico(
CPF varchar(11) unique,
Id_Cliente smallint primary key,
constraint fk_Id_Cliente_Fisico foreign key(Id_Cliente) references Clientes
);

create table Telefone(
Id_Cliente smallint primary key,
constraint fk_Id_Cliente_Telefone foreign key (Id_Cliente) references Clientes,
Telefone1 varchar(11) not null,
Telefone2 varchar(11) default null
);

create table Entregador(
CNH varchar(20) not null unique,
Nome varchar(70) not null,
Id_Entregador serial primary key
);

create table Pagamento(
Id_Pagamento serial primary key,
Tipo_Pagamento varchar(50) not null,
Data_Pagamento date not null,
Valor numeric
);

create table Pedido(
Id_Pedido serial,
Valor_Entrega numeric,
Rua varchar(50) not null,
Numero smallint not null,
Hora_Pedido time,
Data_Pedido date not null,
Id_Pagamento smallint,
Id_Cliente smallint,
Id_Entregador smallint,
primary key (Id_Pedido), --pois se todas fizessem parte da PK, nenhuma poderia se repetir
constraint fk_Id_Cliente foreign key (Id_Cliente) references Clientes,
constraint fk_Id_Pagamento foreign key (Id_Pagamento) references Pagamentos,
constraint fk_Id_Entregador foreign key (Id_Entregador) references Entregadores
);

create table Prato(
Id_Pratos serial primary key,
Restricao varchar(40) default 'Sem restrição',
Tipo varchar(1), --Unico/Personalizado
Nome_Prato varchar(70)
);

create table Contem(
Id_Pratos smallint,
Id_Pedido smallint,
primary key (Id_Pratos, Id_Pedido),
constraint fk_Id_Pratos_Contem foreign key (Id_Pratos) references Pratos,
constraint fk_Id_Pedido_Contem foreign key (Id_Pedido) references Pedidos
);

create table Guarnicao(
Id_Guarnicao serial primary key,
Proteina varchar(60),
Guarnicao1 varchar(50),
Guarnicao2 varchar(50)
);

create table Possui(
Id_Pratos smallint,
Id_Guarnicao smallint,
primary key (Id_Pratos, Id_Guarnicao),
constraint fk_Id_Pratos_Possui foreign key (Id_Pratos) references Pratos,
constraint fk_Id_Guarnicao_Possui foreign key (Id_Guarnicao) references Guarnicoes
);

create table Ingrediente( --fusão com registro, filtrar pelo nome
Id_Ingrediente serial primary key,
Nome_Ingrediente varchar(40) not null,
Qtde_Ingrediente float --quantidade em estoque
);

create table Tem(
Id_Ingrediente smallint,
Id_Guarnicao smallint,
Qtde_Porcao float, --quantidade daquele ingrediente naquela guarnição
Tipo_Medida varchar(2), --kg/g/l/ml
primary key (Id_Ingrediente, Id_Guarnicao),
constraint fk_Id_Ingrediente_Tem foreign key (Id_Ingrediente) references Ingredientes,
constraint fk_Id_Guarnicao_Tem foreign key (Id_Guarnicao) references Guarnicoes
);

create table Registro(
Id_Registro serial,
Id_Ingrediente smallint,
Qtde_Registro float,
Valor_Registro numeric,
primary key (Id_Registro, Id_Ingrediente),
constraint fk_Id_Ingrediente foreign key (Id_Ingrediente) references Ingredientes
);

select * from cliente

insert into Cliente(Id_Cliente, Nome) values (default, 'Adriano');
insert into Cliente(Id_Cliente, Nome) values (default, 'Renata');
insert into Cliente(Id_Cliente, Nome) values (default, 'Samuel');
insert into Cliente(Id_Cliente, Nome) values (default, 'Janainna');
insert into Cliente(Id_Cliente, Nome) values (default, 'Pablo');
insert into Cliente(Id_Cliente, Nome) values (default, 'Felipe');
insert into Cliente(Id_Cliente, Nome) values (default, 'IFPB');


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


insert into Entregadores(CNH, Nome, Id_Entregador) values ('736483727245', 'Rafael', default);
insert into Entregadores(CNH, Nome, Id_Entregador) values ('765498720194', 'Pedro', default);

--para cada pedido tem um e somente um pagamento
--para cada pagamento posso ter um ou mais pedidos
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Dinheiro', '02/01/2019', 13.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Cartão Débito', '03/01/2019', 26.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Dinheiro', '04/01/2019', 52.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Cartão Crédito', '05/01/2019', 39.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Dinheiro', '06/01/2019', 13.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Dinheiro', '07/01/2019', 26.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Dinheiro', '08/01/2019', 13.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Cartão Débito', '09/01/2019', 26.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Cartão Crédito', '10/01/2019', 26.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Dinheiro', '11/01/2019', 13.00);


--O cliente pode realizar mais de um pedido.
--O pedido está relacionado a apenas um pagamento, ou seja, cada objeto pedido tem que está relacionado um objeto pagamento diferente.
--pois vai está relacionado ao cliente, caso ele tenha feito mais de um pedido
insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 5, 'Avenida Primeiro de Maio', 1251, CURRENT_TIME(0), CURRENT_DATE, 1, 1, 1);

insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 10, 'Rua Doutor Antônio Palitot', 160, CURRENT_TIME(0), CURRENT_DATE, 2, 2, 1);
insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 5, 'Avenida Epitácio Pessoa', 1571, CURRENT_TIME(0), CURRENT_DATE, 3, 2, 1);

insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 10, 'Avenida Cabo Branco', 51, CURRENT_TIME(0), CURRENT_DATE, 4, 3, 1);

insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 10, 'Avenida Edson Ramalho', 176, CURRENT_TIME(0), CURRENT_DATE, 5, 4, 2);
insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 5, 'Rua Duque de Caxias', 754, CURRENT_TIME(0), CURRENT_DATE, 6, 4, 2);
insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 5, 'Rua Josefa Taveira', 348, CURRENT_TIME(0), CURRENT_DATE, 7, 4, 2);

insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 5, 'Rua Maciel Pinheiro', 127, CURRENT_TIME(0), CURRENT_DATE, 8, 5, 2);
insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 5, 'Rua Monsenhor Walfredo Leal', 941, CURRENT_TIME(0), CURRENT_DATE, 9, 6, 2);
insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 5, 'Avenida João Machado', 5412, CURRENT_TIME(0), CURRENT_DATE, 10, 7, 1);



--insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
--values (default, 5, 'Rua Quintino Bocaiúva', 214, CURRENT_TIME(0), CURRENT_DATE, 5, 7, 1);
--insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
--values (default, 7, 'Rua Tito Silva', 146, CURRENT_TIME(0), CURRENT_DATE, 6, 2, 2);
--insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
--values (default, 0, 'Rua Treze de Maio', 741, CURRENT_TIME(0), CURRENT_DATE, 6, 1, 1);
--insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
--values (default, 5, 'Rua da Areia', 369, CURRENT_TIME(0), CURRENT_DATE, 7, 3, 2);
--insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
--values (default, 10, 'Avenida Beira Rio', 8421, CURRENT_TIME(0), CURRENT_DATE, 8, 1, 2);

--insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
--values (default, 15, 'Rua Abel Bezerra de Lima', 651, CURRENT_TIME(0), CURRENT_DATE, 8, 1, 2);
--insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
--values (default, 10, 'Avenida Beira Rio', 842, CURRENT_TIME(0), CURRENT_DATE, 9, 1, 2);
--insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
--values (default, 10, 'Avenida Beira Rio', 9612, CURRENT_TIME(0), CURRENT_DATE, 9, 1, 2);
--insert into Pedidos(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
--values (default, 10, 'Avenida Beira Rio', 245, CURRENT_TIME(0), CURRENT_DATE, 10, 1, 2);



insert into Prato(Id_Pratos, Restricao, Tipo, Nome_Prato) values (default, default, 'U');
insert into Prato(Id_Pratos, Restricao, Tipo, Nome_Prato) values (default, default, 'P');
insert into Prato(Id_Pratos, Restricao, Tipo, Nome_Prato) values (default, default, 'U');
insert into Prato(Id_Pratos, Restricao, Tipo, Nome_Prato) values (default, default, 'P');
insert into Prato(Id_Pratos, Restricao, Tipo, Nome_Prato) values (default, default, 'P');
insert into Prato(Id_Pratos, Restricao, Tipo, Nome_Prato) values (default, default, 'U');
insert into Prato(Id_Pratos, Restricao, Tipo, Nome_Prato) values (default, default, 'U');
insert into Prato(Id_Pratos, Restricao, Tipo, Nome_Prato) values (default, 'Sem sal', 'P');--8
insert into Prato(Id_Pratos, Restricao, Tipo, Nome_Prato) values (default, 'Sem sal', 'P');--9
insert into Prato(Id_Pratos, Restricao, Tipo, Nome_Prato) values (default, 'Sem salada', 'U');--10


insert into Contem(Id_Pratos, Id_Pedido) values (1, 1);
insert into Contem(Id_Pratos, Id_Pedido) values (2, 2);
insert into Contem(Id_Pratos, Id_Pedido) values (3, 2);
insert into Contem(Id_Pratos, Id_Pedido) values (4, 3);
insert into Contem(Id_Pratos, Id_Pedido) values (5, 3);
insert into Contem(Id_Pratos, Id_Pedido) values (6, 3);
insert into Contem(Id_Pratos, Id_Pedido) values (7, 3);
insert into Contem(Id_Pratos, Id_Pedido) values (10, 4);--sem salada
insert into Contem(Id_Pratos, Id_Pedido) values (2, 4);
insert into Contem(Id_Pratos, Id_Pedido) values (10, 4);--sem salada
insert into Contem(Id_Pratos, Id_Pedido) values (1, 5);
insert into Contem(Id_Pratos, Id_Pedido) values (2, 6);
insert into Contem(Id_Pratos, Id_Pedido) values (3, 6);
insert into Contem(Id_Pratos, Id_Pedido) values (4, 7);
insert into Contem(Id_Pratos, Id_Pedido) values (8, 8);--sem sal
insert into Contem(Id_Pratos, Id_Pedido) values (8, 8);--sem sal
insert into Contem(Id_Pratos, Id_Pedido) values (9, 9);--sem sal
insert into Contem(Id_Pratos, Id_Pedido) values (5, 9);
insert into Contem(Id_Pratos, Id_Pedido) values (10, 10);--sem salada


insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Quiche de queijo', 'Arroz de alho e óleo', 'Legumes à lolla');
insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Isca de picanha de sol', 'Arroz de alho e óleo', 'Massa ao sugo');
insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Frango ao molho bachamel', 'Batata doce com ervas', 'Farofa de cuscuz com bacon');
insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Linguiça artesanal de carneiro', 'Batata doce com ervas', 'Purê de jerimum');
insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Panang de frango', 'Spaghetti ao pesto', 'Farofa de côco');
insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Hamburguer artesanal', 'Spaghetti ao pesto', 'Legumes grelhados');
insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Ragú de linguiça', 'Salada de macarrão', 'Farofa de cebola caramelizada');
insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Soja ao molho rústico de tomate', 'Salada de macarrão', 'Pão de alho');
insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Pernil de carneiro', 'Arroz cremoso', 'Legumes grelhados');
insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Linguiça artesanal de chaque com queijo', 'Arroz cremoso', 'Ratatouille');

insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Frago com calabresa', 'Legumes', 'Spaghetti ao Sugo');
insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Torta mista', 'Salada de papaya', 'Legumes');
insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Quiche lorraine', 'Creme de legumes', 'Arroz integral');
insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Frango ao molho laranja', 'Batata doce sautée', 'Arroz integral');
insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Frango ao curry', 'Spaghetti alho e óleo', 'Farofa de côco');
insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Papillote de soja em cama de palito de legumes e ervas', 'Spaghtti alho e óleo', 'Legumes sautée');
insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Carne moída', 'Farofa de cebola caramelizada', 'Arroz branco');
insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Frango de forno', 'Salada de macarrão', 'Arroz branco');
insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Filé mignom suíno', 'Arroz cremoso', 'Legumes grelhados');
insert into Guarnicao (Id_Guanicao, Proteina, Guarnicao1, Guarnicao2)
values (default, 'Strudel de frango e legumes', 'Arroz cremoso', 'Abacaxi grelhado com pesto de hortelã');


--o prato só pode ter um objeto guarnição
--o cliente vai escolher quais opções no cardápio e guardar no objeto guarnição
--id pratos 8,9 é sem sal e 10 sem salada
insert into Possui(Id_Pratos, Id_Guanicao) values (1,1);
insert into Possui(Id_Pratos, Id_Guanicao) values (1,1);



insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Sal', '2 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Açucar', '5 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Arroz', '15 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Macarrão', '15 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Macaxeira', '10 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Jerimum', '5 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Farofa', '8 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Cebola', '5 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Batata doce', '5 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Legumes gerais', '2 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Feijão verde', '2 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Queijo', '2 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Temperos gerais', '2 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Alho', '2 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Ovo', '2 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Pernil carneiro', '2 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Soja', '2 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Linguiça artesanal charque queijo', '2 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Linguiça artesanal carneiro', '2 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Carne para hamburguer', '2 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'File mignom', '2 kg de sal');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Picanha de sol', '2 kg de sal');



insert into Tem(Id_Ingrediente, Id_Guarnicao, Qtde_Porcao, Tipo_Medida) values ();


insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Sal', '2 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Açucar', '5 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Arroz', '15 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Macarrão', '15 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Macaxeira', '10 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Jerimum', '5 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Farofa', '2 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Cebola', '2 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Batata doce', '2 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Legumes gerais', '2 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Feijão verde', '2 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Queijo', '2 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Temperos gerais', '2 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Alho', '2 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Ovo', '2 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Pernil carneiro', '2 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Soja', '2 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Linguiça artesanal charque queijo', '2 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Linguiça artesanal carneiro', '2 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Carne para hamburguer', '2 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'File mignom', '2 kg de sal');
insert into Registro(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente) values (default, 'Picanha de sol', '2 kg de sal');


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





insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (default, 1.50, 'Sal');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (default, 24.00, 'Galinha');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (default, 8.50, 'Temperos variados');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (default, 52.50, 'Carne magra');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (default, 10.70, 'Arroz');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (default, 22.30, 'Feijão');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (default, 17.20, 'Macarrão');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (default, 22.00, 'Peixe');
insert into Ingredientes(Id_Ingrediente, Valor, Nome) values (default, 5.00, 'Farinha');

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


--Mostra quais pratos possuem galinha como ingrediente
--A relação está obrigando as duas tabelas op1 e op2 terem galinha quando o id ingrediente for 2, por causa da relação da tabela 'tem'
select *
from tem t
join ingredientes ing on t.Id_Ingrediente = ing.Id_Ingrediente
join pratos pra on t.Id_Pratos = pra.Id_Pratos
join opcao1 op1 on op1.Id_Pratos = pra.Id_Pratos
join opcao2 op2 on op2.Id_Pratos = pra.Id_Pratos
where op2.Proteina = '%Galinha%' --ing.Id_Ingrediente = 2 --ing.nome = 'Galinha'
