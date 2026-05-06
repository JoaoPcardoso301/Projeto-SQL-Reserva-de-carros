create database db_sistema_carro;
use db_sistema_carro;


CREATE TABLE clientes (
    id_cliente int AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf VARCHAR(14) UNIQUE,
    numero_cnh VARCHAR(20) UNIQUE,
    validade_cnh date,
    categoria_cnh VARCHAR(5),
    primary key(id_cliente)
);

CREATE TABLE sedes (
    id_sede int AUTO_INCREMENT,
    nome VARCHAR(100),
    endereco VARCHAR(150),
    cnpj VARCHAR(18),
    telefone VARCHAR(20),
    gerente VARCHAR(100),
    primary key(id_sede)
);

CREATE TABLE classes_carro (
    id_classe int AUTO_INCREMENT,
    nome VARCHAR(50),
    valor_diaria decimal(10,2),
    tipo varchar(50),
    primary key(id_classe)
);

CREATE TABLE carros (
    id_carro int AUTO_INCREMENT,
    placa VARCHAR(10) UNIQUE,
    modelo VARCHAR(100),
    ano int,
    quilometragem int,
    id_sede int,
    id_classe int,
    primary key(id_carro),

    foreign key (id_sede) REFERENCES sedes(id_sede),
    foreign key (id_classe) REFERENCES classes_carro(id_classe)
);

CREATE TABLE reservas (
    id_reserva int AUTO_INCREMENT,
    id_cliente int,
    id_carro int,
    id_sede_origem int,
    id_sede_destino int,
    data_locacao date,
    data_retorno date,
    quantidade_diarias int,
    km_saida int,
    km_retorno int,
    multa decimal(10,2),
    valor_total decimal(10,2),
    situacao VARCHAR(20),
    primary key(id_reserva),

    foreign key (id_cliente) references clientes(id_cliente),
    foreign key (id_carro) references carros(id_carro),
    foreign key (id_sede_origem) references sedes(id_sede),
    foreign key (id_sede_destino) references sedes(id_sede)
);



select * from classes_carro;
insert into classes_carro (nome, valor_diaria, tipo) values
("SUV", "250", "grande"),
("Esportivo", "350", "medio"),
("Sedan", "450", "pequeno");


select * from clientes;
insert into clientes (nome, cpf, numero_cnh, validade_cnh, categoria_cnh) values 
("joao", "293.289.899-89", "23", "2027-02-18", "A"),
("ana", "293.289.899-81", "244", "2028-08-12", "B"),
("julia", "293.289.899-82", "22", "2027-01-19", "AB"),
("pedro", "293.289.899-83", "21", "2029-05-20", "D"),
("jose", "293.289.899-86", "20", "2026-07-10", "E");




