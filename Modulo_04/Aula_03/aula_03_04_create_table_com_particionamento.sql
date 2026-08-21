-- Aula 3 – Partition

DROP TABLE IF EXISTS pessoas;

CREATE TABLE IF NOT EXISTS pessoas (
	 id SERIAL PRIMARY KEY,
	 first_name VARCHAR(3),
	 last_name VARCHAR(3),
	 estado VARCHAR(3)
 ) PARTITION BY RANGE (id);
 
-- Opção mais simples
CREATE TABLE pessoas_part1 PARTITION OF pessoas FOR VALUES FROM (MINVALUE) TO (2000001);
CREATE TABLE pessoas_part2 PARTITION OF pessoas FOR VALUES FROM (2000001) TO (4000001);
CREATE TABLE pessoas_part3 PARTITION OF pessoas FOR VALUES FROM (4000001) TO (6000001);
CREATE TABLE pessoas_part4 PARTITION OF pessoas FOR VALUES FROM (6000001) TO (8000001);
CREATE TABLE pessoas_part5 PARTITION OF pessoas FOR VALUES FROM (8000001) TO (MAXVALUE);

-- -- Opção indireta
-- -- Criar as tabelas particionadas
-- CREATE TABLE pessoas_part1 (
--     LIKE pessoas INCLUDING ALL,
--     CHECK (id >= 1 AND id <= 2000000)
-- );

-- CREATE TABLE pessoas_part2 (
--     LIKE pessoas INCLUDING ALL,
--     CHECK (id > 2000000 AND id <= 4000000)
-- );

-- CREATE TABLE pessoas_part3 (
--     LIKE pessoas INCLUDING ALL,
--     CHECK (id > 4000000 AND id <= 6000000)
-- );

-- CREATE TABLE pessoas_part4 (
--     LIKE pessoas INCLUDING ALL,
--     CHECK (id > 6000000 AND id <= 8000000)
-- );

-- CREATE TABLE pessoas_part5 (
--     LIKE pessoas INCLUDING ALL,
--     CHECK (id > 8000000)  -- A última partição não precisa de limite superior
-- );