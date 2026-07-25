-- Aula 06 - CTE vs Subqueries vs Views vs Temporary Tables vs Materialized Views

CREATE VIEW TotalRevenues AS
SELECT 
    c.company_name, 
    SUM(od.unit_price * od.quantity * (1.0 - od.discount)) AS total
FROM customers c
INNER JOIN orders o
	ON c.customer_id = o.customer_id
INNER JOIN order_details od
	ON od.order_id = o.order_id
GROUP BY c.company_name;

SELECT * FROM TotalRevenues;