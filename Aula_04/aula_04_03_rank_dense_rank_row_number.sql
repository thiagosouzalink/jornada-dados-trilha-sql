-- Aula 04 - Windows Function

-- RANK(), DENSE_RANK() e ROW_NUMBER()

-- Exemplo: Classificação dos produtos mais venvidos POR order ID
SELECT  
 	o.order_id, 
	p.product_name, 
	(o.unit_price * o.quantity) AS total_sale,
	ROW_NUMBER() OVER (
		ORDER BY (o.unit_price * o.quantity) DESC
	) AS order_rn, 
	RANK() OVER (
		ORDER BY (o.unit_price * o.quantity) DESC
	) AS order_rank, 
	DENSE_RANK() OVER (
		ORDER BY (o.unit_price * o.quantity) DESC
	) AS order_dense
FROM  
  order_details o
JOIN 
  products p 
  ON p.product_id = o.product_id;
  
 -- Exemplo: Classificação dos produtos mais venvidos usnado SUB QUERY
 SELECT  
 	sales.product_name, 
  	total_sale,
  	ROW_NUMBER() OVER (ORDER BY total_sale DESC) AS order_rn, 
  	RANK() OVER (ORDER BY total_sale DESC) AS order_rank, 
  	DENSE_RANK() OVER (ORDER BY total_sale DESC) AS order_dense
FROM (
	SELECT 
    	p.product_name, 
    	SUM(o.unit_price * o.quantity) AS total_sale
  	FROM  
    	order_details o
	JOIN 
    	products p 
		ON p.product_id = o.product_id
  GROUP BY 
		p.product_name
) AS sales
ORDER BY 
	sales.product_name;