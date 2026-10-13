CREATE TABLE CLIENTES (
id_cliente INTEGER PRIMARY KEY,
nome TEXT,
email TEXT
);

--criar tabela de encomendas ^ clientes - aula 07/09/2026

CREATE TABLE ENCOMENDAS (
    id_encomenda INTEGER PRIMARY KEY, -- chave primaria 
    data_encomenda TEXT,
    cliente_id INTEGER,
    valor REAL,
    FOREIGN KEY (cliente_id) REFERENCES CLIENTES(id_cliente) --chave estrangeira - coluna de referencia 
);

--2.a) Inserir os 3 Clientes
INSERT INTO CLIENTES (id_cliente, nome, email)VALUES 
(1, 'Ana Silva', 'ana@email.pt'),
(2, 'Bruno Costa', 'bruno@email.pt' ),
(3, 'Carla Mendes', 'carla@email.pt');

-- 2.b) Inserimos as 3 encomendas
INSERT INTO ENCOMENDAS (id_encomenda, data_encomenda, cliente_id, valor) VALUES 
(101, '2024-03-01', 1, 120.00),
(102, '2024-03-02', 1, 45.00),
(103, '2024-03-03', 2, 78.50);

-- consulta do que foi inserido - ex 3

SELECT * FROM CLIENTES; --query/consulta de dados da tabela

SELECT * FROM ENCOMENDAS; 

SELECT nome, email FROM CLIENTES;

SELECT * FROM ENCOMENDAS 
WHERE valor > 50;
and c.id_cliente = enc.cliente_id --condição para ligar as colunas das 2 tabelas, pode usar o JOIN


-- ex 4 - tem relação com a chave estrangeira, ex1 - e; esse é o b - ainda por corrigir 
SELECT ENCOMENDAS.id_encomenda, CLIENTES.nome
FROM ENCOMENDAS
JOIN CLIENTES ON ENCOMENDAS.cliente_id = CLIENTES.id_cliente;

--ex4 - c, encomendas da ana silva

SELECT COUNT(*) AS total_encomendas
FROM ENCOMENDAS 
JOIN CLIENTES ON ENCOMENDAS.cliente_id = CLIENTES.id_cliente 
WHERE CLIENTES.nome = 'Ana Silva';

--ex4 - d, cliente e valor da sua encomenda 
SELECT CLIENTES.nome, ENCOMENDAS.valor
FROM ENCOMENDAS 
JOIN CLIENTES ON ENCOMENDAS.cliente_id = CLIENTES.id_cliente;

--5 ex 5 d é o mesmo codigo do ex 1 - mas em tese estaria sem a chave primari ae chave estrangeira, por isso repetiu aqui 









