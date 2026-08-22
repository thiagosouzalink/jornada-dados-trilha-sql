-- Aula 2 – B-Tree e Index

CREATE INDEX first_name_index ON pessoas(first_name);

-- Table Scan (Varredura de Tabela)
SELECT * FROM pessoas;

-- Index Scan (Varredura de Índice)
SELECT * FROM pessoas WHERE id = 100;

-- Bitmap Index Scan (Varredura de Bitmap de Índice)
SELECT id, first_name FROM pessoas WHERE id = 100 OR first_name = 'aa';

