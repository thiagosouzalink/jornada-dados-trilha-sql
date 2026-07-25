-- -- Aula 04 - Windows Function

-- Exemplo sem GROUP BY
-- 830 linhas
SELECT customer_id, freight
FROM orders;

-- Exemplo com GROUP BY
-- 89 linhas
SELECT 
	customer_id,
    MIN(freight) AS min_freight,
	MAX(freight) AS max_freight,
	AVG(freight) AS avg_freight
FROM orders
GROUP BY customer_id
ORDER BY customer_id;


-- Limitação do SELECT com GROUP BY
SELECT 
	customer_id, 
	order_date, 
	AVG(freight) AS avg_freight
FROM orders
GROUP BY customer_id;

-- Consulta com Funções de Janela
SELECT 
    customer_id,
    order_id,  -- Mantendo a visibilidade de cada pedido
    freight,
    MIN(freight) OVER (PARTITION BY customer_id) AS min_freight,
    MAX(freight) OVER (PARTITION BY customer_id) AS max_freight,
    AVG(freight) OVER (PARTITION BY customer_id) AS avg_freight
FROM orders
ORDER BY customer_id, order_id;