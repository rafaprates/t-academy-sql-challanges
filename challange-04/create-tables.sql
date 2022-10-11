DROP DATABASE exercicio_04;
CREATE DATABASE exercicio_04;
USE exercicio_04;

CREATE TABLE cargo (
	codigo_cargo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(64),
    salario DOUBLE
);

CREATE TABLE colaborador (
	codigo_colaborador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(64),
    data_nascimento DATE,
	fk_codigo_cargo INT,
    estado VARCHAR(2),
    cidade VARCHAR(20),
    genero VARCHAR(10),
	FOREIGN KEY (fk_codigo_cargo) REFERENCES cargo(codigo_cargo)
);

INSERT INTO cargo (nome, salario)
VALUES 
("desenvolvedor",3000),
("analista",4500),
("arquiteto de software", 6200),
("DBA", 7700),
("gerente de projetos", 9000);


INSERT INTO colaborador (nome, data_nascimento, fk_codigo_cargo, estado, cidade, genero)
VALUES
('Jefferson', '1973-05-19', 1, 'SC', 'Blumenau', 'Masculino'),
('Larissa', '1991-01-22', 5, 'SC', 'Joinville', 'Feminino'),
('Cleber', '1987-03-18', 2, 'PR', 'Curitiba', 'Masculino'),
('Luciano', '1995-08-09', 1, 'SC', 'Blumenau', 'Masculino'),
('Jéssica', '1988-08-22', 4, 'SC', 'Florianópolis', 'Feminino'),
('Guilherme', '1982-11-16', 2, 'SC', 'Blumenau', 'Masculino'),
('Marcelo', '1993-04-15', 2, 'PR', 'Londrina', 'Masculino'),
('Brenda', '1992-02-17', 1, 'SC', 'Joinville', 'Feminino'),
('Rebeca', '1984-06-26', 4, 'SC', 'Blumenau', 'Feminino'),
('Cristiano', '1983-07-02', 1, 'SC', 'Florianópolis', 'Masculino'),
('Éder', '1991-05-10', 1, 'SC', 'Blumenau', 'Masculino'),
('William', '1992-12-17', 2, 'PR', 'Curitiba', 'Masculino'),
('Vanessa', '1996-09-29', 1, 'SC', 'Blumenau', 'Feminino'),
('Robson', '1984-05-30', 1, 'PR', 'Londrina', 'Masculino'),
('Tatiana', '1990-02-03', 5, 'PR', 'Curitiba', 'Feminino'),
('Henrique', '1999-10-07', 1, 'SC', 'Blumenau', 'Masculino'),
('Lorena', '1996-04-20', 1, 'SC', 'Joinville', 'Feminino'),
('Carla', '1988-09-28', 4, 'PR', 'Curitiba', 'Feminino'),
('Alexandre', '1982-07-17', 2, 'SC', 'Blumenau', 'Masculino');