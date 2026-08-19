-- Aula 2 – B-Tree e Index

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE pessoas (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(3),
    last_name VARCHAR(3)
);

SELECT 
    tablename AS "Tabela",
    indexname AS "Índice",
    indexdef AS "Definição do Índice"
FROM 
    pg_indexes 
WHERE 
    tablename = 'pessoas'; -- Substitua 'pessoas' pelo nome da sua tabela