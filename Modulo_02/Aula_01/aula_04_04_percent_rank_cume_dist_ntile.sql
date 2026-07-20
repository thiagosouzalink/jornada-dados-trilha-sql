-- Aula 04 - Windows Function

-- Funções PERCENT_RANK() e CUME_DIST()

SELECT  
	order_id, 
  	unit_price * quantity AS total_sale,
  	ROUND(CAST(PERCENT_RANK() OVER (
		PARTITION BY order_id ORDER BY (unit_price * quantity) DESC
	) AS numeric), 2) AS order_percent_rank,
  ROUND(CAST(CUME_DIST() OVER (
	  PARTITION BY order_id ORDER BY (unit_price * quantity) DESC
  ) AS numeric), 2) AS order_cume_dist
FROM  
  order_details;
  
  
-- função NTILE()
SELECT first_name, last_name, title,
   NTILE(3) OVER (ORDER BY first_name) AS group_number
FROM employees;