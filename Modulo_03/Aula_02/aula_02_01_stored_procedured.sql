-- Aula 2 – Stored Procedured

CREATE OR REPLACE PROCEDURE realizar_transacao(
	IN p_tipo CHAR(1),
    IN p_descricao VARCHAR(50),
    IN p_valor INTEGER,
    IN p_cliente_id UUID
)
LANGUAGE plpgsql
AS $$
DECLARE
    saldo_atual INTEGER;
    limite_cliente INTEGER;
	saldo_apos_transacao INTEGER;
BEGIN
    SELECT saldo, limite 
	INTO saldo_atual, limite_cliente
	FROM clients 
	WHERE id = p_cliente_id;
	
	RAISE NOTICE 'Saldo atual do cliente: %s', saldo_atual;
	RAISE NOTICE 'Limite atual do cliente: %s', limite_cliente;
	
	-- Verifica se a transação é válida com base no saldo e no limite
	IF p_tipo = 'd' AND saldo_atual - p_valor < -limite_cliente THEN
		RAISE EXCEPTION 'Limite inferior ao necessario da transacao';
	END IF;
	
	-- Atualiza o saldo do cliente
	UPDATE clients
	SET saldo = saldo + CASE WHEN p_tipo = 'd' THEN -p_valor ELSE p_valor END
	WHERE id = p_cliente_id;
	
	-- Insere uma nova transação
	INSERT INTO transactions (tipo, descricao, valor, cliente_id)
	VALUES (p_tipo, p_descricao, p_valor, p_cliente_id);
	
	SELECT saldo
	INTO saldo_apos_transacao
	FROM clients 
	WHERE id = p_cliente_id;
	
	RAISE NOTICE 'Saldo cliente apos transacao: %s', saldo_apos_transacao;
END;
$$;


SELECT * FROM clients;
-- 030c51cc-151f-4dcd-a5de-5fa9124a1b12

-- ERROR:  Limite inferior ao necessario da transacao
CALL realizar_transacao('d', 'amarelo', 80000, '83245d40-fc5d-4c32-bf08-ea7c7cebb06b');

-- Transação válida
CALL realizar_transacao('d', 'amarelo', 8000, '83245d40-fc5d-4c32-bf08-ea7c7cebb06b');

SELECT * FROM clients;
SELECT * FROM transactions;