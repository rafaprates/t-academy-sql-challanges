DROP PROCEDURE IF EXISTS cadastrar_cliente;
TRUNCATE TABLE clientes;


SELECT * FROM clientes;
CALL cadastrar_cliente("rafael cardoso", "rafael.cardoso@t-systems.com");
#CALL validar_nome_cliente("rafaelbrunopratesbarbosacardoso");
#CALL validar_email_cliente("rafael@example.com");

DROP PROCEDURE cadastrar_cliente;
DELIMITER $$
	CREATE PROCEDURE cadastrar_cliente(IN nome_cliente VARCHAR(30), IN email_cliente VARCHAR(50))
    BEGIN
		DECLARE cliente_id INT;
        DECLARE nome_cliente_eh_valido VARCHAR(255);
        DECLARE email_cliente_eh_valido VARCHAR(255);
        
        CALL validar_nome_cliente(nome_cliente, nome_cliente_eh_valido);
        CALL validar_email_cliente(email_cliente, email_cliente_eh_valido);
	
		SET cliente_id = ((SELECT MAX(id) from clientes) + 1);

		IF (nome_cliente_eh_valido IS NULL) AND (email_cliente_eh_valido IS NULL) THEN
			IF cliente_id IS NULL THEN
				INSERT INTO clientes (id, nome, email)
				VALUES (1, nome_cliente, email_cliente);
			ELSE
				INSERT INTO clientes (id, nome, email)
				VALUES (cliente_id, nome_cliente, email_cliente);
			END IF;
            SELECT "Cliente cadastrado com sucesso";
		END IF;
    END $$
DELIMITER ;

SELECT * FROM clientes;