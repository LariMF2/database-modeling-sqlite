CREATE TABLE Alunos_Original (
    AlunoID INTEGER PRIMARY KEY, --cria a tabela alunos original, coluna da chave primária
    Nome_Completo 	VARCHAR (100) NOT NULL, -- a coluna não aceita ficar sem informação/valor (notnulo - não nulo)
    Telefone_Residencial VARCHAR (20), --VARCHAR É texto e delimitar os nºs de caracteres dentro daquela coluna, nª em ()
    Telefone_Movel VARCHAR (20),
    Telefone_Emergencia VARCHAR (20),
),

INSERT INTO Alunos_Original (AlunoID, Nome_Completo, Telefone_Residencial, Telefone_Movel, Telefone_Emergencia) 
VALUES -- insere os dados dentro das colunas na tabela 
(1, 'Ana Ribeiro', '212345678', '912345678', '934567890'),
(2, 'Joao Martins', '213456789', '921112223', '943334445');

SELECT * FROM Alunos_Original; -- consulta ou query de dados inseridos e filtrados das colunas na tabela


/* 3B: Justificação simples: Todos estes três campos armazenam exatamente o mesmo tipo de informação: 
 * um número de telefone. Criar colunas separadas para cada "tipo" de telefone é apenas uma tentativa de contornar 
 * a limitação da tabela para guardar múltiplos contactos de uma mesma pessoa.*/

/*3C: Viola a 1FN por conter grupos repetidos de colunas (Telefone_Residencial, Telefone_Movel, Telefone_Emergencia).
Se um aluno tiver 4 telefones, não há espaço; se tiver só 1, as outras colunas ficam vazias gastando espaço à toa.*/

-- 1. Criar a nova tabela de Alunos
CREATE TABLE Aluno (
    AlunoID INTEGER PRIMARY KEY,
    Nome_Completo VARCHAR (100) NOT NULL,
);

-- 2. Criar a nova tabela de Telefones (com a ligação FK)
CREATE TABLE Telefone (
    TelefoneID INTEGER PRIMARY KEY, -- COLUNA DA CHAVE PRIMARIA 
    AlunoID INTEGER NOT NULL, 
    Telefone VARCHAR (20) NOT NULL,
    FOREIGN KEY (AlunoID) REFERENCES Aluno(AlunoID) -- COLUNAS E LIGAÇÕES DA CHAVE ESTRANGEIRA: 
);

-- 3. Inserir os Alunos
INSERT INTO Aluno (AlunoID, Nome_Completo) VALUES 
(1, 'Ana Ribeiro'),
(2, 'Joao Martins');

-- 4. Inserir todos os telefones associados aos alunos
INSERT INTO Telefone (TelefoneID, AlunoID, Telefone) VALUES 
(1, 1, '212345678'),
(2, 1, '912345678'),
(3, 1, '934567890'),
(4, 2, '213456789'),
(5, 2, '921112223'),
(6, 2, '943334445');

SELECT * --consulta/query de colunas dentro das tabelas
FROM ALUNO a, TELEFONE t
where t.alunoID = a.alunoID

--testa a junção das duas tabelas, consulta/query das colunas selecionadas
SELECT Aluno.Nome_Completo, Telefone.Telefone 
FROM Aluno 
JOIN Telefone ON Aluno.AlunoID = Telefone.AlunoID;

