-- Aula 3 – Partition

INSERT INTO pessoas (first_name, last_name, estado)
SELECT 
  substring(md5(random()::text), 0, 3),
  substring(md5(random()::text), 0, 3),
  random_estado()
FROM 
  generate_series(1, 10000000);
  
 
select * from pessoas;
SELECT * FROM pessoas WHERE estado = 'RJ';