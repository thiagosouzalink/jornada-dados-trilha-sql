-- Aula 04 - Windows Function

-- Cálcular: Quantos produtos únicos existem? 
-- Quantos produtos no total? Qual é o valor total pago?
SELECT 
	order_id,
	COUNT(order_id) AS unique_product,
	SUM(quantity) AS total_quantity,
	SUM(unit_price * quantity) AS total_price
FROM order_details
GROUP BY order_id
ORDER BY order_id;

-- Com Windows Function
SELECT 
	DISTINCT order_id,
   	COUNT(order_id) OVER (PARTITION BY order_id) AS unique_product,
   	SUM(quantity) OVER (PARTITION BY order_id) AS total_quantity,
   	SUM(unit_price * quantity) OVER (PARTITION BY order_id) AS total_price
FROM order_details
ORDER BY order_id;


-- MIN (), MAX (), AVG ()
-- Usando Group by
SELECT 
	customer_id,
   	MIN(freight) AS min_freight,
   	MAX(freight) AS max_freight,
   	AVG(freight) AS avg_freight
FROM orders
GROUP BY customer_id
ORDER BY customer_id;

-- Usando Windows Function
SELECT
	customer_id,
	MIN(freight) OVER (PARTITION BY customer_id) AS min_freight,
	MAX(freight) OVER (PARTITION BY customer_id) AS max_freight,
	AVG(freight) OVER (PARTITION BY customer_id) AS avg_freight
FROM orders;