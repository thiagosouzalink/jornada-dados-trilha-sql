-- Aula 1 – Criação de Tabelas

DROP TABLE clients;
CREATE TABLE IF NOT EXISTS clients (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    limite INTEGER NOT NULL,
    saldo INTEGER NOT NULL,
	CHECK (limite >= ABS(saldo)),
	CHECK (limite > 0)
);

INSERT INTO clients (limite, saldo)
VALUES
    (10000, 0),
    (80000, 0),
    (1000000, 0),
    (10000000, 0),
    (500000, 0);
	
SELECT * FROM clients;

TRUNCATE TABLE transactions;
INSERT INTO transactions (tipo, descricao, valor, cliente_id)
VALUES ('d', 'Compra de carro', 80000, '83245d40-fc5d-4c32-bf08-ea7c7cebb06b');

SELECT * FROM transactions;

UPDATE clients
SET saldo = saldo - 80000
WHERE id = '83245d40-fc5d-4c32-bf08-ea7c7cebb06b';

