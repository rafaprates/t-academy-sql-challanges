TRUNCATE TABLE historico_movimentacao;
TRUNCATE TABLE itens_carrinho;
TRUNCATE TABLE produtos;

SELECT * FROM produtos;
SELECT * FROM itens_carrinho;
SELECT * FROM historico_movimentacao;

UPDATE produtos SET estoque = 1000 WHERE id_produto = 1;
UPDATE produtos SET estoque = 1000 WHERE id_produto = 2;
UPDATE produtos SET estoque = 1000 WHERE id_produto = 3;

CALL inserir_item_no_carrinho(1, 1, 20);

INSERT INTO produtos (descricao, valor_unitario, estoque)
VALUES
("arroz 5kg", 20.00, 1000),
("feijao 1kg", 7.00, 500),
("ovos 24 un", 15.00, 200);


INSERT INTO itens_carrinho (id_carrinho, id_produto, quantidade, valor_unitario)
VALUES
(1, 1, 700, 20.00);

DELETE FROM itens_carrinho WHERE id_carrinho = 1 AND id_produto = 1;

UPDATE itens_carrinho SET quantidade = 300 WHERE id_carrinho = 1 AND id_produto = 1; 

INSERT INTO itens_carrinho (id_carrinho, id_produto, quantidade, valor_unitario)
VALUES
(1, 1, 2, (SELECT valor_unitario FROM produtos WHERE id_produto = 1)),
(1, 2, 4, (SELECT valor_unitario FROM produtos WHERE id_produto = 2)),
(1, 3, 4, (SELECT valor_unitario FROM produtos WHERE id_produto = 3));


INSERT INTO itens_carrinho (id_carrinho, id_produto, quantidade, valor_unitario)
VALUES
(2, 1, 1, (SELECT valor_unitario FROM produtos WHERE id_produto = 1)),
(2, 2, 1, (SELECT valor_unitario FROM produtos WHERE id_produto = 2));




SELECT * FROM itens_carrinho;
