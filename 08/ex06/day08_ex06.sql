--01
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--02
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--01
SELECT SUM(rating) FROM pizzeria;

--02
UPDATE pizzeria SET rating = 5.0 WHERE name = 'Pizza Hut';
COMMIT;

--01
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;

--02
SELECT SUM(rating) FROM pizzeria;