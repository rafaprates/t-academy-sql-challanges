DROP PROCEDURE IF EXISTS inserir_item_no_carrinho;
DELIMITER $$
CREATE PROCEDURE inserir_item_no_carrinho(IN in_id_carrinho INT, IN in_id_produto INT, IN in_quantidade INT)
	BEGIN
    DECLARE quantidade_produtos_em_carrinho TINYINT;
	DECLARE valor_unitario_produto INT;
    
    SET quantidade_produtos_em_carrinho = (SELECT COUNT(*) FROM produtos WHERE id_produto = in_id_produto);
    
    IF quantidade_produtos_em_carrinho > 0 THEN
		UPDATE itens_carrinho SET quantidade = (quantidade + in_quantidade) WHERE id_produto = in_id_produto;
    ELSE
        SET valor_unitario_produto = (SELECT valor_unitario FROM produtos WHERE id_produto = in_id_produto);
    	INSERT INTO itens_carrinho(id_carrinho, id_produto, quantidade, valor_unitario)
		VALUES
		(in_id_carrinho, in_id_produto, in_quantidade, valor_unitario_produto);
    END IF;
    END $$
DELIMITER ;