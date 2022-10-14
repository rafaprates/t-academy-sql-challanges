# 1. Listar a quantidade de cursos que cada aluno esteja participando. Deverá obrigatoriamente
# exibir o nome de todos os alunos e a quantidade de cursos.
SELECT alunos.nome, COUNT(alunos_cursos.id_curso) as qtd_cursos
FROM alunos
LEFT JOIN alunos_cursos ON alunos.id = alunos_cursos.id_aluno
GROUP BY alunos.nome
ORDER BY qtd_cursos DESC;

# 2. Exibir a quantidade de cursos através do status
SELECT status_curso, COUNT(status_curso) as qtd_cursos
FROM alunos_cursos
GROUP BY status_curso;

# 3. Exiba o nome do aluno e o nome do curso, onde o status esteja concluído e o valor do curso
# seja de pelo menos R$1.000,00.
SELECT alunos.nome, cursos.nome, alunos_cursos.status_curso, cursos.valor
FROM alunos_cursos
INNER JOIN alunos ON alunos.id = alunos_cursos.id_aluno
INNER JOIN cursos ON cursos.id = alunos_cursos.id_curso
WHERE status_curso LIKE "concluido"
AND VALOR > 999.99;

# 4. Exibir a quantidade de alunos, agrupando pelo estado onde vive
SELECT cidade, COUNT(*)
FROM alunos
GROUP BY cidade
ORDER BY cidade ASC;

# 5. Listar o nome dos alunos e o nome dos cursos, onde o status seja Não iniciado.
SELECT alunos.nome, cursos.nome, alunos_cursos.status_curso
FROM alunos_cursos
INNER JOIN alunos ON alunos.id = alunos_cursos.id_aluno
INNER JOIN cursos ON cursos.id = alunos_cursos.id_curso
WHERE status_curso LIKE "nao iniciado";

# 6. Exiba o nome dos alunos e quantidade de cursos que estão cadastrados, onde a idade seja
# inferior a 18 anos (deverá levar em consideração a data e hora atuais).
SELECT alunos.nascimento, alunos.nome, COUNT(*) as qtd_cursos
FROM alunos_cursos
INNER JOIN alunos ON alunos.id = alunos_cursos.id_aluno
INNER JOIN cursos ON cursos.id = alunos_cursos.id_curso
WHERE status_curso IN ("em andamento", "não iniciado") AND
(TIMESTAMPDIFF(YEAR, alunos.nascimento, CURRENT_DATE) < 18)
GROUP BY alunos.nome
ORDER BY qtd_cursos DESC;

# 7. Exiba o nome do curso mais caro, seu valor e a quantidade de alunos que estão participando
SELECT cursos.nome, valor, COUNT(*) as qtd_alunos_participando
FROM cursos
INNER JOIN alunos_cursos ON alunos_cursos.id_curso = cursos.id
WHERE valor = (SELECT MAX(valor) FROM cursos);

# 8. Exiba os nomes de todos os professores e a quantidade de cursos que eles lecionam
SELECT professores.nome, COUNT(alunos_cursos.id_curso) AS qtd_cursos_lecionados
FROM alunos_cursos
INNER JOIN cursos ON cursos.id = alunos_cursos.id_curso
RIGHT JOIN professores on professores.id = cursos.id
GROUP BY professores.nome
ORDER BY qtd_cursos_lecionados DESC;

# 9. Exiba o nome de todos os professores e a quantidade de alunos que participam de todos os
# cursos
SELECT p.nome, COUNT(ac.id_aluno)
FROM alunos_cursos ac
INNER JOIN cursos c ON ac.id_curso = c.id
INNER JOIN professores p ON p.id = c .id_professor
GROUP BY p.nome;

# 10. Exibir o nome de todos os alunos, além do nome do curso, valor do curso e nome do
# professor contidos na tabela alunos_cursos.
SELECT alunos.nome, professores.nome, cursos.nome, cursos.valor
FROM alunos_cursos
INNER JOIN alunos ON alunos.id = alunos_cursos.id_aluno
INNER JOIN cursos ON cursos.id = alunos_cursos.id_curso
INNER JOIN professores on professores.id = cursos.id_professor;

# 11. Realize a média dos valores comercializados em todos os cursos
SELECT ROUND(AVG(valor), 2) AS media_valor_curso
FROM cursos;

# 12. Retorne o nome do curso, valor e quantidade de alunos, onde o valor do curso seja maior ou
# igual a média
SELECT cursos.nome, cursos.valor, COUNT(DISTINCT alunos_cursos.id_aluno) AS qtd_alunos
FROM alunos_cursos
RIGHT JOIN cursos ON cursos.id = alunos_cursos.id_curso
WHERE cursos.valor >= 
(SELECT ROUND(AVG(valor), 2) AS media_valor_curso
FROM cursos)
GROUP BY cursos.nome
ORDER BY qtd_alunos DESC;

# 13. Remover todos os alunos com idade superior a 30 anos
DELETE alunos, alunos_cursos
FROM alunos
INNER JOIN alunos_cursos ON alunos_cursos.id_aluno = alunos.id
WHERE TIMESTAMPDIFF(year, alunos.nascimento, CURRENT_DATE) > 30;

# 14. Excluir todas as tabelas
DROP DATABASE exercicio_07;