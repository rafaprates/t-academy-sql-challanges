DROP TRIGGER deletar_item_do_carrinho;

DELIMITER $$
CREATE TRIGGER deletar_item_do_carrinho AFTER DELETE
ON itens_carrinho
FOR EACH ROW
BEGIN 
    DECLARE log_mensagem VARCHAR(255);
    SET log_mensagem = concat("Foi creditado ", OLD.quantidade, " do estoque do produto ", OLD.id_produto);
    
    UPDATE produtos SET estoque = estoque + OLD.quantidade;
    
    INSERT INTO historico_movimentacao (id_produto, id_carrinho, data_hora, descricao)
    VALUES
    (OLD.id_carrinho, OLD.id_produto, now(), log_mensagem);
END $$
DELIMITER ;