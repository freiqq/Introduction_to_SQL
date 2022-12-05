WITH tmp as (SELECT *
FROM person_order
INNER JOIN menu m on person_order.menu_id = m.id
ORDER BY person_id, pizzeria_id)

INSERT INTO person_discounts
SELECT row_number() over(), person_id, pizzeria_id,
       CASE WHEN count(tmp.pizzeria_id) = 1 THEN 10.5
       WHEN count(tmp.pizzeria_id) = 2 THEN 22
       ELSE 30
       END
FROM tmp
GROUP BY person_id, pizzeria_id;