-- Aula 03 - Joins

-- Having
-- Cria um relatório que mostra a quantidade total de produtos encomendados.
-- Mostra apenas registros para produtos para os quais a quantidade encomendada é menor que 200 (5 linhas)
SELECT 
	o.product_id, 
	p.product_name, 
	SUM(o.quantity) AS quantidade_total
FROM order_details o
JOIN products p 
	ON p.product_id = o.product_id
GROUP BY 
	o.product_id, 
	p.product_name
HAVING 
	SUM(o.quantity) < 200
ORDER BY 
	quantidade_total DESC;
	
	
-- Cria um relatório que mostra o total de pedidos por cliente desde 31 de dezembro de 1996.
-- O relatório deve retornar apenas linhas para as quais o total de pedidos é maior que 15 (5 linhas)
SELECT 
	customer_id, 
	COUNT(order_id) AS total_de_pedidos
FROM orders
WHERE order_date > '1996-12-31'
GROUP BY 
	customer_id
HAVING 
	COUNT(order_id) > 15
ORDER BY 
	total_de_pedidos;