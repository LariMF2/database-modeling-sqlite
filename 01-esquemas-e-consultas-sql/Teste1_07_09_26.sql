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
    FOREIGN KEY (cliente_id) REFERENCES CLIENTES(id_cliente) --chave estrangeira - coluna de referencia, seq 1º tabela, 2coluna
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

SELECT * FROM ENCOMENDAS e
WHERE valor > 50;
and CLIENTES.id_cliente = e.cliente_id --condição para ligar as colunas das 2 tabelas

-- 4.a) Para relacionar as tabelas Clientes e Encomendas, 
-- igualamos a Chave Primária de Clientes com a Chave Estrangeira de Encomendas:
-- WHERE CLIENTES.id_cliente = ENCOMENDAS.cliente_id

-- AULA 09/09/2026 - JUNÇÃO DE TABELAS
-- ex 4 b - Apresenta o nome do cliente associado a cada encomenda
SELECT c.nome, e.id_encomenda
FROM CLIENTES c, ENCOMENDAS e
WHERE e.cliente_id = c.id_cliente;

--ex4 - c, Determina, através de uma consulta SQL, o número de encomendas realizadas pela cliente Ana Silva

SELECT COUNT(*) AS total_encomendas -- COUNT serve para ver quantas linhas aparecem conforme o pedido de consulta, e o AS serve para aparecer o nome para o que voce quer que apareca na tela de consulta/query
FROM CLIENTES c, ENCOMENDAS e                
WHERE c.id_cliente = e.cliente_id
AND c.nome = 'Ana Silva';

--ex4 - d, Apresenta o nome do cliente e o respetivo valor de cada encomenda.
SELECT c.nome, e.valor
FROM ENCOMENDAS e, CLIENTES c
WHERE c.id_cliente = e.cliente_id;

--5 ex 5 d é o mesmo codigdo ex 1 - mas em tese estaria sem a chave primaria ae chave estrangeira, por isso repetiu aqui 











