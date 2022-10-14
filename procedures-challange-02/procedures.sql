DROP PROCEDURE IF EXISTS cadastrar_cliente;
TRUNCATE TABLE clientes;


SELECT * FROM clientes;
CALL cadastrar_cliente("rafaelbruno", "rafael.cardoso@t-systems.com");
#CALL validar_nome_cliente("rafaelbrunopratesbarbosacardoso");
#CALL validar_email_cliente("rafael@example.com");

DROP PROCEDURE cadastrar_cliente;
DELIMITER $$
	CREATE PROCEDURE cadastrar_cliente(IN nome_cliente VARCHAR(30), IN email_cliente VARCHAR(50))
    BEGIN
		DECLARE cliente_id INT;
        DECLARE nome_cliente_eh_valido CHAR(3);
        DECLARE email_cliente_eh_valido CHAR(3);
        
        CALL validar_nome_cliente(nome_cliente, nome_cliente_eh_valido);
        #SET nome_cliente_eh_valido = (CALL validar_nome_cliente(nome_cliente));
        #SET email_cliente_eh_valido = CALL validar_email_cliente(email_cliente);
        SELECT cliente_id;
		SET cliente_id = ((SELECT MAX(id) from clientes) + 1);

		IF nome_cliente_eh_valido = "sim" THEN
			IF cliente_id IS NULL THEN
				#SET cliente_id = 1;
				INSERT INTO clientes (id, nome, email)
				VALUES (1, nome_cliente, email_cliente);
			ELSE
				INSERT INTO clientes (id, nome, email)
				VALUES (cliente_id, nome_cliente, email_cliente);
			END IF;
		END IF;
        SELECT * FROM clientes LIMIT 5;
    END $$
DELIMITER ;

SELECT * FROM clientes;