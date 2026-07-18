-- Aula 02 - Nossos primeiros comandos SQL usando DQL

-- ----------------------------- Mais operadores
-- Operador < (Menor que)
-- Seleciona todos os produtos com preço menor que 20
SELECT * FROM products
WHERE unit_price < 20;

-- Operador > (Maior que)
-- Seleciona todos os produtos com preço maior que 100
SELECT * FROM products
WHERE unit_price > 100;

-- Operador <= (Menor ou igual a)
-- Seleciona todos os produtos com preço menor ou igual a 50
SELECT * FROM products
WHERE unit_price <= 50;

-- Operador >= (Maior ou igual a)
-- Seleciona todos os produtos com quantidade em estoque maior ou igual a 10
SELECT * FROM products
WHERE units_in_stock >= 10;

-- Operador <> (Diferente de)
-- Seleciona todos os produtos cujo preço não é 30
SELECT * FROM products
WHERE unit_price <> 30;