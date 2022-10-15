DROP PROCEDURE IF EXISTS alterar_nome_e_email;
DELIMITER $$
	CREATE PROCEDURE alterar_nome_e_email(IN antigo_nome VARCHAR(255), IN novo_nome VARCHAR(255), IN novo_email VARCHAR(255))
    BEGIN
    
    DECLARE novo_nome_cliente_eh_valido VARCHAR(255);
    DECLARE novo_email_cliente_eh_valido VARCHAR(255);
    DECLARE quantidade_nomes_encontrados INT;
    DECLARE antigo_email VARCHAR(255);
    
    SET quantidade_nomes_encontrados = (SELECT COUNT(nome) FROM clientes WHERE nome = antigo_nome);
    
    IF quantidade_nomes_encontrados > 0 THEN
		CALL validar_nome_cliente(novo_nome, novo_nome_cliente_eh_valido);
		CALL validar_email_cliente(novo_email, novo_email_cliente_eh_valido);
        IF (novo_nome_cliente_eh_valido IS NULL) AND (novo_email_cliente_eh_valido IS NULL) THEN
			SET antigo_email = (SELECT email FROM clientes WHERE nome = antigo_nome);
			UPDATE clientes SET nome = novo_nome, email = novo_email WHERE nome = antigo_nome;
		END IF;
	ELSE 
		SELECT concat("usário ", antigo_nome, " inexiste na base dados");
    END IF;
    END $$
DELIMITER ;