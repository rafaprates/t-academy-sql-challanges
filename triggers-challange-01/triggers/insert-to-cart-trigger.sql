DROP TRIGGER atualizar_estoque_gatilho;

DELIMITER $$
CREATE TRIGGER atualizar_estoque_gatilho AFTER INSERT
ON itens_carrinho
FOR EACH ROW
BEGIN
	DECLARE log_mensagem VARCHAR(255);
    DECLARE descricao_produto VARCHAR(255);
    SET descricao_produto = (SELECT descricao FROM produtos WHERE id_produto = NEW.id_produto);
    SET log_mensagem = concat("Foi debitado ", NEW.quantidade, " unidades do estoque do produto ", descricao_produto);

	UPDATE produtos SET estoque = estoque - NEW.quantidade
    WHERE id_produto = NEW.id_produto;
    
    INSERT INTO historico_movimentacao (id_produto, id_carrinho, data_hora, descricao)
    VALUES (NEW.id_produto, NEW.id_carrinho, now(), log_mensagem);
END $$
DELIMITER ;