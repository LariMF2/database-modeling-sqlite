/* 4.2 - O centro de karting definiu as seguintes regras:
✓ uma corrida possui vários karts
✓ um piloto pode participar em várias corridas
✓ o mesmo kart pode ser utilizado em corridas diferentes
✓ um kart não pode ser atribuído a dois pilotos na mesma corrida
✓ uma atribuição é identificada pela combinação de corrida_id e kart_id*/

/*a) Altera a instrução CREATE TABLE de modo a definir corretamente uma chave primária
que garanta o cumprimento das regras apresentadas*/

DROP TABLE IF EXISTS atribuicoes_kart; /*Ao colocar o DROP TABLE IF EXISTS no topo do script, 
                                          você pode executar o script quantas vezes quiser sem dar erro, pois ele 
                                        limpa a versão antiga  e recria a versão nova e atualizada!*/

CREATE TABLE atribuicoes_kart (
    corrida_id INT NOT NULL,
    kart_id INT NOT NULL,
    nome_piloto VARCHAR(100) NOT NULL,
    PRIMARY KEY (corrida_id, kart_id)
);

/*b) Insire os seguintes dados:
INSERT INTO atribuicoes_kart VALUES (101, 7, 'Inês Rocha');
INSERT INTO atribuicoes_kart VALUES (101, 9, 'Tiago Lopes');
INSERT INTO atribuicoes_kart VALUES (102, 7, 'Marta Silva');*/

INSERT INTO atribuicoes_kart VALUES (101, 7, 'Inês Rocha'); --Como o código da corrida muda, o conjunto continua a ser único e não gera violação.
INSERT INTO atribuicoes_kart VALUES (101, 9, 'Tiago Lopes');
INSERT INTO atribuicoes_kart VALUES (102, 7, 'Marta Silva');

/* c) Tenta executar a seguinte instrução:
INSERT INTO atribuicoes_kart VALUES (101, 7, 'Rui Costa');
Explica o resultado obtido e identifica a combinação de valores que já existe na tabela.*/

INSERT INTO atribuicoes_kart VALUES (101, 7, 'Rui Costa'); /*Ocorreu um erro de violação de chave primária
                                                  porque o par corrida_id = 101 e kart_id = 7 já existe na tabela, 
                                                  impedindo a atribuição do mesmo kart a outro piloto na mesma 
                                                  corrida.*/

/* d) Considera as seguintes combinações corrida_id vs kart_id:
(101, 7)
(101, 9)
(102, 7)
Resposta: As três combinações identificam atribuições diferentes porque a chave primária é 
composta pelo conjunto*/


/* e) Explica por que razão as três combinações identificam atribuições diferentes, apesar de
alguns valores aparecerem repetidos.
Resposta: Como o banco de dados valida o par completo de valores, cada combinação
 permanece única no sistema mesmo havendo números repetidos isoladamente*/


/*f) Imagina que o centro de karting decidia utilizar apenas:
PRIMARY KEY (kart_id)
Explica o problema que surgiria quando o mesmo kart fosse utilizado em corridas
diferentes.
Resposta:Se a chave fosse apenas kart_id, a tabela proibiria repetidores desse código, 
impedindo que um mesmo kart fosse reutilizado em corridas futuras */

/*g) Explica por que razão as três combinações identificam atribuições diferentes, apesar de
alguns valores aparecerem repetidos.
Resposta: As combinações são todas diferentes porque a chave primária valida o conjunto (corrida_id, kart_id),
 permitindo repetir valores individuais desde que o par completo seja único*/

/*Exercício 3 -Escreve as consultas SQL necessárias para -Query*/

/*a) Lista todos os dados das atribuições de karts.*/
SELECT * FROM atribuicoes_kart

/* b) Apresenta apenas os nomes dos pilotos.*/
SELECT nome_piloto 
FROM atribuicoes_kart;

/*c) Lista os karts atribuídos à corrida com o código 10.*/
SELECT kart_id 
FROM atribuicoes_kart
WHERE corrida_id = 10;

/*d) Apresenta o nome do piloto que utiliza o kart 25 na corrida 10.*/
SELECT nome_piloto 
FROM atribuicoes_kart
WHERE corrida_id = 10 AND kart_id =25;

/*e) Lista todas as atribuições do piloto Ana Silva.*/
SELECT nome_piloto 
FROM atribuicoes_kart
WHERE corrida_id = 101 AND kart_id = 7;


/* f) Apresenta as atribuições dos karts cujo código seja superior a 20.*/
SELECT * 
FROM atribuicoes_kart
WHERE nome_piloto = 'Marta Silva';


/* g) Lista os pilotos por ordem alfabética.*/
SELECT nome_piloto 
FROM atribuicoes_kart
ORDER BY nome_piloto ASC;


/*h) Apresenta as atribuições ordenadas pelo código da corrida e, dentro de cada corrida, pelo
código do kart.*/
SELECT * 
FROM atribuicoes_kart
ORDER BY corrida_id ASC, kart_id ASC;

/*i) Lista os pilotos cujo nome começa pela letra M.*/
SELECT nome_piloto 
FROM atribuicoes_kart
WHERE nome_piloto LIKE 'M%';


/*j) Apresenta as atribuições das corridas com os códigos 10 ou 11.*/
SELECT * 
FROM atribuicoes_kart
WHERE corrida_id = 10 OR corrida_id = 11;



