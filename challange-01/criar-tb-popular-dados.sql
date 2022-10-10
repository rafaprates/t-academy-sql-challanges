CREATE DATABASE exercicio_01;

USE exercicio_01;

CREATE TABLE clientes (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    cidade VARCHAR(20),
    idade INT
);


INSERT INTO clientes (nome,cidade,idade)
VALUES
	("Érica","Curitiba",28),
    ("Lucas","Blumenau",16),
    ("Larissa","Florianópolis",36),
    ("Murillo","Joinville",23),
    ("Cristiane","Blumenau",31),
    ("Robson","Joinville",42);


INSERT INTO clientes (nome,idade) 
VALUES (
	"Mariana",37
);


INSERT INTO clientes (nome,cidade,idade)
VALUES
	("Jean","Blumenal",43),
    ("Luana","Pomerode",19),
    ("Cleber","Brusque",34),
    ("Hellen","Blumenau",28),
    ("Paulo","Joinville",44),
    ("Alessandra","São Paulo",28),
	("Denis","Blumenau",37),
    ("Bianca","Campinas",23),
    ("Gabriel","São Paulo",26);