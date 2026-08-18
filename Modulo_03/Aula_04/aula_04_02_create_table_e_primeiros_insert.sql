-- Aula 4 – Transações ACID

BEGIN;
-- Criar tabela
CREATE TABLE exemplo (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50)
);
COMMIT;

-- Inserir dados
BEGIN;
INSERT INTO exemplo (nome) VALUES ('A'), ('B'), ('C');
COMMIT;

BEGIN;
INSERT INTO exemplo (nome) VALUES ('A'), ('B'), ('C');
INSERT INTO exemplo (nome) VALUES ('A'), ('B'), ('C');
INSERT INTO exemplo (nome) VALUES ('A'), ('B'), ('C');
ROLLBACK;

SELECT * FROM exemplo;