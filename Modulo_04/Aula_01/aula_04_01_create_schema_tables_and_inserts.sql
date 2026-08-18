-- Aula 1 – Performance Tuning em SQL: Ordem de execução e otimização
CREATE SCHEMA queryorder
    AUTHORIZATION postgres;
	
DROP TABLE IF EXISTS queryorder.cars, queryorder.engines;

CREATE TABLE queryorder.cars (
 manufacturer VARCHAR(64),
 model VARCHAR(64),
 country VARCHAR(64),
 engine_name VARCHAR(64),
 year INT
);

CREATE TABLE queryorder.engines (
 name VARCHAR(64),
 horse_power INT
);

INSERT INTO queryorder.cars
VALUES 
 ('BMW', 'M4', 'Germany', 'S58B30T0-353', 2021),
 ('BMW', 'M4', 'Germany', 'S58B30T0-375', 2021),
 ('Chevrolet', 'Corvette', 'USA', 'LT6', 2023),
 ('Chevrolet', 'Corvette', 'USA', 'LT2', 2023),
 ('Audi', 'R8', 'Germany', 'DOHC FSI V10-5.2-456', 2019),
 ('McLaren', 'GT', 'UK', 'M840TE', 2019),
 ('Mercedes', 'AMG C 63 S E', 'Germany', 'M139L', 2023);
 
INSERT INTO queryorder.engines
VALUES 
 ('S58B30T0-353', 473),
 ('S58B30T0-375', 510),
 ('LT6', 670),
 ('LT2', 495),
 ('DOHC FSI V10-5.2-456', 612),
 ('M840TE', 612),
 ('M139L', 469);
 
SELECT * FROM queryorder.cars;
SELECT * FROM queryorder.engines;