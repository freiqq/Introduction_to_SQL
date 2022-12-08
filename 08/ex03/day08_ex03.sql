--1
BEGIN TRANSACTION
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

--2
BEGIN TRANSACTION
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

--1
 SELECT * FROM pizzeria WHERE  name  = 'Pizza Hut';

--2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT ;

--1
SELECT * FROM pizzeria WHERE  name  = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE  name  = 'Pizza Hut';

--2
SELECT * FROM pizzeria WHERE  name  = 'Pizza Hut';