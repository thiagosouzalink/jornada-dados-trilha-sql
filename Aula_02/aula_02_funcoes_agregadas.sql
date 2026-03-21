-- Aula 02 - Nossos primeiros comandos SQL usando DQL

-- Funções Agregadas (COUNT, MAX, MIN, SUM, AVG):
-- Exemplo de MIN()
SELECT MIN(unit_price) AS preco_minimo
FROM products;

-- Exemplo de MAX()
SELECT MAX(unit_price) AS preco_maximo
FROM products;

-- Exemplo de COUNT()
SELECT COUNT(*) AS total_de_produtos
FROM products;

-- Exemplo de AVG()
SELECT AVG(unit_price) AS preco_medio
FROM products;

-- Exemplo de SUM()
SELECT SUM(quantity) AS quantidade_total_de_order_details
FROM order_details;

-- Exemplo de MIN() com GROUP BY
-- Calcula o menor preço unitário de produtos em cada categoria
SELECT category_id, MIN(unit_price) AS preco_minimo
FROM products
GROUP BY category_id;

-- Exemplo de MAX() com GROUP BY
-- Calcula o maior preço unitário de produtos em cada categoria
SELECT category_id, MAX(unit_price) AS preco_maximo
FROM products
GROUP BY category_id;

-- Exemplo de COUNT() com GROUP BY
-- Conta o número total de produtos em cada categoria
SELECT category_id, COUNT(*) AS total_de_produtos
FROM products
GROUP BY category_id;

-- Exemplo de AVG() com GROUP BY
-- Calcula o preço médio unitário de produtos em cada categoria
SELECT category_id, AVG(unit_price) AS preco_medio
FROM products
GROUP BY category_id;

-- Exemplo de SUM() com GROUP BY
-- Calcula a quantidade total de produtos pedidos por pedido
SELECT order_id, SUM(quantity) AS quantidade_total_por_pedido
FROM order_details
GROUP BY order_id;