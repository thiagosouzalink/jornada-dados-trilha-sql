-- Aula 04 - Windows Function

-- LAG(), LEAD()
SELECT 
	customer_id, 
  	TO_CHAR(order_date, 'YYYY-MM-DD') AS order_date, 
  	shippers.company_name AS shipper_name, 
  	LAG(freight) OVER (
		PARTITION BY customer_id ORDER BY order_date DESC
	) AS previous_order_freight, 
  	freight AS order_freight, 
  	LEAD(freight) OVER (
		PARTITION BY customer_id ORDER BY order_date DESC
	) AS next_order_freight
FROM 
  orders
JOIN 
  shippers 
  ON shippers.shipper_id = orders.ship_via;