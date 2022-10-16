DROP TRIGGER atualizar_carrinho;
DELIMITER $$
CREATE TRIGGER atualizar_carrinho AFTER UPDATE
ON itens_carrinho
FOR EACH ROW
BEGIN
	DECLARE log_mensagem VARCHAR(255);
    
    IF NEW.quantidade > OLD.quantidade THEN
		UPDATE produtos SET estoque = estoque - (NEW.quantidade - OLD.quantidade) WHERE id_produto = OLD.id_produto;
        SET log_mensagem = concat("Foi debitado ", (NEW.quantidade - OLD.quantidade), " do estoque do produto ", OLD.id_produto);
    ELSE
		UPDATE produtos SET estoque = estoque + (OLD.quantidade - NEW.quantidade) WHERE id_produto = OLD.id_produto;
        SET log_mensagem = concat("Foi creditado ", (OLD.quantidade - NEW.quantidade), " do estoque do produto ", OLD.id_produto);
    END IF;
    
	INSERT INTO historico_movimentacao (id_produto, id_carrinho, data_hora, descricao)
    VALUES
    (OLD.id_carrinho, OLD.id_produto, now(), log_mensagem);
END $$

DELIMITER ;