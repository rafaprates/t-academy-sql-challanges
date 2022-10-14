DROP PROCEDURE validar_nome_cliente;
DELIMITER $$
	CREATE PROCEDURE validar_nome_cliente(IN nome_cliente VARCHAR(255), OUT msg VARCHAR(255))
    BEGIN
		DECLARE comprimento_nome INT;
        SET comprimento_nome = (SELECT char_length(nome_cliente));
		IF (comprimento_nome < 3) OR (comprimento_nome > 31) THEN
			SET msg = "nome inválido: o nome deve ter comprimento maior que 3 e menor que 30";
            SELECT msg;
		END IF;
	END $$ 
DELIMITER ;