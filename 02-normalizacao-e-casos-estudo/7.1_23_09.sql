PRAGMA foreign_keys = ON; --ativa a verificação de chave estrangeira no sqlite

--a) e b):
-- 1. Tabela FORMADOR
CREATE TABLE FORMADOR (
    id_formador INTEGER PRIMARY KEY,
    nome_formador TEXT NOT NULL,
    especializacao TEXT NOT NULL
);

-- 2. Tabela CURSO
CREATE TABLE CURSO (
    id_curso INTEGER PRIMARY KEY,
    nome_curso TEXT NOT NULL,
    dificuldade TEXT NOT NULL,
    id_formador INTEGER NOT NULL,
    FOREIGN KEY (id_formador) REFERENCES FORMADOR(id_formador)
);

-- 3. Tabela INSCRICOES (em 3FN - sem a coluna redundante 'nome_curso')
CREATE TABLE INSCRICOES (
    id_registo INTEGER PRIMARY KEY,
    nome_aluno TEXT NOT NULL,
    id_curso INTEGER NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES CURSO(id_curso)
);

-- Inserir dados na tabela Formadores
INSERT INTO FORMADOR (id_formador, nome_formador, especializacao)
VALUES 
(1, 'Sara Costa', 'Ciência de Dados'),
(2, 'Tomás Martins', 'Aprendizagem Automática'),
(3, 'Emília Brown', 'Python');

-- Inserir dados na tabela Cursos
INSERT INTO CURSO (id_curso, nome_curso, dificuldade, id_formador) VALUES
(201, 'Fundamentos de SQL', 'Iniciante', 1),
(202, 'Introdução ao Python', 'Iniciante', 3),
(203, 'Compreender a Ciência de Dados', 'Intermédio', 1);

-- Inserir Inscrições
INSERT INTO INSCRICOES (id_registo, nome_aluno, id_curso) VALUES
(1001, 'Alice Smith', 201),
(1002, 'Bob Green', 202),
(1003, 'Charlie Blue', 201);

--c) alterar nome do curso:
UPDATE CURSO -- atualizar a tabela X
SET nome_curso = 'Fundamentos básicos de SQL' --set é para inicializar e atualizar a colunba X
WHERE id_curso = 201; --de onde vem a inf a ser atualizada

--d) alterar nome do curso:
UPDATE CURSO 
SET nome_curso = 'Análise de Dados em Python'
WHERE id_curso = 202;

--e) adiciona o ano letivo a inscrições
ALTER TABLE INSCRICOES
ADD COLUMN ano_letivo TEXT;

--f) atualiza o nome da coluna ano letivo, dentro da tabela inscrições
UPDATE INSCRICOES
SET ano_letivo = '2026/2027';

--g) deleta a inscrição do indentificador:
DELETE FROM INSCRICOES
WHERE id_registo = 1001;

--h) deleta o identificador 1002 e verifica se foi executado:
DELETE FROM INSCRICOES
WHERE id_registo = 1002;
-- Verificação da eliminação:
SELECT * FROM INSCRICOES;

--i)query/consulta pega inf de duas tabelas para ter as consulta dos inscritos
SELECT COUNT(i.id_registo) AS total_alunos
FROM INSCRICOES i
JOIN CURSO c ON i.id_curso = c.id_curso
WHERE c.nome_curso = 'Fundamentos básicos de SQL';

--j) nomes dos alunos que não estão inc. no sql - query/consulta 
SELECT i.nome_aluno
FROM INSCRICOES i
JOIN CURSO c ON i.id_curso = c.id_curso
WHERE c.nome_curso <> 'Fundamentos básicos de SQL';

--k)cursos com alunos inscritos, query/consulta
SELECT DISTINCT c.id_curso, c.nome_curso
FROM CURSO c
JOIN INSCRICOES i ON c.id_curso = i.id_curso;

--i) mostras alunos que náo estáo inscritos, query/consulta
SELECT c.id_curso, c.nome_curso
FROM CURSO c
LEFT JOIN INSCRICOES i ON c.id_curso = i.id_curso
WHERE i.id_registo IS NULL;

--m) tinha de dar erro, por cauisa da chave estrangeira
INSERT INTO INSCRICOES (id_registo, nome_aluno, id_curso, ano_letivo)
VALUES (1004, 'Daniel Sousa', 999, '2026/2027');

--n) para eliminar colunas ou linhas / não executei
DELETE FROM INSCRICOES;
DELETE FROM CURSO;
DELETE FROM FORMADOR;

--o) eliminar as  tabelas, por ordem / não executei
DROP TABLE IF EXISTS INSCRICOES; 
DROP TABLE IF EXISTS CURSO;
DROP TABLE IF EXISTS FORMADOR;

