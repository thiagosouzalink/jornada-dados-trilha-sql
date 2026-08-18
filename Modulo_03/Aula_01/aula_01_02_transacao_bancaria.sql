-- Aula 1 – Criação de Tabelas

SELECT * FROM clients;
INSERT INTO transactions (tipo, descricao, valor, cliente_id)
VALUES ('d', 'Compra de carro', 80000, 'e5c886e6-5d7a-4372-9750-7f9743584df6');

SELECT * FROM transactions;

UPDATE clients
SET saldo = saldo + CASE WHEN 'd' = 'd' THEN -80000 ELSE 80000 END
WHERE id = 'e5c886e6-5d7a-4372-9750-7f9743584df6'; -- Substitua pelo ID do cliente desejado

SELECT saldo, limite 
FROM clients
WHERE id = 'e5c886e6-5d7a-4372-9750-7f9743584df6';