CREATE DATABASE exercicio_02;

USE exercicio_02;

CREATE TABLE produtos (
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    marca VARCHAR(50),
    valor DOUBLE,
    estoque INT
);

INSERT INTO produtos (nome, marca, valor, estoque) 
VALUES
("Teclado","Microsoft",220.00,60),
("Monitor 32","Samsung",3700.00,20),
("Mouse","Logitech",129.90,45),
("Impressora","Epson",430.00,15),
("Mouse","Microsoft",199.90,50),
("Monitor 27","LG",1990.80,30),
("Cadeira gamer","Multilaser",1170.00,20),
("Teclado","Dell",110.00,50),
("Mouse","HP",80.00,70),
("Placa de vídeo - GeForce GTX 1660","ASUS",2800.00,10),
("SSD de 256GB","Kingston",400.00,15),
("Processador Core i5 - 10º geração","Intel",1800.00,10),
("Mouse","Multilaser",44.90,70),
("Monitor 23","Dell",1080.00,40),
("Teclado","HP",119.90,25)