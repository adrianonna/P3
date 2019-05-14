db.pedido.insertMany([
{
    dataHora: new Date("2018-09-21T09:23:10Z"),
    endereco:{
        bairro: "Jaguaribe",
        rua: "Avenida Primeiro de Maio",
        numero: 1251
        },
    cliente: {
        nome: "Adriano",
        telefone: ["83987809422", "32351955"]
        },
    prato: {
        tipo: "Unico",
        proteina: {
            nomeProteina: "Quiche de queijo",
            qtdeProteina: 300
                    },
        guarnicao: [
        {
            descricao: "Arroz de alho e óleo",
            qtdeGuarnicao: 120
        },
        {
            descricao: "Legumes à lolla",
            qtdeGuarnicao: 180
        }]
    }     
},
{
    valorEntrega: 12.0,
    dataHora: new Date("2018-09-21T10:23:10Z"),
    endereco:{
        bairro: "Bancarios",
        rua: "Rua Doutor Ant�nio Palitot",
        numero: 160
        },
    cliente: {
        nome: "Renata",
        telefone: ["83987564922", "32563755"]
        },
    prato: {
        tipo: "Personalizado",
        restricao: ["pouco sal", "sem verduras"],
        proteina: {
            nomeProteina: "Isca de picanha de sol",
            qtdeProteina: 250
        },
        guarnicao: [
        {
            descricao: "Batata doce com ervas",
            qtdeGuarnicao: 150
        },
        {
            descricao: "Spaghetti ao pesto",
            qtdeGuarnicao: 150
        }]
    }    
},
{
    valorEntrega: 10.0,
    dataHora: new Date("2018-09-22T10:01:10Z"),
    endereco:{
        bairro: "Tambauzinho",
        rua: "Avenida Epitácio Pessoa",
        numero: 1571
        },
    cliente: {
        nome: "Fabricio",
        telefone: ["83987045216", "32352148"]
        },
    prato: {
        tipo: "Unico",
        proteina: {
            nomeProteina: "Frango ao molho bechamel",
            qtdeProteina: 200
                    },
        guarnicao: [
        {
            descricao: "Massa ao sugo",
            qtdeGuarnicao: 150
        },
        {
            descricao: "Legumes à lolla",
            qtdeGuarnicao: 150
        }]
    }     
},
{
    valorEntrega: 15.0,
    dataHora: new Date("2018-09-23T10:11:10Z"),
    endereco:{
        bairro: "Cabo Branco",
        rua: "Avenida Cabo Branco",
        numero: 51
        },
    cliente: {
        nome: "Will",
        telefone: ["83987568542", "32587421"]
        },
    prato: {
        tipo: "Unico",
        restricao: ["sem verduras"],
        proteina: {
            nomeProteina: "Linguiça artesanal de carneiro",
            qtdeProteina: 250
        },
        guarnicao: [
        {
            descricao: "Batata doce com ervas",
            qtdeGuarnicao: 170
        },
        {
            descricao: "Spaghetti ao pesto",
            qtdeGuarnicao: 130
        }]
    }    
},
{
    valorEntrega: 12.0,
    dataHora: new Date("2018-09-24T09:23:10Z"),
    endereco:{
        bairro: "Manaira",
        rua: "Avenida Edson Ramalho",
        numero: 176
        },
    cliente: {
        nome: "Esmeralda",
        telefone: ["83987856147", "32365218"]
        },
    prato: {
        tipo: "Unico",
        proteina: {
            nomeProteina: "Panang de frango",
            qtdeProteina: 280
                    },
        guarnicao: [
        {
            descricao: "Purê de jerimum",
            qtdeGuarnicao: 120
        },
        {
            descricao: "Legumes grelhados",
            qtdeGuarnicao: 180
        }]
    }     
},
{
    valorEntrega: 5.0,
    dataHora: new Date("2018-09-24T10:15:10Z"),
    endereco:{
        bairro: "Centro",
        rua: "Rua Duque de Caxias",
        numero: 754
        },
    cliente: {
        nome: "Talita",
        telefone: ["83986325984", "32854136"]
        },
    prato: {
        tipo: "Personalizado",
        proteina: {
            nomeProteina: "Hamburguer artesanal",
            qtdeProteina: 300
        },
        guarnicao: [
        {
            descricao: "Legumes grelhados",
            qtdeGuarnicao: 150
        },
        {
            descricao: "Arroz cremoso",
            qtdeGuarnicao: 150
        }]
    }    
},
{
    valorEntrega: 18.0,
    dataHora: new Date("2018-09-25T09:00:10Z"),
    endereco:{
        bairro: "Mangabeira",
        rua: "Rua Josefa Taveira",
        numero: 348
        },
    cliente: {
        nome: "Francisco",
        telefone: ["83987265874", "32352364"]
        },
    prato: {
        tipo: "Unico",
        proteina: {
            nomeProteina: "Ragú de linguiça",
            qtdeProteina: 300
                    },
        guarnicao: [
        {
            descricao: "Arroz de alho e óleo",
            qtdeGuarnicao: 150
        },
        {
            descricao: "Legumes à lolla",
            qtdeGuarnicao: 150
        }]
    }     
},
{
    valorEntrega: 5.0,
    dataHora: new Date("2018-09-26T09:23:10Z"),
    endereco:{
        bairro: "Centro",
        rua: "Rua Maciel Pinheiro",
        numero: 127
        },
    cliente: {
        nome: "Marcia",
        telefone: ["83987956321", "32854136"]
        },
    prato: {
        tipo: "Unico",
        proteina: {
            nomeProteina: "Soja ao molho rústico de tomate",
            qtdeProteina: 300
        },
        guarnicao: [
        {
            descricao: "Farofa de côco",
            qtdeGuarnicao: 170
        },
        {
            descricao: "Ratatouille",
            qtdeGuarnicao: 180
        }]
    }    
},
{
    valorEntrega: 5.0,
    dataHora: new Date("2018-12-21T10:23:10Z"),
    endereco:{
        bairro: "Centro",
        rua: "Rua Monsenhor Walfredo Leal",
        numero: 941
        },
    cliente: {
        nome: "Paulo",
        telefone: ["83987895148", "32396327"]
        },
    prato: {
        tipo: "Unico",
        proteina: {
            nomeProteina: "Pernil de carneiro",
            qtdeProteina: 250
                    },
        guarnicao: [
        {
            descricao: "Farofa de cebola caramelizada",
            qtdeGuarnicao: 160
        },
        {
            descricao: "Salada de macarrão",
            qtdeGuarnicao: 190
        }]
    }     
},
{
    dataHora: new Date("2018-12-21T09:20:10Z"),
    endereco:{
        bairro: "Jaguaribe",
        rua: "Avenida João Machado",
        numero: 842
        },
    cliente: {
        nome: "Taysa",
        telefone: ["83987426589", "32236589"]
        },
    prato: {
        tipo: "Personalizado",
        proteina: {
            nomeProteina: "Lingui�a artesanal de chaque com queijo",
            qtdeProteina: 300
        },
        guarnicao: [
        {
            descricao: "Arroz cremoso",
            qtdeGuarnicao: 180
        },
        {
            descricao: "Farofa de c�co",
            qtdeGuarnicao: 170
        }]
    }    
},
{
    valorEntrega: 8.0,
    dataHora: new Date("2019-01-21T09:11:10Z"),
    endereco:{
        bairro: "Torre",
        rua: "Rua Quintino Bocaiúva",
        numero: 214
        },
    cliente: {
        nome: "Walberto",
        telefone: ["83978536942", "32856324"]
        },
    prato: {
        tipo: "Unico",
        proteina: {
            nomeProteina: "Panang de frango",
            qtdeProteina: 300
                    },
        guarnicao: [
        {
            descricao: "Batata doce com ervas",
            qtdeGuarnicao: 180
        },
        {
            descricao: "Spaghetti ao pesto",
            qtdeGuarnicao: 170
        }]
    }     
},
{
    valorEntrega: 10.0,
    dataHora: new Date("2019-01-22T10:01:10Z"),
    endereco:{
        bairro: "Miramar",
        rua: "Rua Tito Silva",
        numero: 146
        },
    cliente: {
        nome: "Lucas",
        telefone: ["83987963254", "32563987"]
        },
    prato: {
        tipo: "Personalizado",
        restricao: ["pouco sal"],
        proteina: {
            nomeProteina: "Isca de picanha de sol",
            qtdeProteina: 280
        },
        guarnicao: [
        {
            descricao: "Farofa de cuscuz com bacon",
            qtdeGuarnicao: 180
        },
        {
            descricao: "Spaghetti ao pesto",
            qtdeGuarnicao: 170
        }]
    }    
},
{
    valorEntrega: 5.0,
    dataHora: new Date("2019-01-22T09:20:10Z"),
    endereco:{
        bairro: "Centro",
        rua: "Rua Treze de Maio",
        numero: 741
        },
    cliente: {
        nome: "Samuel",
        telefone: ["83989635248", "32358742"]
        },
    prato: {
        tipo: "Unico",
        proteina: {
            nomeProteina: "Pernil de carneiro",
            qtdeProteina: 280
                    },
        guarnicao: [
        {
            descricao: "Pão de alho",
            qtdeGuarnicao: 150
        },
        {
            descricao: "Batata doce com ervas",
            qtdeGuarnicao: 180
        }]
    }     
},
{
    valorEntrega: 5.0,
    dataHora: new Date("2019-02-10T09:13:10Z"),
    endereco:{
        bairro: "Centro",
        rua: "Rua da Areia",
        numero: 369
        },
    cliente: {
        nome: "Erick",
        telefone: ["83988625498", "32563527"]
        },
    prato: {
        tipo: "Personalizado",
        proteina: {
            nomeProteina: "Hamburguer artesanal",
            qtdeProteina: 300
        },
        guarnicao: [
        {
            descricao: "Salada de macarrão",
            qtdeGuarnicao: 180
        },
        {
            descricao: "Legumes grelhados",
            qtdeGuarnicao: 170
        }]
    }    
},
{
    valorEntrega: 8.0,
    dataHora: new Date("2019-01-10T10:01:10Z"),
    endereco:{
        bairro: "Torre",
        rua: "Avenida Beira Rio",
        numero: 8421
        },
    cliente: {
        nome: "Adriano",
        telefone: ["83989565487", "32556324"]
        },
    prato: {
        tipo: "Personalizado",
        proteina: {
            nomeProteina: "Frango ao molho bechamel",
            qtdeProteina: 300
        },
        guarnicao: [
        {
            descricao: "Farofa de coco",
            qtdeGuarnicao: 180
        },
        {
            descricao: "Spaghetti ao pesto",
            qtdeGuarnicao: 170
        }]
    }    
}
])


db.pedido.remove({})



//---------------------------INDICES
//cria indices para data
db.pedido.createIndex({dataHora: 1})

//cria indices para os valores de entre
db.pedido.createIndex({valorEntrega: 1})



//---------------------------INSER��O
//insere um documento
db.pedido.insertOne({
    dataHora: new Date("2019-01-19T9:05:10Z"),
    endereco:{
        bairro: "Jaguaribe",
        rua: "Avenida Primeiro de Maio",
        numero: 842
        },
    cliente: {
        nome: "Taysa",
        telefone: ["83987426589", "32236589"]
        },
    prato: {
        tipo: "Personalizado",
        proteina: {
            nomeProteina: "Frango ao molho bechamel",
            qtdeProteina: 300
        },
        guarnicao: [
        {
            descricao: "Farofa de coco",
            qtdeGuarnicao: 180
        },
        {
            descricao: "Spaghetti ao pesto",
            qtdeGuarnicao: 170
        }]
    }
})



//---------------------------UPDATE
//altera o endereço da cliente Renata
db.pedido.update({"cliente.nome": "Renata"},
    {$set:
        {"endereco.bairro": "Torre",
         "endereco.rua": "Rua Sao Gon�alo",
         "endereco.numero": 190}})


//altera taxa de entrega para o bairro da torre
db.pedido.updateMany({"endereco.bairro": "Torre"},
    {$set:
        {"valorEntrega": 5.0}})



//---------------------------REMO��O
//remove bairro Mangabeira
db.pedido.remove({"endereco.bairro": "Mangabeira"})



//---------------------------COLE��O INTEIRA
db.pedido.find({})



//---------------------------CONTAGEM DE DOCUMENTOS
db.pedido.count()



//---------------------------CONSULTAS
//---------------------------CONSULTA SEM PROJE��O
//Localiza os documentos que contenham o telefone informado
db.pedido.find(
    {"cliente.telefone":{$in:["83987426589"]}})

//Localiza os pratos do tipo personalizados do ano de 2018
db.pedido.find(
    {"dataHora":{$gte:new Date(2018)}, "prato.tipo": "Personalizado"})

//Localiza os documentos que o bairro seja Torre e Centro
db.pedido.find(
    {"endereco.bairro":{$in:["Torre", "Centro"]}})



//---------------------------CONSULTA COM PROJE��O
//mostra os bairros que tem valor de entrega maior ou igual a 10
db.pedido.find(
    {valorEntrega:{$gte:10}},
    {_id:0, "endereco.bairro": 1, "endereco.rua": 1})

//mostra o bairro e rua do pedido do cliente Adriano
db.pedido.find(
    {"cliente.nome":"Adriano"},
    {_id:0, "endereco.bairro": 1, "endereco.rua": 1})

//mostra os clientes que fizeram o pedido em 2018
db.pedido.find(
    {"dataHora":{$gte:new Date(2018)}},
    {_id:0, "cliente.nome": 1})



//---------------------------CONSULTA COM FILTRO, PROJE��O E REGEX
//mostra todas as proteinas que o valor da entrega foi maior que 5
db.pedido.find(
        {"prato.proteina.nomeProteina": /([A-Za-z]+)/, valorEntrega: {$gt: 5} },{_id:0, "prato.proteina.nomeProteina":1, "valorEntrega":1})



//---------------------------CONSULTA ARRAY DE ELEMENTOS
//mostra todos os clientes e bairros do telefone informado
db.pedido.find(
    {"cliente.telefone.0": "83987426589"},
        {_id:0, "cliente.nome":1, "endereco.bairro":1})



//---------------------------CONSULTA ESTRUTURA EMBUTIDA
//mostra os clientes e proteinas dos pratos tipo unico
db.pedido.find(
    {"prato.tipo": "Unico"},
    {"cliente.nome": 1, _id: 0, "prato.proteina.nomeProteina":1})



//---------------------------CONSULTA COM AGREGA��O
//mostra o somatorio dos valores de entrega
db.pedido.aggregate([{$group: {_id:null, soma:{$sum: "$valorEntrega"}}}])



//---------------------------CONSULTA COM DISTINCT OU LIMIT
//mostra os documentos com limite de 4, do mes de setembro de 2018
db.pedido.find(
        {dataHora: {$gte:new Date(2018,01,09), $lte:new Date (2018,30,09)}}).limit(4)



//---------------------------CONSULTA LIVRE
//consulta para verificar qual o total do valor pago de entrega de terminado cliente para proporcionar uma entrega gratis
db.pedido.aggregate([
            { $match: { "cliente.nome": "Fabricio" } },
            {$group: {_id: null, soma:{$sum: "$valorEntrega"}}}
        ])
    