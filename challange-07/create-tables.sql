DROP DATABASE exercicio_07;
CREATE DATABASE exercicio_07;
USE exercicio_07;

CREATE TABLE professores(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20)
);

CREATE TABLE cursos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20),
    valor DOUBLE,
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES professores(id)
);

CREATE TABLE alunos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20),
    nascimento DATE,
    estado VARCHAR(20),
    cidade VARCHAR(40)
);

CREATE TABLE alunos_cursos(
	id_aluno INT,
    id_curso INT,
    status_curso VARCHAR(20),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id),
    FOREIGN KEY (id_curso) REFERENCES cursos(id)
);