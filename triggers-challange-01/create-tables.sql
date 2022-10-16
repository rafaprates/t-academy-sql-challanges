CREATE DATABASE gatilhos_challange_01;
USE gatilhos_challange_01;

CREATE TABLE IF NOT EXISTS produtos (
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(30),
    valor_unitario DOUBLE,
    estoque FLOAT
);

DROP 
CREATE TABLE IF NOT EXISTS itens_carrinho (
	id_carrinho INT,
    id_produto INT,
    quantidade INT,
    valor_unitario DOUBLE,
    PRIMARY KEY (id_carrinho, id_produto),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE historico_movimentacao (
	id_produto 

);