-- Aula 2 – B-Tree e Index

SELECT id FROM pessoas WHERE id = 100000;
EXPLAIN ANALYZE SELECT id FROM pessoas WHERE id = 100000;

SELECT first_name FROM pessoas WHERE id = 100000;
EXPLAIN ANALYZE SELECT first_name FROM pessoas WHERE id = 100000;

SELECT first_name FROM pessoas WHERE first_name = 'b6';

SELECT first_name FROM pessoas WHERE first_name LIKE '%a%';