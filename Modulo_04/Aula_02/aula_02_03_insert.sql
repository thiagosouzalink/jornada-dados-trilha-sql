-- Aula 2 – B-Tree e Index

INSERT INTO pessoas (first_name, last_name)
SELECT 
    substring(md5(random()::text), 0, 3),
    substring(md5(random()::text), 0, 3)
FROM 
    generate_series(1, 1000000);