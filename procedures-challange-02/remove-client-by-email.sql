DELIMITER $$
CREATE PROCEDURE remover_cliente_por_email(IN email_cliente VARCHAR(255))
BEGIN 
	DECLARE quantidade_emails_encontrados INT;
	SET quantidade_emails_encontrados = (SELECT COUNT(*) FROM clientes WHERE email = email_cliente);
    
    IF quantidade_emails_encontrados = 1 THEN
		DELETE FROM clientes WHERE email = email_cliente;
        SELECT "cliente excluído com sucesso";
	ELSE 
		SELECT "O e-mail informado inexiste na base de dados";
    END IF;
END $$
DELIMITER ;