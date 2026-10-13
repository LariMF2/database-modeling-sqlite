-- AULA 09/09/2026 -  ex dia 09/09/26 - tabela de livros e reviews

PRAGMA foreign_keys = ON; -- para ativar o conceito de chave estrangeira

/*VARCHAR é "igual ao TEXT" mas leva a frente (50) um numero dentro do parenteses 
 * que serve para delimitar os caracteres que serão inseridos dentro daquela coluna*/

--2 A, B e C: tabela books + chave primaria
CREATE TABLE books(
id INTEGER PRIMARY KEY,
title TEXT,
author TEXT,
published_date TEXT,
isbn TEXT
);

-- tabelas reviews + CHAVE ESTRANGEIRA
CREATE TABLE reviews (
id INTEGER PRIMARY KEY,
book_id INTEGER,
reviewer_name TEXT,
    content TEXT,
    rating INTEGER,
    published_date TEXT,
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- 2 d,e - Inserir os 3 livros da tabela BOOKS
INSERT INTO books (id, title, author, published_date, isbn) VALUES
(1, 'My First SQL book', 'Mary Parker', '2012-02-22 12:08:17.320053-03', '981483029127'),
(2, 'My Second SQL book', 'John Mayer', '1972-07-03 09:22:45.050088-07', '857300923713'),
(3, 'My Third SQL book', 'Cary Flint', '2015-10-18 14:05:44.547516-07', '523120967812');

-- Inserir as 3 avaliações da tabela REVIEWS
INSERT INTO reviews (id, book_id, reviewer_name, content, rating, published_date) VALUES
(1, 1, 'John Smith', 'My first review', 4, '2017-12-10 05:50:11.127281-02'),
(2, 2, 'John Smith', 'My second review', 5, '2017-10-13 15:05:12.673382-05'),
(3, 2, 'Alice Walker', 'Another review', 1, '2017-10-22 23:47:10.407569-07');

--2G - teste da chave estrangeira - deu erro, inserir nova avaliação
INSERT INTO books (id, title, author, published_date, isbn)
VALUES (1, 'SQL Avançado', 'Pedro Álvares', '2024-01-01', '123456789');

--Query/Consultas - 3A Lista todos os registos e colunas da tabela
SELECT * FROM books;

--3B Apresenta apenas os campos title e author de todos os livros registados
SELECT title, author FROM books;

--3C Seleciona toda a informação do livro cujo id é igual a 2
SELECT * FROM books 
WHERE id = 2;

--3.d) Lista todos os registos e colunas da tabela reviews
SELECT * FROM reviews;

--3.e) Mostra apenas os campos reviewer_name e rating de todas as avaliações
SELECT reviewer_name, rating FROM reviews;

--3.f) Lista todas as avaliações que apresentem uma classificação (rating) igual ou superior a 4
SELECT * FROM reviews 
WHERE rating >= 4;

--3.g) Seleciona todas as avaliações efetuadas exclusivamente pelo utilizador "John Smith"
SELECT * FROM reviews 
WHERE reviewer_name = 'John Smith';
















