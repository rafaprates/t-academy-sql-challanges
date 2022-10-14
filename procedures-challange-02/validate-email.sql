DROP PROCEDURE validar_email_cliente;
DELIMITER $$
	CREATE PROCEDURE validar_email_cliente(IN email VARCHAR(255), OUT msg VARCHAR(255))
    BEGIN
		DECLARE comprimento_email INT;
        DECLARE ocorrencias_email_em_clientes INT;
        DECLARE quantidade_arrobas INT;
        
        SET comprimento_email = (SELECT char_length(email));
        SET quantidade_arrobas = length(email) - length(REPLACE(email,'@', '')) = 1;
        SET ocorrencias_email_em_clientes = 
        (SELECT COUNT(*) FROM clientes WHERE clientes.email = email);

		IF comprimento_email < 10 THEN
			SET msg = "e-mail inválido: comprimento deve ser maior que 10 caracteres";
            SELECT msg;
		ELSEIF quantidade_arrobas != 1 THEN
			SET msg = "e-mail inválido: formato de e-mail inválido";
            SELECT msg;
		ELSEIF ocorrencias_email_em_clientes != 0 THEN
			SET msg = "e-mail inválido: e-mail já cadastrado";
            SELECT msg;
		END IF;
        
		IF msg IS NOT NULL THEN
			SELECT msg;
		END IF;
	END $$
DELIMITER ;