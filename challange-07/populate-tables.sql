USE exercicio_07;

INSERT INTO professores(nome)
VALUES
("larissa"),
("daniel"),
("gustavo"),
("carla"),
("guilherme"),
("carina"),
("lúcio"),
("bianca");

INSERT INTO cursos (nome, valor, id_professor)
VALUES
("java - basico", 1000, 2),
("java - avançado", 1250, 2),
("spring boot", 1800, 2),
("C#", 1140, 7),
("ASP.NET Core", 1800, 7),
("python", 900, 4),
("flask", 1020, 4),
("django", 1400, 4),
("php", 950, 4),
("laravel", 1600, 4),
("angular", 2300, 1),
("react", 2100, 1),
("html", 500, 8),
("css", 700, 8),
("javascript", 900, 4),
("banco de dados", 600, 8),
("design patterns", 2700, 8);

INSERT INTO alunos (nome, nascimento, estado, cidade)
VALUES
("Aline", "1997-03-01", "Santa Catarina", "Blumenau"),
("Mariana", "1993-08-28", "Santa Catarina", "Joinville"),
("Gustavo", "2000-11-14", "São Paulo", "Campinas"),
("Bianca", "1999-01-07", "Santa Catarina", "Blumenau"),
("Ricardo", "2002-07-30", "Paraná", "Curitiba"),
("Tamara", "2005-02-22", "São Paulo", "São Paulo"),
("Juliano", "1986-09-19", "Paraná", "Londrina"),
("Fernanda", "1987-01-28", "São Paulo", "São Paulo"),
("Alice", "2001-06-13", "Santa Catarina", "Blumenau"),
("Henrique", "1991-01-24", "Rio de Janeiro", "Niterói"),
("Marcelo", "1988-12-08", "Paraná", "Curitiba"),
("Daniela", "1998-10-14", "Santa Catarina", "Florianópolis"),
("Caroline", "2002-04-10", "Paraná", "Maringá"),
("Letícia", "1993-08-22", "São Paulo", "São Paulo"),
("Mauro", "1996-09-08", "Santa Catarina", "Jaraguá do Sul");

INSERT INTO alunos_cursos (id_aluno, id_curso, status_curso)
VALUES
(1, 2, "Concluído"),
(3, 6, "Em andamento"),
(1, 7, "Concluído"),
(4, 2, "Em andamento"),
(9, 16, "Não iniciado"),
(8, 10, "Concluído"),
(1, 4, "Concluído"),
(4, 9, "Não iniciado"),
(10, 2, "Em andamento"),
(7, 1, "Concluído"),
(12, 2, "Não iniciado"),
(2, 1, "Não iniciado"),
(15, 7, "Não iniciado"),
(11, 2, "Concluído"),
(6, 13, "Em andamento"),
(3, 4, "Em andamento"),
(4, 10, "Em andamento"),
(9, 17, "Concluído"),
(1, 5, "Em andamento"),
(10, 8, "Em andamento");