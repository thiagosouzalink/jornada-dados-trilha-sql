-- Aula 01 - Instalando PostgreSQL e criando nosso primeiro banco
-- Exibe todos os registros da tabela Customers
SELECT * FROM customers;

-- Exibe o nome de contato e a cidade dos clientes
SELECT contact_name, city FROM customers;

-- Utilizando DISTINCT
-- Lista todos os países dos clientes
SELECT country FROM customers;
-- Lista os países sem repetição
SELECT DISTINCT country FROM customers;
-- Conta quantos países únicos existem
SELECT COUNT(DISTINCT country) FROM customers;


-- Cláusula WHERE
-- Seleciona todos os clientes do México
SELECT * FROM customers 
WHERE country = 'Mexico';
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