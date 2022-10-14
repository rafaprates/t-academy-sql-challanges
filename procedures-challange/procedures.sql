DROP PROCEDURE IF EXISTS inserirItem;
DROP PROCEDURE IF EXISTS inserirOuAtualizarItem;
DELIMITER $$
	CREATE PROCEDURE inserirOuAtualizarItem(IN id_produto INT, IN quantidade_estoque INT)
    BEGIN
		DECLARE existeProdutoEmItem INT;
		DECLARE valor_produto DOUBLE;
        DECLARE estoque_existente INT;
        
		SET existeProdutoEmItem = 
        (SELECT COUNT(*) FROM itens WHERE fk_produto = id_produto);

		SET valor_produto =
        (SELECT valor FROM produtos
        WHERE id = id_produto);
        
        IF existeProdutoEmItem = 0 THEN
			INSERT INTO itens (fk_produto, quantidade, valor_unitario)
			VALUES (id_produto, quantidade_estoque, valor_produto);
		ELSE
			SET estoque_existente = (SELECT quantidade FROM itens WHERE fk_produto = id_produto);
			UPDATE itens SET quantidade = (estoque_existente + quantidade_estoque)
            WHERE fk_produto = id_produto;
		 END IF;
    END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS inserirItem;
DELIMITER $$
	CREATE PROCEDURE inserirItem(IN id_produto INT, IN quantidade_estoque INT)
    BEGIN
		INSERT INTO itens (fk_produto, valor_unitario)
        SELECT id, valor FROM produtos
        WHERE id = id_produto;
        
        UPDATE itens 
        SET quantidade = quantidade_estoque
        WHERE fk_produto = id_produto;
    END $$
DELIMITER ;

CALL inserirOuAtualizarItem(1, 100);

CALL inserirItem(2, 400);


SELECT produtos.nome, itens.quantidade FROM itens
INNER JOIN produtos ON produtos.id = itens.fk_produto;

select * from itens;

TRUNCATE itens;