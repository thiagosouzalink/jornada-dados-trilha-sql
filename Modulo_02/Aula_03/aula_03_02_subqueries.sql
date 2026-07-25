-- Aula 06 - CTE vs Subqueries vs Views vs Temporary Tables vs Materialized Views

-- --------- Subquery
SELECT product_id FROM (
	SELECT product_id
	FROM (
		SELECT 
			product_id, 
			rk
		FROM (
			SELECT 
				product_id,
				SUM(od.quantity * od.unit_price * ( 1 - od.discount)) AS sold_value,
				RANK() OVER (ORDER BY SUM( od.quantity * od.unit_price * ( 1 - od.discount )) DESC) AS rk -- WINDOWS FUNCTION
			FROM order_odails od
			GROUP BY od.product_id
			ORDER BY rk
		)
		WHERE rk <= 5
	)
	WHERE product_id BETWEEN 35 AND 65
)
ORDER BY product_id DESC;



-- -------- CTE
WITH CalculatedValues AS (
	-- Calcula o valor vendido e o rank para cada produto
	SELECT 
		product_id,
		SUM(od.quantity * od.unit_price * (1 - od.discount)) AS sold_value,
		RANK() OVER (ORDER BY SUM(od.quantity * od.unit_price * (1 - od.discount)) DESC) AS rank
	FROM order_details od
	GROUP BY product_id
),
TopRankedProducts AS (
    -- Seleciona apenas os produtos com rank entre os top 5
    SELECT 
        product_id
    FROM CalculatedValues
    WHERE rank <= 5
),
FilteredProducts AS (
    -- Filtra os produtos com IDs entre 35 e 65
    SELECT 
        product_id
    FROM TopRankedProducts
    WHERE product_id BETWEEN 35 AND 65
)
-- Seleciona e ordena os produtos finais
SELECT product_id
FROM FilteredProducts
ORDER BY product_id DESC;