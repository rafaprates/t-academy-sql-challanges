USE exercicio_01;

# 1.
SELECT * FROM clientes;

# 2.
SELECT COUNT(nome) AS qtde_clientes FROM clientes;

# 3.
SELECT nome, idade FROM clientes WHERE idade = 
(SELECT MAX(idade) from clientes);

# 4.
SELECT DISTINCT(cidade) FROM clientes;

# 5.
SELECT cidade, COUNT(cidade) FROM clientes GROUP BY cidade;

# 6.
SELECT nome, idade FROM clientes WHERE cidade IS NULL;

# 7.
SELECT AVG(idade) FROM clientes;

# 8. 
SELECT nome, idade FROM clientes WHERE
idade = (SELECT MIN(idade) FROM clientes);

# 9.
SELECT nome, idade FROM clientes WHERE
idade > (SELECT AVG(idade) FROM CLIENTES);

# 10.
SELECT * FROM clientes WHERE
idade >= 20 AND idade <=30;

# 11.
SELECT * FROM clientes WHERE
cidade = "Blumenau" AND idade >= 30;

# 12.
SELECT * FROM clientes WHERE
cidade = "Florianópolis" OR "Curitiba";

# 13.
SELECT nome FROM clientes WHERE
nome LIKE "%L%";

# 14.
SELECT nome FROM clientes ORDER BY nome ASC;

# 15.
UPDATE clientes SET cidade = "Blumenau" WHERE cidade IS NULL;

# 16.
DELETE FROM clientes WHERE cidade != "Bluemenau";

# 17.
DROP TABLE clientes;