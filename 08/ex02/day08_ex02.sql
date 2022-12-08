--1
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--2
BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--1
SELECT * FROM pizzeria WHERE  name  = 'Pizza Hut';

--2
SELECT * FROM pizzeria WHERE  name  = 'Pizza Hut';

--1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

--2
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

--1
COMMIT;

--2
COMMIT;

--1
SELECT * FROM pizzeria WHERE  name  = 'Pizza Hut';

--2
SELECT * FROM pizzeria WHERE  name  = 'Pizza Hut';