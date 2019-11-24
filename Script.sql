DROP DATABASE IF EXISTS trabalho_banco_de_dados;
CREATE DATABASE trabalho_banco_de_dados;
USE trabalho_banco_de_dados;

-- Questão 1

CREATE TABLE Autor (
    Codigo INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    NomeAut VARCHAR(50) NOT NULL
);

CREATE TABLE Editora (
    Codigo INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    NomeEdit VARCHAR(50) NOT NULL
);

CREATE TABLE Assunto (
    Codigo INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Descricao VARCHAR(120) NOT NULL
);

CREATE TABLE Livro (
    Codigo INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Titulo VARCHAR(60) NOT NULL,
    AnoPublic INTEGER NOT NULL,
    CodEditora INTEGER NOT NULL,
    CodAssunto INTEGER NOT NULL,
    FOREIGN KEY (CodEditora) REFERENCES Editora(Codigo),
    FOREIGN KEY (CodAssunto) REFERENCES Assunto(Codigo)
);

CREATE TABLE Autoria (
    CodLivro INTEGER NOT NULL,
    CodAutor INTEGER NOT NULL,
    FOREIGN KEY (CodLivro) REFERENCES Livro(Codigo),
    FOREIGN KEY (CodAutor) REFERENCES Autor(Codigo),
    PRIMARY KEY (CodLivro, CodAutor)
);

CREATE TABLE Exemplar (
    CodExemplar INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CodLivro INTEGER NOT NULL,
    DataAquisicao DATE NOT NULL,
    ValorAquisicao REAL NOT NULL,
    FOREIGN KEY (CodLivro) REFERENCES Livro(Codigo)
);

CREATE TABLE Aluno (
    Codigo INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    DataNasc DATE NOT NULL,
    Cidade CHAR(32) NOT NULL
);

CREATE TABLE Emprestimo(
    CodEmprest INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Data DATE NOT NULL,
    CodAluno INTEGER NOT NULL,
    FOREIGN KEY (CodAluno) REFERENCES Aluno(Codigo)
);

CREATE TABLE ItemEmprest(
    CodEmprest INTEGER NOT NULL,
    Item INTEGER NOT NULL,
    CodExemplar INTEGER NOT NULL,
    DataDevol DATE NOT NULL,
    Multa REAL,
    FOREIGN KEY (CodEmprest) REFERENCES Emprestimo(CodEmprest),
    FOREIGN KEY (CodExemplar) REFERENCES Exemplar(CodExemplar),
    PRIMARY KEY (CodEmprest, Item)
);

-- Questão 2

INSERT INTO Autor (NomeAut) VALUES
    ("J.K. Rowling"),
    ("Stephen King"),
    ("Pedro Bandeira"),
    ("George R. R. Martin"),
    ("João Guimarães Rosa"),
    ("Shamkant Navathe"),
    ("Naphtali Rishe"),
    ("Machado de Assis"),
    ("Ron Larson"),
    ("Betsy Farber");

INSERT INTO Editora (NomeEdit) VALUES
    ("Rocco"),
    ("Editora Objetiva"),
    ("Moderna"),
    ("LeYa"),
    ("José Olympio"),
    ("IEEE Computer Society Press"),
    ("L&PM"),
    ("Campus"),
    ("Makron Books"),
    ("Pearson");

INSERT INTO Assunto (Descricao) VALUES
    ("Fantasia"),
    ("Horror"),
    ("Aventura"),
    ("Literatura brasileira"),
    ("Computação"),
    ("Estatística");

INSERT INTO Livro (Titulo, AnoPublic, CodEditora, CodAssunto) VALUES
    ("Harry Potter e a Pedra Filosofal", 2000, 1, 1),
    ("A Coisa", 1986, 2, 2),
    ("A Droga da Obediência", 1984, 3, 3),
    ("As Crônicas de Gelo e Fogo", 1996, 4, 1),
    ("Grande Sertão: Veredas", 1956, 5, 4),
    ("Harry Potter e a Câmara Secreta", 2000, 1, 1),
    ("Harry Potter e o Prisioneiro de Azkaban", 2000, 1, 1),
    ("Harry Potter e o Cálice de Fogo", 2001, 1, 1),
    ("Harry Potter e a Ordem da Fênix", 2003, 1, 1),
    ("Harry Potter e o Enigma do Príncipe", 2005, 1, 1),
    ("Harry Potter e as Relíquias da Morte", 2007, 1, 1),
    ("Pântano de Sangue", 1987, 3, 3),
    ("Anjo da Morte", 1988, 3, 3),
    ("A Droga do Amor", 1994, 3, 3),
    ("Droga de Americana", 2001, 3, 3),
    ("Databases: Theory, Design and Applications", 1991, 6, 5),
    ("Parallel Architectures", 1991, 6, 5),
    ("Helena", 1876, 7, 4),
    ("O Instituto", 2019, 8, 2),
    ("Estatística Aplicada", 2015, 9, 6);

INSERT INTO Autoria (CodLivro, CodAutor) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 1),
    (7, 1),
    (8, 1),
    (9, 1),
    (10, 1),
    (11, 1),
    (12, 3),
    (13, 3),
    (14, 3),
    (15, 3),
    (16, 6),
    (16, 7),
    (17, 6),
    (17, 7),
    (18, 8),
    (19, 2),
    (20, 9),
    (20, 10);

INSERT INTO Exemplar(CodLivro, DataAquisicao, ValorAquisicao) VALUES
    (1, '2019-06-15', 49.00),  (1, '2019-06-15', 20.00),
    (2, '2018-06-15', 36.00),  (2, '2019-06-15', 44.00),
    (3, '2019-06-15', 46.00),  (3, '2019-06-15', 55.00),
    (4, '2019-06-15', 47.00),  (4, '2019-06-15', 49.00),
    (5, '2019-06-15', 48.00),  (5, '2019-06-15', 57.00),
    (6, '2019-06-15', 60.00),  (6, '2019-06-15', 54.00),
    (7, '2019-06-15', 47.00),  (7, '2019-06-15', 39.00),
    (8, '2019-06-15', 20.00),  (8, '2019-06-15', 59.00),
    (9, '2019-06-15', 57.00),  (9, '2019-06-15', 52.00),
    (10, '2019-06-15', 43.00), (10, '2019-06-15', 26.00),
    (11, '2019-06-15', 57.00), (11, '2019-06-15', 27.00),
    (12, '2019-06-15', 21.00), (12, '2019-06-15', 30.00),
    (13, '2019-06-15', 48.00), (13, '2019-06-15', 36.00),
    (14, '2019-06-15', 31.00), (14, '2019-06-15', 41.00),
    (15, '2019-06-15', 55.00), (15, '2019-06-15', 47.00),
    (16, '2019-06-15', 60.00), (16, '2019-06-15', 45.00),
    (17, '2019-06-15', 58.00), (17, '2019-06-15', 43.00),
    (18, '2019-06-15', 15.00), (18, '2019-06-15', 12.00),
    (19, '2019-06-15', 43.00), (19, '2019-06-15', 47.00);

INSERT INTO Aluno(Nome, DataNasc, Cidade) VALUES
    ("Bernardo Valadares", "2005-01-05", "Belo Horizonte"),
    ("Raquel Moraes", "1996-03-24", "Belo Horizonte"),
    ("Júlio Reis", "1995-07-20", "Betim"),
    ("Paula Santos", "2002-06-06", "Belo Horizonte"),
    ("Joaquim Oliveira", "1995-03-05", "Sete Lagoas"),
    ("Rafael Cardoso", "2005-06-26", "Ribeirão das Neves"),
    ("Ana Clara", "2004-05-01", "Belo Horizonte"),
    ("Sara Pena", "2000-04-08", "Belo Horizonte"),
    ("Cláudio Carvalho", "2000-04-08", "Contagem"),
    ("Maria Clara", "2002-05-05", "Sabará");

INSERT INTO Emprestimo(Data, CodAluno) VALUES
    ("2019-09-07", 7),
    ("2019-09-13", 7),
    ("2019-09-04", 7),
    ("2018-10-30", 7),
    ("2018-06-30", 7),
    ("2018-10-12", 7),
    ("2018-10-31", 7),
    ("2018-02-18", 7),
    ("2018-12-13", 7),
    ("2018-01-25", 7),
    ("2018-04-26", 6),
    ("2018-02-23", 3),
    ("2018-03-13", 3),
    ("2018-11-16", 6),
    ("2018-08-29", 9),
    ("2018-12-06", 6),
    ("2018-02-01", 1),
    ("2018-06-28", 8),
    ("2018-04-12", 2),
    ("2018-02-19", 9),
    ("2018-02-06", 6),
    ("2018-04-02", 2),
    ("2018-04-24", 4),
    ("2018-08-29", 9),
    ("2018-01-19", 9),
    ("2018-02-13", 3),
    ("2018-08-15", 5),
    ("2018-09-29", 9),
    ("2018-11-26", 6),
    ("2018-06-17", 7),
    ("2018-09-29", 9),
    ("2018-11-26", 6),
    ("2018-06-17", 7),
    ("2018-09-29", 9),
    ("2018-11-26", 6),
    ("2018-06-17", 7);

INSERT INTO ItemEmprest(CodEmprest, Item, CodExemplar, DataDevol, Multa) VALUES
    ( 1,  1,  7, "2019-09-08", 3.00),
    ( 2,  2,  1, "2019-09-15", 9.00),
    ( 3,  3,  2, "2019-09-07", 2.00),
    ( 4,  4, 13, "2019-08-27", 6.00),
    ( 5,  5,  4, "2019-09-04", 10.00),
    ( 6,  6,  5, "2019-09-09", NULL),
    ( 7,  7,  6, "2019-09-11", 1.00),
    ( 8,  8,  7, "2019-09-18", 8.00),
    ( 9,  9,  8, "2019-10-08", 5.00),
    (10, 10,  9, "2019-10-22", 1.00),
    (11, 11, 10, "2019-10-27", NULL),
    (12, 12,  1, "2019-11-12", 6.00),
    (13, 13,  7, "2019-08-08", 4.00),
    (14, 14,  1, "2019-07-27", 1.00),
    (15, 15, 12, "2019-07-30", 3.00),
    (16, 16,  3, "2019-08-27", NULL),
    (17, 17,  4, "2019-09-04", 5.00),
    (18, 18, 15, "2019-09-09", NULL),
    (19, 19,  6, "2019-09-17", 10.00),
    (20, 20,  7, "2019-09-23", 7.00),
    (21, 21,  8, "2019-10-08", 1.00),
    (22, 22,  9, "2019-10-22", 8.00),
    (23, 23, 10, "2019-10-27", 8.00),
    (24, 24,  1, "2019-11-12", 9.00),
    (25, 25, 13, "2019-08-27", 8.00),
    (26, 26,  4, "2019-09-04", 5.00),
    (27, 27, 15, "2019-09-09", 2.00),
    (28, 28,  6, "2019-09-17", 10.00),
    (29, 29,  7, "2019-09-23", 2.00),
    (30, 30,  8, "2019-10-08", 9.00),
    (31, 31,  35, "2019-09-17", 10.00),
    (32, 32,  35, "2019-09-23", 2.00),
    (33, 33,  36, "2019-10-08", 9.00),
    (34, 34,  35, "2019-09-17", 10.00),
    (35, 35,  35, "2019-09-23", 2.00),
    (36, 36,  36, "2019-10-08", 9.00);

-- Questão 3
/* SELECT l.Titulo, l.AnoPublic, COUNT(e.CodExemplar), AVG(e.ValorAquisicao)
    FROM Livro l
    INNER JOIN Exemplar e ON (e.CodLivro=l.Codigo)
    INNER JOIN Assunto a ON (a.Codigo=l.CodAssunto)
    WHERE e.DataAquisicao BETWEEN '2019-01-01' AND '2019-12-31'
        AND a.Descricao = "Literatura brasileira"
    GROUP BY l.Codigo; */

-- Questão 4
/* SELECT l. Titulo, em.Data, ie.Multa
    FROM Livro l
    INNER JOIN Exemplar ex ON (ex.CodLivro = l.Codigo)
    INNER JOIN ItemEmprest ie ON (ie.CodExemplar = ex.CodExemplar)
    INNER JOIN Emprestimo em ON (em.CodEmprest = ie.CodEmprest)
    INNER JOIN Aluno al ON (al.Codigo = em.CodAluno)
    WHERE al.Nome LIKE "Bernardo Valadares"; */

-- Questão 5
/* SELECT al.*
    FROM Aluno al
    WHERE al.Codigo NOT IN (
        SELECT em.CodAluno FROM Emprestimo em
    ); */

-- Questão 6
/* SELECT al.Nome, COUNT(em.CodEmprest)
    FROM Aluno al
    LEFT JOIN Emprestimo em ON (em.CodAluno = al.Codigo)
    GROUP BY al.Codigo; */

-- Questão 7
/* SELECT a.NomeAut
    FROM Autor a
    INNER JOIN Autoria au ON (au.CodAutor = a.Codigo)
    INNER JOIN Livro l ON (l.Codigo = au.CodLivro)
    INNER JOIN Assunto ass ON (ass.Codigo = l.CodAssunto)
    WHERE ass.Descricao = "Literatura brasileira"; */

-- Questão 8
/* SELECT al.Nome
    FROM Aluno al
    INNER JOIN Emprestimo em ON (em.CodAluno = al.Codigo)
    INNER JOIN ItemEmprest ie ON (ie.CodEmprest = em.CodEmprest)
    INNER JOIN Exemplar ex ON (ex.CodExemplar = ie.CodExemplar)
    INNER JOIN Livro l ON (l.Codigo = ex.CodLivro)
    GROUP BY al.Codigo
    HAVING COUNT(l.Codigo) > 10; */

-- Questão 9
/* SELECT a.NomeAut
    FROM Autor a
    INNER JOIN Autoria au ON (au.CodAutor = a.Codigo)
    WHERE au.CodLivro IN (
        SELECT l.Codigo
            FROM Livro l
            INNER JOIN Autoria au ON (au.CodLivro = l.Codigo)
            INNER JOIN Autor a ON (a.Codigo = au.CodAutor)
            WHERE a.NomeAut LIKE "% Navathe"
    ) AND a.NomeAut NOT LIKE "% Navathe"
    GROUP BY a.Codigo; */

-- Questão 10
/* SELECT a.NomeAut
    FROM Autor a
    INNER JOIN Autoria au ON (au.CodAutor = a.Codigo)
    GROUP BY a.Codigo
    HAVING COUNT(au.CodLivro) > (
        SELECT COUNT(au.CodLivro)
            FROM Autoria au
            INNER JOIN Autor a ON (a.Codigo = au.CodAutor)
            WHERE a.NomeAut LIKE "% Navathe"
    ); */

-- Questão 11
/* SELECT al.Nome, AVG(ie.Multa)
    FROM Aluno al
    INNER JOIN Emprestimo e ON (e.CodAluno = al.Codigo)
    INNER JOIN ItemEmprest ie ON (ie.CodEmprest = e.CodEmprest)
    WHERE ie.Multa IS NOT NULL
    GROUP BY al.Codigo
    HAVING AVG(ie.Multa) > (
        SELECT AVG(ie.Multa)
            FROM Aluno al
            INNER JOIN Emprestimo e ON (e.CodAluno = al.Codigo)
            INNER JOIN ItemEmprest ie ON (ie.CodEmprest = e.CodEmprest)
            WHERE al.Cidade = "Belo Horizonte"
                AND ie.Multa IS NOT NULL
    ); */

-- Questão 12
/* SELECT al.Nome
    FROM Aluno al
    INNER JOIN Emprestimo em ON (em.CodAluno = al.Codigo)
    GROUP BY al.Codigo
    HAVING COUNT(em.CodEmprest) > (
        SELECT COUNT(ie.CodEmprest)
            FROM ItemEmprest ie
            INNER JOIN Exemplar ex ON (ex.CodExemplar = ie.CodExemplar)
            INNER JOIN Livro l ON (l.Codigo = ex.CodLivro)
            INNER JOIN Autoria au ON (au.CodLivro = l.Codigo)
            INNER JOIN Autor a ON (a.Codigo = au.CodAutor)
            WHERE a.NomeAut LIKE "Machado de Assis"
            GROUP BY l.Codigo
    ); */

-- Questão 13
/* SELECT ed.NomeEdit
    FROM Editora ed
    INNER JOIN Livro l ON (l.CodEditora = ed.Codigo)
    GROUP BY ed.Codigo
    HAVING COUNT(l.Codigo) > (
        SELECT COUNT(l.Codigo)
            FROM Editora ed
            INNER JOIN Livro l ON (l.CodEditora = ed.Codigo)
            WHERE ed.NomeEdit LIKE "Campus"
            GROUP BY ed.Codigo
    ); */

-- Questão 14
/* SELECT l.Titulo, al.Nome
    FROM Livro l
    INNER JOIN Exemplar ex ON (ex.CodLivro = l.Codigo)
    INNER JOIN ItemEmprest ie ON (ie.CodExemplar = ex.CodExemplar)
    INNER JOIN Emprestimo em ON (em.CodEmprest = ie.CodEmprest)
    INNER JOIN Aluno al ON (al.Codigo = em.CodAluno)
    WHERE em.Data BETWEEN '2019-09-01' AND '2019-09-30'
        AND ie.DataDevol - em.Data <= 2
    GROUP BY l.Codigo, al.Codigo; */

-- Questão 15
/* SELECT l.Titulo, COUNT(ie.CodEmprest)
    FROM Livro l
    INNER JOIN Exemplar ex ON (ex.CodLivro = l.Codigo)
    INNER JOIN ItemEmprest ie ON (ie.CodExemplar = ex.CodExemplar)
    INNER JOIN Emprestimo em ON (em.CodEmprest = ie.CodEmprest)
    WHERE em.Data BETWEEN '2019-01-01' AND '2019-12-31'
    GROUP BY l.Codigo
    HAVING COUNT(ie.CodEmprest) = (
        SELECT COUNT(ie.CodEmprest)
            FROM ItemEmprest ie
            INNER JOIN Exemplar ex ON (ex.CodExemplar = ie.CodExemplar)
            INNER JOIN Livro l ON (l.Codigo = ex.CodLivro)
            INNER JOIN Emprestimo em ON (em.CodEmprest = ie.CodEmprest)
            WHERE em.Data BETWEEN '2019-01-01' AND '2019-12-31'
            GROUP BY l.Codigo
            ORDER BY COUNT(ie.CodEmprest) DESC LIMIT 1
    ); */

-- Questão 16
/* SELECT l.Titulo, ex.CodExemplar
    FROM Livro l
    INNER JOIN Exemplar ex ON (ex.CodLivro = l.Codigo)
    INNER JOIN Editora ed ON (ed.Codigo = l.CodEditora)
    WHERE ex.ValorAquisicao > (
        SELECT AVG(ex2.ValorAquisicao)
            FROM Livro l2
            INNER JOIN Exemplar ex2 ON (ex2.CodLivro = l2.Codigo)
            INNER JOIN Editora ed2 ON (ed2.Codigo = l2.CodEditora)
            WHERE ed2.Codigo = ed.Codigo
            GROUP BY ed2.Codigo
            ORDER BY AVG(ex2.ValorAquisicao) DESC LIMIT 1
    )
    GROUP BY ex.CodExemplar; */

-- Questão 17
/* DELETE FROM Aluno WHERE Codigo = (
    SELECT al.Codigo
        FROM Aluno al
        LEFT JOIN Emprestimo em ON (em.CodAluno = al.Codigo)
        WHERE em.CodEmprest IS NULL
); */

-- Questão 18
/* UPDATE Livro SET CodEditora = (
    SELECT Codigo
        FROM Editora
        WHERE NomeEdit LIKE "Pearson"
        LIMIT 1
) WHERE CodEditora = (
    SELECT Codigo
        FROM Editora
        WHERE NomeEdit LIKE "Makron Books"
        LIMIT 1
); */