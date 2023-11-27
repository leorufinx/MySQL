create database deadlock;
use deadlock;


CREATE TABLE Exemplo (ID INT PRIMARY KEY, Valor INT);


INSERT INTO Exemplo (ID, Valor) VALUES (1, 100);
INSERT INTO Exemplo (ID, Valor) VALUES (2, 200);


START TRANSACTION;
SELECT * FROM Exemplo WHERE ID = 1 FOR UPDATE;
UPDATE Exemplo SET Valor = 250 WHERE ID = 2;
COMMIT;

