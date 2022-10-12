# 1. Exibir o nome do aluno, o nome da matéria e o nome da turma
SELECT nomeAluno, nomeMateria, nomeTurma
FROM alunos_turmas
INNER JOIN alunos ON alunos_turmas.codigoAluno = alunos.codigoAluno
INNER JOIN materias ON alunos_turmas.codigoMateria = materias.codigoMateria
INNER JOIN turmas ON alunos_turmas.codigoTurma = turmas.codigoTurma;


# 2. Nome de cada professor e matéria que leciona
SELECT nomeMateria, nomeProfessor
FROM materias
INNER JOIN professores ON materias.codigoMateria = professores.codigoProfessor;


# 3. Quantidade de alunos em cada turma
SELECT COUNT(*), turmas.nomeTurma
FROM alunos_turmas
INNER JOIN turmas ON alunos_turmas.codigoMateria = turmas.codigoTurma
GROUP BY alunos_turmas.codigoTurma;


# 4. Quantidade de alunos por turno
SELECT COUNT(*), turmas.turnoTurma
FROM alunos_turmas
INNER JOIN turmas ON alunos_turmas.codigoMateria = turmas.codigoTurma
GROUP BY alunos_turmas.codigoTurma;


# 5. Listar todos os alunos (nome), turma e matéria, onde professor Renato leciona
SELECT alunos.nomeAluno, turmas.nomeTurma, materias.nomeMateria
FROM alunos_turmas
INNER JOIN alunos ON alunos.codigoAluno = alunos_turmas.codigoAluno
INNER JOIN turmas ON turmas.codigoTurma = alunos_turmas.codigoTurma
INNER JOIN materias ON materias.codigoMateria = alunos_turmas.codigoMateria
INNER JOIN professores ON professores.codigoProfessor = materias.codigoProfessor
WHERE professores.nomeProfessor = "Renato";


# 6. Listar o nome de todos os professores que lecionam química
SELECT materias.nomeMateria, professores.nomeProfessor
FROM materias
INNER JOIN professores ON professores.codigoProfessor = materias.codigoProfessor
WHERE materias.nomeMateria = "química";


# 7. Quais alunos estao cadastrados na materia história?
SELECT alunos.nomeAluno, materias.nomeMateria
FROM alunos_turmas
INNER JOIN materias ON materias.codigoMateria = alunos_turmas.codigoMateria
INNER JOIN alunos ON alunos.codigoAluno = alunos_turmas.codigoAluno
WHERE materias.nomeMateria = "história";


# 8. Nome dos professores que leciona as matérias de português e inglês
SELECT materias.nomeMateria, professores.nomeProfessor 
FROM materias
INNER JOIN professores ON materias.codigoProfessor = professores.codigoProfessor
WHERE nomeMateria = "portugues" 
OR nomeMateria = "ingles";


# 9. Quantidade de alunos por matéria
SELECT materias.nomeMateria, COUNT(alunos_turmas.codigoMateria) AS qtd_alunos
FROM materias
INNER JOIN alunos_turmas ON alunos_turmas.codigoMateria = materias.codigoMateria
GROUP BY materias.nomeMateria;


# 10. Quais são os alunos que têm aula com a professora Cátia da matéria de inglês?
SELECT professores.nomeProfessor, materias.nomeMateria, alunos.nomeAluno
FROM alunos_turmas
INNER JOIN alunos ON alunos.codigoAluno = alunos_turmas.codigoAluno
INNER JOIN materias ON materias.codigoMateria = alunos_turmas.codigoMateria
INNER JOIN professores on professores.codigoProfessor = materias.codigoProfessor
WHERE professores.nomeProfessor = "catia" AND materias.nomeMateria = "ingles";


# 11. Quantidade de alunos da turma 6A que tem aula de matemática com o professor Renato?
SELECT COUNT(*) as qtd_alunos_prof_renato_matematica_6b
FROM alunos_turmas
INNER JOIN alunos ON alunos.codigoAluno = alunos_turmas.codigoAluno
INNER JOIN materias ON materias.codigoMateria = alunos_turmas.codigoMateria
INNER JOIN professores ON professores.codigoProfessor = materias.codigoProfessor
INNER JOIN turmas ON turmas.codigoTurma = alunos_turmas.codigoTurma
WHERE professores.nomeProfessor = "renato" 
AND materias.nomeMateria = "matemática"
AND turmas.nomeTurma = "6b";


# 12. Exiba as matérias que o professor Airton leciona
SELECT materias.nomeMateria
FROM materias
WHERE materias.codigoProfessor = 
(SELECT codigoProfessor FROM professores WHERE nomeProfessor = "Airton");


# 13. Quantidade de alunos no período vespertino que estão tendo aula de biologia.
SELECT COUNT(*) AS qtd_alunos_vespertino_biologia 
FROM alunos_turmas
INNER JOIN turmas ON turmas.codigoTurma = alunos_turmas.codigoTurma
INNER JOIN materias ON materias.codigoMateria = alunos_turmas.codigoMateria
INNER JOIN alunos ON alunos.codigoAluno = alunos_turmas.codigoAluno
WHERE turmas.turnoTurma = "vespertino";


# 14. Remover todas as tabelas
DROP DATABASE exercicio_06;