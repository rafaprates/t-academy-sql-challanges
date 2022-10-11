DROP DATABASE exercicio_05;
CREATE DATABASE exercicio_05;
USE exercicio_05;

CREATE TABLE marca (
	id_marca INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20)
);

CREATE TABLE produto (
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(32),
    valor DOUBLE,
    quantidade_estoque INT,
    fk_id_marca INT,
    FOREIGN KEY (fk_id_marca) REFERENCES marca(id_marca)
);

INSERT INTO marca (nome)
VALUES
("nike"),
("adidas"),
("colcci"),
("tommy hilfiger"),
("hering"),
("vans"),
("vizzano"),
("aramis"),
("reserva");

INSERT INTO produto (nome, valor, quantidade_estoque, fk_id_marca)
VALUES
("tenis adidas performance", 345, 765, 2),
("tenis nike revolution", 769, 1235, 1),
("blusa feminina rosa", 99, 754, 6),
("camisa social branca", 180.99, 235, 8),
("Bota Chelsea Lacey", 322, 98, 3),
("blusa moletom romance", 150.76, 324, 3),
("Camiseta preta base", 79, 1235, 4),
("Bolsa Colcci Lisa",   249, 112, 3),
("Camisa Adidas Originals", 346, 344, 2),
("Tênis WM preto", 988, 2341, 6),
("Bota Colcci azul", 1540, 143, 3),
("Scarpin feminino salto", 877, 673, 7),
("Camiseta Nike Dri-FIT",  124, 228, 1),
("Camisa polo azul",  233, 549, 8),
("Camisa Polo Tommy Hilfiger", 499, 794, 4),
("Sandália Vizzano", 1540, 83, 7),
("Tênis Adidas Superstar", 769, 326, 2),
("Camiseta algodão verde", 76.99, 1214, 9),
("Short Nike Nk", 298, 683, 1),
("Camisa Aramis geométrica", 355, 1033, 8),
("Bolsa Nike Unissex", 265.29, 596, 1),
("Camiseta Aramis vermelha", 199, 457, 8),
("Boné Tommy Jeans", 204.64, 68, 4),
("Jaqueta Adidas ECO", 609.98, 116, 2);

