create table Cliente(
Id_Cliente serial primary key,
Nome varchar(70) not null,
telefone1 varchar(11) not null,
telefone2 varchar(11),
Tipo varchar(2),
CPF varchar(11) null,
CNPJ varchar(14) null,
constraint ak_cpf unique(CPF),
constraint ak_cnpj unique(CNPJ),
constraint ck_tipo check (upper(tipo) in ('F', 'J' , 'FJ', 'JF'))
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
--Id_Pagamento tbm seria um chave estrangeira? visto que cada pedido só terá apenas um pagamento.
constraint fk_Id_Cliente foreign key (Id_Cliente) references Cliente,
constraint fk_Id_Pagamento foreign key (Id_Pagamento) references Pagamento,
constraint fk_Id_Entregador foreign key (Id_Entregador) references Entregador
);

create table Proteina(
Id_Proteina serial primary key,
Nome_Proteina varchar(60)
);

create table Prato(
Id_Prato serial primary key,
Id_Proteina smallint,
Restricao varchar(40) default 'Sem restrição',
Tipo varchar(1), --Unico/Personalizado
--Nome_Prato varchar(70),
constraint fk_Id_Proteina foreign key (Id_Proteina) references Proteina
);

create table Contem(
Id_Prato smallint,
Id_Pedido smallint,
primary key (Id_Prato, Id_Pedido),
constraint fk_Id_Prato_Contem foreign key (Id_Prato) references Prato,
constraint fk_Id_Pedido_Contem foreign key (Id_Pedido) references Pedido
);

create table Guarnicao(
Id_Guarnicao serial primary key,
Nome_Guarnicao varchar(60)
);

create table PossuiGuarnicao(
Id_Prato smallint,
Id_Guarnicao smallint,
primary key (Id_Prato, Id_Guarnicao),
constraint fk_Id_Prato_Possui foreign key (Id_Prato) references Prato,
constraint fk_Id_Guarnicao_Possui foreign key (Id_Guarnicao) references Guarnicao
);

create table Ingrediente(
Id_Ingrediente serial primary key,
Nome_Ingrediente varchar(40) not null,
Qtde_Ingrediente integer, --quantidade em estoque
Medida_Ingrediente varchar(2)
);

--aquela guarnição contem um ou varios ingredientes
--do contrário, pode ter ingrediente que não é usado
create table TemGuarnicao(
Id_Guarnicao smallint,
Id_Ingrediente smallint,
Qtde_Guarnicao smallint, --quantidade daquele ingrediente naquela guarnição
Medida_Guarnicao varchar(2),
primary key (Id_Guarnicao, Id_Ingrediente),
constraint fk_Id_Ingrediente_TemGuarnicao foreign key (Id_Ingrediente) references Ingrediente,
constraint fk_Id_Guarnicao_TemGuarnicao foreign key (Id_Guarnicao) references Guarnicao
);

--aquela proteina contem um ou varios ingredientes
create table TemProteina(
Id_Proteina smallint,
Id_Ingrediente smallint,
Qtde_Proteina smallint, --quantidade daquele ingrediente naquela proteina
Medida_Proteina varchar(2),
primary key (Id_Proteina, Id_Ingrediente),
constraint fk_Id_Proteina_TemProteina foreign key (Id_Proteina) references Proteina,
constraint fk_Id_Ingrediente_TemProteina foreign key (Id_Ingrediente) references Ingrediente
);



insert into Cliente(Id_Cliente, Nome, telefone1, tipo, CPF)
values (default, 'Adriano', '83996547164', 'F', '01136425470');
insert into Cliente(Id_Cliente, Nome, telefone1, tipo, CPF)
values (default, 'Renata', '83987809422', 'F', '87463728194');
insert into Cliente(Id_Cliente, Nome, telefone1, tipo, CPF)
values (default, 'Samuel', '83987542415', 'F', '76453898752');
insert into Cliente(Id_Cliente, Nome, telefone1, tipo, CPF)
values (default, 'Janainna', '83996854125', 'f', '87645362718');
insert into Cliente(Id_Cliente, Nome, telefone1, telefone2, tipo, CPF)
values (default, 'Pablo', '83999342648', '8332352137', 'F', '47769876532');
insert into Cliente(Id_Cliente, Nome, telefone1, tipo, CPF, CNPJ)
values (default, 'Felipe', '8332351955', 'FJ', '10956329875', '69325741651000');
insert into Cliente(Id_Cliente, Nome, telefone1, tipo, CNPJ)
values (default, 'IFPB', '83987452654', 'J', '65946371851000');



insert into Entregador(CNH, Nome, Id_Entregador) values ('736483727245', 'Rafael', default);
insert into Entregador(CNH, Nome, Id_Entregador) values ('765498720194', 'Pedro', default);

--para cada pedido tem um e somente um pagamento
--para cada pagamento posso ter um ou mais pedidos
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Dinheiro', '01/01/2019', 13.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Cartão Débito', '01/01/2019', 26.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Dinheiro', '02/01/2019', 52.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Cartão Crédito', '02/01/2019', 39.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Dinheiro', '02/01/2019', 13.00);--5
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Dinheiro', '03/01/2019', 26.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Dinheiro', '03/01/2019', 13.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Cartão Débito', '04/01/2019', 26.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Cartão Crédito', '05/01/2019', 26.00);
insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Dinheiro', '05/01/2019', 13.00);--10


--O cliente pode realizar mais de um pedido.
--O pedido está relacionado a apenas um pagamento, ou seja, cada objeto pedido tem que está relacionado um objeto pagamento diferente.
--pois vai está relacionado ao cliente, caso ele tenha feito mais de um pedido
--Adriano
insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 5, 'Avenida Primeiro de Maio', 1251, '09:05', '01/01/2019', 1, 1, 1);
--Renata
insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 10, 'Rua Doutor Antônio Palitot', 160, '10:15', '01/01/2019', 2, 2, 1);
insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 5, 'Avenida Epitácio Pessoa', 1571, '10:05', '02/01/2019', 3, 2, 1);
--Samuel
insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 10, 'Avenida Cabo Branco', 51, '10:30', '02/01/2019', 4, 3, 1);
--Janainna
insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 10, 'Avenida Edson Ramalho', 176, '10:02', '02/01/2019', 5, 4, 2);
insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 5, 'Rua Duque de Caxias', 754, '9:40', '03/01/2019', 6, 4, 2);
insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 5, 'Rua Josefa Taveira', 348, '10:30', '03/01/2019', 7, 4, 2);
--Pablo
insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 5, 'Rua Maciel Pinheiro', 127, '09:52', '04/01/2019', 8, 5, 2);
--Felipe
insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 5, 'Rua Monsenhor Walfredo Leal', '941', '8:30', '05/01/2019', 9, 6, 2);
--IFPB
insert into Pedido(Id_Pedido, Valor_Entrega, Rua, Numero, Hora_Pedido, Data_Pedido, Id_Pagamento, Id_Cliente, Id_Entregador)
values (default, 5, 'Avenida João Machado', 5412, '9:56', '05/01/2019', 10, 7, 1);



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


insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Sal', 2000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Açucar', 5000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Arroz', 15000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Macarrão', 15000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Macaxeira', 10000, 'g');--5
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Jerimum', 5000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Farofa', 8000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Cebola', 5000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Batata doce', 5000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Legumes gerais', 5000, 'g');--10
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Feijão verde', 8000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Queijo', 5000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Temperos gerais', 5000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Alho', 2000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Ovo', 60, 'u');--15
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Creme de leite', 4000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Pernil carneiro', 10000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Soja', 15000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Linguiça artesanal charque queijo', 8000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Linguiça artesanal carneiro', 8000, 'g');--20
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Carne para hamburguer', 10000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'File mignom', 15000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Picanha de sol', 10000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Frango', 20000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Manteiga', 20000, 'g');--25
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Leite', 20000, 'ml');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Leite de coco', 15000, 'ml');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Pimenta', 8000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Óleo', 20000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Linguiça', 15000, 'g');--30
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Soja', 15000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Verduras gerais', 10000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Tomate', 8000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Bacon', 15000, 'g');
insert into Ingrediente(Id_Ingrediente, Nome_Ingrediente, Qtde_Ingrediente, Medida_Ingrediente) values (default, 'Pão', 5000, 'g');--35


insert into Proteina(Id_Proteina, Nome_Proteina) values(default, 'Quiche de queijo');
insert into Proteina(Id_Proteina, Nome_Proteina) values(default, 'Isca de picanha de sol');
insert into Proteina(Id_Proteina, Nome_Proteina) values(default, 'Frango ao molho bechamel');
insert into Proteina(Id_Proteina, Nome_Proteina) values(default, 'Linguiça artesanal de carneiro');
insert into Proteina(Id_Proteina, Nome_Proteina) values(default, 'Panang de frango');--5
insert into Proteina(Id_Proteina, Nome_Proteina) values(default, 'Hamburguer artesanal');
insert into Proteina(Id_Proteina, Nome_Proteina) values(default, 'Ragú de linguiça');
insert into Proteina(Id_Proteina, Nome_Proteina) values(default, 'Soja ao molho rústico de tomate');
insert into Proteina(Id_Proteina, Nome_Proteina) values(default, 'Pernil de carneiro');
insert into Proteina(Id_Proteina, Nome_Proteina) values(default, 'Linguiça artesanal de chaque com queijo');--10


insert into Guarnicao (Id_Guarnicao, Nome_Guarnicao) values (default, 'Arroz de alho e óleo');
insert into Guarnicao (Id_Guarnicao, Nome_Guarnicao) values (default, 'Legumes à lolla');
insert into Guarnicao (Id_Guarnicao, Nome_Guarnicao) values (default, 'Massa ao sugo');
insert into Guarnicao (Id_Guarnicao, Nome_Guarnicao) values (default, 'Batata doce com ervas');
insert into Guarnicao (Id_Guarnicao, Nome_Guarnicao) values (default, 'Farofa de cuscuz com bacon');--5
insert into Guarnicao (Id_Guarnicao, Nome_Guarnicao) values (default, 'Purê de jerimum');
insert into Guarnicao (Id_Guarnicao, Nome_Guarnicao) values (default, 'Spaghetti ao pesto');
insert into Guarnicao (Id_Guarnicao, Nome_Guarnicao) values (default, 'Farofa de côco');
insert into Guarnicao (Id_Guarnicao, Nome_Guarnicao) values (default, 'Legumes grelhados');
insert into Guarnicao (Id_Guarnicao, Nome_Guarnicao) values (default, 'Salada de macarrão');--10
insert into Guarnicao (Id_Guarnicao, Nome_Guarnicao) values (default, 'Farofa de cebola caramelizada');
insert into Guarnicao (Id_Guarnicao, Nome_Guarnicao) values (default, 'Pão de alho');
insert into Guarnicao (Id_Guarnicao, Nome_Guarnicao) values (default, 'Arroz cremoso');
insert into Guarnicao (Id_Guarnicao, Nome_Guarnicao) values (default, 'Ratatouille');


--Ingredientes em Arroz de alho e óleo
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (1, 3, 90, 'g');--arroz
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (1, 14, 20, 'g');--alho
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (1, 29, 15, 'ml');--óleo
--Ingredientes em Legumes à lolla
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (2, 10, 150, 'g');--legumes
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (2, 13, 30, 'g');--temperos
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (2, 32, 50, 'g');--verduras
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (2, 25, 30, 'g');--manteiga
--Ingredientes em Massa ao sugo
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (3, 4, 150, 'g');--Macarrao
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (3, 1, 2, 'g');--sal
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (3, 33, 70, 'g');--tomate
--Ingredientes em Batata doce com ervas
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (4, 9, 150, 'g');--batata doce
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (4, 13, 50, 'g');--temperos
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (4, 10, 50, 'g');--legumes
--Ingredientes em Farofa de cuscuz com bacon
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (5, 7, 150, 'g');--farofa
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (5, 34, 80, 'g');--bacon
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (5, 8, 50, 'g');--cebola
--Ingredientes em Purê de jerimum
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (6, 6, 150, 'g');--jerimum
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (6, 25, 40, 'g');--manteiga
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (6, 26, 80, 'ml');--leite
--Ingredientes em Spaghetti ao pesto
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (7, 4, 150, 'g');--macarrão
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (7, 14, 15, 'g');--alho
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (7, 29, 20, 'ml');--oleo
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (7, 1, 2, 'g');--sal
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (7, 12, 80, 'g');--queijo
--Ingredientes em Farofa de côco
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (8, 7, 150, 'g');--farofa
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (8, 1, 2, 'g');--sal
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (8, 13, 40, 'g');--temperos
--Ingredientes em Legumes grelhados
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (9, 10, 150, 'g');--legumes
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (9, 13, 30, 'g');--temperos
--Ingredientes em Salada de macarrão
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (10, 4, 150, 'g');--macarrão
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (10, 10, 80, 'g');--legumes
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (10, 29, 20, 'ml');--óleo
--Ingredientes em Farofa de cebola caramelizada
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (11, 7, 100, 'g');--farofa
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (11, 8, 80, 'g');--cebola
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (11, 2, 50, 'g');--açucar
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (11, 25, 40, 'g');--manteiga
--Ingredientes em Pão de alho
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (12, 14, 30, 'g');--alho
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (12, 26, 80, 'ml');--leite
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (12, 13, 30, 'g');--temperos
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (12, 1, 3, 'g');--sal
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (12, 35, 150, 'g');--pão
--Ingredientes em Arroz cremoso
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (13, 2, 150, 'g');--arroz
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (13, 16, 80, 'g');--creme de leite
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (13, 13, 30, 'g');--temperos
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (13, 25, 20, 'g');--manteiga
--Ingredientes em Ratatouille
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (14, 10, 50, 'g');--legumes
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (14, 32, 50, 'g');--verduras
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (14, 8, 50, 'g');--cebola
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (14, 1, 2, 'g');--sal
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (14, 14, 4, 'g');--alho
insert into TemGuarnicao(Id_Guarnicao, Id_Ingrediente, Qtde_Guarnicao, Medida_Guarnicao) values (14, 33, 50, 'g');--tomate


--Ingredientes em quiche de queijo
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (1, 15, 3, 'u');--ovo
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (1, 16, 300, 'ml');--creme de leite
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (1, 12, 200, 'g');--queijo
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (1, 1, 1, 'g');--sal
--Ingredientes em isca de picanha de sol
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (2, 23, 200, 'g');--picanha de sol
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (2, 14, 2, 'g');--alho
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (2, 8, 80, 'g');--cebola
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (2, 13, 20, 'g');--temperos
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (2, 1, 1, 'g');--sal
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (2, 25, 10, 'g');--manteiga
--Ingredientes em Frango ao molho bechamel
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (3, 24, 250, 'g');--frango
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (3, 2, 10, 'g');--açucar
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (3, 7, 150, 'g');--farofa
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (3, 25, 10, 'g');--manteiga
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (3, 26, 100, 'ml');--leite
--Ingredientes em Linguiça artesanal de carneiro
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (4, 20, 200, 'g');--linguiça carneiro
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (4, 13, 20, 'g');--temperos
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (4, 25, 10, 'g');--manteiga
--Ingredientes em Panang de frango
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (5, 24, 250, 'g');--frango
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (5, 2, 5, 'g');--açucar
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (5, 1, 1, 'g');--sal
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (5, 28, 8, 'g');--pimenta
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (5, 29, 15, 'ml');--óleo
--Ingredientes em Hamburguer artesanal
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (6, 21, 250, 'g');--carne hamburguer
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (6, 13, 15, 'g');--temperos
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (6, 12, 40, 'g');--queijo
--Ingredientes em Ragú de linguiça
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (7, 14, 10, 'g');--alho
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (7, 29, 20, 'ml');--óleo
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (7, 30, 250, 'g');--linguiça
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (7, 2, 10, 'g');--açucar
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (7, 10, 50, 'g');--legumes
--Ingredientes em Soja ao molho rústico de tomate
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (8, 31, 250, 'g');--soja
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (8, 32, 50, 'g');--verduras
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (8, 1, 2, 'g');--sal
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (8, 29, 10, 'ml');--óleo
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (8, 14, 5, 'g');--alho
--Ingredientes em Pernil de carneiro
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (9, 8, 80, 'g');--cebola
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (9, 14, 10, 'g');--alho
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (9, 1, 2, 'g');--sal
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (9, 13, 80, 'g');--temperos
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (9, 17, 200, 'g');--pernil
--Ingredientes em Linguiça artesanal de chaque com queijo
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (10, 19, 250, 'g');--linguiça charque queijo
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (10, 13, 20, 'g');--temperos
insert into TemProteina(Id_Proteina, Id_Ingrediente, Qtde_Proteina, Medida_Proteina) values (10, 25, 10, 'g');--manteiga


insert into Prato(Id_Prato, Id_Proteina, Restricao, Tipo) values (default, 1, default, 'U');
insert into Prato(Id_Prato, Id_Proteina, Restricao, Tipo) values (default, 2, default, 'P');
insert into Prato(Id_Prato, Id_Proteina, Restricao, Tipo) values (default, 3, default, 'U');
insert into Prato(Id_Prato, Id_Proteina, Restricao, Tipo) values (default, 4, default, 'P');
insert into Prato(Id_Prato, Id_Proteina, Restricao, Tipo) values (default, 5, default, 'P');
insert into Prato(Id_Prato, Id_Proteina, Restricao, Tipo) values (default, 6, default, 'U');
insert into Prato(Id_Prato, Id_Proteina, Restricao, Tipo) values (default, 7, default, 'U');
insert into Prato(Id_Prato, Id_Proteina, Restricao, Tipo) values (default, 8, 'Sem sal', 'P');--8
insert into Prato(Id_Prato, Id_Proteina, Restricao, Tipo) values (default, 9, 'Sem sal', 'P');--9
insert into Prato(Id_Prato, Id_Proteina, Restricao, Tipo) values (default, 10, 'Sem salada', 'U');--10


insert into Contem(Id_Prato, Id_Pedido) values (1, 1);
insert into Contem(Id_Prato, Id_Pedido) values (2, 2);
insert into Contem(Id_Prato, Id_Pedido) values (3, 2);
insert into Contem(Id_Prato, Id_Pedido) values (4, 3);
insert into Contem(Id_Prato, Id_Pedido) values (5, 3);
insert into Contem(Id_Prato, Id_Pedido) values (6, 3);
insert into Contem(Id_Prato, Id_Pedido) values (7, 3);
insert into Contem(Id_Prato, Id_Pedido) values (10, 4);--sem salada
insert into Contem(Id_Prato, Id_Pedido) values (2, 4);
insert into Contem(Id_Prato, Id_Pedido) values (10, 5);--sem salada
insert into Contem(Id_Prato, Id_Pedido) values (1, 5);
insert into Contem(Id_Prato, Id_Pedido) values (2, 6);
insert into Contem(Id_Prato, Id_Pedido) values (3, 6);
insert into Contem(Id_Prato, Id_Pedido) values (4, 7);
insert into Contem(Id_Prato, Id_Pedido) values (8, 8);--sem sal
insert into Contem(Id_Prato, Id_Pedido) values (8, 9);--sem sal
insert into Contem(Id_Prato, Id_Pedido) values (9, 9);--sem sal
insert into Contem(Id_Prato, Id_Pedido) values (5, 9);
insert into Contem(Id_Prato, Id_Pedido) values (10, 10);--sem salada


insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (1, 1);
insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (1, 2);
insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (2, 3);
insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (2, 4);
insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (3, 5);
insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (3, 1);
insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (4, 6);
insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (4, 2);
insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (5, 7);
insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (5, 3);
insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (6, 8);
insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (6, 4);
insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (7, 9);
insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (7, 10);
insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (8, 11);
insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (8, 12);
insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (9, 13);
insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (9, 14);
insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (10, 3);
insert into PossuiGuarnicao(Id_Prato, Id_Guarnicao) values (10, 5);



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


--mostra todos os clientes que pediram prato unico
select distinct(c.nome), pra.tipo
from cliente c join pedido ped
on ped.id_cliente = c.id_cliente
join contem con on con.id_pedido = ped.id_pedido
join prato pra on con.id_prato = pra.id_prato
where pra.tipo = 'U'


--mostra todas as guarnições e proteinas que possuem sal como ingredientes
select distinct(gua.Nome_Guarnicao), pro.Nome_Proteina
from prato pra join possuiguarnicao pgua on pgua.id_prato = pra.id_prato
join guarnicao gua on pgua.id_guarnicao = gua.id_guarnicao
join temguarnicao tgua on gua.id_guarnicao = tgua.id_guarnicao
join ingrediente ing on tgua.id_ingrediente = ing.id_ingrediente
join temproteina tpro on tpro.id_ingrediente = ing.id_ingrediente
join proteina pro on tpro.id_proteina = pro.id_proteina
where ing.Nome_Ingrediente = 'Sal'


--mostra clientes que realizaram pagamento no valor acima da média do total de pagamentos
select distinct(cli.nome) from cliente cli
join pedido ped on ped.id_cliente = cli.id_cliente
join pagamento pag on ped.id_pagamento = pag.id_pagamento
where pag.valor > (select avg(valor) from pagamento)


--criação da view para consulta os pedidos dos clientes
create view ConsultaPedido (NomeCliente, IdPedido, DataPedido, HoraPedido, RuaPedido, NumeroPedido, NomeProteina, NomeGuarnicao) as
select cli.nome, ped.id_pedido, ped.Data_Pedido, ped.Hora_pedido, ped.rua, ped.numero, pro.Nome_Proteina, gua.Nome_Guarnicao
from cliente cli join pedido ped on cli.id_cliente = ped.id_cliente
join contem con on con.id_pedido = ped.id_pedido
join prato pra on con.id_prato = pra.id_prato
join proteina pro on pro.id_proteina = pra.id_proteina
join possuiguarnicao pgua on pgua.id_prato = pra.id_prato
join guarnicao gua on pgua.id_guarnicao = gua.id_guarnicao

select * from ConsultaPedido

--criação da view para consultar os pagamentos dos clientes
create view ClientePagamento (NomeCliente, ValorPagamento, TipoPagamento) as
select cli.nome, pag.valor, pag.Tipo_Pagamento
from cliente cli join pedido ped on cli.id_cliente = ped.id_cliente
join pagamento pag on ped.id_pagamento = pag.id_pagamento

select * from ClientePagamento

--criação de view para inserção de clientes com cpf
--se não houber segundo telefone, deixar ''
create or replace view ClienteCPF (IdCliente, NomeCliente, Telefone1, Telefone2, Tipo, CPF) as
select id_cliente, nome, telefone1, telefone2, tipo, cpf, cnpj
from cliente


--dando privilégio para o usuário1 inserir na view ClienteCPF
grant insert on ClienteCPF to usuario1;


--inserção de dados da view(tbm insere na tabela cliente)
insert into ClienteCPF values (default, 'Danimes', '83987809422', '', 'F', '54789584954')


--consulta na view ClientePagamento do total pago pelo cliente
select sum(ValorPagamento)
from clientepagamento
where NomeCliente = 'Renata'


--criando index na coluna DataPedido da tabela Pedido
create index DataPedido on pedido(Data_Pedido);
create index ValorPagamento on pagamento(valor);
create index QtdeIngrediente on ingrediente(qtde_ingrediente);



--função para iserir quantidade de ingrediente em ingrediente
CREATE OR REPLACE FUNCTION AumentaIngrediente(qtde INTEGER, n VARCHAR(30))
RETURNS void
AS $$
declare res varchar(30);
BEGIN
select Nome_Ingrediente into strict res from ingrediente where Nome_Ingrediente = n;
update ingrediente set Qtde_Ingrediente = Qtde_Ingrediente + qtde where Nome_Ingrediente = n;
exception
when no_data_found then
raise notice 'Ingrediente não encontrado';
END;
$$ LANGUAGE'plpgsql';

select AumentaIngrediente(2000, 'Pão')

select * from ingrediente




--função para calcular o total dos valores dos pedidos
CREATE OR REPLACE FUNCTION TotalPagamento()
RETURNS integer
AS $$
declare res numeric;
BEGIN
select sum(valor) into strict res from pagamento;
return res;
END;
$$ LANGUAGE'plpgsql';

select TotalPagamento();



--função para dar desconto de 10% caso o pagamento seja a dinheiro
CREATE OR REPLACE FUNCTION DescontoDinheiro()
RETURNS trigger AS $$
BEGIN
update pagamento set valor = valor * 0.90 where Tipo_Pagamento = 'Dinheiro';
return null;
END;
$$ LANGUAGE'plpgsql';

--tringger para função de desconto
create trigger DescDin
after insert on pagamento
for each row execute procedure DescontoDinheiro();

insert into Pagamento(Id_Pagamento, Tipo_Pagamento, Data_Pagamento, Valor) values (default, 'Dinheiro', '25/01/2019', 100.00);

select * from pagamento



--função para diminuir a quantidade nos ingredientes
select pra.id_prato, gua.id_guarnicao, gua.Nome_guarnicao, tgua.Qtde_Guarnicao, ing.Nome_Ingrediente, ing.id_ingrediente
from prato pra
join possuiguarnicao pgua
on pra.id_prato = pgua.id_prato
join guarnicao gua
on pgua.id_guarnicao = gua.id_guarnicao
join temguarnicao tgua 
on gua.id_guarnicao = tgua.id_guarnicao
join Ingrediente ing
on ing.id_ingrediente = tgua.id_ingrediente


select pra.id_prato, pro.id_proteina, pro.Nome_proteina, tpro.Qtde_proteina, ing.Nome_Ingrediente, ing.id_ingrediente
from prato pra
join proteina pro
on pra.id_proteina = pro.id_proteina
join temproteina tpro
on tpro.id_proteina = pro.id_proteina
join ingrediente ing
on tpro.id_ingrediente = ing.id_ingrediente


select * from ingrediente


--trigger para inserir cliente 


