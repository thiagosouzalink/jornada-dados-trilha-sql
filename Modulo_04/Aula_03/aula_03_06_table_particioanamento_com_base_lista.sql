-- Aula 3 – Partition

DROP TABLE IF EXISTS pessoas;

CREATE TABLE IF NOT EXISTS pessoas (
    id SERIAL,
    first_name VARCHAR(3),
    last_name VARCHAR(3),
    estado VARCHAR(3),
    PRIMARY KEY (id, estado)
) PARTITION BY LIST (estado);

-- Criar as partições
CREATE TABLE pessoas_sp PARTITION OF pessoas FOR VALUES IN ('SP');
CREATE TABLE pessoas_rj PARTITION OF pessoas FOR VALUES IN ('RJ');
CREATE TABLE pessoas_mg PARTITION OF pessoas FOR VALUES IN ('MG');
CREATE TABLE pessoas_es PARTITION OF pessoas FOR VALUES IN ('ES');
CREATE TABLE pessoas_df PARTITION OF pessoas FOR VALUES IN ('DF');


INSERT INTO pessoas (first_name, last_name, estado)
SELECT 
  substring(md5(random()::text), 0, 3),
  substring(md5(random()::text), 0, 3),
  random_estado()
FROM 
  generate_series(1, 10000000);
  
 
select * from pessoas;
SELECT * FROM pessoas WHERE estado = 'RJ';