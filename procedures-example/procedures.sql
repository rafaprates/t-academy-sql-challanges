USE exercicio_02;

DELIMITER $$
CREATE PROCEDURE loopFor(IN n INT)
BEGIN
	DECLARE cont INT DEFAULT 0;
    DECLARE msg VARCHAR(255);
    SET msg = '';
    repita: LOOP
		SET cont = cont + 1;
        set msg = CONCAT(msg, cont, ',');
        IF cont > n THEN
			LEAVE repita;
		END IF;
	END LOOP;
    SELECT msg;
END $$
DELIMITER ;

CALL loopFor(5);

DROP PROCEDURE IF EXISTS consultaProduto;
DELIMITER $$
	CREATE PROCEDURE consultaProduto(IN filtro VARCHAR(20))
    BEGIN
		SELECT * FROM produtos
        WHERE nome LIKE filtro;
    END $$
DELIMITER ;

CALL consultaProduto('%a');

DROP PROCEDURE IF EXISTS inserirItem;
DELIMITER $$
	CREATE PROCEDURE inserirItem()
    BEGIN
		SELECT valor FROM produtos;
    END $$
DELIMITER ;

CALL inserirItem();
















