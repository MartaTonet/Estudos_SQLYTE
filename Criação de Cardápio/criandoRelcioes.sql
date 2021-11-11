
--CRiando a primeira tabela cardapio

CREATE TABLE cardapio(
  idPrato INTEGER PRIMARY KEY AUTOINCREMENT,
  nomePrato CHAR(50),
  preco FLOAT,
  tipoPrato CHAR(20),
  descricao TEXT 
)

--inserir dados na tabela cardapio

INSERT INTO cardapio(nomeprato, preco, tipoprato, descricao) 
VALUES ('yakiçoba', 25.90, 'massas', 'É um macarrrão oriental com choio e carne bovina'),
('sushi', 20.99, 'peixes', 'peixe cru com algas e arroz'),
('temaki', 16.99, 'peixes', 'cone de peixe cru com creme de queijo'),
('lamen', 36.99, 'massas', 'caldo com macarrão, bisteca de porco e ovos');

--mostrar dados inseridos na tabela cardapio
SELECT * FROM cardapio

--MOSTRAR A MÉDIA DOS TIPOS DE PRATOS SEPARADOS

SELECT tipoprato, AVG(preco) AS "Média dos tipos de pratos"
FROM cardapio
GROUP BY tipoprato; 

-- SOMA DOS TIPOS DE PRATOS SEPARADOS
SELECT tipoprato, SUM(preco) AS "Soma dos tipos de pratos"
FROM cardapio
GROUP BY tipoprato;

-- mostrar valor minímo do preco dos tipos de pratos
SELECT tipoprato, MIN(preco) AS "Valor minímo dos tipos de pratos"
FROM cardapio
GROUP BY tipoprato;


--mostrar valor máximo do preco dos pratos
SELECT tipoprato, 	MAX(preco) AS "Valor máximo dos tipos de pratos"
FROM cardapio
GROUP BY tipoprato;

SELECT tipoprato, COUNT(preco) AS "Quantidade de cada tipo de prato"
FROM cardapio
GROUP BY tipoprato 

--inserir uma nova tabela
CREATE TABLE cliente(
	idCliente INTEGER PRIMARY KEY AUTOINCREMENT,
  	nomeCliente CHAR(50),
  	telefone char(14),
  	endereco CHAR (30) 

)


-- inserir dados na nova tabela cliente

insert into cliente (nomeCliente, telefone, endereco) VALUES
("André Silva", "149911223344", "Av. Brasil 454"),
("Maria Souza", "119811223355", "Rua Paulo Freire, 87"),
("Joana Gomes", "179788445566", "Av. 07 de Setembro, 74"),
("Luíz Ramos", "21981122335544", "Rua 12 de Setembro, 798");

--consultar dados inseridoscardapio

SELECT * FROM cliente;

--DELETAR DADOS ACRESCETADOS POR ACIDENTE
DELETE FROM cliente  WHERE idcliente >= 5


--Criar a terceira tabela CHAMADA PEDIDO para criar chave ou estrangeira ou criar relaçõescardapio
--USAMOS O FOREIGN PARA CRIAR A CHAVE ESTRANGEIRA

create table pedidos (
  idPedido integer PRIMARY key AUTOINCREMENT,
  idprato int, 
  idCliente INT,
  data datetime,
  FOREIGN KEY (idprato) REFERENCES cardapio(idprato),
   FOREIGN KEY (idcliente) REFERENCES cliente(idcliente)
  )
  
  --iNSERIR DADOOS NA TABELA PEDIDO QUE ACABAMOD DE CRIAR NO COMANDO A CIMA
  
  insert into pedidos (idCliente, idprato,  data) VALUES
(1, 1, '2021-11-01 17:25:31'),
-- AQUI o Cliente de ID 1 (André), pediu um prato de ID 1 (yakissoba) na data informada acima
(1, 2, '2021-11-05 18:25:31'),
(1, 2, '2021-11-08 18:12:05'),
(2, 3, '2021-11-12 11:05:15'),
(2, 4, '2021-11-12 12:15:32'),
(2, 1, '2021-11-14 11:01:49'),
(3, 4, '2021-11-15 18:50:47'),
(3, 2, '2021-11-17 19:42:36'),
(2, 3, '2021-11-19 15:33:01'),
(4, 2, '2021-11-20 12:21:17'),
(4, 4, datetime('now')); 


--consultar os dados inseridos

SELECT* FROM pedidos



-- Fazendo relacionamento com as nossas tabelas Pedido e Cliente
--Usa-se o Group BY para mostrar os dados uma unica vez sem estar repetido


--usamos o INNER JOIN PARA RELACIONAR CRIAR RELAÇÃO ENTRE AS TABELAS
--OBS: devemos sempre criar apelidos com uma variavel ao fazer relação. Como está no exemplo a baixo.
/*SELECT x.nomeCliente, y.data
FROM cliente x, pedidos y
INNER JOIN cliente ON x.idCliente = y.idCliente;*/

SELECT c.nomecliente, p.data
FROM cliente c, pedidos p
INNER JOIN cliente ON c.idcliente = p.idcliente 

GROUP BY C.nomecliente
; 

--fazer um join do campo nome prato e data
--selecionar apenas nome do prato e a data que foi pedido

SELECT c.nomeprato, p.data
FROM cardapio c, pedidos p
INNER JOIN cardapio ON c.idPrato = p.idprato

--mostrar quantas vezes cada prato foi pedidocardapio
--usar o ORDER BY COUNT para ordenar em ordem descrente e para organizar de forma crescente coloca-se o Desc
 
SELECT c.nomeprato, COUNT (p.idprato) AS " Número de vezes que um prato foi pedido"
FROM cardapio c, pedidos p
INNER JOIN cardapio ON c.idPrato = p.idprato
GROUP BY C.nomeprato 
ORDER by  COUNT (p.idprato) DESC
;



-- Unir três tabelascardapio
-- C ( está a representar o carcardapio), CLI( está a representar a tabela clcliente) P(representa a tabela pepedidos)

SELECT c.nomeprato, cli.nomecliente, p.data 
FROM pedidos 
INNER JOIN cardapio C ON C.idPrato = P.idprato
INNER JOIN cliente cli ON cli.idCliente =  
  