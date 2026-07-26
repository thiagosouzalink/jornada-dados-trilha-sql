-- Aula 1 – Criação de Tabelas

SELECT * FROM transactions;

DELETE FROM transactions
WHERE id = 1;

UPDATE clients
SET saldo = 0
WHERE id = 'e5c886e6-5d7a-4372-9750-7f9743584df6';

DROP TABLE clients;
CREATE TABLE IF NOT EXISTS clients (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    limite INTEGER NOT NULL,
    saldo INTEGER NOT NULL,
	CHECK (saldo >= -limite),
	CHECK (limite > 0)
);

