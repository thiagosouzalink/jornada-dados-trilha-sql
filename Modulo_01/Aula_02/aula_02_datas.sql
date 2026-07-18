-- Aula 02 - Nossos primeiros comandos SQL usando DQL

--Selecione todas as ordens BETWEEN '04-July-1996' e '09-July-1996':
select * from orders
where order_date between '07/04/1996' and '07/09/1996';


-- SQL Server
-- Usando CONVERT
SELECT CONVERT(VARCHAR, order_date, 120) FROM orders
WHERE order_date BETWEEN '1996-04-07' AND '1996-09-07';
-- Usando FORMAT
SELECT FORMAT(order_date, 'yyyy-MM-dd') FROM orders
WHERE order_date BETWEEN '1996-04-07' AND '1996-09-07';

-- MySQL
SELECT DATE_FORMAT(order_date, '%Y-%m-%d') FROM orders
WHERE order_date BETWEEN '1996-04-07' AND '1996-09-07';

-- Oracle
SELECT TO_CHAR(order_date, 'YYYY-MM-DD') FROM orders
WHERE order_date BETWEEN TO_DATE('1996-04-07', 'YYYY-MM-DD') 
					     AND TO_DATE('1996-09-07', 'YYYY-MM-DD');
						 
-- SQLite
SELECT strftime('%Y-%m-%d', order_date) FROM orders
WHERE order_date BETWEEN '1996-04-07' AND '1996-09-07';