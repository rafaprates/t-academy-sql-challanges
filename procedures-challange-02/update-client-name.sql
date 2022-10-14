DELIMITER $$
	CREATE PROCEDURE alterar_nome(IN antigo_nome VARCHAR(255), IN novo_nome VARCHAR(255), IN novo_email VARCHAR(255))
    BEGIN
    
    DECLARE novo_nome_cliente_eh_valido VARCHAR(255);
    DECLARE novo_email_cliente_eh_valido VARCHAR(255);
    DECLARE email_existe INT;
    
    #SELECT COUNT(nome) FROM clientes WHERE nome = antigo_nome;
    SELECT COUNT(email) from clientes WHERE email = novo_email;
    
    IF email_existe > 0 THEN
		CALL validar_nome_cliente(novo_nome, novo_nome_cliente_eh_valido);
		CALL validar_email_cliente(novo_email, novo_email_cliente_eh_valido);
        IF (nome_cliente_eh_valido IS NULL) AND (email_cliente_eh_valido IS NULL) THEN
			UPDATE clientes SET nome = novo_nome WHERE nome = antigo_nome;
			UPDATE clientes SET email = novo_email WHERE 
		END IF;
	ELSE 
		SELECT "e-mail não existe na base dados";
    END IF;
    END $$
DELIMITER ;