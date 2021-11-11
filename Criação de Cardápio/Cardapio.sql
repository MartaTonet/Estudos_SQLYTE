
SELECT * FROM demo


--Criação de um cardápio(usar integer para para nº inteiros, char para limite de caracteres, float para números decimais ou podemos usar reais,
-- text para crição de textos logos como descrições)
CREATE TABLE cardapio(
  idPrato INTEGER PRIMARY KEY AUTOINCREMENT,
  nomePrato CHAR(50),
  preco FLOAT,
  tipoPrato CHAR(20),
  descricao TEXT 
)


INSERT INTO cardapio(nomeprato, preco, tipoprato, descricao) 
VALUES ('yakiçoba', 25.90, 'massas', 'É um macarrrão oriental com choio e carne bovina'),
('sushi', 20.99, 'peixes', 'peixe cru com algas e arroz'),
('temaki', 16.99, 'peixes', 'cone de peixe cru com creme de queijo'),
('lamen', 36.99, 'massas', 'caldo com macarrão, bisteca de porco e ovos');


--Mostrar todas as colunas e registros da tabela cardápio
-- USAR U (SELECT * FROM) para mostrar ou consultar os dados da tabela mãe que foram inseridos na aba anterior

SELECT * FROM cardapio;
SELECT * FROM cardapio;


--Consultar todos os pratos com preço maior ou igual de R$20.99 
--USAR O (WERW) PARA FILTRAR ou mostrar um dado específico de uma tabela 

SELECT * 
FROM cardapio
WHERE preco >= 20.99;


-- Consultar pratos com o preço maior ou igual que R$17.00 e menor que R$36,00
-- Usa-se o (AND) para fazer essa dupla consulta do mesmo dado

SELECT * 
FROM cardapio
WHERE preco >= 17.00 AND preco < 36.00;



--Consultar todos os pratos do cardápio que termina com a letra (i)
-- Usa-se o (LIKE "%s")para encontrar as palavras que terminam com essa determinada letra.
--("%s%"(para buscar uma  palavra com esse entre ela) 
SELECT * 
FROM cardapio
WHERE nomeprato like "%a%" 

--Atualizar todos os preços aumentando 10% do valor dos pratos.
--Usamos o (SET) para aplicar a percentagem ao dado do banco que queremos atualizar o valor

UPDATE cardapio 
SET preco = preco*1.10


--Atualizar o valor de um dado específicocardapio
-- Usa-se o (SET e o Werw) para fazer essa alterção específica udando o  nº de ID deste elemento que queremos atualizar o valor

UPDATE cardapio 
SET preco = 23.90
WHERE idprato = 4


--deletar algum dado do bancocardapio
--Usar (DELETE FROM PARA APAGAR E O WHERE PARA ESPECIFICAR O ID DO ELEMENTO QUE QUEREMOS APAGARcardapio
DELETE FROM cardapio
WHERE idprato = 2


--deletar algum dado do bancocardapio
--Usar (DELETE FROM PARA APAGAR E O WHERE PARA ESPECIFICAR O ID DO ELEMENTO QUE QUEREMOS APAGARcardapio
DELETE FROM cardapio
WHERE idprato = 2


--OPERADORES DE AGREGAÇÃO



-- consultar de a média dos preços do nosso caradapiocardapio
-- Usa-se(AVG) para calcular a média
SELECT AVG(preco)
FROM cardapio;


--Para somar o valor total do preço dos pratoscardapio
--usa-se (SUM) PARA fazer essa soma
SELECT SUM(preco)
FROM cardapio;

SELECT COUNT (*)
FROM cardapio;

--Mostrar o valor minimo e o valor máximo do  preço dos pratos
SELECT MIN(preco), MAX(preco)
FROM cardapio


--Comando para renomear colunas ou atribuir um apelido

SELECT nomeprato AS 'Nome do Prato', preco AS ' Preço do Produto' 
FROM cardapio
