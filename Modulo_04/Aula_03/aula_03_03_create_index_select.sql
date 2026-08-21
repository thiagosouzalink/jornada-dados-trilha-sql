-- Aula 3 – Partition

CREATE INDEX first_name_index ON pessoas(first_name);

SELECT COUNT(*) FROM pessoas WHERE first_name = 'aa';

SELECT COUNT(*) FROM pessoas WHERE last_name = 'aa';