CREATE DATABASE exercicio_06;
USE exercicio_06;

CREATE TABLE professores (
    codigoProfessor INT PRIMARY KEY AUTO_INCREMENT,
    nomeProfessor VARCHAR(20)
);



CREATE TABLE materias (
    codigoMateria INT PRIMARY KEY AUTO_INCREMENT,
    codigoProfessor INT,
    nomeMateria VARCHAR(20),
    CONSTRAINT fk_professor FOREIGN KEY (codigoProfessor)
        REFERENCES professores (codigoProfessor)
);



CREATE TABLE turmas (
    codigoTurma INT PRIMARY KEY AUTO_INCREMENT,
    nomeTurma VARCHAR(2),
    turnoTurma VARCHAR(10)
);



CREATE TABLE alunos (
    codigoAluno INT PRIMARY KEY AUTO_INCREMENT,
    nomeAluno VARCHAR(30)
);



CREATE TABLE alunos_turmas (
    codigoAluno INT,
    codigoMateria INT,
    codigoTurma INT,
    CONSTRAINT fk_alunos FOREIGN KEY (codigoAluno)
        REFERENCES alunos (codigoAluno),
    CONSTRAINT fk_materias FOREIGN KEY (codigoMateria)
        REFERENCES materias (codigoMateria),
    CONSTRAINT fk_turmas FOREIGN KEY (codigoTurma)
        REFERENCES turmas (codigoTurma)
);



insert into professores (nomeProfessor) values
    ('Renato'),
    ('Oscar'),
    ('Cátia'),
    ('Osvaldo'),
    ('Marília'),
    ('Paula'),
    ('Otávio'),
    ('Airton');



insert into materias (codigoProfessor, nomeMateria) values
    (1, 'Matemática'),
    (2, 'Geografia'),
    (7, 'Química'),
    (6, 'Filosofia'),
    (1, 'Física'),
    (3, 'Português'),
    (3, 'Inglês'),
    (6, 'Sociologia'),
    (5, 'Português'),
    (4, 'História'),
    (4, 'Sociologia'),
    (5, 'Espanhol'),
    (8, 'Biologia'),
    (8, 'Química');
    
insert into turmas(nomeTurma, turnoTurma) values
    ('6A', 'Matutino'),
    ('6B', 'Vespertino'),
    ('7A', 'Matutino'),
    ('7B', 'Vespertino'),
    ('8A', 'Matutino'),
    ('8B', 'Vespertino');
    
insert into alunos (nomeAluno) values
    ('Alessandra'),
    ('Emanuela'),
    ('Cíntia'),
    ('Diego'),
    ('Eduardo'),
    ('Larissa'),
    ('Jonathan'),
    ('Cleber'),
    ('Jéssica'),
    ('Lucas'),
    ('Murilo'),
    ('Marcelo'),
    ('Rebeca'),
    ('Tatiana'),
    ('Taís'),
    ('Gabriel'),
    ('Felipe'),
    ('Eliza'),
    ('Sarah'),
    ('Patrícia');



insert into alunos_turmas(codigoAluno, codigoMateria, codigoTurma) values
    (1, 1, 1),
    (2, 5, 1),
    (3, 10, 2),
    (4, 14, 1),
    (5, 1, 1),
    (6, 2, 6),
    (7, 3, 2),
    (8, 6, 3),
    (9, 5, 4),
    (10, 4, 4),
    (11, 1, 5),
    (12, 5, 2),
    (13, 8, 3),
    (14, 13, 6),
    (15, 6, 5),
    (16, 14, 3),
    (17, 9, 5),
    (18, 3, 1),
    (19, 8, 4),
    (20, 5, 6),
    (4, 10, 3),
    (15, 2, 1),
    (12, 10, 1),
    (9, 8, 6);