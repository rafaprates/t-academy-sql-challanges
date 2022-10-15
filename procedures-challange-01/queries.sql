USE exercicio_02;

SELECT * FROM produtos;

# 1.
SELECT DISTINCT marca, COUNT(marca) FROM produtos GROUP BY marca;

# 2.
SELECT ROUND(AVG(valor), 2) FROM produtos AS media_precos;

# 3.
SELECT DISTINCT marca, SUM(valor) FROM produtos AS soma_precos GROUP BY marca;

# 4.
SELECT nome, valor FROM produtos ORDER BY valor DESC;

# 5.
SELECT MAX(valor) FROM produtos;

# 6.
SELECT * FROM produtos WHERE
valor >= (SELECT AVG(valor) FROM produtos);

# 7.
SELECT nome, marca, valor FROM produtos WHERE
valor = (SELECT MAX(valor) FROM produtos);

# 8.
SELECT nome, marca, valor FROM produtos WHERE
valor BETWEEN 100.00 AND 500.00;

# 9.
SELECT nome, marca, valor FROM produtos WHERE
nome LIKE "%mouse%" ORDER BY valor ASC;

# 10.
SELECT nome, LENGTH(nome) AS qtd_letras_produto FROM produtos;

# 11.
UPDATE produtos SET nome = "Alienware" WHERE
nome = "Dell";

# 12.
DROP TABLE produtos;