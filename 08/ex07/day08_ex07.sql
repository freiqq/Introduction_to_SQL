--01
BEGIN TRANSACTION;

--02
BEGIN TRANSACTION;

--01
 UPDATE pizzeria SET rating = 3.3 WHERE id = 1;

--02
 UPDATE pizzeria SET rating = 2.2 WHERE id = 2;

--01
UPDATE pizzeria SET rating = 4.4 WHERE id = 2;

--02
UPDATE pizzeria SET rating = 1.1 WHERE id = 1;

--01
COMMIT

--02
COMMIT