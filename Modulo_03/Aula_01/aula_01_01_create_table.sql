-- Aula 1 – Criação de Tabelas

-- ------------------ Create
CREATE TABLE IF NOT EXISTS clients (
    id SERIAL PRIMARY KEY NOT NULL,
    limite INTEGER NOT NULL,
    saldo INTEGER NOT NULL
);

-- Usando UUID
DROP TABLE clients;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS clients (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    limite INTEGER NOT NULL,
    saldo INTEGER NOT NULL
);

-- drop table transactions;
CREATE TABLE IF NOT EXISTS transactions (
    id SERIAL PRIMARY KEY NOT NULL,
    tipo CHAR(1) NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    valor INTEGER NOT NULL,
    cliente_id UUID NOT NULL,
    realizada_em TIMESTAMP NOT NULL DEFAULT NOW()
);


-- ------------------- Insert
INSERT INTO clients (limite, saldo)
VALUES
    (10000, 0),
    (80000, 0),
    (1000000, 0),
    (10000000, 0),
    (500000, 0);
	

SELECT * FROM clients;
SELECT * FROM transactions;