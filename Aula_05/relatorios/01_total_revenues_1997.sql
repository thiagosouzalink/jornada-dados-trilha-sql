-- Qual foi o total de receitas no ano de 1997?
SELECT 
	SUM(od.unit_price * od.quantity * (1.0 - od.discount)) AS total_revenues_1997
FROM order_details od
INNER JOIN (
    SELECT order_id 
    FROM orders 
    WHERE EXTRACT(YEAR FROM order_date) = '1997'
) AS o 
ON o.order_id = od.order_id;