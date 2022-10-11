USE exercicio_05;
SELECT * FROM marca;
SELECT * FROM produto;

# 1. Exiba o nome do produto, nome da marca e o valor do produto
SELECT produto.nome, marca.nome, produto.valor
FROM produto, marca
WHERE produto.fk_id_marca = id_marca;

# 2. Listar obrigatoriamente todas as marcas e a quantidade de produtos cadastrado por marca
SELECT marca.nome, COUNT(produto.fk_id_marca) as qtd
FROM marca, produto
WHERE produto.fk_id_marca = id_marca
GROUP BY marca.nome;

# 3. Exibir o nome do produto e seu valor em ordem decrescente (do maior valor para o menor)
SELECT nome, valor
FROM produto
ORDER BY valor DESC;

# 4. Média dos valores dos produtos por cada marca.
SELECT m.nome, AVG(p.valor) AS media_preco
FROM produto p, marca m
WHERE p.fk_id_marca = m.id_marca
GROUP BY m.nome;

# 5. Listar nome do produto, valor, nome da marca e quantidade em estoque 
# do produto de maior valor (Haverá dois produtos, os dois terão que ser exibidos)
SELECT p.nome, p.valor, m.nome, p.quantidade_estoque
FROM produto p, marca m
WHERE p.fk_id_marca = m.id_marca
AND p.valor = (SELECT MAX(valor) FROM produto);

# 6. Listar todos os produtos (exiba todos os dados e converta o código da marca para o nome),
# onde o estoque esteja entre 500 e 1000 unidades.
SELECT *
FROM produto p, marca m
WHERE p.fk_id_marca = m.id_marca
AND p.quantidade_estoque BETWEEN 500 AND 1000;

# 7. Listar todos os produtos (nome, valor e estoque) que contenham os termos: Blusa, Camiseta
# e Camisa. Exiba em ordem decrescente de preço.
SELECT p.nome, p.valor, p.quantidade_estoque
FROM produto p, marca m
WHERE p.fk_id_marca = m.id_marca
AND (p.nome LIKE "%blusa%" 
OR p.nome LIKE "%camiseta%" 
OR p.nome LIKE "%camisa%");

# 8. Exibir a soma dos valores de cada produto e agrupar por marcas que estejam vinculadas em
# algum produto
SELECT m.nome, SUM(valor) as total_valor_por_marca
FROM produto p, marca m
WHERE p.fk_id_marca = m.id_marca
GROUP BY m.nome;

# 9. Exibir nome da marca onde o produto é o mais caro
SELECT m.nome
FROM produto p, marca m
WHERE p.fk_id_marca = m.id_marca
AND p.valor = (SELECT MAX(valor) FROM produto);

# 10. Listar todos os produtos (nome e estoque), onde a quantidade em estoque seja maior ou igual
# a média total do estoque contido na tabela de produtos.
SELECT AVG(quantidade_estoque) media_qtd_estoque
FROM produto;

SELECT *
FROM produto p, marca m
WHERE p.fk_id_marca = m.id_marca
AND p.quantidade_estoque > (SELECT AVG(quantidade_estoque) FROM produto);

# 11. Excluir todas as tabelas
DROP DATABASE exercicio_05;