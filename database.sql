create database Wilah;
ALTER DATABASE wilah CHARSET = UTF8 COLLATE = utf8_general_ci;
use Wilah;

create table Funcionario
(
	id int auto_increment primary key,
    cpf varchar(11) unique,
    email varchar(256),
    senha varchar(64),
    nome varchar(256),
    telefone varchar(30)
);
insert into funcionario values (default,'12211111111','a','a','jorge','123123123123'),
(default,'88574001475','joana@yahoo.com','joana02','Joana Dias','995821410'),
(default,'74574001472','ana@yahoo.com','anaa2','Ana Almeida','988821415'),
(default,'91571201414','joao@gmail.com','joao_01','João Gustavo','991821412'),
(default,'00174001433','ivete@yahoo.com','ivete52','Ivete Gomes','995341422');


create table cliente(
	id_cliente int auto_increment primary key,
    cpf varchar(11) unique,
    email varchar(256),
    senha varchar(64),
    nome varchar(256),
	telefone varchar(30)
);
insert into cliente (cpf,email,senha,nome,telefone)values 
(00112596773,"fernanda@gmail.com","fernanda01","Fernanda dos Santos",999850222),
(00552591473,"cleber@gmail.com","cleber61","Cleber Gomes dos Santos",999410269),
(09912876722,"roberto@gmail.com","Roberto50","Roberto Goncalves Da Silva",997818235),
(00166596778,"caio@gmail.com","caio77","Caio da Silva",998450957),
(00322555774,"pedro@gmail.com","pedro16","Pedro Barbosa",998771001),
(00428855755,"gugupedrosa@gmail.com","gugu55","Gustavo Pedrosa",995550216),
(01122556494,"anna@gmail.com","anna10","Anna Silva Assis",993550201),
(01124956494,"clara@gmail.com","clara77","Clara Ramos",987850234),
(00472598979,"aline@gmail.com","aline88","Aline dos Santos",999851124),
(00472554120,"a","a","Nicole Ester",989430277);

create table distribuidora(
	id int auto_increment primary key,
    nome varchar(128) not null,
    telefone varchar(12) not null,
    endereco varchar(256) not null
);
insert into distribuidora (nome,telefone,endereco) values ("FATT",32339874,"Rua pedrosa ,N°255,Bairro Santa ceia"),
("UNIC",35330244,"Rua Ferreira ,N°05,Bairro Silveira"),
("THE LOT",39995412,"Rua Gui marques ,N°88,Bairro Almeida"),
("ROOR",35330288,"Rua Pedro Carvalho ,N°98,Bairro Aparecida"),
("ALI EATS",35226012,"Rua Marques ,N°74,Bairro Caitano"),
("99 EATS",39995412,"Rua Gui marques ,N°88,Bairro Almeida"),
("FOOD LIVE",35336474,"Rua Pedroza,N°1298,Bairro industrial"),
("You hunger",35661207,"Rua esmeralda ,N°741,Bairro Agostinho"),
("HEALTHY FOODS",35339912,"Rua Faladares ,N°02,Bairro Esmeralda"),
("Eats food",35337854,"Rua coleira ,N°36,Bairro Santa Maria");

create table produtos(
	id int auto_increment primary key,
    logo longblob,
    categoria varchar (30),
    descricao varchar(30),
    nome varchar(64),
    preco decimal(6,2),
    marca varchar (30),
    distribuidora int,
    foreign key (distribuidora) references distribuidora(id)
);


insert into produtos(categoria,nome,descricao,preco,distribuidora,marca) values("Alimento","Feijão","Carioca",10.25,1,"Camil"),
("Alimento","Arroz","Branco",15.40,2,"Prato fino"),
("Alimento","Macarrão","Espagute 10",4.30,5,"Renata"),
("Alimento","Biscoito","Recheada de morango",5.00,4,"Lacta"),
("Bebida","Coca Cola","Sabor cola",7.50,6,"Coca Cola"),
("Bebida","Leite","Semidesnatado",5.20,6,"Italac"),
("Alimeto","Iorgute","Leite",3.00,8,"Piracanjuba"),
("Alimento","Carne","Picanha",50.55,2,"Friboi"),
("Limpeza","Sabonete","Em barra",1.99,9,"Dove"),
("Limpeza","Desengordurante","Ultilizado em inox",8.75,10,"Cif"),
("Alimento","Bolo","De chocolate",9.99,3,"Dona Benta"),
("Higiene","Creme dental","Tripla ação",4.30,7,"Colgate");


create table pedidos(
	id int auto_increment primary key,
    cliente int,
    endereco varchar(128),
    situacao enum('Entregue', 'Cancelado', 'Aguardando Pagamento...', 'Em espera'),
    id_cliente int,
    foreign key (id_cliente) references cliente (id_cliente) 
);
insert into pedidos (cliente,endereco,situacao) values (001,"Rua Pedro Batista, N°238,Bairro Santa Maria",'Entregue'),
(002,"Rua Silva Lima, N°56,Bairro Almeida",'Em espera'),
(003,"Rua Vilva Benta, N°83,Bairro Vipa Drt",'Cancelado'),
(004,"Rua OLiveira, N°72,Bairro Fouy",'Aguardando Pagamento...'),
(005,"Rua K,N°01,Bairro Guaritá",'Cancelado'),
(006,"Rua Goias ,N°748,Bairro São Mateus",'Em espera'),
(007,"Rua Das Flores,N°97,Bairro Vinhosa",'Aguardando Pagamento...'),
(008,"Rua Sergipe,N°21,Bairro Bananal",'Aguardando Pagamento...'),
(009,"Rua Vinte e Três,N°63,Bairro Carulas",'Entregue'),
(010,"Rua Pará,N°36,Bairro Fiteiro",'Cancelado'),
(011,"Rua O ,N°95,Bairro Granja",'Entregue'),
(012,"Rua José Bonifácio,N°102,Bairro Aguas Claras",'Entregue'),
(013,"Rua Rua Minas Gerais,N°37,Bairro Bom Pastor",'Em espera'),
(0014,"Rua Da Paz, N°44,Bairro Bico da Foice",'Entregue');


create table lista(
	pedido int,
    produto int,
    quantidade int,
    foreign key (produto) references produtos(id),
    foreign key (pedido) references pedidos(id)
); 

insert into lista (pedido,produto,quantidade) values (1,2,3),
(2,5,2),
(5,4,1),
(4,3,2),
(6,6,3),
(3,1,1);

create table feedback(
	id int auto_increment primary key,
	mensagem varchar(1280),
    mensagem_admin varchar(2156),
    id_cliente int,
    foreign key (id_cliente) references cliente (id_cliente) 
);

insert into feedback (mensagem,mensagem_admin,id) values ("Muito bom o programa,atende muito bem as minhas demandas","O sistema Wilah agradece,obgrigada",1),
("Achei a plataforma organizada e a interface bonita","O sistema Wilah agradece,obgrigada",3),
("Possui uma bela interface e funcionamento","O sistema Wilah agradece,obgrigada",6);

create table lembrar(
	usuario varchar(256),
    senha varchar(64)
);
 insert into lembrar(senha,usuario) values ("fernanda01","Fernanda dos Santos"),
 ("caio77","Caio da Silva"),
 ("clara77","Clara Ramos");














