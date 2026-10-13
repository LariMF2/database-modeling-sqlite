/* Exercício 4.1
Um cinema pretende criar uma base de dados para gerir as reservas de lugares nas diferentes
sessões.
O cinema definiu as seguintes regras:
✓ Uma sessão possui vários lugares.
✓ Um cliente pode efetuar várias reservas.
✓ O mesmo lugar pode ser reservado em sessões diferentes.
✓ Um lugar não pode ter duas reservas para a mesma sessão.
✓ Uma reserva é identificada pela combinação de dos atributos sessao_id e lugar_id.*/

/*a) Altere a instrução CREATE TABLE de modo a garantir as regras apresentadas.*/
CREATE TABLE reservas (
    sessao_id INT NOT NULL,
    lugar_id INT NOT NULL,
    nome_cliente VARCHAR(100) NOT NULL,
    
    PRIMARY  KEY (sessao_id, lugar_id) /* Garante que os campos da chave primária
     (sessao_id e lugar_id) nunca fiquem vazios. Garante que nenhuma reserva 
     seja registada sem o nome do cliente (nome_cliente NOT NULL).*/
);

/* b) Insire os seguintes dados:
INSERT INTO reservas VALUES (10, 25, 'Ana Silva');
INSERT INTO reservas VALUES (10, 26, 'João Costa');
INSERT INTO reservas VALUES (11, 25, 'Marta Santos');
Explica porque é que o lugar 25 pode aparecer duas vezes na tabela.*/
INSERT INTO reservas VALUES (10, 25, 'Ana Silva');
INSERT INTO reservas VALUES (10, 26, 'Joao Costa');
INSERT INTO reservas VALUES (11, 25, 'Marta Santos'); /*o lugar 25 aparece duas vezes, por que 
                                                       esta em sessões diferentes*/

/*c) Tenta executar:
INSERT INTO reservas VALUES (10, 25, 'Pedro Alves');
Explica o resultado.
E neste caso, qual é a combinação de valores que já existe na tabela?*/
INSERT INTO reservas VALUES (10, 25, 'Pedro Alves'); /*A instrução falha porque a combinação
                                                      (10, 25) já existe na tabela (foi inserida 
                                                      anteriormente para a cliente Ana Silva).*/

/*d) Considera as seguintes combinações dos atributos sessao_id vs lugar_id.:
(10, 25)
(10, 26)
(11, 25)
Explique porque é que estas combinações identificam reservas diferentes, apesar de o
valor 25 aparecer em duas delas.
Resposta: (10, 25): Identifica a reserva do Lugar 25 para a Sessão 10.
(10, 26): Identifica a reserva de um lugar diferente (Lugar 26) na mesma Sessão 10.
(11, 25): Identifica a reserva do Lugar 25, mas numa sessão completamente diferente (Sessão 11).
Como a validação da chave primária composta avalia o par (sessao_id, lugar_id) como um conjunto único, cada uma dessas combinações é diferente das outras. O valor 25 pode repetir-se porque está associado a sessões distintas.
*/

/*e) Imagina agora que o cinema decidiu utilizar apenas:
PRIMARY KEY (lugar_id)
Explica que problema surgiria quando fossem registadas reservas para o mesmo lugar
em sessões diferentes.
Resposta: Se a chave fosse apenas lugar_id, o banco de dados proibiria valores 
repetidos nessa coluna, o que impediria que o mesmo lugar fosse reservado em sessões diferentes 
e limitaria a venda de cada lugar a uma única vez em todo o sistema.*/



