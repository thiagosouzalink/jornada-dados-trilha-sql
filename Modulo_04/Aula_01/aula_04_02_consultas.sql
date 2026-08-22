-- Aula 1 – Performance Tuning em SQL: Ordem de execução e otimização

-- EXPLAIN 
SELECT
  cars.manufacturer,
  cars.model,
  cars.country,
  cars.year,
  MAX(engines.horse_power) as maximum_horse_power
FROM queryorder.cars cars
JOIN queryorder.engines engines
	ON cars.engine_name = engines.name
WHERE cars.year > 2015 AND cars.country = 'Germany'
GROUP BY 
	cars.manufacturer, 
	cars.model, 
	cars.country, 
	cars.year
HAVING 
	MAX(engines.horse_power)> 200
ORDER BY 
	maximum_horse_power DESC
LIMIT 2
;


-- EXPLAIN 
SELECT
  cars.manufacturer,
  cars.model,
  cars.country,
  cars.year
FROM queryorder.cars cars
JOIN queryorder.engines engines
	ON cars.engine_name = engines.name
WHERE cars.year > 2015 AND cars.country = 'Germany'
;


-- EXPLAIN 
SELECT
  cars.manufacturer,
  cars.model,
  cars.country,
  cars.year
FROM queryorder.cars cars
JOIN queryorder.engines engines
	ON cars.engine_name = engines.name
;