CREATE TABLE Professor_Original (
    ProfessorID INTEGER PRIMARY KEY, -- TABELA CRIADA, COLUNA DA CHAVE PRIMARIA
    Nome_Completo VARCHAR (100) NOT NULL,
    Disciplinas VARCHAR (50) NOT NULL
);

INSERT INTO Professor_Original (ProfessorID, Nome_Completo, Disciplinas) --COLOCAMOS VALORES DENTRO DA TABELA 
VALUES
(1, 'Carlos Silva', 'Matematica, Fisica, Estatistica'),
(2, 'Sofia Costa', 'Biologia, Quimica, Genetica');

SELECT * FROM Professor_Original po --CONSULTA/QUERY DAS INF. INSERIDAS

-- 1. Tabela PROFESSOR
CREATE TABLE PROFESSOR (
    ProfessorID INTEGER PRIMARY KEY,
    Nome_Completo VARCHAR (100) NOT NULL
);

-- 2. Tabela DISCIPLINA
CREATE TABLE DISCIPLINA (
    DisciplinaID INTEGER PRIMARY KEY,
    Nome_Disciplina VARCHAR (50) NOT NULL
);

-- 3. Tabela de Ligação PROFESSOR_DISCIPLINA
CREATE TABLE PROFESSOR_DISCIPLINA (
    ProfessorID INTEGER NOT NULL,
    DisciplinaID INTEGER NOT NULL,
    PRIMARY KEY (ProfessorID, DisciplinaID),
    FOREIGN KEY (ProfessorID) REFERENCES PROFESSOR(ProfessorID),
    FOREIGN KEY (DisciplinaID) REFERENCES DISCIPLINA(DisciplinaID)
);

-- Inserir os dados na coluna dos Professores
INSERT INTO PROFESSOR (ProfessorID, Nome_Completo) 
VALUES 
(1, 'Carlos Silva'),
(2, 'Sofia Costa');

-- Inserir os dados na coluna das Disciplinas
INSERT INTO DISCIPLINA (DisciplinaID, Nome_Disciplina) 
VALUES 
(1, 'Matematica'),
(2, 'Fisica'),
(3, 'Estatistica'),
(4, 'Biologia'),
(5, 'Quimica'),
(6, 'Genetica');

--Inserir as associações (quem leciona o quê)
INSERT INTO PROFESSOR_DISCIPLINA (ProfessorID, DisciplinaID) VALUES 
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6);

SELECT * --CONSULTA/QUERY DAS COLUNAS DENTRO DA TABELA 
FROM PROFESSOR_DISCIPLINA pd 

SELECT 
    PROFESSOR.ProfessorID, 
    PROFESSOR.Nome_Completo, 
    DISCIPLINA.DisciplinaID, 
    DISCIPLINA.Nome_Disciplina
FROM PROFESSOR_DISCIPLINA, PROFESSOR, DISCIPLINA
WHERE PROFESSOR_DISCIPLINA.ProfessorID = PROFESSOR.ProfessorID
  AND PROFESSOR_DISCIPLINA.DisciplinaID = DISCIPLINA.DisciplinaID;

-- 3.3.1. Listar o identificador e o nome completo de todos os professores.
SELECT ProfessorID, Nome_Completo 
FROM PROFESSOR;

--3.3.2Apresentar todas as disciplinas por ordem alfabética. 
SELECT Nome_Disciplina 
FROM DISCIPLINA
ORDER BY Nome_Disciplina ASC;

--3.3.3nome do professor
SELECT 
    PROFESSOR.Nome_Completo, 
    PROFESSOR_DISCIPLINA.DisciplinaID
FROM PROFESSOR, PROFESSOR_DISCIPLINA
WHERE PROFESSOR.ProfessorID = PROFESSOR_DISCIPLINA.ProfessorID;

--3.3.4nome do professor que leciona com a disc. 1

SELECT ProfessorID 
FROM PROFESSOR_DISCIPLINA
WHERE DisciplinaID = 1;


--5. Listar as disciplinas lecionadas pelo professor com o identificador 2.
SELECT DISCIPLINA.Nome_Disciplina
FROM DISCIPLINA, PROFESSOR_DISCIPLINA
WHERE DISCIPLINA.DisciplinaID = PROFESSOR_DISCIPLINA.DisciplinaID
  AND PROFESSOR_DISCIPLINA.ProfessorID = 2;

/*3.3.6 Apresentar o nome de cada professor e o nome das respetivas disciplinas, ordenando os
resultados pelo nome do professor.*/

SELECT 
    PROFESSOR.Nome_Completo, 
    DISCIPLINA.Nome_Disciplina
FROM PROFESSOR_DISCIPLINA, PROFESSOR, DISCIPLINA
WHERE PROFESSOR_DISCIPLINA.ProfessorID = PROFESSOR.ProfessorID
  AND PROFESSOR_DISCIPLINA.DisciplinaID = DISCIPLINA.DisciplinaID
ORDER BY PROFESSOR.Nome_Completo ASC;

--3.3.7. Listar os nomes dos professores que lecionam Matemática.

SELECT PROFESSOR.Nome_Completo
FROM PROFESSOR, PROFESSOR_DISCIPLINA, DISCIPLINA
WHERE PROFESSOR.ProfessorID = PROFESSOR_DISCIPLINA.ProfessorID
  AND PROFESSOR_DISCIPLINA.DisciplinaID = DISCIPLINA.DisciplinaID
  AND DISCIPLINA.Nome_Disciplina = 'Matematica';

--3.3.8. Apresentar os nomes das disciplinas lecionadas por Sofia Costa.

SELECT DISCIPLINA.Nome_Disciplina
FROM DISCIPLINA, PROFESSOR_DISCIPLINA, PROFESSOR
WHERE DISCIPLINA.DisciplinaID = PROFESSOR_DISCIPLINA.DisciplinaID
  AND PROFESSOR_DISCIPLINA.ProfessorID = PROFESSOR.ProfessorID
  AND PROFESSOR.Nome_Completo = 'Sofia Costa';

--3.3.9. Listar os professores que lecionam uma disciplina cujo nome começa pela letra «F».

SELECT DISTINCT PROFESSOR.Nome_Completo
FROM PROFESSOR, PROFESSOR_DISCIPLINA, DISCIPLINA
WHERE PROFESSOR.ProfessorID = PROFESSOR_DISCIPLINA.ProfessorID
  AND PROFESSOR_DISCIPLINA.DisciplinaID = DISCIPLINA.DisciplinaID
  AND DISCIPLINA.Nome_Disciplina LIKE 'F%';

/*3.3.10. Apresentar os nomes dos professores e das disciplinas associadas, 
 ordenando os resultados primeiro pelo nome da disciplina e depois pelo nome do professor.*/

SELECT 
    PROFESSOR.Nome_Completo, 
    DISCIPLINA.Nome_Disciplina
FROM PROFESSOR_DISCIPLINA, PROFESSOR, DISCIPLINA
WHERE PROFESSOR_DISCIPLINA.ProfessorID = PROFESSOR.ProfessorID
  AND PROFESSOR_DISCIPLINA.DisciplinaID = DISCIPLINA.DisciplinaID
ORDER BY 
    DISCIPLINA.Nome_Disciplina ASC, 
    PROFESSOR.Nome_Completo ASC;

--3.3.10 - com join:
SELECT 
    PROFESSOR.Nome_Completo, 
    DISCIPLINA.Nome_Disciplina
FROM PROFESSOR_DISCIPLINA
JOIN PROFESSOR 
    ON PROFESSOR_DISCIPLINA.ProfessorID = PROFESSOR.ProfessorID
JOIN DISCIPLINA 
    ON PROFESSOR_DISCIPLINA.DisciplinaID = DISCIPLINA.DisciplinaID
ORDER BY 
    DISCIPLINA.Nome_Disciplina ASC, 
    PROFESSOR.Nome_Completo ASC;


/*Com JOIN: As ligações entre tabelas ficam isoladas no JOIN ... 
 ON e o WHERE serve apenas para filtrar o resultado final.
Com WHERE ... AND: As tabelas são listadas no FROM e todas as regras 
(tanto as ligações das chaves como os filtros de texto/número) 
são juntas no WHERE usando a palavra AND.*/
