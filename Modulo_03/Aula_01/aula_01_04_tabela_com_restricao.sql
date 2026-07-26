-- Aula 1 – Criação de Tabelas

DROP TABLE clients;
CREATE TABLE IF NOT EXISTS clients (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    limite INTEGER NOT NULL,
    saldo INTEGER NOT NULL,
	CHECK (saldo >= -limite),
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
INSERT INTO transactions (tipo, descricao, valor, cliente_id)
VALUES ('d', 'Compra de carro', 80000, '030c51cc-151f-4dcd-a5de-5fa9124a1b12');

SELECT * FROM transactions;

UPDATE clients
SET saldo = saldo - 80000
WHERE id = '030c51cc-151f-4dcd-a5de-5fa9124a1b12';
