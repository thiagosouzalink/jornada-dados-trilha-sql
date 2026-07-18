-- Aula 02 - Nossos primeiros comandos SQL usando DQL

-- -------------------- Principais comandos da DQL
-- SELECT: O comando mais fundamental em DQL, usado para selecionar dados de uma ou mais tabelas.
SELECT * FROM customers;
select contact_name, city from customers;

-- DISTINCT: Usado com SELECT para retornar apenas valores distintos.
SELECT country FROM customers;
SELECT DISTINCT country FROM customers;
SELECT count(distinct country) FROM customers;

-- WHERE: Usado para filtrar.
-- Seleciona todos os clientes do México
SELECT * FROM customers 
WHERE country='Mexico';
-- Seleciona clientes com ID específico
SELECT * FROM customers 
WHERE customer_id='ANATR';
-- Utiliza AND para múltiplos critérios
SELECT * FROM customers 
WHERE country='Germany' AND city='Berlin';
-- Utiliza OR para mais de uma cidade
SELECT * FROM customers 
WHERE city='Berlin' OR city='Aachen';
-- Utiliza NOT para excluir a Alemanha
SELECT * FROM customers 
WHERE country<>'Germany';
-- Combina AND, OR e NOT
SELECT * FROM customers 
WHERE country='Germany' 
      AND (city='Berlin' OR city='Aachen');
-- Exclui clientes da Alemanha e EUA
SELECT * FROM customers 
WHERE country<>'Germany' AND country<>'USA';