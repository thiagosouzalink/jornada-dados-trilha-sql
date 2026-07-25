-- Aula 06 - CTE vs Subqueries vs Views vs Temporary Tables vs Materialized Views

WITH TotalRevenues AS (
    SELECT 
        c.company_name, 
        SUM(od.unit_price * od.quantity * (1.0 - od.discount)) AS total
    FROM customers c
    INNER JOIN orders o
		ON c.customer_id = o.customer_id
    INNER JOIN order_details od
		ON od.order_id = o.order_id
    CROSS JOIN products p -- Junção cruzada com a tabela de produtos para aumentar a carga da consulta
    GROUP BY c.company_name
)
SELECT * FROM TotalRevenues;


-- Criação da tabela temporária
CREATE TEMP TABLE TotalRevenues AS
SELECT 
    c.company_name, 
    SUM(od.unit_price * od.quantity * (1.0 - od.discount)) AS total
FROM customers c
INNER JOIN orders o
	ON c.customer_id = o.customer_id
INNER JOIN order_details od
	ON od.order_id = o.order_id
CROSS JOIN products p -- Junção cruzada com a tabela de produtos para aumentar a carga da consulta
GROUP BY c.company_name;

-- Consulta na tabela temporária
SELECT * FROM TotalRevenues;