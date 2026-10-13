CREATE TABLE ALUNOS (
    AlunoID INT PRIMARY KEY,
    NomeCompleto VARCHAR(100),
    DataNascimento DATE
);

INSERT INTO ALUNOS VALUES (1, 'Ana Ribeiro', '2009-03-14');
INSERT INTO ALUNOS VALUES (2, 'João Martins', '2008-07-22');
INSERT INTO ALUNOS VALUES (3, 'Marta Costa', '2009-11-05');

SELECT * FROM ALUNOS --consulta dos dados da tabela alunos

-- Exercício 1.2 - Disciplinas
-- 1.2 a) Cria, através de SQL, a tabela DISCIPLINAS, considerando os seguintes tipos de dados:
--        DisciplinaID número inteiro, NomeDisciplina texto até 100 caracteres, CargaHoraria número inteiro.
--        Define DisciplinaID como chave primária.
-- 1.2 b) Insere na nova tabela os dados apresentados anteriormente.

CREATE TABLE DISCIPLINAS (
    DisciplinaID INT PRIMARY KEY,
    NomeDisciplina VARCHAR(100),
    CargaHoraria INT
);

INSERT INTO DISCIPLINAS VALUES (1, 'Matemática', 150);
INSERT INTO DISCIPLINAS VALUES (2, 'Português', 150);
INSERT INTO DISCIPLINAS VALUES (3, 'Inglês', 100);
INSERT INTO DISCIPLINAS VALUES (4, 'História', 100);
INSERT INTO DISCIPLINAS VALUES (5, 'Geografia', 100);

SELECT * FROM DISCIPLINAS --query/consulta dos dados da tabela disciplina

/*Exercício 2 a)  Enunciado: Identifique a chave primária da tabela e justifique a sua escolha.
  Resposta: Chave Primária: Composta por (AlunoID, DisciplinaID).  Justificação: Nem AlunoID nem DisciplinaID 
  podem ser chaves isoladas, pois um aluno pode inscrever-se em várias disciplinas e uma disciplina 
  tem vários alunos. Apenas a combinação do par garante a identificação única de cada linha*/


/*Exercício 2 b)  Enunciado: Determine de que atributos depende funcionalmente:  i. o atributo NomeAluno
 *  (na tabela do enunciado aparece como NomeCompleto)  ii. o atributo NomeDisciplina  i. NomeCompleto: 
 * Depende apenas de AlunoID.  ii. NomeDisciplina: Depende apenas de DisciplinaID*/


/*Exercício 2 c)  Enunciado: Explique por que razão a tabela se encontra na 1FN, mas não se encontra na 2FN.
 Resposta Por que está na 1FN: Todos os valores das células são atómicos (únicos/indivisíveis) e não existem grupos
de colunas repetidas.  Por que NÃO está na 2FN: Existem dependências funcionais parciais.
 Atributos não-chave (como NomeCompleto e NomeDisciplina) dependem apenas de parte da 
 chave primária composta (AlunoID e DisciplinaID, respetivamente), e não da chave inteira.  */

/*Exercício 2 d) e e)  Enunciado: Reestruture a tabela em 2FN, indique as chaves e justifique
 *Tabelas e Chaves:ALUNOS (AlunoID [PK], NomeCompleto, DataNascimento).  DISCIPLINAS (DisciplinaID [PK], 
 *NomeDisciplina, CargaHoraria).  INSCRICOES (AlunoID [FK], DisciplinaID [FK], Nota) com Chave Primária Composta
 * (AlunoID, DisciplinaID).  Justificação de 2FN: Eliminaram-se as dependências parciais,
 *  fazendo com que cada atributo dependa totalmente da respetiva chave primária. 
 *  Preservação: Os dados originais mantêm-se intactos através do relacionamento entre as chaves estrangeiras. */

/* falta do 2 f em diante */
