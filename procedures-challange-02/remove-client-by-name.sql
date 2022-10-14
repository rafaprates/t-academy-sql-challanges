DELIMITER $$
CREATE PROCEDURE remover_cliente_por_nome(IN nome_cliente VARCHAR(255))
BEGIN 
	DECLARE quantidade_nomes_encontrados INT;
	SET quantidade_nomes_encontrados = (SELECT COUNT(*) FROM clientes WHERE nome = nome_cliente);
    
    IF quantidade_nomes_encontrados > 0 THEN
		DELETE FROM clientes WHERE nome = nome_cliente;
        SELECT "cliente excluído com sucesso";
	ELSE 
		SELECT "O nome informado inexiste na base de dados";
    END IF;
END $$
DELIMITER ;