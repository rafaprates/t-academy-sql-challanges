USE exercicio_04;

SELECT * FROM colaborador;
SELECT * FROM cargo;

SELECT CURDATE();

# 1. Listar o nome do colaborador, nome do cargo e salário
SELECT colaborador.nome AS nome_colaborador, cargo.nome AS cargo_colaborador
FROM colaborador
INNER JOIN cargo ON colaborador.fk_codigo_cargo = cargo.codigo_cargo;

# 2. Listar todos os cargos (nome) e a quantidade de colaboradores em cada cargo
SELECT cargo.nome, COUNT(colaborador.fk_codigo_cargo) AS qtd_colaboradores
FROM cargo, colaborador
WHERE cargo.codigo_cargo = colaborador.fk_codigo_cargo
GROUP BY cargo.nome;

# 3. Média salarial por gênero
SELECT colaborador.genero, ROUND(AVG(cargo.salario), 2) AS media_salario
FROM colaborador, cargo
WHERE colaborador.fk_codigo_cargo = cargo.codigo_cargo
GROUP BY colaborador.genero;

# 4. Listar o nome e a data de nascimento de todos que possuem idade entre 20 e 30 anos.
SELECT nome, data_nascimento
FROM colaborador
WHERE (DATEDIFF(CURDATE(), data_nascimento) / 365) 
BETWEEN 20 AND 30; 

# 5. Quantidade de pessoas que trabalham em cada estado
SELECT estado, COUNT(*) AS qtd_colaborador
FROM colaborador
GROUP BY estado;

# 6. Quantidade de pessoas que trabalham em uma cidade
SELECT cidade, COUNT(*) AS qtd_colaborador
FROM colaborador
GROUP BY cidade;

# 7. Quantidade de mulheres com idade superior a 30 anos e que atuam no estado do Parana
SELECT nome, data_nascimento
FROM colaborador
WHERE genero = "feminino"
AND ((DATEDIFF(CURDATE(), colaborador.data_nascimento)) / 365) > 30
AND estado = "sc";

# 8. Média de salário por cidade
SELECT AVG(cargo.salario) AS media_salario, cidade
FROM colaborador, cargo
WHERE colaborador.fk_codigo_cargo = cargo.codigo_cargo
GROUP BY cidade;

# 9. Média de salário de todos os colaborados cadastrados
SELECT ROUND(AVG(cargo.salario), 2) AS media_salario
FROM colaborador, cargo
WHERE colaborador.fk_codigo_cargo = cargo.codigo_cargo;

# 10. Exibir todos os dados do colaborador mais velho
SELECT *
FROM colaborador
WHERE data_nascimento = (SELECT MIN(data_nascimento) FROM colaborador);

# 11. Exibir a quantidade de pessoas que nasceram na decada de 90
SELECT COUNT(*) as qtd_nascidos_apos_1990
FROM colaborador
WHERE 
data_nascimento BETWEEN '1990-01-01' and '1999-12-31';

# 12. Excluir a tabela
DROP TABLE colaborador;
DROP TABLE cargo;